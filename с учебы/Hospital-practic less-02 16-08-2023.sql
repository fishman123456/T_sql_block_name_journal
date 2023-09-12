create database Hospital
use Hospital
create table Departments
(
    id int identity(1,1) not null primary key,
    Building int not null check(Building>=1 and Building<=5),
    Financing money not null check(Financing>=0),
    Name nvarchar(100) not null unique check(Name<>'')
)
create table Diseases
(
    id int identity(1,1) not null primary key,
    Name nvarchar(100) not null unique check(Name<>''),
	Severity int not null check(Severity>=1) default 1
)
create table Doctors
(
	id int identity (1,1) not null primary key,
	Name nvarchar(max) not null check(Name<>''),
	Phone char(10) null,
	Sallary money not null check(Sallary>=0)
)
create table Examinations
(
	id int identity (1,1) not null primary key,
	DayOfWeek int not null check(DayOfWeek>=1 and DayOfWeek<=7),
	Name nvarchar(100) not null unique check(Name<>''),
	StartTime time not null check(StartTime>='8:00' and StartTime<='18:00'),
	EndTime time not null, check (EndTime > StartTime)
)
--ALTER TABLE Examinations
--ADD EndTime time not null check (EndTime > StartTime);