{{ config(materialized='table') }}

WITH raw_bp_data AS (
  SELECT
    ENCOUNTER_ID,
    BP_VALUE AS original_bp_value,  -- Keep the original BP_VALUE
    CASE 
      WHEN BP_VALUE LIKE '%,%' THEN FLATTENED_VALUE.value
      ELSE BP_VALUE
    END AS split_bp_value, 
    ROW_NUMBER() OVER (PARTITION BY ENCOUNTER_ID ORDER BY BP_VALUE) as repeat_rank
  FROM
    {{ source('unified_model_source', 'BP_INPUT') }},
    LATERAL FLATTEN(INPUT => CASE WHEN BP_VALUE LIKE '%,%' THEN SPLIT(BP_VALUE, ',') ELSE ARRAY_CONSTRUCT(BP_VALUE) END) AS FLATTENED_VALUE
)

, parsed_bp_data AS (
  SELECT
    ENCOUNTER_ID,
    original_bp_value,
    split_bp_value,
    -- Handle the case where split_bp_value is exactly 5 digits
    CASE
      WHEN LENGTH(REGEXP_REPLACE(split_bp_value, '\\D', '')) = 5 THEN 
        TRY_CAST(SUBSTRING(REGEXP_REPLACE(split_bp_value, '\\D', ''), 1, 3) AS FLOAT)
      ELSE
        TRY_CAST(TRIM(REGEXP_SUBSTR(split_bp_value, '([0-9]+)[^0-9]?\\/', 1, 1, 'e', 1)) AS FLOAT)
    END AS raw_systolic,
    CASE
      WHEN LENGTH(REGEXP_REPLACE(split_bp_value, '\\D', '')) = 5 THEN 
        TRY_CAST(SUBSTRING(REGEXP_REPLACE(split_bp_value, '\\D', ''), 4, 2) AS FLOAT)
      ELSE
        TRY_CAST(TRIM(REGEXP_SUBSTR(split_bp_value, '\\/\\s*([0-9]+)[^0-9]?', 1, 1, 'e', 1)) AS FLOAT)
    END AS raw_diastolic,
    repeat_rank
  FROM
    raw_bp_data
)

, cleaned_bp_data AS (
  SELECT
    ENCOUNTER_ID,
    original_bp_value AS BP_VALUE,
    CASE 
      WHEN raw_systolic = FLOOR(raw_systolic) AND raw_systolic BETWEEN 60 AND 300 THEN raw_systolic 
      ELSE NULL 
    END AS systolic_bp,
    CASE 
      WHEN raw_diastolic = FLOOR(raw_diastolic) AND raw_diastolic BETWEEN 40 AND 150 THEN raw_diastolic 
      ELSE NULL 
    END AS diastolic_bp,
    repeat_rank,
    CASE
      WHEN raw_systolic LIKE '%.%' OR raw_diastolic LIKE '%.%' THEN 'Doesnt look like a BP value'
      WHEN raw_systolic NOT BETWEEN 60 AND 300  THEN 'systolic not within range'
      WHEN raw_diastolic NOT BETWEEN 40 AND 150 THEN 'diastolic not within range'
    --   no slash - "not in sys or dias"
      WHEN raw_systolic IS NULL OR raw_diastolic IS NULL THEN 'BP not passed'
      ELSE NULL
    END AS notes
  FROM
    parsed_bp_data
)

SELECT
  ENCOUNTER_ID,
  BP_VALUE,
  systolic_bp,
  diastolic_bp,
  repeat_rank AS repeat_rank,
  notes
FROM
  cleaned_bp_data

