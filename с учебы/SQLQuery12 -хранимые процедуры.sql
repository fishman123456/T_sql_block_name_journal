create default def_int as 5;
create default def_for_text as 'Name';

drop   def_for_text

create rule rule_int as @a>=0

create rule rule_name_rule1 as @name like 'A%' or @name like 'B%'

drop rule rule_name_rule1

create type d_new_type from varchar(100) not null

exec sp_bindrule 'rule_name_rule1', 'd_new_type'
exec sp_bindefault 'def_for_text', 'd_new_type'
---------------------------------------------------
create table testtable
(
	id int not null, 
	Salary int,
	Name d_new_type,
	percent_ as (Salary * 0.87)--расчетное поле
)

alter table testtable add NameCol varchar(1100) not null
alter table testtable drop column NameCol 

alter table testtable add constraint PK_TESTTABLE primary key (id)
alter table testtable drop constraint PK_TESTTABLE

create table test2
(
	id int,
	tasttableID int
)

alter table test2 add constraint FK_test2_testtable foreign key (tasttableID) references testtable(id) 

select * from testtable

select country, count(*)
from View_1 
group by country

create view NameView
as
select p.Name, count(*) as cnt 
from Publishers p
join Disc d on d.publisher = p.id
group by p.Name
having count(*)>=2

select v.NamePub, v.country, n.cnt
from View_1 v 
left join NameView n on v.NamePub = n.Name


create view NameView2
as
select p.Name, d.name as dname  
from Publishers p
join Disc d on d.publisher = p.id 
with check option

select * from  NameView2

insert into NameView2
values ('asdasd','asdfasdf')
 
create view NameView3
as
select * from test
with check option			  

select * from  NameView3

insert into NameView3
values (6,1324)

---------------------------------
create procedure sp_name
as 
select p.Name, d.name as dname  
from Publishers p
join Disc d on d.publisher = p.id 
go

execute sp_name
exec sp_name

drop procedure sp_name

alter procedure sp_name
as 
select distinct p.Name, d.name as dname  
from Publishers p
join Disc d on d.publisher = p.id 
go
--------------------
create procedure sp_name1
@a int,
@b int,
@res int output
as
begin 
	set @res = @a*@b - @a;
end

declare @result int
exec sp_name1 @a = 110, @b = 2230, @res = @result output
select @result

declare @result int
exec sp_name1 10, 20, @result output
select @result


--вывести наименование определенного факультета и его кафедры
create procedure sp_name2
@a varchar(100)
as
begin 
	select f.Name, d.name
	from Faculties f
	join Departments d on d.FacultyId = f.Id
	where f.Name like @a
end
exec sp_name2 'Energy and Electronics'

alter procedure sp_name2
as
begin 
	insert into Temp
	select f.Name, d.name
	from Faculties f
	join Departments d on d.FacultyId = f.Id 
end

exec sp_name2

select * from Temp

alter procedure sp_add_records
@Name varchar(100),
@Surname varchar(100),
@Salary money,
@Premium money,
@SubjectName varchar(100),
@LecRoom varchar(100)
as
begin
	if (@Name is null) 
		set @Name = 'Имя не определено'; 
	if (@Surname is null) 
		set @Surname = 'Фамилия не определено';  
	insert into Teachers
	values (@Name, @Salary, @Surname, @Premium, GETDATE());
	if (@SubjectName is null) 
		set @SubjectName = 'Предмет не определено'; 
	insert into Subjects
	values (@SubjectName);

	declare @a int, @b int 
	select top 1 @a = id from Subjects where Name like @SubjectName
	select top 1 @b = id from Teachers where Name like @Name and Surname like @Surname

	insert into Lectures
	values (@LecRoom, @a, @b)
end;

exec sp_add_records 'Имя4', 'Фамилия4', 12311, 111, 'Информатика', 'A-211'

select * from Teachers
select * from Subjects
select * from Lectures
--создать хранимую процедуру, которая будет удалять записи об учителях и переносить в таблицу архив 
--(по имени и фамилии учителя)
select * from TeachersArchive
delete from TeachersArchive

create procedure sp_name22
@Name varchar(100),
@Surname varchar(100)
as
begin
	declare @id int, @Salary money, @Premium money, @EmploymentDate date

	select @id =id, @Name = Name, @Surname = Surname, @Salary = Salary, 
	@Premium = Premium, @EmploymentDate = EmploymentDate
	from Teachers
	where Name like @Name and Surname like @Surname;

	insert into TeachersArchive
	values (@Name, @Salary, @Surname, @Premium, @EmploymentDate);

	delete from Teachers where Name like @Name and Surname like @Surname;
end;

exec sp_name22 'Имя5', 'Фамилия5'

select * from Teachers
select * from TeachersArchive