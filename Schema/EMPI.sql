-- Dimension Tables
CREATE TABLE DimPatient (
    patient_id SERIAL PRIMARY KEY,
    external_patient_id STRING,
    first_name STRING,
    last_name STRING,
    date_of_birth DATE,
    -- Add additional patient-related attributes as needed
);

CREATE TABLE DimAddress (
    address_id SERIAL PRIMARY KEY,
    patient_id INT REFERENCES DimPatient(patient_id),
    address STRING,
    -- Add additional address-related attributes as needed
);

CREATE TABLE DimPhoneNumber (
    phone_id SERIAL PRIMARY KEY,
    patient_id INT REFERENCES DimPatient(patient_id),
    phone_type STRING, -- e.g., Cellphone, Homephone
    phone_number STRING,
    -- Add additional phone-related attributes as needed
);

-- Fact Table
CREATE TABLE FactPatientEvent (
    event_id SERIAL PRIMARY KEY,
    patient_id INT REFERENCES DimPatient(patient_id),
    event_type STRING, -- e.g., Create, Update
    event_timestamp TIMESTAMP,
    -- Add additional event-related attributes as needed
);



/* 
In this schema:

DimPatient: Contains core patient information including a generated internal patient_id as a primary key, an external_patient_id to store the patient identifier from different systems, first_name, last_name, and date_of_birth. You can add additional patient-related attributes here.

DimAddress: Stores patient addresses. The address_id is a generated internal identifier, and patient_id references the corresponding patient in DimPatient. You can add attributes like city, state, postal code, etc., based on your needs.

DimPhoneNumber: Stores patient phone numbers. The phone_id is a generated internal identifier, and patient_id references the corresponding patient in DimPatient. The phone_type can be used to distinguish between cellphone and homephone. Additional attributes can be added as needed.

FactPatientEvent: Represents events related to patients, such as the creation or update of patient information. It includes an event_id as a primary key, patient_id referencing the patient in DimPatient, event_type, and event_timestamp. Additional attributes can be added to capture more details about events.

 */