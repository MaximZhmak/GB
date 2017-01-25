use Medic
go

--�������� ������������ ������
create procedure AddDispGroup
				 @name nvarchar(50)
as
insert into DispanserGroup(name) 
values (@name)
go

--�������� ����� ������
create procedure AddStreet
				@name nvarchar(50)
as
insert into Streets(name)
values(@name)
go

--�������� ���������
create procedure AddPrivileges
				 @name nvarchar(50)
as 
insert into Privileges(name)
values(@name)
go

--�������� ��������
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


--������� ��������
create procedure DeletePatient
				 @idPatient int
as
delete from Patient where idPatient=@idPatient
go

--�������� ������ ���� ���������
create procedure GetAllPatients
as
select * from Patient 
go

--�������� �������� �� ������ �����
create procedure GetPatientByCardNumber
   				 @cardNumber int
as
select * from Patient where cardNumber = @cardNumber
go
--�������� �������� �� id ��������
create procedure GetPatientByIdPatient
   				 @IdPatient int
as
select * from Patient where idPatient = @IdPatient
go
--�������� �������� �� ����
create procedure GetPatientBySex
   				 @sex int
as
select * from Patient where sex = @sex
go
--�������� �������� �� ��������

--�������� �������� �� ������������ ������
create procedure GetPatientByDispanserGroup
   				 @idDispanserGroup int
as
select * from Patient where idDispanserGroup = @idDispanserGroup
go
--�������� �������� �� ������
create procedure GetPatientByPrefCardNumbe
   				 @prefCardNumber int
as
select * from Patient where prefCardNumber = @prefCardNumber
go
--�������� �������� �� ���� ������ �� ����
create procedure GetPatientByRegistrationDate
   				 @regDate datetime
as
select * from Patient where startRegistrationDate < @regDate
go
--�������� �������� �� ���� ��������� ��������
create procedure GetPatientByStartOfrecord
   				 @startOfrecord datetime
as
select * from Patient where startOfrecord < @startOfrecord
go


----�������� ��������� ������������
create procedure AddMedicalSpecialization
				 @name nvarchar(50)
as
insert into Specialization (name) values (@name)
go

--�������� ��������� ������������
create procedure AddMedicalPosition
				 @name nvarchar(50)
as
insert into Position (name) values (@name)
go

--�������� ����� ���� email-password
create procedure AddNewPassword
				 @email nvarchar(50),
				 @pass nvarchar(20)
as
insert into Credentials(EmailMedWorker, password) values(@email, @pass)
go

--�������� ����� ����� �������-������
create procedure AddNewPatienDoctorConnection
				 @idPatient int, 
				 @idDoctor int,
				 @contractNumber int
as
insert into DoctorPatient(idPatient, idMedWorker, ContractNumber)
values(@idPatient, @idDoctor, @contractNumber)
go

--������� ���� ��������� �� �������
create procedure GetPatientsByDoctorId
				 @idDoctor int
as
select * from Patient where idPatient in
(select idPatient from DoctorPatient where idMedWorker=@idDoctor) 
go

--������� ���� �������� �� ��������
create procedure GetDoctorsByPatientId
				 @idPatient int
as
select * from MedWorker where id in
(select idMedWorker from DoctorPatient where idPatient=@idPatient) 
go

--������� ���� ��������� � ����������
create procedure GetPatientsWithContracts
as
select * from Patient where idPatient in
(select idPatient from DoctorPatient where ContractNumber  is not null) 
go

--������� ���� �������� � �����������
create procedure GetDoctorsWithContracts
as
select * from MedWorker where id in
(select idMedWorker from DoctorPatient where ContractNumber  is not null) 
go

--�������� ������ ������������
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

--������� ������������
create procedure DeleteMedWorker
				 @email nvarchar(50)
as
delete from MedWorker where email like @email
go


