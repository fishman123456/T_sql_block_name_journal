--1) Вывести преподов и название факультетов на которых они преподают 24-08-2024 23-58. Спать хочу
use Academy2

select t.Name + ' '+t.Surname, f.Name
from Teachers T, Lectures L, 
GroupsLectures GR, Groups G,
Departments D, Faculties F
where  T.Id = L.TeacherId and  GR.LectureId =L.Id and
		GR.GroupId = G.Id and G.DepartmentId = D.Id and
		D.id = f.Id 

--не моё
		select distinct  t.Name + ' '+t.Surname , f.Name
from Teachers t
join Lectures l on t.Id=l.TeacherId
join GroupsLectures gl on gl.LectureId=l.Id
join Groups g on g.Id=gl.GroupId
join Departments d on d.Id=g.DepartmentId
join Faculties f on f.Id=d.FacultyId
order by f.Name

--2)Показать все группы, в которых первая буква названия либо «А», либо «G».работает 20-08-2023 11:24
select GR.Name
from Groups GR
where GR.Name like'З%'or GR.Name like'С%'

--3) Показать все кафедры, название которых состоит из 2 слов
select d.Name
from Departments d
where d.Name like '% %' and d.Name not  like '% % %'

--4)    Вывести количество лекций в каждый день недели.
select  GL.GroupId, count(*)
from GroupsLectures GL
join Lectures L on L.Id =GL.LectureId
group by GL.GroupId

--5) вывести кафедру с максимальным финансированием
select MAX (D.Financing)
from Departments D 
select *
from Departments

--6) вывести название кафедры или имя преподавателя 
--их зарплату или финансирование если оно больше 17 000 готово
select distinct T.Name, t.Sallary 
from Teachers T, Departments D
where T.SalLary>500

select D.Name, D.Financing
from Teachers T, Departments D
where D.Financing>17000 

--7 вывести кол-во групп, кол-во преподавателей, кол-во лекций готово
select 'Teachers', count(*)
from Teachers 
union all
select 'Groups', count(*)
from Groups 
union all
select 'Lectures', count(*)
from Lectures 

--8) Вывести кол-во преподавателей у которых зарплата 
--больше чем финансирование на какой-то кафедре 
select count(*)
from Teachers T, Departments D
where T.SalLary>any (select D.Financing from Departments)
--9) кол-во преподавателей у которых зарплата в диапазонах
-- 10000 - 14999
-- 15000 - 19999
-- 20000 - 24999
-- 25000 - 49000
select *
from Teachers T
where t.Sallary BETWEEN 500 AND 1009
union all
select *
from Teachers T
where t.Sallary BETWEEN 1009 AND 1250
union all
select * 
from Teachers T 
where t.Sallary BETWEEN 1250 AND 2000
--or t.Salary BETWEEN 20000 AND 24999
--or t.Salary BETWEEN 25000 AND 49000

--10) Вывести наименование групп(ы) с максимальным количеством лекций

select *
from Groups G, GroupsLectures GR, Lectures L
where G.Id=GR.GroupId and GR.LectureId = l.Id
-- не моё
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
 
 
select g.Name  
from Groups g
join GroupsLectures gl on  gl.GroupId=g.Id
join Lectures l on gl.LectureId=l.Id
group by g.Name
having count(l.LectureRoom) = (
select max(f1.CountRoom) as max_
from  
(select g.Name , count(l.LectureRoom) as CountRoom
from Groups g
join GroupsLectures gl on  gl.GroupId=g.Id
join Lectures l on gl.LectureId=l.Id
group by g.Name) f1
)
