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