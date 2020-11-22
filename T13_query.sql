CREATE DATABASE T13_COMPANY;
USE T13_COMPANY;

CREATE TABLE T13_INCIDENT (
    T13_Incident_Id VARCHAR(20) NOT NULL,
    T13_Incident_Type VARCHAR(30) NULL,
    T13_Incident_Date DATE NOT NULL,
    Description VARCHAR(100) NULL,
    CONSTRAINT XPKT13_INCIDENT_17 PRIMARY KEY (T13_Incident_Id)
);
CREATE UNIQUE INDEX XPKT13_INCIDENT_17 ON T13_INCIDENT(T13_Incident_Id ASC);

CREATE TABLE T13_CUSTOMER (
    Cust_Id VARCHAR(20) NOT NULL,
    Cust_FName VARCHAR(10) NOT NULL,
    Cust_LName VARCHAR(10) NOT NULL,
    Cust_DOB DATE NOT NULL,
    Cust_Gender CHAR(2) NOT NULL,
    Cust_Address VARCHAR(20) NOT NULL,
    Cust_MOB_Number INTEGER NOT NULL,
    Cust_Email VARCHAR(20) NULL,
    Cust_Passport_Number VARCHAR(20) NULL,
    Cust_Marital_Status CHAR(8) NULL,
    Cust_PPS_Number INTEGER NULL,
    CONSTRAINT XPKT13_CUSTOMER_1 PRIMARY KEY (Cust_Id)
);
CREATE UNIQUE INDEX XPKT13_CUSTOMER_1 ON T13_CUSTOMER(Cust_Id ASC);

CREATE TABLE T13_INCIDENT_REPORT (
    T13_Incident_Report_Id VARCHAR(20) NOT NULL,
    T13_Incident_Type CHAR(10) NULL,
    T13_Incident_Inspector VARCHAR(20) NULL,
    T13_Incident_Cost INTEGER NULL,
    T13_Incident_Report_Description VARCHAR(100) NULL,
    T13_Incident_Id VARCHAR(20) NOT NULL,
    Cust_Id VARCHAR(20) NOT NULL,
    CONSTRAINT XPKT13_INCIDENT_REPORT_18 PRIMARY KEY (T13_Incident_Report_Id , T13_Incident_Id , Cust_Id),
    CONSTRAINT R_83 FOREIGN KEY (T13_Incident_Id)
        REFERENCES T13_INCIDENT (T13_Incident_Id),
    CONSTRAINT R_86 FOREIGN KEY (Cust_Id)
        REFERENCES T13_CUSTOMER (Cust_Id)
);
CREATE UNIQUE INDEX XPKT13_INCIDENT_REPORT_18 ON T13_INCIDENT_REPORT
(T13_Incident_Report_Id ASC,T13_Incident_Id ASC,Cust_Id ASC);

CREATE TABLE T13_INSURANCE_COMPANY (
    Company_Name VARCHAR(20) NOT NULL,
    Company_Address VARCHAR(50) NULL,
    Company_Contact_Number INTEGER NULL,
    Company_Fax INTEGER NULL,
    Company_Email VARCHAR(20) NULL,
    Company_Website VARCHAR(20) NULL,
    Company_Location VARCHAR(20) NULL,
    CONSTRAINT XPKT13_INSURANCE_COMPANY_15 PRIMARY KEY (Company_Name)
);
CREATE UNIQUE INDEX XPKT13_INSURANCE_COMPANY_15 ON T13_INSURANCE_COMPANY
(Company_Name ASC);

CREATE TABLE T13_DEPARTMENT (
    T13_Department_Name VARCHAR(20) NOT NULL,
    T13_Department_ID CHAR(18) NOT NULL,
    T13_Department_T13_Staff CHAR(18) NULL,
    T13_Department_T13_Offices CHAR(18) NULL,
    Company_Name VARCHAR(20) NOT NULL,
    CONSTRAINT XPKT13_DEPARTMENT PRIMARY KEY (T13_Department_Name , T13_Department_ID , Company_Name),
    CONSTRAINT R_56 FOREIGN KEY (Company_Name)
        REFERENCES T13_INSURANCE_COMPANY (Company_Name)
);
CREATE UNIQUE INDEX XPKT13_DEPARTMENT ON T13_DEPARTMENT	
(T13_Department_Name ASC,T13_Department_ID ASC,Company_Name ASC);

CREATE TABLE T13_T13_VEHICLE_SERVICE (
    T13_Department_Name VARCHAR(20) NOT NULL,
    T13_T13_Vehicle_Service_Company_Name VARCHAR(20) NOT NULL,
    T13_T13_Vehicle_Service_Address VARCHAR(20) NULL,
    T13_T13_Vehicle_Service_Contact VARCHAR(20) NULL,
    T13_T13_Vehicle_Service_Incharge VARCHAR(20) NULL,
    T13_T13_Vehicle_Service_Type VARCHAR(20) NULL,
    T13_Department_Id VARCHAR(20) NOT NULL,
    Company_Name VARCHAR(20) NOT NULL,
    CONSTRAINT XPKT13_T13_VEHICLE_SERVICE PRIMARY KEY (T13_T13_Vehicle_Service_Company_Name , T13_Department_Name),
    CONSTRAINT R_50 FOREIGN KEY (T13_Department_Name , T13_Department_Id , Company_Name)
        REFERENCES T13_DEPARTMENT (T13_Department_Name , T13_Department_ID , Company_Name)
);
CREATE UNIQUE INDEX XPKT13_T13_VEHICLE_SERVICE ON T13_T13_VEHICLE_SERVICE
(T13_T13_Vehicle_Service_Company_Name ASC,T13_Department_Name ASC);

CREATE TABLE T13_VEHICLE (
    T13_Vehicle_Id VARCHAR(20) NOT NULL,
    Policy_Id VARCHAR(20) NULL,
    Dependent_T13_NOK_Id VARCHAR(20) NULL,
    T13_Vehicle_Registration_Number VARCHAR(20) NOT NULL,
    T13_Vehicle_Value INTEGER NULL,
    T13_Vehicle_Type VARCHAR(20) NOT NULL,
    T13_Vehicle_Size INTEGER NULL,
    T13_Vehicle_Number_Of_Seat INTEGER NULL,
    T13_Vehicle_Manufacturer VARCHAR(20) NULL,
    T13_Vehicle_Engine_Number INTEGER NULL,
    T13_Vehicle_Chasis_Number INTEGER NULL,
    T13_Vehicle_Number VARCHAR(20) NULL,
    T13_Vehicle_Model_Number VARCHAR(20) NULL,
    Cust_Id VARCHAR(20) NOT NULL,
    CONSTRAINT XPKT13_VEHICLE_6 PRIMARY KEY (T13_Vehicle_Id , Cust_Id),
    CONSTRAINT R_92 FOREIGN KEY (Cust_Id)
        REFERENCES T13_CUSTOMER (Cust_Id)
);
CREATE UNIQUE INDEX XPKT13_VEHICLE_6 ON T13_VEHICLE (T13_Vehicle_Id ASC,Cust_Id ASC);

CREATE TABLE T13_PREMIUM_PAYMENT (
    T13_Premium_Payment_Id VARCHAR(20) NOT NULL,
    Policy_Number VARCHAR(20) NOT NULL,
    T13_Premium_Payment_Amount INTEGER NOT NULL,
    T13_Premium_Payment_Schedule DATE NOT NULL,
    T13_Receipt_Id VARCHAR(20) NOT NULL,
    Cust_Id VARCHAR(20) NOT NULL,
    CONSTRAINT XPKT13_PREMIUM_PAYMENT_5 PRIMARY KEY (T13_Premium_Payment_Id , Cust_Id),
    CONSTRAINT R_85 FOREIGN KEY (Cust_Id)
        REFERENCES T13_CUSTOMER (Cust_Id)
);
CREATE UNIQUE INDEX XPKT13_PREMIUM_PAYMENT_5 ON T13_PREMIUM_PAYMENT (T13_Premium_Payment_Id ASC,Cust_Id ASC);

CREATE TABLE T13_RECEIPT (
    T13_Receipt_Id VARCHAR(20) NOT NULL,
    Time DATE NOT NULL,
    Cost INTEGER NOT NULL,
    T13_Premium_Payment_Id VARCHAR(20) NOT NULL,
    Cust_Id VARCHAR(20) NOT NULL,
    CONSTRAINT XPKT13_RECEIPT_21 PRIMARY KEY (T13_Receipt_Id , T13_Premium_Payment_Id , Cust_Id),
    CONSTRAINT R_84 FOREIGN KEY (T13_Premium_Payment_Id , Cust_Id)
        REFERENCES T13_PREMIUM_PAYMENT (T13_Premium_Payment_Id , Cust_Id)
);
CREATE UNIQUE INDEX XPKT13_RECEIPT_21 ON T13_RECEIPT (T13_Receipt_Id ASC,T13_Premium_Payment_Id ASC,Cust_Id ASC);

CREATE TABLE T13_APPLICATION (
    T13_Application_Id VARCHAR(20) NOT NULL,
    T13_Vehicle_Id VARCHAR(20) NOT NULL,
    T13_Application_Status CHAR(8) NOT NULL,
    T13_Coverage VARCHAR(50) NOT NULL,
    Cust_Id VARCHAR(20) NOT NULL,
    CONSTRAINT XPKT13_APPLICATION_2 PRIMARY KEY (T13_Application_Id , Cust_Id),
    CONSTRAINT R_93 FOREIGN KEY (Cust_Id)
        REFERENCES T13_CUSTOMER (Cust_Id)
);
CREATE UNIQUE INDEX XPKT13_APPLICATION_2 ON T13_APPLICATION (T13_Application_Id ASC,Cust_Id ASC);

CREATE TABLE T13_INSURANCE_POLICY (
    Agreement_id VARCHAR(20) NOT NULL,
    T13_Department_Name VARCHAR(20) NULL,
    Policy_Number VARCHAR(20) NULL,
    Start_Date DATE NULL,
    Expiry_Date DATE NULL,
    Term_Condition_Description VARCHAR(100) NULL,
    T13_Application_Id VARCHAR(20) NOT NULL,
    Cust_Id VARCHAR(20) NOT NULL,
    CONSTRAINT XPKT13_INSURANCE_POLICY_4 PRIMARY KEY (Agreement_id , T13_Application_Id , Cust_Id),
    CONSTRAINT R_95 FOREIGN KEY (T13_Application_Id , Cust_Id)
        REFERENCES T13_APPLICATION (T13_Application_Id , Cust_Id)
);
CREATE UNIQUE INDEX XPKT13_INSURANCE_POLICY_4 ON T13_INSURANCE_POLICY(Agreement_id ASC,T13_Application_Id ASC,Cust_Id ASC);

CREATE TABLE T13_POLICY_RENEWABLE (
    T13_Policy_Renewable_Id VARCHAR(20) NOT NULL,
    Date_Of_Renewal DATE NOT NULL,
    Type_Of_Renewal CHAR(15) NOT NULL,
    Agreement_id VARCHAR(20) NOT NULL,
    T13_Application_Id VARCHAR(20) NOT NULL,
    Cust_Id VARCHAR(20) NOT NULL,
    CONSTRAINT XPKT13_POLICY_RENEWABLE_16 PRIMARY KEY (T13_Policy_Renewable_Id , Agreement_id , T13_Application_Id , Cust_Id),
    CONSTRAINT R_101 FOREIGN KEY (Agreement_id , T13_Application_Id , Cust_Id)
        REFERENCES T13_INSURANCE_POLICY (Agreement_id , T13_Application_Id , Cust_Id)
);
CREATE UNIQUE INDEX XPKT13_POLICY_RENEWABLE_16 ON T13_POLICY_RENEWABLE 
(T13_Policy_Renewable_Id ASC,Agreement_id ASC,T13_Application_Id
ASC,Cust_Id ASC);

CREATE TABLE T13_MEMBERSHIP (
    T13_Membership_Id VARCHAR(20) NOT NULL,
    T13_Membership_Type CHAR(15) NOT NULL,
    Organisation_Contact VARCHAR(20) NULL,
    Cust_Id VARCHAR(20) NOT NULL,
    CONSTRAINT XPKT13_MEMBERSHIP_12 PRIMARY KEY (T13_Membership_Id , Cust_Id),
    CONSTRAINT R_91 FOREIGN KEY (Cust_Id)
        REFERENCES T13_CUSTOMER (Cust_Id)
);
CREATE UNIQUE INDEX XPKT13_MEMBERSHIP_12 ON T13_MEMBERSHIP (T13_Membership_Id ASC,Cust_Id ASC);

CREATE TABLE T13_QU0TE (
    Quote_Id VARCHAR(20) NOT NULL,
    Issue_Date DATE NOT NULL,
    Valid_From_Date DATE NOT NULL,
    Valid_Till_Date DATE NOT NULL,
    Description VARCHAR(100) NULL,
    T13_Product_Id VARCHAR(20) NOT NULL,
    T13_Coverage_Level VARCHAR(20) NOT NULL,
    T13_Application_Id VARCHAR(20) NOT NULL,
    Cust_Id VARCHAR(20) NOT NULL,
    CONSTRAINT XPKT13_QU0TE_3 PRIMARY KEY (Quote_Id , T13_Application_Id , Cust_Id),
    CONSTRAINT R_94 FOREIGN KEY (T13_Application_Id , Cust_Id)
        REFERENCES T13_APPLICATION (T13_Application_Id , Cust_Id)
);
CREATE UNIQUE INDEX XPKT13_QU0TE_3 ON T13_QU0TE
(Quote_Id ASC,T13_Application_Id ASC,Cust_Id ASC);

CREATE TABLE T13_STAFF (
    T13_Staff_Id VARCHAR(20) NOT NULL,
    T13_Staff_Fname VARCHAR(10) NULL,
    T13_Staff_LName VARCHAR(10) NULL,
    T13_Staff_Adress VARCHAR(20) NULL,
    T13_Staff_Contact INTEGER NULL,
    T13_Staff_Gender CHAR(2) NULL,
    T13_Staff_Marital_Status CHAR(8) NULL,
    T13_Staff_Nationality CHAR(15) NULL,
    T13_Staff_Qualification VARCHAR(20) NULL,
    T13_Staff_Allowance INTEGER NULL,
    T13_Staff_PPS_Number INTEGER NULL,
    Company_Name VARCHAR(20) NOT NULL,
    CONSTRAINT XPKT13_STAFF_9 PRIMARY KEY (T13_Staff_Id , Company_Name),
    CONSTRAINT R_105 FOREIGN KEY (Company_Name)
        REFERENCES T13_INSURANCE_COMPANY (Company_Name)
);
CREATE UNIQUE INDEX XPKT13_STAFF_9 ON T13_STAFF(T13_Staff_Id ASC,Company_Name ASC);

CREATE TABLE T13_NOK (
    T13_Nok_Id VARCHAR(20) NOT NULL,
    T13_Nok_Name VARCHAR(20) NULL,
    T13_Nok_Address VARCHAR(20) NULL,
    T13_Nok_Phone_Number INTEGER NULL,
    T13_Nok_Gender CHAR(2) NULL,
    T13_Nok_Marital_Status CHAR(8) NULL,
    Agreement_id VARCHAR(20) NOT NULL,
    T13_Application_Id VARCHAR(20) NOT NULL,
    Cust_Id VARCHAR(20) NOT NULL,
    CONSTRAINT XPKT13_NOK_14 PRIMARY KEY (T13_Nok_Id , Agreement_id , T13_Application_Id , Cust_Id),
    CONSTRAINT R_99 FOREIGN KEY (Agreement_id , T13_Application_Id , Cust_Id)
        REFERENCES T13_INSURANCE_POLICY (Agreement_id , T13_Application_Id , Cust_Id)
);
CREATE UNIQUE INDEX XPKT13_NOK_14 ON T13_NOK (T13_Nok_Id ASC,Agreement_id ASC,T13_Application_Id ASC);

CREATE TABLE T13_PRODUCT (
    T13_Product_Price INTEGER NULL,
    T13_Product_Type CHAR(15) NULL,
    T13_Product_Number VARCHAR(20) NOT NULL,
    Company_Name VARCHAR(20) NOT NULL,
    CONSTRAINT XPKT13_PRODUCT_20 PRIMARY KEY (T13_Product_Number , Company_Name),
    CONSTRAINT R_107 FOREIGN KEY (Company_Name)
        REFERENCES T13_INSURANCE_COMPANY (Company_Name)
);
CREATE UNIQUE INDEX XPKT13_PRODUCT_20 ON T13_PRODUCT (T13_Product_Number ASC,Company_Name ASC);

CREATE TABLE T13_OFFICE (
    T13_Office_Name VARCHAR(20) NOT NULL,
    T13_Office_Leader VARCHAR(20) NOT NULL,
    Contact_Information VARCHAR(20) NOT NULL,
    Address VARCHAR(20) NOT NULL,
    Admin_Cost INTEGER NULL,
    T13_Staff VARCHAR(50) NULL,
    T13_Department_Name VARCHAR(20) NOT NULL,
    Company_Name VARCHAR(20) NOT NULL,
    T13_Department_ID CHAR(18) NOT NULL,
    CONSTRAINT XPKT13_OFFICE_11 PRIMARY KEY (T13_Office_Name , T13_Department_Name , Company_Name),
    CONSTRAINT R_104 FOREIGN KEY (T13_Department_Name , T13_Department_ID , Company_Name)
        REFERENCES T13_DEPARTMENT (T13_Department_Name , T13_Department_ID , Company_Name)
);
CREATE UNIQUE INDEX XPKT13_OFFICE_11 ON T13_OFFICE (T13_Office_Name ASC,T13_Department_Name ASC,Company_Name ASC);

CREATE TABLE T13_COVERAGE (
    T13_Coverage_Id VARCHAR(20) NOT NULL,
    T13_Coverage_Amount INTEGER NOT NULL,
    T13_Coverage_Type CHAR(10) NOT NULL,
    T13_Coverage_Level CHAR(15) NOT NULL,
    T13_Product_Id VARCHAR(20) NOT NULL,
    T13_Coverage_Description VARCHAR(100) NULL,
    Covearge_Terms VARCHAR(50) NULL,
    Company_Name VARCHAR(20) NOT NULL,
    CONSTRAINT XPKT13_COVERAGE_19 PRIMARY KEY (T13_Coverage_Id , Company_Name),
    CONSTRAINT R_102 FOREIGN KEY (Company_Name)
        REFERENCES T13_INSURANCE_COMPANY (Company_Name)
);
CREATE UNIQUE INDEX XPKT13_COVERAGE_19 ON T13_COVERAGE (T13_Coverage_Id ASC,Company_Name ASC);

CREATE TABLE T13_INSURANCE_POLICY_T13_COVERAGE (
    Agreement_id VARCHAR(20) NOT NULL,
    T13_Application_Id VARCHAR(20) NOT NULL,
    Cust_Id VARCHAR(20) NOT NULL,
    T13_Coverage_Id VARCHAR(20) NOT NULL,
    Company_Name VARCHAR(20) NOT NULL,
    CONSTRAINT XPKT13_INSURANCE_POLICY_4_T13_COVERAGE PRIMARY KEY (Agreement_id , T13_Application_Id , Cust_Id , T13_Coverage_Id , Company_Name),
    CONSTRAINT R_97 FOREIGN KEY (Agreement_id , T13_Application_Id , Cust_Id)
        REFERENCES T13_INSURANCE_POLICY (Agreement_id , T13_Application_Id , Cust_Id),
    CONSTRAINT R_98 FOREIGN KEY (T13_Coverage_Id , Company_Name)
        REFERENCES T13_COVERAGE (T13_Coverage_Id , Company_Name)
);
CREATE UNIQUE INDEX XPKT13_INSURANCE_POLICY_4_T13_COVERAGE ON T13_INSURANCE_POLICY_T13_COVERAGE(
Agreement_id ASC,T13_Application_Id ASC,Cust_Id ASC,T13_Coverage_Id ASC,Company_Name ASC);

CREATE TABLE T13_CLAIM (
    T13_Claim_Id VARCHAR(20) NOT NULL,
    Agreement_Id VARCHAR(20) NOT NULL,
    T13_Claim_Amount INTEGER NOT NULL,
    T13_Incident_Id VARCHAR(20) NOT NULL,
    Damage_Type VARCHAR(20) NOT NULL,
    Date_Of_T13_Claim DATE NOT NULL,
    T13_Claim_Status CHAR(10) NOT NULL,
    Cust_Id VARCHAR(20) NOT NULL,
    CONSTRAINT XPKT13_CLAIM_7 PRIMARY KEY (T13_Claim_Id , Cust_Id),
    CONSTRAINT R_88 FOREIGN KEY (Cust_Id)
        REFERENCES T13_CUSTOMER (Cust_Id)
);
CREATE UNIQUE INDEX XPKT13_CLAIM_7 ON T13_CLAIM(T13_Claim_Id ASC,Cust_Id ASC);

CREATE TABLE T13_CLAIM_SETTLEMENT (
    T13_Claim_Settlement_Id VARCHAR(20) NOT NULL,
    T13_Vehicle_Id VARCHAR(20) NOT NULL,
    Date_Settled DATE NOT NULL,
    Amount_Paid INTEGER NOT NULL,
    T13_Coverage_Id VARCHAR(20) NOT NULL,
    T13_Claim_Id VARCHAR(20) NOT NULL,
    Cust_Id VARCHAR(20) NOT NULL,
    CONSTRAINT XPKT13_CLAIM_SETTLEMENT_8 PRIMARY KEY (T13_Claim_Settlement_Id , T13_Claim_Id , Cust_Id),
    CONSTRAINT R_90 FOREIGN KEY (T13_Claim_Id , Cust_Id)
        REFERENCES T13_CLAIM (T13_Claim_Id , Cust_Id)
);
CREATE UNIQUE INDEX XPKT13_CLAIM_SETTLEMENT_8 ON T13_CLAIM_SETTLEMENT (T13_Claim_Settlement_Id ASC,T13_Claim_Id ASC,Cust_Id ASC);