create table Visa( 
    Passport_ID varchar2(255) NOT NULL PRIMARY KEY, 
    Visa_Type varchar2(5) NOT NULL, 
    First_Name varchar2(50) NOT NULL, 
    Last_Name varchar2(50) NOT NULL, 
    Date_of_Birth date, 
    Email_ID varchar2(255) NOT NULL, 
    Phone_Number int NOT NULL, 
    Nationality varchar2(50) NOT NULL 
); 
 
create table Tourist( 
    Passport_ID varchar2(255) NOT NULL PRIMARY KEY, 
    Duration_Of_Stay INT, 
    Intended_Arrival_Date DATE, 
    FOREIGN KEY (Passport_ID) references Visa(Passport_ID) 
); 
 
create table Dependant( 
    Primary_Passport_ID varchar2(255) NOT NULL, 
    Passport_ID varchar(255) NOT NULL, 
    Relationship varchar2(10), 
    PRIMARY KEY (Passport_ID,Primary_Passport_ID), 
    FOREIGN KEY (Primary_Passport_ID) references Visa(Passport_ID) 
); 
 
create table Student( 
    Student_ID INT NOT NULL, 
    Passport_ID varchar2(255) NOT NULL, 
    Visa_Expiration_Date Date, 
    IS_HAVING_SSN CHAR(1) CHECK (IS_HAVING_SSN IN ('Y','N')), 
    PRIMARY KEY (Student_ID), 
    FOREIGN KEY(Passport_ID) references Visa(Passport_ID) 
); 
 
create table enrollment ( 
    Enrollment_ID NUMBER NOT NULL PRIMARY KEY, 
    Student_ID INT NOT NULL, 
    Section_ID  VARCHAR2(255) NOT NULL, 
    FOREIGN KEY (Student_ID) references Student(Student_ID) 
); 
 
create table section ( 
    Section_ID varchar2(255) NOT NULL PRIMARY KEY, 
    Course_ID INT NOT NULL, 
    Section varchar2(255), 
    Semester_Year varchar2(255) 
); 
 
alter table enrollment 
add constraint enroll_fk2 FOREIGN KEY (Section_ID) references section(Section_ID); 
 
create table course ( 
    Course_ID INT NOT NULL PRIMARY KEY, 
    Course_Name char(20), 
    Department char(20), 
    Credits INT 
); 
 
alter table section 
add constraint section_fk1 FOREIGN KEY (Course_ID) references course(Course_ID); 
 
create table FinancialAid ( 
    FinancialAidID varchar2(255) NOT NULL PRIMARY KEY, 
    Student_ID INT NOT NULL, 
    FOREIGN KEY (Student_ID) references Student(Student_ID) 
); 
 
create table Scholarship ( 
    FinancialAidID varchar2(255) NOT NULL PRIMARY KEY, 
    Provider char(20), 
    CGPA INT NOT NULL, 
    FOREIGN KEY (FinancialAidID) references FinancialAid(FinancialAidID) 
); 
 
create table Loan ( 
    FinancialAidID varchar2(255) NOT NULL PRIMARY KEY, 
    Loan_Provider char(20), 
    Grace_Period varchar2(255), 
    FOREIGN KEY (FinancialAidID) references FinancialAid(FinancialAidID) 
); 
 
create table Sponsor ( 
    FinancialAidID varchar2(255) NOT NULL PRIMARY KEY, 
    Sponsor_FullName char(50), 
    Relationship char(20), 
    FOREIGN KEY (FinancialAidID) references FinancialAid(FinancialAidID) 
); 
 
create table Employment ( 
    Employment_ID varchar2(255) PRIMARY KEY, 
    Student_ID INT, 
    Department char(50), 
    Position_ varchar2(255), 
    Start_Date Date, 
    End_Date Date, 
    FOREIGN KEY (Student_ID) references Student(Student_ID) 
);