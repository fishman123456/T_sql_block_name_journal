select * from Teachers

--count()
select count(*) as '���-�� �������' from Teachers;

select count(Name) as '���-�� �������' from Teachers;

select count(Premium) as '���-�� �������' from Teachers;

select count(distinct Name) as '���-�� �������' from Teachers;

select count(*) as '���-�� �������' from Teachers
where Name like '����'
--avg()
select avg(Salary) from Teachers;
select avg(Salary+Premium) from Teachers;

--sum()
select * from Teachers
select sum(Salary) from Teachers

--min()
select min(Surname) from Teachers

select min(Salary) from Teachers

--max()
select max(Surname) from Teachers

select max(Salary) from Teachers

--���������� ���-�� ����� �� ���������� Computer Science

select count(*)
from Faculties f, Departments d, Groups g
where g.DepartmentId = d.Id and f.id = d.FacultyId
and f.Name like 'Computer Science'

select * from Departments;

--����� ������� ��+������ �������� �� ������� Software Development

select avg(t.Salary + t.Premium)
from Groups g, Departments d, Lectures l, GroupsLectures gl, Teachers t
where g.DepartmentId = d.Id and gl.GroupId = g.Id and gl.LectureId = l.Id and t.Id = l.TeacherId
and d.Name like 'Software Development';

--group by 
--����� ���-�� ������ �� ������ ����������

select f.Name, count(*)
from Faculties f, Departments d
where d.FacultyId = f.Id
group by f.Name

select f.Name, count(*)
from Faculties f, Departments d
where d.FacultyId = f.Id
group by f.Name

select f.Name, d.name
from Faculties f, Departments d
where d.FacultyId = f.Id 

select count(d.Name)
from Faculties f, Departments d
where d.FacultyId = f.Id
group by f.Name

--���������� ���-�� ����� �� ���������� Computer Science

select count(*)
from Faculties f, Departments d, Groups g
where g.DepartmentId = d.Id and f.id = d.FacultyId
and f.Name like 'Computer Science'

--���������� ���-�� ����� �� �����������
select f.Name, d.Name, count(*)
from Faculties f, Departments d, Groups g
where g.DepartmentId = d.Id and f.id = d.FacultyId 
group by f.Name, d.Name

--������� ���������� �������� � ������ ������
select g.Name, count(distinct t.Surname + ' ' + t.Name)
from Groups g, GroupsLectures gl, Lectures l, Teachers t
where gl.GroupId = g.Id and gl.LectureId = l.Id and t.Id = l.TeacherId
group by g.Name

--having
--������� ���������� �������� � ������, ��� �� ���������� >=2
select g.Name, count(distinct t.Surname + ' ' + t.Name) as cnt
from Groups g, GroupsLectures gl, Lectures l, Teachers t
where gl.GroupId = g.Id and gl.LectureId = l.Id and t.Id = l.TeacherId
group by g.Name
having count(distinct t.Surname + ' ' + t.Name)>=2;

select min (Salary)
from Teachers
having avg(Premium) >= 7000;
-----------
select * from Teachers
--������� ��������, ������� ��������� �� ������� � ������������ ���������������
select t.Name + ' ' + t.Surname, d.Name, d.Financing
from Groups g, GroupsLectures gl, Lectures l, Teachers t, Departments d
where gl.GroupId = g.Id and gl.LectureId = l.Id and t.Id = l.TeacherId and d.Id = g.DepartmentId
group by t.Name + ' ' + t.Surname, d.Name, d.Financing
having max(d.Financing) = d.Financing

select max(Financing) from Departments
select * from Departments

select distinct t.Name + ' ' + t.Surname
from Groups g, GroupsLectures gl, Lectures l, Teachers t, Departments d
where gl.GroupId = g.Id and gl.LectureId = l.Id and t.Id = l.TeacherId and d.Id = g.DepartmentId 
and d.Name like 'Software Development'

--1
select distinct t.Name + ' ' + t.Surname
from Groups g, GroupsLectures gl, Lectures l, Teachers t, Departments d
where gl.GroupId = g.Id and gl.LectureId = l.Id and t.Id = l.TeacherId and d.Id = g.DepartmentId 
and d.Financing = (select max(Financing) from Departments)

select f.Name, d.Name
from Departments d, Faculties f
where f.id = d.FacultyId

select d.Name
from Departments d
where d.FacultyId in (select id from Faculties f where f.Name like 'Computer Science') ;

--2
--������� ������������ ���������� �������� � �������
select max(t.cnt)
from
(
select g.Name, count(distinct t.Surname + ' ' + t.Name) as cnt
from Groups g, GroupsLectures gl, Lectures l, Teachers t
where gl.GroupId = g.Id and gl.LectureId = l.Id and t.Id = l.TeacherId
group by g.Name
) t

--3
select max(t.Salary), (select Financing from Departments)
from Teachers t

--������� ��������������, � ������� �� ������ ��� ������� �������������� ������

select avg(Financing) from Departments

select t.Name + ' ' + t.Surname
from Teachers t
where t.Salary > (select avg(Financing) from Departments d where d.financing < (select avg(Financing) from Faculties))
 

--������� ������ � ������������ ����������� ��������
--1)
select g.Name, count(distinct t.Surname + ' ' + t.Name) as cnt
from Groups g, GroupsLectures gl, Lectures l, Teachers t
where gl.GroupId = g.Id and gl.LectureId = l.Id and t.Id = l.TeacherId
group by g.Name
--2) 
select max(t.cnt)
from 
(
select g.Name, count(distinct t.Surname + ' ' + t.Name) as cnt
from Groups g, GroupsLectures gl, Lectures l, Teachers t
where gl.GroupId = g.Id and gl.LectureId = l.Id and t.Id = l.TeacherId
group by g.Name
) t

--3)
select g.Name 
from Groups g, GroupsLectures gl, Lectures l, Teachers t
where gl.GroupId = g.Id and gl.LectureId = l.Id and t.Id = l.TeacherId
group by g.Name
having count(distinct t.Surname + ' ' + t.Name) = 
(
	select max(t.cnt)
	from 
	(
	select g.Name, count(distinct t.Surname + ' ' + t.Name) as cnt
	from Groups g, GroupsLectures gl, Lectures l, Teachers t
	where gl.GroupId = g.Id and gl.LectureId = l.Id and t.Id = l.TeacherId
	group by g.Name
	) t
)
----------------
select top 1 g.Name 
from Groups g, GroupsLectures gl, Lectures l, Teachers t
where gl.GroupId = g.Id and gl.LectureId = l.Id and t.Id = l.TeacherId
group by g.Name
order by count(distinct t.Surname + ' ' + t.Name) desc