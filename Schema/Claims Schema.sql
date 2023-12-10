CREATE OR REPLACE TABLE Eligibility (
    patient_id STRING,
    member_id STRING,
    birth_date DATE,
    death_date DATE,
    enrollment_start_date DATE,
    enrollment_end_date DATE,
    payer STRING,
    payer_type STRING,
    plan STRING,
    original_reason_entitlement_code STRING,
    dual_status_code STRING,
    medicare_status_code STRING,
    data_source STRING,
    UniqueRowID int default 0,
    LoadDate datetime
);


CREATE OR REPLACE TABLE DimEncounter (
    encounter_id STRING PRIMARY KEY,
    admission_date DATE,
    discharge_date DATE,
    admit_source_code STRING,
    admit_type_code STRING,
    discharge_disposition_code STRING,
    place_of_service_code STRING,
    bill_type_code STRING,
    ms_drg_code STRING,
    apr_drg_code STRING,
    revenue_center_code STRING
);

CREATE OR REPLACE TABLE DimServiceGroup (
    service_category_1 STRING,
    service_category_2 STRING,
    PRIMARY KEY (service_category_1, service_category_2)
);


CREATE OR REPLACE TABLE DimProvider (
    npi STRING PRIMARY KEY,  
    provider_name STRING,
    specialty STRING,
    address STRING,
    phone STRING,
    email STRING,
    provider_type STRING,
    rendering_npi STRING,  
    billing_npi STRING,    
    facility_npi STRING   
);



CREATE OR REPLACE TABLE DimDate (
    date DATE PRIMARY KEY,
    day_of_week STRING,
    is_weekend BOOLEAN,
    month INT,
    year INT,
    quarter INT,
    day_of_month INT,
    week_of_year INT
);


CREATE OR REPLACE TABLE DimEncounter (
    encounter_id STRING PRIMARY KEY,
    admission_date DATE,
    discharge_date DATE,
    admit_source_code STRING,
    admit_type_code STRING,
    discharge_disposition_code STRING,
    place_of_service_code STRING,
    bill_type_code STRING,
    ms_drg_code STRING,
    apr_drg_code STRING,
    revenue_center_code STRING
);

/*
CREATE OR REPLACE TABLE FactMedicalClaim (
    claim_id STRING PRIMARY KEY,
    claim_line_number INT,
    encounter_id STRING REFERENCES DimEncounter(encounter_id),
    claim_type STRING,
    patient_id STRING,
    member_id STRING,
    payer STRING,
    plan STRING,
    claim_start_date DATE,
    claim_end_date DATE,
    claim_line_start_date DATE,
    claim_line_end_date DATE,
    service_category_1 STRING REFERENCES DimServiceGroup(service_category_1),
    service_category_2 STRING REFERENCES DimServiceGroup(service_category_2),
    admit_source_code STRING REFERENCES DimEncounter(admit_source_code),
    admit_type_code STRING REFERENCES DimEncounter(admit_type_code),
    discharge_disposition_code STRING REFERENCES DimEncounter(discharge_disposition_code),
    place_of_service_code STRING REFERENCES DimEncounter(place_of_service_code),
    bill_type_code STRING REFERENCES DimEncounter(bill_type_code),
    ms_drg_code STRING REFERENCES DimEncounter(ms_drg_code),
    apr_drg_code STRING REFERENCES DimEncounter(apr_drg_code),
    rendering_npi STRING REFERENCES DimProvider(npi),
    billing_npi STRING REFERENCES DimProvider(npi),
    facility_npi STRING REFERENCES DimProvider(npi),
    paid_date DATE,
    paid_amount NUMERIC,
    allowed_amount NUMERIC,
    charge_amount NUMERIC,
    coinsurance_amount NUMERIC,
    copayment_amount NUMERIC,
    deductible_amount NUMERIC,
    total_cost_amount NUMERIC,
    data_source STRING,
    UniqueRowID int default 0,
    LoadDate datetime
);

*/

CREATE OR REPLACE TABLE FactMedicalClaim (
    claim_id STRING PRIMARY KEY,
    claim_line_number INT,
    encounter_id STRING,
    claim_type STRING,
    patient_id STRING,
    member_id STRING,
    payer STRING,
    plan STRING,
    claim_start_date DATE,
    claim_end_date DATE,
    claim_line_start_date DATE,
    claim_line_end_date DATE,
    service_category_1 STRING,
    service_category_2 STRING,
    admit_source_code STRING,
    admit_type_code STRING,
    discharge_disposition_code STRING,
    place_of_service_code STRING,
    bill_type_code STRING,
    ms_drg_code STRING,
    apr_drg_code STRING,
    rendering_npi STRING,
    billing_npi STRING,
    facility_npi STRING,
    paid_date DATE,
    paid_amount NUMERIC,
    allowed_amount NUMERIC,
    charge_amount NUMERIC,
    coinsurance_amount NUMERIC,
    copayment_amount NUMERIC,
    deductible_amount NUMERIC,
    total_cost_amount NUMERIC,
    data_source STRING,
    UniqueRowID int default 0,
    LoadDate datetime
);


CREATE OR REPLACE TABLE FactPrescriptionClaim (
    claim_id STRING PRIMARY KEY,
    claim_line_number INTEGER,
    patient_id STRING,
    member_id STRING,
    payer STRING,
    plan STRING,
    prescribing_provider_npi STRING REFERENCES DimProvider(npi),
    dispensing_provider_npi STRING REFERENCES DimProvider(npi),
    dispensing_date DATE,
    ndc_code STRING,
    quantity INTEGER,
    days_supply INTEGER,
    refills INTEGER,
    paid_date DATE,
    paid_amount NUMERIC,
    allowed_amount NUMERIC,
    coinsurance_amount NUMERIC,
    copayment_amount NUMERIC,
    deductible_amount NUMERIC,
    data_source STRING,
    UniqueRowID int default 0,
    LoadDate datetime
);

