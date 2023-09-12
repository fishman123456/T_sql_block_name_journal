select * from Teachers;

select Name, Surname from Teachers

select Name + ' ' + Surname as FIO, Salary from Teachers

select Name, Surname, Salary, Salary * 1.2 from Teachers

--� ������� (��� �������) �\� ����������: (�����)

select '� ������� ' + Name + ' ' + Surname + ' �\� ����������: ' + Salary from Teachers
--cast() convert()
select '� ������� ' + Name + ' ' + Surname + ' �\� ����������: ' + cast(Salary as varchar(20)) from Teachers;
select '� ������� ' + Name + ' ' + Surname + ' �\� ����������: ' + convert(varchar(20), Salary) from Teachers;

select * from Teachers;

select top 5 Name, Surname, Salary from Teachers

select distinct Name from Teachers
select Name from Teachers

select distinct Name, Surname from Teachers;
select Name, Surname from Teachers
-----------------------
select * from Teachers;

select * from Teachers
where Salary>= 30000;

select * from Teachers
where Salary < 30000

-- =, <>, >, <, <=, >=, !< - �� ������ ���, !> - �� ������ ���
-- T-SQL
select * from Teachers
where len(Name) = 4

select * from Teachers
where Salary > 30000 and Premium <10000 -- and\or

select * from Teachers
where Salary > 30000 and Premium <10000 or len(Name) = 4

select * from Teachers
where Salary > 30000 and (Premium <10000 or len(Name) = 4)


--year() month() day()
select * from TableDate
where year(Date_) = 2000

select * from TableDate
where month(Date_) = 2

select * from TableDate
where day(Date_) = 3

select * from TableDate
where year(Date_) = 1999 

select * from Teachers
where Premium is null

select * from Teachers
where Premium is not null

select * from Teachers
where not Name = 'Jack'

select * from Teachers
where Salary >= 30000 and Salary <= 60000

select * from Teachers
where Salary between 30000 and 60000
---------
--order by <�������� ����> asc\desc
select * from Teachers
order by Salary desc
--!!!
select * from Teachers
where Salary between 30000 and 60000
order by Salary desc

select * from Teachers
order by Name desc

-------------- in, between, like

select * from Teachers
where Name = 'Jack' or Name = 'Ben' or Name = '����'


select * from Teachers
where Name in ('Jack', 'Ben', '����')

select * from Teachers
where Name like 'Jack'
-- % _
select * from Teachers
where Name like '___'

select * from Teachers
where Name like 't%'

---------------

--insert
insert into Test(Name, Surname)
values ('Name2', 'Sur1')

select * from Teachers

insert into Teachers(Name, Surname, Premium, Salary)
values ('Name2', 'Sur1', null, 123221)

insert into Teachers
values ('Name2', 1232221, 'Surname2', null)

insert into Test
select distinct Name, 'sur' 
from Teachers

select * from NewTeachers

select * 
into NewTeachers
from Teachers
where Salary>25000

drop table NewTeachers

----------------------------
--update
select * from Teachers

update Teachers
set Salary = 99999
where Name like 'Ben'

update Teachers
set Premium = 1111
where Premium is null

-----------------------
--delete
select * from Teachers

delete from Teachers 
where id >=20

-------------------------------

create table Examinations1
(
	id int identity (1,1) not null primary key,
	DayOfWeek int not null check(DayOfWeek>=1 and DayOfWeek<=7),
	Name nvarchar(100) not null unique check(Name<>''),
	StartTime time not null check(StartTime>='8:00' and StartTime<='18:00'),
	EndTime time not null,
	check (EndTime > StartTime)
)
----------------------

create table Students
(
	id int not null primary key identity(1,1),
	Name varchar(50),
	Surname varchar(50),
	Brithday date,
	GroupID int foreign key references Groups(id)
	--constraint FK_GroupsStudents foreign key (GroupID) references Groups(id)
)

create table Groups 
(
	id int not null primary key identity(1,1),
	Name varchar(50)
)

create table Teachers
(
	id int not null primary key identity(1,1),
	Name varchar(50),
	Surname varchar(50)
)

create table TeachersGroups
(
	id int not null primary key identity(1,1),
	GroupID int foreign key references Groups(id),
	TeacherID int foreign key references Teachers(id)
)

select * from Teachers;
select * from Groups;
select * from Students;

select g.Name, s.Name, s.Surname
from Groups as g, Students as s
--������� ��� ��������� � ������ � ������� ��� ���������
select g.Name, s.Name, s.Surname
from Groups g, Students s
where g.id = s.GroupID;

select * from Groups;
select * from Students;

--������� ��� ������� ���������� Computer Science
select f.name as 'facult', d.Name as '�������'
from Faculties f, Departments d 
where f.Id = d.FacultyId and f.name like 'Computer Science';

--������� ������ �-22 � ������ ������� ���������� � ���� �������
select g.Name, l.LectureRoom
from Groups g, Lectures l, GroupsLectures gl
where g.id = gl.GroupId and gl.LectureId = l.id and g.Name like 'C-22'

--������� ���� �������� ������� Software Development
select distinct d.Name, t.Name + ' ' + t.Surname as FIO
from Departments d, Groups g, Lectures l, GroupsLectures gl, Teachers t
where g.id = gl.GroupId 
and gl.LectureId = l.id 
and d.Id = g.DepartmentId 
and t.Id = l.TeacherId
and d.Name like 'Software Development'

select * from Departments