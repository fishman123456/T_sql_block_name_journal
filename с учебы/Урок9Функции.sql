select cos(45)
select dateadd()
select getdate()

create function NameF(@day datetime)
returns varchar(100)
as
begin
	declare @a varchar(100);
	if (datename(dw, @day) = 'четверг')
		set @a = 'сегодня четверг' 
	else 
		set @a = 'другой день'
	return @a;
end

select dbo.NameF(getdate())
select dbo.NameF(cast('2023-08-30' as date))
select datename(dw, getdate())
--скалярная
create function f_summa(@a int, @b int)
returns int
as
begin
	declare @res varchar(100);
	set @res = @a + @b; 
	return @res;
end

select dbo.f_summa(10,20)

--Табличная функция
create function f_table (@name varchar(100))
returns table
as
return 
	(select f.Name as fNmae, d.Name as dName
	from Faculties f
	join Departments d on d.FacultyId = f.Id
	where f.Name like @name) 

select * from f_table('Computer Science')
--C-22
create function f_name11(@gName varchar(100))
returns @tabparam table(Name varchar(100), Surname varchar(100), Salary money)
as
begin
	declare @tmp table (gName varchar(100), tid int);

	insert into @tmp 
	select distinct g.Name, l.TeacherId
	from Groups g
	join GroupsLectures gl on gl.GroupId = g.id
	join Lectures l on l.id = gl.LectureId 
	where g.Name like @gName;

	insert into @tabparam
	select t.Name, t.Surname, t.Salary
	from Teachers t 
	join @tmp tmp on tmp.tid = t.id;
	return
end


select * from f_name11('C-22');

drop function f_name11;

--1. Пользовательская функция возвращает все диски заданного
--года. Год передаётся в качестве параметра

