--exists
--����� ������� ��������� � ������-���� ����������
select * from Departments;
select 1 from Departments;

select d.Name
from Departments d
where exists(select * from Faculties f where f.id = d.FacultyId)

select d.Name
from Departments d
where not exists(select * from Faculties f where f.id = d.FacultyId)
---------
create table exam
(
	id int,
	NameStudent	varchar(50),
	Name varchar(50),
	mark int
)

select * from exam
--������� �� ������� exam �������� - ����������
select distinct NameStudent from exam where mark = 4 or mark = 5--�������� ������

select distinct e.NameStudent 
from exam e
where not exists(select 1 from exam e2 where e.NameStudent = e2.NameStudent and mark <4)
----------------
--any\some
--���������� �� �������������, � ������� �� ��������� �������������� �����-���� �������
select t.Surname + ' ' + t.Name
from Teachers t
where t.Salary = any(select Financing from Departments)

select * from Teachers
select * from Departments

select t.Surname + ' ' + t.Name
from Teachers t
where t.Salary in (select Financing from Departments)

--���������� �� �������������, � ������� �� ������ ��� �������������� �����-���� �������
select t.Surname + ' ' + t.Name
from Teachers t
where t.Salary < any(select Financing from Departments)

select * from Teachers
select * from Departments

select * from Teachers
where Name = 'Jack' or Name = 'Ben' or Name = '����'

select * from Teachers
where Name in ('Jack', 'Ben', '����')

--all 
--���������� �� �������������, � ������� �� ������ ��� �������������� � ����� �� ������
select * from Teachers
select * from Departments

select t.Surname + ' ' + t.Name
from Teachers t
where t.Salary > all(select Financing from Departments)
------------------------
select * from Departments
select * from Faculties

--c��������
select * from t1 ...
union\union all
select * from t2 ...

select Name, financing as fin1 from Departments
union all
select Name, financing as asdfgasdf from Faculties 
union all
select Name, financing as asdfgasdf from Faculties 
union all
select Name, financing as asdfgasdf from Faculties 
union all
select Name, financing as asdfgasdf from Faculties 


select Name, financing as fin1 from Departments
union
select Name, financing as asdfgasdf from Faculties

select '�� 0 �� 10 000', count(*)
from (
select Name, financing as fin1 from Departments
union
select Name, financing as asdfgasdf from Faculties
) t
where t.fin1 between 0 and 10000
union all
select '�� 10 000 �� 20 000', count(*)
from (
select Name, financing as fin1 from Departments
union
select Name, financing as asdfgasdf from Faculties
) t
where t.fin1 between 10000 and 20000
union all
select '�� 20 000 �� 30 000', count(*)
from (
select Name, financing as fin1 from Departments
union
select Name, financing as asdfgasdf from Faculties
) t
where t.fin1 between 20000 and 30000
union all
select '�� 30 000 �� 40 000', count(*)
from (
select Name, financing as fin1 from Departments
union
select Name, financing as asdfgasdf from Faculties
) t
where t.fin1 between 30000 and 40000
union all
select t.Surname, t.Salary from Teachers t
-----------

select f.Name, d.Name
from Departments d, Faculties f
where d.FacultyId = f.Id

--inner join \ join
select f.Name, d.Name
from Departments d 
join Faculties f on d.FacultyId = f.Id
where f.Name like 'Computer Science'

select *
from Departments d 
join Faculties f on d.FacultyId = f.Id

select f.Name, d.Name
from Departments d 
join Faculties f on d.FacultyId = f.Id and f.Name like 'Computer Science'
---LEFT JOIN

--������� ��� ������� � ���������� � ���
select d.Name, f.Name
from Departments d left join Faculties f on d.FacultyId = f.Id

--right join
select d.Name, f.Name
from Departments d right join Faculties f on d.FacultyId = f.Id

--full join
select d.Name, f.Name
from Departments d full join Faculties f on d.FacultyId = f.Id

-------------------
select d.Name, f.Name 
from Departments d 
left join Faculties f on d.FacultyId = f.Id

select d.Name, f.Name 
from Faculties f 
right join Departments d on d.FacultyId = f.Id
-----------
select distinct d.name, t.Name + ' ' + t.Surname
from Departments d
join Groups g on d.Id = g.DepartmentId
join GroupsLectures gl on gl.GroupId = g.Id
join Lectures l on l.Id = gl.LectureId
join Teachers t on t.Id = l.TeacherId

select distinct d.name, t.Name + ' ' + t.Surname
from GroupsLectures gl
join Lectures l on l.Id = gl.LectureId
join Teachers t on t.Id = l.TeacherId
join Groups g on gl.GroupId = g.Id
join Departments d on d.Id = g.DepartmentId


