create database Medic
go

use Medic
go


--диспансерная группа
create table DispanserGroup
(id int not null primary key,
name nvarchar(50) not null
)
go

--улицы города
create table Streets
(
id int not null primary key,
name nvarchar(50) not null
)
go

--льготы
create table Privileges
(
id int not null primary key, 
name nvarchar(50) not null
)
go

--Пациент
create table Patient
(
id int not null primary key,
idPatient int not null,          -- id пациента
cardNumber int,                  -- номер медицинской карточки
name nvarchar(50) not null,      -- имя   
fathersName nvarchar(50) not null,--отчество
surname nvarchar(50) not null,   -- фамилия
sex bit,                         -- пол
dateOfBirth datetime,            -- дата рождения
idDispanserGroup int,            -- диспансерная группа
phone1 nvarchar(20),
phone2 nvarchar(20),
idStreet int,                    
houseNumber nvarchar(50),        -- номер дома и остальной адрес
placeOfWork nvarchar(50),        -- место работы
position nvarchar(50),           -- должность
prefCardNumber nvarchar(50),     -- номер льготного удостоверения
startRegistrationDate datetime,  -- дата приема на учет
endRegistrationDate datetime,    -- дата снятия с учета
startOfrecord datetime not null, -- дата заведения карточки
constraint F_KEY_DISP_GROUP foreign key (idDispanserGroup) references DispanserGroup(id) on delete cascade on update cascade,
constraint F_KEY_ID_STREET foreign key (idStreet) references Streets(id) on delete no action on update cascade
)
go

--профессии медработников
create table Specialization
(
id int primary key not null,
name nvarchar(50)
)
go


--Медработник
create table MedWorker
(
id int primary key not null,
name nvarchar(50) not null,      -- имя   
fathersName nvarchar(50) not null,--отчество
surname nvarchar(50) not null,   -- фамилия
idPrivileges int,                -- ?????????????????
dateOfBirth datetime,            -- дата рождения
phone1 nvarchar(20),
phone2 nvarchar(20),
idStreet int,                    
houseNumber nvarchar(50),        -- номер дома и остальной адрес
idSpecialization int not null,   -- специальность врача
position nvarchar(50) not null,  -- должность
email nvarchar(50) not null,
hiringDate datetime,             -- дата приема на работу
constraint F_KEY_ID_PRIVILEGES foreign key (idPrivileges) references Privileges(id) on delete no action on update cascade,
constraint F_KEY_STREET foreign key (idStreet) references Streets(id) on delete no action on update cascade,
constraint F_KEY_ID_SPECIALIZ foreign key (idSpecialization) references Specialization(id) on delete no action on update cascade
)
go


--пара email-пароль
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
idMedWorker int,                       -- id медработника
numberOfWeek int,                      -- номер недели

MondayWorkHoursInHospitalStart time,   -- начало приема в поликлинике
MondayWorkHoursInHospitalEnd time,     -- конец приема в поликлинике
MondayWorkHoursOnCallStart time,       -- начало приема на вызове
MondayWorkHoursOnCallEnd time,         -- конец приема на вызове

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









