![Starting Point](<alt="image" src="https://github.com/pikki/unifiedmodel/assets/5861934/d4035df8-5336-4f56-a6bf-a2e7b51f7e5a">)

# DBT Model for Blood Pressure Data Cleaning

## Overview
This repository contains a dbt model designed to clean and parse blood pressure (BP) data. The model processes raw BP readings, splits them into systolic and diastolic components, and performs validations to ensure the data falls within expected ranges.

## Model Description
The model operates in three main stages:
1. **Raw Data Processing (`raw_bp_data`)**: Extracts and splits the BP readings from the source table `BP_INPUT`.
2. **Parsing BP Data (`parsed_bp_data`)**: Parses the split BP values into systolic and diastolic readings and performs basic data type conversions.
3. **Data Cleaning (`cleaned_bp_data`)**: Validates the systolic and diastolic values, ensuring they fall within predefined ranges. It also generates notes on data quality issues.

## Source Data
The model expects data from the `BP_INPUT` table in the `unified_model_source` schema, with the following fields:
- `ENCOUNTER_ID`: The unique identifier for each medical encounter.
- `BP_VALUE`: The raw blood pressure reading.

## Output
The final output includes:
- `ENCOUNTER_ID`: Identifier for the medical encounter.
- `BP_VALUE`: Original raw BP reading.
- `systolic_bp`: Cleaned systolic BP value.
- `diastolic_bp`: Cleaned diastolic BP value.
- `repeat_rank`: Rank of the BP reading for each encounter.
- `notes`: Notes indicating any data quality issues.

## Usage
To use this dbt model in your project:
1. Include this repository as a package in your dbt project.
2. Reference the model in your dbt runs.

## Requirements
- dbt (Data Build Tool)
- Access to a Snowflake database (as the model is designed for Snowflake SQL syntax)

## Contributing
Contributions to improve this model are welcome. Please feel free to submit issues and pull requests.

