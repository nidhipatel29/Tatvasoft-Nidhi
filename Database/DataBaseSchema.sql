CREATE DATABASE helperlandDb

USE helperlandDb

GO

CREATE SCHEMA MegaClass
GO 

CREATE TABLE Customer (
cus_id int NOT NULL PRIMARY KEY,
cus_Fname nvarchar(50),
cus_Lname nvarchar(50),
cus_Passsword varchar(50),
cus_Email varchar(50),
cus_ConNum int ,
cus_DOB varchar(20),
cus_Lang nvarchar(20),
cus_Notification varchar(50),
cus_Service varchar(50),
cus_Fav_Pros varchar(50),
cus_Status varchar(50)
)
GO

CREATE TABLE Address(
add_Id int NOT NULL PRIMARY KEY,
cus_Address varchar(50),
con_Number int,
cus_Id int,
FOREIGN KEY (cus_Id) REFERENCES  Customer(cus_Id)
)
GO

CREATE TABLE Services(
service_Id int NOT NULL PRIMARY KEY,
service_Time TIME,
service_Duration TIME,
service_Comment varchar(70),
service_havePets BIT   NULL   DEFAULT 0,
address_Id int ,
FOREIGN KEY (address_Id) REFERENCES  Address(add_Id),
service_InvoiceAdd varchar(70),
payment_Success BIT   NULL   DEFAULT 0,
payment_Id int,
payment_amnt int,
service_Status varchar(10),
service_Ratings int,
cus_Id int,
sp_Id int,
invoice_Id int,
FOREIGN KEY (cus_Id) REFERENCES  Customer(cus_Id),
)

GO

CREATE TABLE Invoice(
invoice_Id int NOT NULL PRIMARY KEY,
invoice_Time TIME,
invoice_Ammount int,
invoice_Link varchar(50),
)

GO

CREATE TABLE all_Notification(
not_Id int NOT NULL PRIMARY KEY,
cus_to_sp BIT   NULL   DEFAULT 0,
not_From varchar(10),
not_To varchar(10),
not_Content varchar(50),
not_TIme TIME,
)

GO

CREATE TABLE ContactDetails(
FirstName varchar(50) NOT NULL,
LastName varchar(50) NOT NULL,
CONSTRAINT user_info PRIMARY KEY (FirstName,LastName),
Email varchar(50),
Contact_Number int,
Query_type varchar(50),
Detailed_msg varchar(50),
Attechament varchar(50)
)

GO

CREATE TABLE ExtraServices(
extraSerivce_ID int NOT NULL PRIMARY KEY,
service_amnt int,
service_Duration TIME,
)

GO

CREATE TABLE ServiceProvider(
sp_ID INT NOT NULL PRIMARY KEY,
sp_Active_Status varchar(20),
sp_Fname varchar(50),
sp_Lname varchar(50),
sp_Pswd varchar(50),
sp_con_N0 int ,
sp_Nationality varchar(50),
sp_Gender varchar(10),
sp_DOB varchar(10),
sp_avtar_Id int,
sp_Address varchar(50),
sp_billing_Add varchar(50),
sp_tax_No int,
sp_service_radius int,
sp_pets BIT   NULL   DEFAULT 0,
extraSerivce_ID int,
sp_Lang varchar(20),
sp_Blocklist varchar(50),
not_Id int,
user_info varchar(50),
FOREIGN KEY (not_Id) REFERENCES  all_Notification(not_Id),

)

GO


CREATE TABLE SP_Documents(
doc_ID INT NOT NULL PRIMARY KEY,
doc_Name varchar(50),
doc_Type varchar(50),
doc_issue_Date varchar(50),
doc_expiry_Date varchar(50),
doc_Link varchar(50),
sp_Id int,
FOREIGN KEY (sp_Id) REFERENCES  ServiceProvider(sp_Id),
)

GO

CREATE TABLE AvailbilityOfSP(
sp_Id int NOT NULL PRIMARY KEY,
all_day BIT   NULL   DEFAULT 0,
day_Time TIME,

Monday BIT   NULL   DEFAULT 0,
mon_Time TIME,

Tuesday BIT   NULL   DEFAULT 0,
tue_Time TIME,

Wednesday BIT   NULL   DEFAULT 0,
wed_Time TIME,

Thursday BIT   NULL   DEFAULT 0,
th_Time TIME,

Friday BIT   NULL   DEFAULT 0,
fri_Time TIME,

Saturday BIT   NULL   DEFAULT 0,
sat_Time TIME,

Sunday BIT   NULL   DEFAULT 0,
sun_Time TIME,
)

GO

CREATE TABLE Avtar(
avtar_Id int NOT NULL PRIMARY KEY,
avtar_Link varchar(50),
)

GO

CREATE TABLE AdminTbl(
admin_Id INT NOT NULL PRIMARY KEY,
admin_Mail varchar(50),
admin_Password varchar(50),
admin_Lang varchar(50)
)

GO