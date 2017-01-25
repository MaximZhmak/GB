use Medic
go

--Добавить диспансерная группа
create procedure AddDispGroup
				 @name nvarchar(50)
as
insert into DispanserGroup(name) 
values (@name)
go

--Добавить улицы города
create procedure AddStreet
				@name nvarchar(50)
as
insert into Streets(name)
values(@name)
go

--Добавить категории
create procedure AddPrivileges
				 @name nvarchar(50)
as 
insert into Privileges(name)
values(@name)
go

--добавить пациента
create procedure AddPatient
				@idPatient int,
				@cardNumber int, 
				@name nvarchar(50),
				@fathersName nvarchar(50),
				@surname nvarchar(50),
				@sex bit,
				@dateOfBirth datetime,
				@idDispanserGroup int, 
				@phone1 nvarchar(20),
				@phone2 nvarchar(20),
				@idStreet int,
				@houseNumber nvarchar(50),
				@placeOfWork nvarchar(50),        
				@position nvarchar(50),          
				@prefCardNumber nvarchar(50),     
				@startRegistrationDate datetime,  
				@endRegistrationDate datetime,  
				@startOfrecord datetime
as
insert into Patient(idPatient, cardNumber, name, fathersName, surname, sex, dateOfBirth,
idDispanserGroup, phone1, phone2, idStreet, houseNumber, placeOfWork, position,
prefCardNumber, startRegistrationDate, endRegistrationDate, startOfrecord)
values (@idPatient,
				@cardNumber , 
				@name ,
				@fathersName,
				@surname ,
				@sex,
				@dateOfBirth,
				@idDispanserGroup , 
				@phone1,
				@phone2 ,
				@idStreet ,
				@houseNumber,
				@placeOfWork ,        
				@position ,          
				@prefCardNumber,     
				@startRegistrationDate ,  
				@endRegistrationDate ,  
				@startOfrecord )
go


--удалить пациента
create procedure DeletePatient
				 @idPatient int
as
delete from Patient where idPatient=@idPatient
go

--получить список всех пациентов
create procedure GetAllPatients
as
select * from Patient 
go

--получить пациента по номеру карты
create procedure GetPatientByCardNumber
   				 @cardNumber int
as
select * from Patient where cardNumber = @cardNumber
go
--получить пациента по id пациента
create procedure GetPatientByIdPatient
   				 @IdPatient int
as
select * from Patient where idPatient = @IdPatient
go
--получить пациента по полу
create procedure GetPatientBySex
   				 @sex int
as
select * from Patient where sex = @sex
go
--получить пациента по возрасту

--получить пациента по диспансерной группе
create procedure GetPatientByDispanserGroup
   				 @idDispanserGroup int
as
select * from Patient where idDispanserGroup = @idDispanserGroup
go
--получить пациента по льготе
create procedure GetPatientByPrefCardNumbe
   				 @prefCardNumber int
as
select * from Patient where prefCardNumber = @prefCardNumber
go
--получить пациента по дате приема на учет
create procedure GetPatientByRegistrationDate
   				 @regDate datetime
as
select * from Patient where startRegistrationDate < @regDate
go
--получить пациента по дате заведения карточки
create procedure GetPatientByStartOfrecord
   				 @startOfrecord datetime
as
select * from Patient where startOfrecord < @startOfrecord
go


----добавить профессию Медработника
create procedure AddMedicalSpecialization
				 @name nvarchar(50)
as
insert into Specialization (name) values (@name)
go

--добавить должность медработника
create procedure AddMedicalPosition
				 @name nvarchar(50)
as
insert into Position (name) values (@name)
go

--добавить новую пару email-password
create procedure AddNewPassword
				 @email nvarchar(50),
				 @pass nvarchar(20)
as
insert into Credentials(EmailMedWorker, password) values(@email, @pass)
go

--добавить новую связь пациент-доктор
create procedure AddNewPatienDoctorConnection
				 @idPatient int, 
				 @idDoctor int,
				 @contractNumber int
as
insert into DoctorPatient(idPatient, idMedWorker, ContractNumber)
values(@idPatient, @idDoctor, @contractNumber)
go

--выбрать всех пациентов по доктору
create procedure GetPatientsByDoctorId
				 @idDoctor int
as
select * from Patient where idPatient in
(select idPatient from DoctorPatient where idMedWorker=@idDoctor) 
go

--выбрать всех докторов по пациенту
create procedure GetDoctorsByPatientId
				 @idPatient int
as
select * from MedWorker where id in
(select idMedWorker from DoctorPatient where idPatient=@idPatient) 
go

--выбрать всех пациентов с договорами
create procedure GetPatientsWithContracts
as
select * from Patient where idPatient in
(select idPatient from DoctorPatient where ContractNumber  is not null) 
go

--выбрать всех докторов с контрактами
create procedure GetDoctorsWithContracts
as
select * from MedWorker where id in
(select idMedWorker from DoctorPatient where ContractNumber  is not null) 
go

--добавить нового Медработника
create procedure AddNewMedWorker
@id int,
@name nvarchar(50),     
@fathersName nvarchar(50),
@surname nvarchar(50) ,  
@idPrivileges int, 
@dateOfBirth datetime,   
@phone1 nvarchar(20),
@phone2 nvarchar(20),
@idStreet int,                    
@houseNumber nvarchar(50), 
@idSpecialization int ,   
@position nvarchar(50) , 
@email nvarchar(50) ,
@hiringDate datetime
as
insert into MedWorker (id, name, fathersName, surname, idPrivileges, dateOfBirth, 
phone1, phone2, idStreet, houseNumber, idSpecialization, position, email, hiringDate)
values (
@id,
@name,     
@fathersName,
@surname,  
@idPrivileges, 
@dateOfBirth,   
@phone1,
@phone2,
@idStreet,                    
@houseNumber, 
@idSpecialization,   
@position, 
@email,
@hiringDate
)
go

--удалить медработника
create procedure DeleteMedWorker
				 @email nvarchar(50)
as
delete from MedWorker where email like @email
go


