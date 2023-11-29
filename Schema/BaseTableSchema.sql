--
-- Primary Warehouse Tables
--




/* Drop table if it exists */
IF OBJECT_ID('dbo.Fact_Encounter', 'U') IS NOT NULL
  DROP TABLE dbo.Fact_Encounter;

CREATE TABLE Fact_Encounter (
  ID bigint IDENTITY(1,1) NOT NULL,
  DataSourceID int NULL,
  ExportFlag int default 0,
  FacilityID int NULL,
  ProviderID int NULL,
  PatientID int NULL,
  EncounterID int NULL,
  ReDataSourceID varchar(255) NULL,
  EncounterType varchar(255) NULL,
  LockFlag varchar(255) NULL,
  EncounterDate date NULL,
  VisitStatus varchar(255) NULL,
  VisitStatusdesc varchar(255) NULL,
  VisitType varchar(255) NULL,
  VisitTypedesc varchar(255) NULL,
  StartTime varchar(50) NULL,
  EndTime varchar(50) NULL,
  TimeIn varchar(50) NULL,
  TimeOut varchar(50) NULL,
  ArrivedTime varchar(50) NULL,
  DepartureTime varchar(50) NULL,
  AppointmentReason varchar(255) NULL,
  UniqueRowID int default 0 NULL,
  LoadDate datetime NULL,
  PRIMARY KEY (ID)
)  ;


/* Drop table if it exists */
IF OBJECT_ID('dbo.DIM_Facility', 'U') IS NOT NULL
  DROP TABLE dbo.DIM_Facility;

CREATE TABLE DIM_Facility (
  ID bigint IDENTITY(1,1) NOT NULL,
  DataSourceID int NULL,
  ExportFlag int default 0,
  FacilityID int NULL,
  Name varchar(255) NULL,
  Code varchar(255) NULL,
  City varchar(255) NULL,
  Address1 varchar(255) NULL,
  Address2 varchar(255) NULL,
  Phone varchar(255) NULL,
  Zipcode varchar(255) NULL,
  State varchar(255) NULL,
  POS varchar(255) NULL,
  FacilityTaxID varchar(255) NULL,
  UniqueRowID int default 0 NULL,
  
  LoadDate datetime NULL,
  PRIMARY KEY (ID)
)  ;

/* Drop table if it exists */
IF OBJECT_ID('dbo.DIM_Insurance', 'U') IS NOT NULL
  DROP TABLE dbo.DIM_Insurance;

CREATE TABLE DIM_Insurance (
  ID bigint IDENTITY(1,1) NOT NULL,
  DataSourceID int NULL,
  ExportFlag int default 0,
  InsID int NULL,
  InsName varchar(255) NULL,
  City varchar(255) NULL,
  Zipcode varchar(255) NULL,
  State varchar(255) NULL,
  UniqueRowID int default 0 NULL,
  
  LoadDate datetime NULL,
  PRIMARY KEY (ID)
)  ;

/* Drop table if it exists */
IF OBJECT_ID('dbo.DIM_Lab', 'U') IS NOT NULL
  DROP TABLE dbo.DIM_Lab;

CREATE TABLE DIM_Lab (
  ID bigint IDENTITY(1,1) NOT NULL,
  DataSourceID int NULL,
  ExportFlag int default 0,
  LabID int NULL,
  LabAttributeID int NULL,
  LabName varchar(255) NULL,
  LabAttributeName varchar(255) NULL,
  LOINC varchar(255) NULL,
  LabDeleteFlag varchar(255) NULL,
  UniqueRowID int default 0 NULL,
  
  LoadDate datetime NULL,
  PRIMARY KEY (ID)
)  ;

/* Drop table if it exists */
IF OBJECT_ID('dbo.DIM_Medication', 'U') IS NOT NULL
  DROP TABLE dbo.DIM_Medication;

CREATE TABLE DIM_Medication (
  ID bigint IDENTITY(1,1) NOT NULL,
  DataSourceID int NULL,
  ExportFlag int default 0,
  ItemID int Not NULL,
  Medication varchar(255) NULL,
  NDC varchar(255) NULL,
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
  UniqueRowID int default 0 NULL,
  LoadDate datetime NULL,
  Warfarin int default 0,
  OpioidMedFlag int default 0,
  SpecificDMARDMeds int default 0,
  SpecificHTNMeds int default 0
  PRIMARY KEY (ID)
)  ;

/* Drop table if it exists */
IF OBJECT_ID('dbo.Patient', 'U') IS NOT NULL
  DROP TABLE dbo.Patient;

CREATE TABLE Patient (
  ID bigint IDENTITY(1,1) NOT NULL,
  DataSourceID int NULL,
  ExportFlag int default 0,
  PatientID int NULL,
  AccountNum varchar(25) NULL,
  Name varchar(255) NULL,
  FirstName varchar(255) NULL,
  LastName varchar(255) NULL,
  DOB varchar(255) NULL,
  Gender varchar(255) NULL,
  City varchar(255) NULL,
  Zipcode varchar(255) NULL,
  State varchar(255) NULL,
  MaritalStatus varchar(255) NULL,
  Language varchar(255) NULL,
  Race varchar(255) NULL,
  Ethnicity varchar(255) NULL,
  Employment varchar(255) NULL,
  Phone varchar(255) NULL,
  CellPhone varchar(255) NULL,
  Email varchar(255) NULL,
  FacilityID varchar(255) NULL,
  PCPProviderID varchar(255) NULL,
  RefProviderID varchar(255) NULL,
  RenProviderID varchar(255) NULL,
  PrimaryInsID varchar(255) NULL,
  PrimarySubscriberNum varchar(255) NULL,
  SecondaryInsID varchar(255) NULL,
  SecondarySubscriberNum varchar(255) NULL,
  Inactive varchar(255) NULL,
  Address1 varchar(255) NULL,
  Address2 varchar(255) NULL,
  Deceased varchar(255) NULL,
  DeceasedDate varchar(255) NULL,
  HL7ID varchar(255) NULL,
  UniqueRowID int default 0 NULL,
  
  LoadDate varchar(255) NULL,
  Hysterectomy int default NULL,
  ExcludeFlag int NULL,
  PRIMARY KEY (ID)
)  ;

/* Drop table if it exists */
IF OBJECT_ID('dbo.DIM_Procedure', 'U') IS NOT NULL
  DROP TABLE dbo.DIM_Procedure;

CREATE TABLE DIM_Procedure (
  ID bigint IDENTITY(1,1) NOT NULL,
  DataSourceID int NULL,
  ExportFlag int default 0,
  ProcedureID int NULL,
  ProcedureName varchar(255) NULL,
  UniqueRowID int default 0 NULL,
  
  LoadDate datetime NULL,
  PRIMARY KEY (ID)
)  ;

/* Drop table if it exists */
IF OBJECT_ID('dbo.DIM_Provider', 'U') IS NOT NULL
  DROP TABLE dbo.DIM_Provider;

CREATE TABLE DIM_Provider (
  ID bigint IDENTITY(1,1) NOT NULL,
  DataSourceID int NULL,
  ExportFlag int default 0,
  ProviderID int NULL,
  NPI varchar(255) NULL,
  DEA varchar(255) NULL,
  FirstName varchar(255) NULL,
  LastName varchar(255) NULL,
  Name varchar(255) NULL,
  DOB varchar(255) NULL,
  City varchar(255) NULL,
  Zipcode varchar(255) NULL,
  State varchar(255) NULL,
  FacilityID varchar(255) NULL,
  Gender varchar(255) NULL,
  Specialty varchar(255) NULL,
  ProviderTaxID varchar(255) NULL,
  UniqueRowID int default 0 NULL,
  
  LoadDate datetime NULL,
  PRIMARY KEY (ID)
)  ;

/* Drop table if it exists */
IF OBJECT_ID('dbo.DIM_Structdata', 'U') IS NOT NULL
  DROP TABLE dbo.DIM_Structdata;

CREATE TABLE DIM_Structdata (
  ID bigint IDENTITY(1,1) NOT NULL,
  DataSourceID int NULL,
  ExportFlag int default 0,
  TableName varchar(255) NULL,
  Question varchar(1000) NULL,
  QuestionID int NULL,
  CommQuestion varchar(1000) NULL,
  ecwStructID varchar(255) NULL,
  ChoiceID varchar(255) NULL,
  Choice varchar(1000) NULL,
  CommChoice varchar(1000) NULL,
  ecwOptionID varchar(255) NULL,
  UniqueRowID int default 0 NULL,
  
  LoadDate datetime NULL,
  Category varchar(1000) NULL,
  PRIMARY KEY (ID)
)  ;

/* Drop table if it exists */
IF OBJECT_ID('dbo.DIM_Vitals', 'U') IS NOT NULL
  DROP TABLE dbo.DIM_Vitals;

CREATE TABLE DIM_Vitals (
  ID bigint IDENTITY(1,1) NOT NULL,
  DataSourceID int NULL,
  ExportFlag int default 0,
  VitalID int NULL,
  VitalName varchar(255) NULL,
  MappedName varchar(255) NULL,
  UniqueRowID int default 0 NULL,
  
  LoadDate datetime NULL,
  PRIMARY KEY (ID)
)  ;

/* Drop table if it exists */
IF OBJECT_ID('dbo.DIM_Xray', 'U') IS NOT NULL
  DROP TABLE dbo.DIM_Xray;

CREATE TABLE DIM_Xray (
  ID bigint IDENTITY(1,1) NOT NULL,
  DataSourceID int NULL,
  ExportFlag int default 0,
  XRayID int NULL,
  XRayName varchar(255) NULL,
  XrayDeleteFlag varchar(255) NULL,
  UniqueRowID int default 0 NULL,
  
  LoadDate datetime NULL,
  PRIMARY KEY (ID)
)  ;

/* Drop table if it exists */
IF OBJECT_ID('dbo.FACT_Allergies', 'U') IS NOT NULL
  DROP TABLE dbo.FACT_Allergies;

CREATE TABLE FACT_Allergies (
  ID bigint IDENTITY(1,1) NOT NULL,
  DataSourceID int NULL,
  ExportFlag int default 0,
  FacilityID varchar(255) NULL,
  ProviderID varchar(255) NULL,
  PatientID int NULL,
  EncounterID varchar(255) NULL,
  EncounterDate varchar(255) NULL,
  ItemID varchar(255) NULL,
  Name varchar(255) NULL,
  NDC varchar(255) NULL,
  Type varchar(255) NULL,
  Status varchar(255) NULL,
  UniqueRowID int default 0 NULL,
  
  LoadDate datetime NULL,
  PRIMARY KEY (ID)
)  ;

/* Drop table if it exists */
IF OBJECT_ID('dbo.FACT_Assessment', 'U') IS NOT NULL
  DROP TABLE dbo.FACT_Assessment;

CREATE TABLE FACT_Assessment (
  ID bigint IDENTITY(1,1) NOT NULL,
  DataSourceID int NULL,
  ExportFlag int default 0,
  FacilityID int NULL,
  ProviderID int NULL,
  PatientID int NULL,
  EncounterID int NULL,
  EncounterDate date NULL,
  AssessmentID varchar(255) NULL,
  ICDCode varchar(255) NULL,
  ICD_F varchar(255) NULL,
  Flag int NULL,
  AsmtOnsetDate varchar(255) NULL,
  Risk varchar(255) NULL,
  PrimaryAsmtFlag varchar(255) NULL,
  UniqueRowID int default 0 NULL,
  
  LoadDate datetime NULL,
  PRIMARY KEY (ID)
)  ;

/* Drop table if it exists */
IF OBJECT_ID('dbo.FACT_Billing', 'U') IS NOT NULL
  DROP TABLE dbo.FACT_Billing;

CREATE TABLE FACT_Billing (
  ID bigint IDENTITY(1,1) NOT NULL,
  DataSourceID int NULL,
  ExportFlag int default 0,
  FacilityID int NULL,
  ProviderID int NULL,
  PatientID int NULL,
  EncounterID int NULL,
  EncounterDate date NULL,
  ItemID int NULL,
  CPTCodeName varchar(255) NULL,
  CPTCode varchar(255) NULL,
  Modifier1 varchar(255) NULL,
  Modifier2 varchar(255) NULL,
  Modifier3 varchar(255) NULL,
  Modifier4 varchar(255) NULL,
  ICD1 varchar(255) NULL,
  ICD2 varchar(255) NULL,
  ICD3 varchar(255) NULL,
  ICD4 varchar(255) NULL,
  UniqueRowID int default 0 NULL,
  
  LoadDate datetime NULL,
  PRIMARY KEY (ID)
)  ;


/* Drop table if it exists
IF OBJECT_ID('dbo.FACT_BP', 'U') IS NOT NULL
  DROP TABLE dbo.FACT_BP;

CREATE TABLE FACT_BP (
  id bigint IDENTITY(1,1) NOT NULL,
  DataSourceID int NULL,
  PatientID int NULL,
  EncounterID varchar(255) NULL,
  Systolic real NULL,
  Diastolic real NULL,
  EncounterDate varchar(225) NULL,
  UniqueRowID int default 0 NULL,
  QueryDate date NULL,
  PRIMARY KEY (id)
)  ; */

/* Drop table if it exists */
IF OBJECT_ID('dbo.FACT_Immunization', 'U') IS NOT NULL
  DROP TABLE dbo.FACT_Immunization;

CREATE TABLE FACT_Immunization (
  ID bigint IDENTITY(1,1) NOT NULL,
  DataSourceID int NULL,
  ExportFlag int default 0,
  FacilityID varchar(255) NULL,
  ProviderID varchar(255) NULL,
  PatientID int NULL,
  EncounterID varchar(255) NULL,
  ImmunizationID varchar(255) NULL,
  ItemID varchar(255) NULL,
  ItemsDeleteFlag varchar(255) NULL,
  Location varchar(255) NULL,
  GivenDate varchar(255) NULL,
  GivenBy varchar(255) NULL,
  LotNumber varchar(255) NULL,
  Dose varchar(255) NULL,
  Manufacturer varchar(255) NULL,
  Historyflag varchar(255) NULL,
  CVX varchar(255) NULL,
  CPT varchar(255) NULL,
  VFC varchar(255) NULL,
  LotID varchar(255) NULL,
  VaccineName varchar(255) NULL,
  ImmunizationName varchar(255) NULL,
  ImmunizationDeleteFlag varchar(255) NULL,
  IMMTInj varchar(255) NULL,
  UniqueRowID int default 0 NULL,
  
  LoadDate datetime NULL,
  PRIMARY KEY (ID)
)  ;

/* Drop table if it exists */
IF OBJECT_ID('dbo.FACT_Lab', 'U') IS NOT NULL
  DROP TABLE dbo.FACT_Lab;

CREATE TABLE FACT_Lab (
  ID bigint IDENTITY(1,1) NOT NULL,
  DataSourceID int NULL,
  ExportFlag int default 0,
  FacilityID varchar(255) NULL,
  ProviderID varchar(255) NULL,
  PatientID int NULL,
  EncounterID int NULL,
  ReportID varchar(225) NULL,
  LabID int NULL,
  LabAttributeID int NULL,
  LabValue varchar(255) NULL,
  LabResult varchar(255) NULL,
  OrderDate varchar(255) NULL,
  ResultDate varchar(255) NULL,
  ReviewedDate varchar(255) NULL,
  UniqueRowID int default 0 NULL,
  
  LoadDate datetime NULL,
  PRIMARY KEY (ID)
)  ;

/* Drop table if it exists */
IF OBJECT_ID('dbo.FACT_Medication', 'U') IS NOT NULL
  DROP TABLE dbo.FACT_Medication;

CREATE TABLE FACT_Medication (
  ID bigint IDENTITY(1,1) NOT NULL,
  DataSourceID int NULL,
  ExportFlag int default 0,
  RxID int NULL,
  FacilityID varchar(255) NULL,
  ProviderID varchar(255) NULL,
  PatientID int NULL,
  EncounterID int NULL,
  EncounterDate date NULL,
  Medication varchar(255) NULL,
  NDC varchar(255) NULL,
  RxComment varchar(255) NULL,
  Duration varchar(255) NULL,
  Dispense varchar(255) NULL,
  Refill varchar(255) NULL,
  Strength varchar(255) NULL,
  ItemID varchar(255) NULL,
  UniqueRowID int default 0 NULL,
  
  LoadDate datetime NULL,
  PRIMARY KEY (ID)
)  ;



/* Drop table if it exists */
IF OBJECT_ID('dbo.FACT_Problemlist', 'U') IS NOT NULL
  DROP TABLE dbo.FACT_Problemlist;

CREATE TABLE FACT_Problemlist (
  ID bigint IDENTITY(1,1) NOT NULL,
  DataSourceID int NULL,
  ExportFlag int default 0,
  PatientID int NULL,
  AssessmentID varchar(255) NULL,
  ICDCode varchar(255) NULL,
  AddDate date NULL,
  UniqueRowID int default 0 NULL,
  
  LoadDate datetime NULL,
  Condition varchar(255) NULL,
  PRIMARY KEY (ID)
)  ;

/* Drop table if it exists */
IF OBJECT_ID('dbo.FACT_Procedure', 'U') IS NOT NULL
  DROP TABLE dbo.FACT_Procedure;

CREATE TABLE FACT_Procedure (
  ID bigint IDENTITY(1,1) NOT NULL,
  DataSourceID int NULL,
  ExportFlag int default 0,
  FacilityID varchar(255) NULL,
  ProviderID varchar(255) NULL,
  PatientID int NULL,
  EncounterID int NULL,
  ReportID varchar(255) NULL,
  ProcedureID varchar(255) NULL,
  Value varchar(255) NULL,
  ProcResult varchar(255) NULL,
  OrderDate varchar(255) NULL,
  ResultDate varchar(255) NULL,
  ReviewedDate varchar(255) NULL,
  UniqueRowID int default 0 NULL,
  
  LoadDate datetime NULL,
  PRIMARY KEY (ID)
)  ;


/* Drop table if it exists */
IF OBJECT_ID('dbo.FACT_Referral', 'U') IS NOT NULL
  DROP TABLE dbo.FACT_Referral;

CREATE TABLE FACT_Referral (
  ID bigint IDENTITY(1,1) NOT NULL,
  DataSourceID int NULL,
  ExportFlag int default 0,
  FacilityID varchar(255) NULL,
  ProviderID varchar(255) NULL,
  PatientID int NULL,
  EncounterID int NULL,
  ReferralDate varchar(255) NULL,
  Status varchar(255) NULL,
  ReceivedDate varchar(255) NULL,
  AssessmentID varchar(255) NULL,
  AppointmentDate varchar(255) NULL,
  FromFacilityID varchar(255) NULL,
  ToFacilityID varchar(255) NULL,
  FromProviderID varchar(255) NULL,
  ToProviderID varchar(255) NULL,
  Specialty varchar(255) NULL,
  ReferralID varchar(255) NULL,
  ReferralStartDate varchar(255) NULL,
  ReferralEndDate varchar(255) NULL,
  UniqueRowID int default 0 NULL,
  
  LoadDate varchar(255) NULL,
  Reason varchar(255) NULL,
  PRIMARY KEY (ID)
)  ;

/* Drop table if it exists */
IF OBJECT_ID('dbo.FACT_Structdata', 'U') IS NOT NULL
  DROP TABLE dbo.FACT_Structdata;

CREATE TABLE FACT_Structdata (
  ID bigint IDENTITY(1,1) NOT NULL,
  DataSourceID int NULL,
  ExportFlag int default 0,
  FacilityID varchar(255) NULL,
  ProviderID varchar(255) NULL,
  PatientID int NULL,
  EncounterID int NULL,
  EncounterDate date NULL,
  Section varchar(255) NULL,
  QuestionID int NULL,
  Question varchar(500) NULL,
  Answer varchar(500) NULL,
  UniqueRowID int default 0 NULL,
  
  LoadDate datetime NULL,
  PRIMARY KEY (ID)
)  ;

/* Drop table if it exists */
IF OBJECT_ID('dbo.FACT_Vitals', 'U') IS NOT NULL
  DROP TABLE dbo.FACT_Vitals;

CREATE TABLE FACT_Vitals (
  ID bigint IDENTITY(1,1) NOT NULL,
  DataSourceID int NULL,
  ExportFlag int default 0,
  FacilityID varchar(255) NULL,
  ProviderID varchar(255) NULL,
  PatientID int NULL,
  EncounterID int NULL,
  EncounterDate date NULL,
  VitalID int NULL,
  Value varchar(255) NULL,
  UpdatedBy varchar(255) NULL,
  UpdatedByFirstName varchar(255) NULL,
  UpdatedByLastName varchar(255) NULL,
  UniqueRowID int default 0 NULL,
  
  LoadDate datetime NULL,
  PRIMARY KEY (ID)
)  ;

/* Drop table if it exists */
IF OBJECT_ID('dbo.FACT_Xray', 'U') IS NOT NULL
  DROP TABLE dbo.FACT_Xray;

CREATE TABLE FACT_Xray (
  ID bigint IDENTITY(1,1) NOT NULL,
  DataSourceID int NULL,
  ExportFlag int default 0,
  FacilityID varchar(255) NULL,
  ProviderID varchar(255) NULL,
  PatientID int NULL,
  EncounterID int NULL,
  ReportID varchar(255) NULL,
  XRayID varchar(255) NULL,
  Value varchar(255) NULL,
  XRayResult varchar(255) NULL,
  OrderDate varchar(255) NULL,
  ResultDate varchar(255) NULL,
  ReviewedDate varchar(255) NULL,
  UniqueRowID int default 0 NULL,
  LoadDate datetime NULL,
  PRIMARY KEY (ID)
)  ;

GO
--
--
--

--
-- END OF TABLES
--