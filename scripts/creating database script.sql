create database Medic
go

use Medic
go


--������������ ������
create table DispanserGroup
(id int not null primary key,
name nvarchar(50) not null
)
go

--����� ������
create table Streets
(
id int not null primary key,
name nvarchar(50) not null
)
go

--������
create table Privileges
(
id int not null primary key, 
name nvarchar(50) not null
)
go

--�������
create table Patient
(
id int not null primary key,
idPatient int not null,          -- id ��������
cardNumber int,                  -- ����� ����������� ��������
name nvarchar(50) not null,      -- ���   
fathersName nvarchar(50) not null,--��������
surname nvarchar(50) not null,   -- �������
sex bit,                         -- ���
dateOfBirth datetime,            -- ���� ��������
idDispanserGroup int,            -- ������������ ������
phone1 nvarchar(20),
phone2 nvarchar(20),
idStreet int,                    
houseNumber nvarchar(50),        -- ����� ���� � ��������� �����
placeOfWork nvarchar(50),        -- ����� ������
position nvarchar(50),           -- ���������
prefCardNumber nvarchar(50),     -- ����� ��������� �������������
startRegistrationDate datetime,  -- ���� ������ �� ����
endRegistrationDate datetime,    -- ���� ������ � �����
startOfrecord datetime not null, -- ���� ��������� ��������
constraint F_KEY_DISP_GROUP foreign key (idDispanserGroup) references DispanserGroup(id) on delete cascade on update cascade,
constraint F_KEY_ID_STREET foreign key (idStreet) references Streets(id) on delete no action on update cascade
)
go

--��������� �������������
create table Specialization
(
id int primary key not null,
name nvarchar(50)
)
go


--�����������
create table MedWorker
(
id int primary key not null,
name nvarchar(50) not null,      -- ���   
fathersName nvarchar(50) not null,--��������
surname nvarchar(50) not null,   -- �������
idPrivileges int,                -- ?????????????????
dateOfBirth datetime,            -- ���� ��������
phone1 nvarchar(20),
phone2 nvarchar(20),
idStreet int,                    
houseNumber nvarchar(50),        -- ����� ���� � ��������� �����
idSpecialization int not null,   -- ������������� �����
position nvarchar(50) not null,  -- ���������
email nvarchar(50) not null,
hiringDate datetime,             -- ���� ������ �� ������
constraint F_KEY_ID_PRIVILEGES foreign key (idPrivileges) references Privileges(id) on delete no action on update cascade,
constraint F_KEY_STREET foreign key (idStreet) references Streets(id) on delete no action on update cascade,
constraint F_KEY_ID_SPECIALIZ foreign key (idSpecialization) references Specialization(id) on delete no action on update cascade
)
go


--���� email-������
create table Credentials
(
id int not null primary key, 
EmailMedWorker nvarchar(50) not null,                
password nvarchar(20) check (password<=20) not null,
)
go





create table DoctorPatient
(
id int primary key not null,
idPatient int not null,
idMedWorker int not null,
ContractNumber int,
constraint FK_IDPATIENT foreign key (idPatient) references Patient(id) on delete no action on update no action,
constraint FK_IDMEDWORKER foreign key (idMedWorker) references MedWorker(id) on delete no action on update no action
)
go

create table TimeTable
(
id int primary key not null,
idMedWorker int,                       -- id ������������
numberOfWeek int,                      -- ����� ������

MondayWorkHoursInHospitalStart time,   -- ������ ������ � �����������
MondayWorkHoursInHospitalEnd time,     -- ����� ������ � �����������
MondayWorkHoursOnCallStart time,       -- ������ ������ �� ������
MondayWorkHoursOnCallEnd time,         -- ����� ������ �� ������

TuesdayWorkHoursInHospitalStart time,
TuesdayWorkHoursInHospitalEnd time,
TuesdayWorkHoursOnCallStart time,
TuesdayWorkHoursOnCallEnd time,

WednesdayWorkHoursInHospitalStart time,
WednesdayWorkHoursInHospitalEnd time,
WednesdayWorkHoursOnCallStart time,
WednesdayWorkHoursOnCallEnd time,

ThursdayWorkHoursInHospitalStart time,
ThursdayWorkHoursInHospitalEnd time,
ThursdayWorkHoursOnCallStart time,
ThursdayWorkHoursOnCallEnd time,

FridayWorkHoursInHospitalStart time,
FridayWorkHoursInHospitalEnd time,
FridayWorkHoursOnCallStart time,
FridayWorkHoursOnCallEnd time,

SaturdayWorkHoursInHospitalStart time,
SaturdayWorkHoursInHospitalEnd time,
SaturdayWorkHoursOnCallStart time,
SaturdayWorkHoursOnCallEnd time,

SundayWorkHoursInHospitalStart time,
SundayWorkHoursInHospitalEnd time,
SundayWorkHoursOnCallStart time,
SundayWorkHoursOnCallEnd time
)
go









