--домашнее задание 7 
--31-08-2023 13:00
-- 
use Homework7
-- 1. Вывести названия аудиторий, в которых читает лекции преподаватель “Ирина Иринова”. готово 14-40
select* from Teachers,Lectures, Schedules, LectureRooms


select* 
from Teachers T,Lectures L, Schedules Sch, LectureRooms LR
where LR.Id = Sch.LectureRoomId and Sch.Id = L.Id and T.Id = L.TeacherId

select distinct (LR.Name), T.Surname, T.Name
--T.Name, T.Surname,  LR.Name
from Teachers T, Lectures L, Schedules Sch, LectureRooms LR
where LR.Id = Sch.LectureRoomId and Sch.Id = L.Id and T.Id = L.TeacherId and T.Name = 'Ирина'

-- 2. Вывести фамилии ассистенов, читающих лекции в группе “Соц-01”. готово 16-27
select* from Groups
select distinct T.Surname
from Assistants A, Teachers T, Departments D, Groups G, GroupsLectures GL, Lectures L
where   T.Id = A.TeacherId and D.Building = T.Id and G.DepartmentId = D.Id and G.Name like 'Соц-01'

-- 3. Вывести дисциплины, которые читает преподаватель “Галина” для групп 4-го курса. готово 16-36
select* from Groups

select T.Name, T.Surname,G.Year
from  Teachers T, Departments D, Groups G
where  D.Id = T.Id and G.DepartmentId = D.Id and G.Year=4 and T.Name like 'Г%'
--Галина Галинова

-- 4. Вывести фамилии преподавателей, которые не читают лекции по понедельникам. готово 16-48
SELECT T.Surname,Sch.DayOfWeek
FROM Teachers T, Lectures L, Schedules Sch 
where T.Id = L.TeacherId and Sch.LectureId = L.Id and Sch.DayOfWeek != 1

-- 5. Вывести названия аудиторий, с указанием их корпусов, в которых нет лекций в среду второй недели на третьей паре.
-- готово 04-08-2023 14:56
select LRe.Name, SCH.DayOfWeek
from  LectureRooms LRe, Schedules SCH, Lectures L
where LRe.Id =SCH.LectureRoomId and SCH.LectureId=L.Id and SCH.DayOfWeek<>3

-- 6. Вывести полные имена преподавателей факультета “Педагогический”. готово 04-09-2023 15:03
select T.Name+' '+ T.Surname, F.Name
from Teachers T, Deans D, Faculties F
where T.Id = D.TeacherId and F.DeanId = D.Id and F.Name ='Педагогический'

-- 7. Вывести список номеров всех аудиторий, которые имеются в таблицах факультетов, кафедр и аудиторий.
-- готово 04-09-2023 15:11
select LR.Name, F.Name
from LectureRooms LR, Schedules SCH, 
	Lectures L, Teachers T, Deans D, Faculties F
where LR.Id = SCH.LectureRoomId and SCH.LectureId = L.Id and
		L.TeacherId = T.id and T.id = D.TeacherId and F.DeanId = D.Id

-- 8. Вывести полные имена преподавателей в следующем порядке:
--   деканы факультетов, заведующие кафедрами, преподаватели, кураторы, ассистенты.
select T.Name+' '+ T.Surname as Fullname, F.Name, Dep.Name
from Teachers T, Deans D, Faculties F, Departments Dep
where T.id = D.TeacherId and D.Id = F.DeanId and  F.Id = Dep.FacultyId

-- 9. Вывести дни недели (без повторений), в которые имеются занятия в
--   аудиториях “A311” и “A104” корпуса 6. готово 04-09-2023 15:23

select Distinct (LRe.Name),  SCH.DayOfWeek
from  LectureRooms LRe, Schedules SCH, Lectures L
where LRe.Id =SCH.LectureRoomId and SCH.LectureId=L.Id and (LRe.Name like 'Ауд 501' or LRe.Name like 'Ауд 101')
