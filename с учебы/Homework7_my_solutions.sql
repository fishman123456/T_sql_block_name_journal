--�������� ������� 7 
--31-08-2023 13:00
-- 
use Homework7
-- 1. ������� �������� ���������, � ������� ������ ������ ������������� ������ ��������. ������ 14-40
select* from Teachers,Lectures, Schedules, LectureRooms


select* 
from Teachers T,Lectures L, Schedules Sch, LectureRooms LR
where LR.Id = Sch.LectureRoomId and Sch.Id = L.Id and T.Id = L.TeacherId

select distinct (LR.Name), T.Surname, T.Name
--T.Name, T.Surname,  LR.Name
from Teachers T, Lectures L, Schedules Sch, LectureRooms LR
where LR.Id = Sch.LectureRoomId and Sch.Id = L.Id and T.Id = L.TeacherId and T.Name = '�����'

-- 2. ������� ������� ����������, �������� ������ � ������ ����-01�. ������ 16-27
select* from Groups
select distinct T.Surname
from Assistants A, Teachers T, Departments D, Groups G, GroupsLectures GL, Lectures L
where   T.Id = A.TeacherId and D.Building = T.Id and G.DepartmentId = D.Id and G.Name like '���-01'

-- 3. ������� ����������, ������� ������ ������������� �������� ��� ����� 4-�� �����. ������ 16-36
select* from Groups

select T.Name, T.Surname,G.Year
from  Teachers T, Departments D, Groups G
where  D.Id = T.Id and G.DepartmentId = D.Id and G.Year=4 and T.Name like '�%'
--������ ��������

-- 4. ������� ������� ��������������, ������� �� ������ ������ �� �������������. ������ 16-48
SELECT T.Surname,Sch.DayOfWeek
FROM Teachers T, Lectures L, Schedules Sch 
where T.Id = L.TeacherId and Sch.LectureId = L.Id and Sch.DayOfWeek != 1

-- 5. ������� �������� ���������, � ��������� �� ��������, � ������� ��� ������ � ����� ������ ������ �� ������� ����.
-- ������ 04-08-2023 14:56
select LRe.Name, SCH.DayOfWeek
from  LectureRooms LRe, Schedules SCH, Lectures L
where LRe.Id =SCH.LectureRoomId and SCH.LectureId=L.Id and SCH.DayOfWeek<>3

-- 6. ������� ������ ����� �������������� ���������� ���������������. ������ 04-09-2023 15:03
select T.Name+' '+ T.Surname, F.Name
from Teachers T, Deans D, Faculties F
where T.Id = D.TeacherId and F.DeanId = D.Id and F.Name ='��������������'

-- 7. ������� ������ ������� ���� ���������, ������� ������� � �������� �����������, ������ � ���������.
-- ������ 04-09-2023 15:11
select LR.Name, F.Name
from LectureRooms LR, Schedules SCH, 
	Lectures L, Teachers T, Deans D, Faculties F
where LR.Id = SCH.LectureRoomId and SCH.LectureId = L.Id and
		L.TeacherId = T.id and T.id = D.TeacherId and F.DeanId = D.Id

-- 8. ������� ������ ����� �������������� � ��������� �������:
--   ������ �����������, ���������� ���������, �������������, ��������, ����������.
select T.Name+' '+ T.Surname as Fullname, F.Name, Dep.Name
from Teachers T, Deans D, Faculties F, Departments Dep
where T.id = D.TeacherId and D.Id = F.DeanId and  F.Id = Dep.FacultyId

-- 9. ������� ��� ������ (��� ����������), � ������� ������� ������� �
--   ���������� �A311� � �A104� ������� 6. ������ 04-09-2023 15:23

select Distinct (LRe.Name),  SCH.DayOfWeek
from  LectureRooms LRe, Schedules SCH, Lectures L
where LRe.Id =SCH.LectureRoomId and SCH.LectureId=L.Id and (LRe.Name like '��� 501' or LRe.Name like '��� 101')
