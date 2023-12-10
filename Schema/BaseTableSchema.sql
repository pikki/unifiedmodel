--
-- Primary Warehouse Tables
--


--
-- Primary Warehouse Tables
--




/* Drop table if it exists */
CREATE OR REPLACE TABLE Fact_Encounter (
  ID bigint AUTOINCREMENT NOT NULL,
  DataSourceID int,
  ExportFlag int default 0,
  FacilityID int,
  ProviderID int,
  PatientID int,
  EncounterID int,
  ReDataSourceID varchar(255),
  EncounterType varchar(255),
  LockFlag varchar(255),
  EncounterDate date,
  VisitStatus varchar(255),
  VisitStatusdesc varchar(255),
  VisitType varchar(255),
  VisitTypedesc varchar(255),
  StartTime varchar(50),
  EndTime varchar(50),
  TimeIn varchar(50),
  TimeOut varchar(50),
  ArrivedTime varchar(50),
  DepartureTime varchar(50),
  AppointmentReason varchar(255),
  UniqueRowID int default 0,
  LoadDate datetime,
  PRIMARY KEY (ID)
);



/* Drop table if it exists */
CREATE OR REPLACE TABLE DIM_Facility (
  ID bigint AUTOINCREMENT NOT NULL,
  DataSourceID int,
  ExportFlag int default 0,
  FacilityID int,
  Name varchar(255),
  Code varchar(255),
  City varchar(255),
  Address1 varchar(255),
  Address2 varchar(255),
  Phone varchar(255),
  Zipcode varchar(255),
  State varchar(255),
  POS varchar(255),
  FacilityTaxID varchar(255),
  UniqueRowID int default 0,
  LoadDate datetime,
  PRIMARY KEY (ID)
);


/* Drop table if it exists */
CREATE OR REPLACE TABLE DIM_Insurance (
  ID bigint AUTOINCREMENT NOT NULL,
  DataSourceID int,
  ExportFlag int default 0,
  InsID int,
  InsName varchar(255),
  City varchar(255),
  Zipcode varchar(255),
  State varchar(255),
  UniqueRowID int default 0,
  LoadDate datetime,
  PRIMARY KEY (ID)
);


/* Drop table if it exists */
CREATE OR REPLACE TABLE DIM_Lab (
  ID bigint AUTOINCREMENT NOT NULL,
  DataSourceID int,
  ExportFlag int default 0,
  LabID int,
  LabAttributeID int,
  LabName varchar(255),
  LabAttributeName varchar(255),
  LOINC varchar(255),
  LabDeleteFlag varchar(255),
  UniqueRowID int default 0,
  LoadDate datetime,
  PRIMARY KEY (ID)
);



/* Drop table if it exists */
CREATE OR REPLACE TABLE DIM_Medication (
  ID bigint AUTOINCREMENT NOT NULL,
  DataSourceID int,
  ExportFlag int default 0,
  ItemID int NOT NULL,
  Medication varchar(255),
  NDC varchar(255),
  DiabeticMedFlag int default 0,
  TobaccoMedFlag int default 0,
  PharyngitisMedFlag int default 0,
  ChlamydiaMedFlag int default 0,
  AsthmaMedFlag int default 0,
  AsthmaControllerMedFlag int default 0,
  OsteoporosisMedFlag int default 0,
  DMARDMedFlag int default 0,
  BronchitisMedFlag int default 0,
  AspirinMedFlag int default 0,
  AntibioticMedFlag int default 0,
  BetaBlockerMedFlag int default 0,
  AntiDepressantMedFlag int default 0,
  ADHDMedFlag int default 0,
  CorticosteroidsMedFlag int default 0,
  CorticosteroidsTheraphyMedFlag int default 0,
  AntiTNFTheraphyMedFlag int default 0,
  DigoxinMedFlag int default 0,
  DiureticsMedFlag int default 0,
  ACEARBsMedFlag int default 0,
  Statin int default 0,
  ImpDrug int default 0,
  Processed int default 0,
  UniqueRowID int default 0,
  LoadDate datetime,
  Warfarin int default 0,
  OpioidMedFlag int default 0,
  SpecificDMARDMeds int default 0,
  SpecificHTNMeds int default 0,
  PRIMARY KEY (ID)
);




CREATE OR REPLACE TABLE Patient (
  ID bigint AUTOINCREMENT NOT NULL,
  DataSourceID int,
  ExportFlag int default 0,
  PatientID int,
  AccountNum varchar(25),
  Name varchar(255),
  FirstName varchar(255),
  LastName varchar(255),
  DOB varchar(255),
  Gender varchar(255),
  City varchar(255),
  Zipcode varchar(255),
  State varchar(255),
  MaritalStatus varchar(255),
  Language varchar(255),
  Race varchar(255),
  Ethnicity varchar(255),
  Employment varchar(255),
  Phone varchar(255),
  CellPhone varchar(255),
  Email varchar(255),
  FacilityID varchar(255),
  PCPProviderID varchar(255),
  RefProviderID varchar(255),
  RenProviderID varchar(255),
  PrimaryInsID varchar(255),
  PrimarySubscriberNum varchar(255),
  SecondaryInsID varchar(255),
  SecondarySubscriberNum varchar(255),
  Inactive varchar(255),
  Address1 varchar(255),
  Address2 varchar(255),
  Deceased varchar(255),
  DeceasedDate varchar(255),
  HL7ID varchar(255),
  UniqueRowID int default 0,
  LoadDate varchar(255),
  Hysterectomy int,
  ExcludeFlag int,
  PRIMARY KEY (ID)
);



/* Drop table if it exists */
CREATE OR REPLACE TABLE DIM_Procedure (
  ID bigint AUTOINCREMENT NOT NULL,
  DataSourceID int,
  ExportFlag int default 0,
  ProcedureID int,
  ProcedureName varchar(255),
  UniqueRowID int default 0,
  LoadDate datetime,
  PRIMARY KEY (ID)
);


/* Drop table if it exists */
CREATE OR REPLACE TABLE DIM_Provider (
  ID bigint AUTOINCREMENT NOT NULL,
  DataSourceID int,
  ExportFlag int default 0,
  ProviderID int,
  NPI varchar(255),
  DEA varchar(255),
  FirstName varchar(255),
  LastName varchar(255),
  Name varchar(255),
  DOB varchar(255),
  City varchar(255),
  Zipcode varchar(255),
  State varchar(255),
  FacilityID varchar(255),
  Gender varchar(255),
  Specialty varchar(255),
  ProviderTaxID varchar(255),
  UniqueRowID int default 0,
  LoadDate datetime,
  PRIMARY KEY (ID)
);


/* Drop table if it exists */
CREATE OR REPLACE TABLE DIM_Structdata (
  ID bigint AUTOINCREMENT NOT NULL,
  DataSourceID int,
  ExportFlag int default 0,
  TableName varchar(255),
  Question varchar(1000),
  QuestionID int,
  CommQuestion varchar(1000),
  ecwStructID varchar(255),
  ChoiceID varchar(255),
  Choice varchar(1000),
  CommChoice varchar(1000),
  ecwOptionID varchar(255),
  UniqueRowID int default 0,
  LoadDate datetime,
  Category varchar(1000),
  PRIMARY KEY (ID)
);


CREATE OR REPLACE TABLE DIM_Vitals (
  ID bigint AUTOINCREMENT NOT NULL,
  DataSourceID int,
  ExportFlag int default 0,
  VitalID int,
  VitalName varchar(255),
  MappedName varchar(255),
  UniqueRowID int default 0,
  LoadDate datetime,
  PRIMARY KEY (ID)
);

CREATE OR REPLACE TABLE DIM_Xray (
  ID bigint AUTOINCREMENT NOT NULL,
  DataSourceID int,
  ExportFlag int default 0,
  XRayID int,
  XRayName varchar(255),
  XrayDeleteFlag varchar(255),
  UniqueRowID int default 0,
  LoadDate datetime,
  PRIMARY KEY (ID)
);



CREATE OR REPLACE TABLE DIM_Encounter (
    FacilityID INT,
    VisitTypedesc STRING,
    VisitType STRING,
    VisitStatusdesc STRING,
    VisitStatus STRING,
    DepartureTime TIMESTAMP,
    ArrivedTime TIMESTAMP,
    TimeOut TIMESTAMP,
    TimeIn TIMESTAMP,
    EndTime TIMESTAMP,
    StartTime TIMESTAMP,
    LockFlag INT,
    EncounterType INT,
    ResourceID INT,
    EncounterID INT,
    PatientID INT,
    ProviderID INT,
    AppointmentReason STRING
);

CREATE OR REPLACE TABLE Dim_Assessment (
    AssessmentID INT,
    ICDCode STRING,
    ICDName STRING
);


CREATE OR REPLACE TABLE FACT_Allergies (
  ID bigint AUTOINCREMENT NOT NULL,
  DataSourceID int,
  ExportFlag int default 0,
  FacilityID varchar(255),
  ProviderID varchar(255),
  PatientID int,
  EncounterID varchar(255),
  EncounterDate varchar(255),
  ItemID varchar(255),
  Name varchar(255),
  NDC varchar(255),
  Type varchar(255),
  Status varchar(255),
  UniqueRowID int default 0,
  LoadDate datetime,
  PRIMARY KEY (ID)
);

CREATE OR REPLACE TABLE FACT_Assessment (
  ID bigint AUTOINCREMENT NOT NULL,
  DataSourceID int,
  ExportFlag int default 0,
  FacilityID int,
  ProviderID int,
  PatientID int,
  EncounterID int,
  EncounterDate date,
  AssessmentID varchar(255),
  ICDCode varchar(255),
  ICD_F varchar(255),
  Flag int,
  AsmtOnsetDate varchar(255),
  Risk varchar(255),
  PrimaryAsmtFlag varchar(255),
  UniqueRowID int default 0,
  LoadDate datetime,
  PRIMARY KEY (ID)
);

CREATE OR REPLACE TABLE FACT_Billing (
  ID bigint AUTOINCREMENT NOT NULL,
  DataSourceID int,
  ExportFlag int default 0,
  FacilityID int,
  ProviderID int,
  PatientID int,
  EncounterID int,
  EncounterDate date,
  ItemID int,
  CPTCodeName varchar(255),
  CPTCode varchar(255),
  Modifier1 varchar(255),
  Modifier2 varchar(255),
  Modifier3 varchar(255),
  Modifier4 varchar(255),
  ICD1 varchar(255),
  ICD2 varchar(255),
  ICD3 varchar(255),
  ICD4 varchar(255),
  UniqueRowID int default 0,
  LoadDate datetime,
  PRIMARY KEY (ID)
);

CREATE OR REPLACE TABLE FACT_Immunization (
  ID bigint AUTOINCREMENT NOT NULL,
  DataSourceID int,
  ExportFlag int default 0,
  FacilityID varchar(255),
  ProviderID varchar(255),
  PatientID int,
  EncounterID varchar(255),
  ImmunizationID varchar(255),
  ItemID varchar(255),
  ItemsDeleteFlag varchar(255),
  Location varchar(255),
  GivenDate varchar(255),
  GivenBy varchar(255),
  LotNumber varchar(255),
  Dose varchar(255),
  Manufacturer varchar(255),
  Historyflag varchar(255),
  CVX varchar(255),
  CPT varchar(255),
  VFC varchar(255),
  LotID varchar(255),
  VaccineName varchar(255),
  ImmunizationName varchar(255),
  ImmunizationDeleteFlag varchar(255),
  IMMTInj varchar(255),
  UniqueRowID int default 0,
  LoadDate datetime,
  PRIMARY KEY (ID)
);

CREATE OR REPLACE TABLE FACT_Lab (
  ID bigint AUTOINCREMENT NOT NULL,
  DataSourceID int,
  ExportFlag int default 0,
  FacilityID varchar(255),
  ProviderID varchar(255),
  PatientID int,
  EncounterID int,
  ReportID varchar(225),
  LabID int,
  LabAttributeID int,
  LabValue varchar(255),
  LabResult varchar(255),
  OrderDate varchar(255),
  ResultDate varchar(255),
  ReviewedDate varchar(255),
  UniqueRowID int default 0,
  LoadDate datetime,
  PRIMARY KEY (ID)
);

CREATE OR REPLACE TABLE FACT_Medication (
  ID bigint AUTOINCREMENT NOT NULL,
  DataSourceID int,
  ExportFlag int default 0,
  RxID int,
  FacilityID varchar(255),
  ProviderID varchar(255),
  PatientID int,
  EncounterID int,
  EncounterDate date,
  Medication varchar(255),
  NDC varchar(255),
  RxComment varchar(255),
  Duration varchar(255),
  Dispense varchar(255),
  Refill varchar(255),
  Strength varchar(255),
  ItemID varchar(255),
  UniqueRowID int default 0,
  LoadDate datetime,
  PRIMARY KEY (ID)
);

CREATE OR REPLACE TABLE FACT_Problemlist (
  ID bigint AUTOINCREMENT NOT NULL,
  DataSourceID int,
  ExportFlag int default 0,
  PatientID int,
  AssessmentID varchar(255),
  ICDCode varchar(255),
  AddDate date,
  UniqueRowID int default 0,
  LoadDate datetime,
  Condition varchar(255),
  PRIMARY KEY (ID)
);

CREATE OR REPLACE TABLE FACT_Procedure (
  ID bigint AUTOINCREMENT NOT NULL,
  DataSourceID int,
  ExportFlag int default 0,
  FacilityID varchar(255),
  ProviderID varchar(255),
  PatientID int,
  EncounterID int,
  ReportID varchar(255),
  ProcedureID varchar(255),
  Value varchar(255),
  ProcResult varchar(255),
  OrderDate varchar(255),
  ResultDate varchar(255),
  ReviewedDate varchar(255),
  UniqueRowID int default 0,
  LoadDate datetime,
  PRIMARY KEY (ID)
);

CREATE OR REPLACE TABLE FACT_Referral (
  ID bigint AUTOINCREMENT NOT NULL,
  DataSourceID int,
  ExportFlag int default 0,
  FacilityID varchar(255),
  ProviderID varchar(255),
  PatientID int,
  EncounterID int,
  ReferralDate varchar(255),
  Status varchar(255),
  ReceivedDate varchar(255),
  AssessmentID varchar(255),
  AppointmentDate varchar(255),
  FromFacilityID varchar(255),
  ToFacilityID varchar(255),
  FromProviderID varchar(255),
  ToProviderID varchar(255),
  Specialty varchar(255),
  ReferralID varchar(255),
  ReferralStartDate varchar(255),
  ReferralEndDate varchar(255),
  UniqueRowID int default 0,
  LoadDate varchar(255),
  Reason varchar(255),
  PRIMARY KEY (ID)
);

CREATE OR REPLACE TABLE FACT_Structdata (
  ID bigint AUTOINCREMENT NOT NULL,
  DataSourceID int,
  ExportFlag int default 0,
  FacilityID varchar(255),
  ProviderID varchar(255),
  PatientID int,
  EncounterID int,
  EncounterDate date,
  Section varchar(255),
  QuestionID int,
  Question varchar(500),
  Answer varchar(500),
  UniqueRowID int default 0,
  LoadDate datetime,
  PRIMARY KEY (ID)
);

CREATE OR REPLACE TABLE FACT_Vitals (
  ID bigint AUTOINCREMENT NOT NULL,
  DataSourceID int,
  ExportFlag int default 0,
  FacilityID varchar(255),
  ProviderID varchar(255),
  PatientID int,
  EncounterID int,
  EncounterDate date,
  VitalID int,
  Value varchar(255),
  UpdatedBy varchar(255),
  UpdatedByFirstName varchar(255),
  UpdatedByLastName varchar(255),
  UniqueRowID int default 0,
  LoadDate datetime,
  PRIMARY KEY (ID)
);

CREATE OR REPLACE TABLE FACT_Xray (
  ID bigint AUTOINCREMENT NOT NULL,
  DataSourceID int,
  ExportFlag int default 0,
  FacilityID varchar(255),
  ProviderID varchar(255),
  PatientID int,
  EncounterID int,
  ReportID varchar(255),
  XRayID varchar(255),
  Value varchar(255),
  XRayResult varchar(255),
  OrderDate varchar(255),
  ResultDate varchar(255),
  ReviewedDate varchar(255),
  UniqueRowID int default 0,
  LoadDate datetime,
  PRIMARY KEY (ID)
);

    
--
--
--

--
-- END OF TABLES
--

--
-- END OF TABLES
--