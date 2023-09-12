declare 
@a int,
@b int = 3425234,
@text varchar(100) = 'Сумма чисел';
begin
	select @a = 11111, @b = 1111; 
	--set @a = 100;
	select @text, @a + @b;
end;
----------
select * from Teachers

declare 
@tabParam table (Name varchar(100), Surname varchar(100), Salary money)
begin 
	insert into @tabParam
	select Name, Surname, Salary 
	from Teachers
	where Salary >= 26000;
	select * from @tabParam
end;

declare 
@a money ;
begin 
	select @a = Salary from Teachers where id = 1
	select @a
end;
-----------------------
print ('asdfasdf');
-----------------------if\else
if (datename(dw, getdate())) = 'Вторник'
begin 
	print ('Сегодня понедельник');
end
else 
	print ('Другой день недели');
------------------------
select datename(dw, getdate())
select datename(ww, getdate())
select datename(mm, getdate())
select datename(yy, getdate())
select datename(d, getdate())
-------------------------------------

if (select avg(Salary) from Teachers) > 500000
	print ('есть такие')
else 
begin
	print ('нет таких');
	print ('нет таких2');
end;
---------------------------
if exists(select * from Teachers where Name like 'asdfasdfasdf')
	print ('есть такие')
else 
begin
	print ('нет таких'); 
end;
--case
select * from Teachers
select Name + ' ' + Surname,
case when Salary >=26000 and Salary <30000 then 'Большая зп'
	 when Salary < 26000 then 'Низкая зп'
	 else 'другое'
end,
Salary
from Teachers


select Name + ' ' + Surname,
case when Salary >= (select avg(Financing) from Departments) then 'Большая зп'
	 when Salary < 26000 then 'Низкая зп'
	 else 'другое'
end,
Salary
from Teachers

select Name + ' ' + Surname,
case when Salary is null then 9999
	 else Salary
end,
Salary
from Teachers
-----------------------------
declare 
@i int = 1;
begin
	while @i<=999
	begin
		if @i between 11 and 19
		print('');
		else 
			print(@i);
		set @i = @i +1;
		if @i =60
		break

	end
end;
--------------------------------
while (select avg(Salary) from Teachers)>26000
begin
	print('1');
end;

------------------
--cte, common table expression
with t1
as
(
select max(salary) as max_ from Teachers
)
select t.Name + ' ' + t.Surname 
from Teachers t
join t1 on t1.max_ = t.Salary


with t1
as
(
select max(salary) as max_ from Teachers
),
t2 as
(
select t.Name + ' ' + t.Surname  as FIO
from Teachers t
join t1 on t1.max_ = t.Salary)
select * from t2

--Вывести наименование групп(ы) с максимальным количеством лекций 
select f.Name
from  
(
select g.Name , count(l.LectureRoom) as CountRoom
from Groups g
join GroupsLectures gl on  gl.GroupId=g.Id
join Lectures l on gl.LectureId=l.Id
group by g.Name) f,
(
select max(f1.CountRoom) as max_
from  
(select g.Name , count(l.LectureRoom) as CountRoom
from Groups g
join GroupsLectures gl on  gl.GroupId=g.Id
join Lectures l on gl.LectureId=l.Id
group by g.Name) f1
) f2
where f.CountRoom = f2.max_


with t1
as
(
select g.Name , count(l.LectureRoom) as CountRoom
from Groups g
join GroupsLectures gl on  gl.GroupId=g.Id
join Lectures l on gl.LectureId=l.Id
group by g.Name
),
t2 as
(
select max(t1.CountRoom) as max_
from t1
),
t3 
as
(
select * from t1 where CountRoom>=3
)
select t1.Name
from t1 
join t2 on t1.CountRoom = t2.max_
------------------------
--триггеры
create trigger Name_
on (Таблица)
for --insert,update, delete
as 
begin
	
end;

insert into Teachers
values ('Name1', 'Surname1')

create trigger Check_unique_name
on Teachers
for insert, update 
as
begin
	declare @a varchar(100)
	select @a = Name from inserted
	if (select count(t.Name) from Teachers t, inserted i where t.Name = i.Name)>1
	begin
		print('Такой учитель уже существует')
		rollback transaction 
	end
	else
		print('Данные успешно добавлены')
end

select * from Teachers

insert into Teachers
values ('Jack', 123123, 'asdfas', 12312, null)
 
drop trigger Check_unique_name

enable trigger Check_unique_name on Teachers
disable trigger Check_unique_name on Teachers


create trigger Nametrig12
on database
for drop_table, alter_table
as
begin
	print('Удалять и изменять таблицы нельзя')
	rollback transaction
end

drop table Example

enable trigger Nametrig12 on database
disable trigger Nametrig12 on database
1125579048
select * from sys.all_objects where name = 'Teachers'

select * from sys.all_columns sac
join sys.all_objects sao on sac.object_id = sao.object_id
where sao.name = 'Teachers'

select sao.name, st.name 
from sys.triggers st
join sys.all_objects sao on sao.object_id = st.parent_id