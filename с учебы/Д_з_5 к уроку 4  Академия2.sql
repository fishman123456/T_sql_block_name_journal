--Домашнее задание №5
---------------добавлять таблицы, согласно п/п  !!!!
--1. Вывести количество преподавателей каыедры "Software Development”.
--2. Вывести количество лекций, которые читает преподаватель “Dave McQueen”.
--3. Вывести количество занятий, проводимых в аудитории “D201”.
--4. Вывести названия аудиторий и количество лекций, проводимых в них.
--5. Вывести количество студентов, посещающих лекции преподавателя “Jack Underhill”.
--6. Вывести среднюю ставку преподавателей факультета “Computer Science”.
--7. Вывести минимальное и максимальное количество студентов среди всех групп.
--8. Вывести средний фонд финансирования кафедр.
--9. Вывести полные имена преподавателей и количество читаемых ими дисциплин.
--10. Вывести количество лекций в каждый день недели.
--11. Вывести номера аудиторий и количество кафедр, чьи лекции в них читаются.
--12. Вывести названия факультетов и количество дисциплин, которые на них читаются.

--Создание базы данных Академия2
--п/п 01
create database Academy2
--п/п 02
use Academy2

--1. Дисциплины (Subjects)
--■ Идентификатор (Id). Уникальный идентификатор дис-
--циплины.
--▷ Тип данных int
--▷ Авто приращение.
--▷ Не может содержать null-значения.
--▷ Первичный ключ.
--■ Название (Name). Название дисциплины.
--▷ Тип данных nvarchar(100)
--▷ Не может содержать null-значения.
--▷ Не может быть пустым.
--▷ Должно быть уникальным.
-- п/п 1
create table Subjects
(
Id int identity(1,1) not null primary key,
Name nvarchar(100) not null check(Name<>'') unique
)

--2. Преподаватели (Teachers)
--■ Идентификатор (Id). Уникальный идентификатор пре-
--подавателя.
--▷ Тип данных int
--▷ Авто приращение.
--▷ Не может содержать null-значения.
--▷ Первичный ключ.
--■ Имя (Name). Имя преподавателя.
--▷ Тип данных nvarchar(max)
--▷ Не может содержать null-значения.
--▷ Не может быть пустым.
--■ Ставка (Salary). Ставка преподавателя.
--▷ Тип данных money
--▷ Не может содержать null-значения.
--▷ Не может быть меньше либо равно 0.
--■ Фамилия (Surname). Фамилия преподавателя.
--▷ Тип данных nvarchar(max)
--▷ Не может содержать null-значения.
--▷ Не может быть пустым.
-- п/п 2
create table Teachers
(
Id int identity(1,1) not null primary key,
Name nvarchar(max) not null check(Name<>''),
Surname nvarchar(max) not null check(Surname<>''),
Sallary money not null check(Sallary>=0)
)

--3. Факультеты (Faculties)
--■ Идентификатор (Id). Уникальный идентификатор факультета.
--▷ Тип данных int
--▷ Авто приращение.
--▷ Не может содержать null-значения.
--▷ Первичный ключ.
--■ Название (Name). Название факультета.
--▷ Тип данных nvarchar(100)
--▷ Не может содержать null-значения.
--▷ Не может быть пустым.
--▷ Должно быть уникальным.
--■ Финансирование (Financing). Фонд финансирования факультета.
--▷ Тип данных money
--▷ Не может содержать null-значения.
--▷ Не может быть меньше 0.
--▷ Значение по умолчанию 0
--п/п 3
create table Faculties
(
Id int identity(1,1) not null primary key,
Name nvarchar(100) not null check(Name<>''),
Financing money not null check(Financing>0) default 0
)

--4. Кафедры (Departments)
--■ Идентификатор (Id). Уникальный идентификатор кафедры.
--▷ Тип данных int
--▷ Авто приращение.
--▷ Не может содержать null-значения.
--▷ Первичный ключ.
--■ Финансирование (Financing). Фонд финансирования кафедры.
--▷ Тип данных money
--▷ Не может содержать null-значения.
--▷ Не может быть меньше 0.
--▷ Значение по умолчанию 0
--■ Название (Name). Название кафедры.
--▷ Тип данных nvarchar (100)
--▷ Не может содержать null-значения.
--▷ Не может быть пустым.
--▷ Должно быть уникальным.
--■ Идентификатор факультета (FacultyId). Факультет, в состав которого входит кафедра.
--▷ Тип данных int
--▷ Не может содержать null-значения.
--▷ Внешний ключ.
-- п/п 4
create table Departments
(
Id int identity(1,1) not null primary key,
Name nvarchar(100) not null check(Name<>'') unique,
Financing money not null check(Financing>0) default 0,
FacultyId int not null,
FOREIGN KEY (FacultyId)  REFERENCES Faculties (Id)
)

--5. Группы (Groups)
--■ Идентификатор (Id). Уникальный идентификатор группы.
--▷ Тип группы int
--▷ Авто приращение.
--▷ Не может содержать null-значения.
--▷ Первичный ключ.
--■ Название (Name). Название группы.
--▷ Тип данных nvarchar(10)
--▷ Не может содержать null-значения.
--▷ Не может быть пустым.
--▷ Должно быть уникальным.
--■ Курс (Year). Курс (год) на котором обучается группа.
--▷ Тип данных int
--▷ Не может содержать null-значения.
--▷ Должно быть в диапазоне от 1 до 5.
--■ Идентификатор кафедры (DepartmentId). Кафедра, в состав которой входит группа.
--▷ Тип данных int
--▷ Не может содержать null-значения.
--▷ Внешний ключ.
-- п/п 5
create table Groups
(
Id int identity(1,1) not null primary key,
Name nvarchar(10) not null check(Name<>'') unique,
Year int not null check(Year>=1 and Year<=5),
DepartmentId int not null,
FOREIGN KEY (DepartmentId)  REFERENCES Departments (Id)
)

--6. Лекции (Lectures)
--■ Идентификатор (Id). Уникальный идентификатор лекции.
--▷ Тип данных int
--▷ Авто приращение.
--▷ Не может содержать null-значения.
--▷ Первичный ключ.
--■ Аудитория (LectureRoom). Аудитория в которой читается лекция.
--▷ Тип данных nvarchar(max)
--▷ Не может содержать null-значения.
--▷ Не может быть пустым.
--■ Идентификатор дисциплины (SubjectId). Дисциплина,
--по которой читается лекция.
--▷ Тип данных int
--▷ Не может содержать null-значения.
--▷ Внешний ключ.
--■ Идентификатор преподавателя (TeacherId). Преподаватель, который читает лекцию.
--▷ Тип данных int
--▷ Не может содержать null-значения.
--▷ Внешний ключ.
-- п/п 6
create table Lectures
(
Id int identity(1,1) not null primary key,
LectureRoom nvarchar(max) not null check(LectureRoom<>''),
SubjectId int not null,
FOREIGN KEY (SubjectId)  REFERENCES Subjects (Id),
TeacherId int not null,
FOREIGN KEY (TeacherId)  REFERENCES Teachers (Id)
)

--7. Группы и лекции (GroupsLectures)
--■ Идентификатор (Id). Уникальный идентификатор группы и лекции.
--▷ Тип данных int
--▷ Авто приращение.
--▷ Не может содержать null-значения.
--▷ Первичный ключ.
--■ Идентификатор группы (GroupId). Группа.
--▷ Тип данных int
--▷ Не может содержать null-значения.
--▷ Внешний ключ.
--■ Идентификатор лекции (LectureId). Лекция.
--▷ Тип данных int
--▷ Не может содержать null-значения.
--▷ Внешний ключ.
-- п/п 7
create table GroupsLectures
(
Id int identity(1,1) not null primary key,
GroupId int not null,
FOREIGN KEY (GroupId)  REFERENCES Groups (Id),
LectureId int not null,
FOREIGN KEY (LectureId)  REFERENCES Lectures (Id)
)


-- добавляем записи в таблицу факультеты
INSERT Faculties VALUES ('Дизайн',300)
INSERT Faculties VALUES ('Математика',1200)
INSERT Faculties VALUES ('Информатика',800)
INSERT Faculties VALUES ('Геология',2500)
INSERT Faculties VALUES ('Электроснабжение',1500)
INSERT Faculties VALUES ('Горное производство',600)
INSERT Faculties VALUES ('Электропривод',2000)


-- добавляем записи в таблицу учителя 
INSERT Teachers VALUES ('Горбатюк', 'Анна',500)
INSERT Teachers VALUES ('Громова' , 'Валентина',500)
INSERT Teachers VALUES ('Данилин' , 'Тимофей',600)
INSERT Teachers VALUES ('Дручинин' , 'Сергей',650)
INSERT Teachers VALUES ('Князева' , 'Ольга',630)
INSERT Teachers VALUES ('Комарова' , 'Юлия',600)
INSERT Teachers VALUES ('Комашко' , 'Елена',630)
INSERT Teachers VALUES ('Костина' , 'Надежда',700)

-- добавляем записи в таблицу предметы
INSERT Subjects VALUES ('Математика')
INSERT Subjects VALUES ('Физика')
INSERT Subjects VALUES ('ТОЭ')
INSERT Subjects VALUES ('Материаловедение')
INSERT Subjects VALUES ('Русский язык')
INSERT Subjects VALUES ('История')
INSERT Subjects VALUES ('Английский язык')
INSERT Subjects VALUES ('Химия')
INSERT Subjects VALUES ('Начертательная геометрия')
INSERT Subjects VALUES ('Информатика')

-- добавляем записи в таблицу кафедры
INSERT Departments VALUES ('Кафедра автоматизации', 2300,2)
INSERT Departments VALUES ('Кафедра архитектуры', 1300,3)
INSERT Departments VALUES ('Кафедра филологии', 3300,5)
INSERT Departments VALUES ('Кафедра менеджмента', 2800,1)
INSERT Departments VALUES ('Кафедра геотехнологии', 2500,4)
INSERT Departments VALUES ('Кафедра транспорта', 2650,6)
INSERT Departments VALUES ('Кафедра электропривода', 1830,7)

-- добавляем записи в таблицу группы
INSERT Groups VALUES ('ЗЭПА', 1, 7)
INSERT Groups VALUES ('ЗМЧМ', 2, 6)
INSERT Groups VALUES ('ЗГП', 3, 5)
INSERT Groups VALUES ('ССП', 4, 4)
INSERT Groups VALUES ('МЭП', 5, 1)
INSERT Groups VALUES ('АЭП', 5, 2)
INSERT Groups VALUES ('СТ', 1, 3)


-- добавляем записи в таблицу лекции
INSERT Lectures VALUES ('402',1,8)
INSERT Lectures VALUES ('308',2,7)
INSERT Lectures VALUES ('410',3,6)
INSERT Lectures VALUES ('508',4,5)
INSERT Lectures VALUES ('412',5,4)
INSERT Lectures VALUES ('416',6,3)
INSERT Lectures VALUES ('301',7,2)
INSERT Lectures VALUES ('304',8,1)
INSERT Lectures VALUES ('510',9,5)
INSERT Lectures VALUES ('212',10,8)

-- добавляем записи в таблицу группы_лекции(расписание) 
INSERT GroupsLectures VALUES (1,7)
INSERT GroupsLectures VALUES (2,6)
INSERT GroupsLectures VALUES (3,5)
INSERT GroupsLectures VALUES (4,4)
INSERT GroupsLectures VALUES (5,3)
INSERT GroupsLectures VALUES (6,2)
INSERT GroupsLectures VALUES (7,1)
--итого 0.5 часов на создание и заполнение таблицы
use Academy2
--1. Вывести количество преподавателей кафедры "Software Development”. 24-08-2023 12:37-- нет счетчика работает
select distinct count (T2.name)
from Teachers T2,Subjects S, Lectures L, 
GroupsLectures GR, Groups G,
Departments D, Faculties F
where  T2.Id = L.TeacherId and S.Id=L.SubjectId and GR.LectureId =L.Id and
		GR.GroupId = G.Id and G.DepartmentId = D.Id and
		D.id = f.Id and D.Name like 'Кафедра электропривода'
		--Кафедра филологии Кафедра архитектуры
		--Кафедра автоматизации Кафедра менеджмента
		--Кафедра геотехнологии Кафедра транспорта Кафедра электропривода

--2. Вывести количество лекций, которые читает преподаватель “Мартынюк”.--  работает 14:15
select Count(*)
from Teachers T,Subjects S, Lectures L, 
GroupsLectures GR, Groups G,
Departments D, Faculties F
where  T.Id = L.TeacherId and S.Id=L.SubjectId and GR.LectureId =L.Id and
		GR.GroupId = G.Id and G.DepartmentId = D.Id and
		D.id = f.Id and T.Name like 'Мартынюк'
--3. Вывести количество занятий, проводимых в аудитории “D201”. ++ Работает 14:05
select Count(*)
from Teachers T,Subjects S, Lectures L, 
GroupsLectures GR, Groups G
where  T.Id = L.TeacherId and S.Id=L.SubjectId and GR.LectureId =L.Id and
		GR.GroupId = G.Id  and L.LectureRoom like '402'

--4. Вывести номера аудиторий и количество лекций, проводимых в них. работает но не совсем правильно 28-08-2023   11:58
select distinct L.LectureRoom,S.Name
from Lectures L
left join Subjects S on s.Id=l.SubjectId
right join Teachers T on t.id = l.TeacherId



--5. Вывести количество студентов, посещающих лекции преподавателя “Jack Underhill”.????
--6. Вывести среднюю ставку преподавателей факультета “Computer Science”.

--7. Вывести минимальное и максимальное количество студентов среди всех групп. ???
--8. Вывести средний фонд финансирования кафедр.

--9. Вывести полные имена преподавателей и количество читаемых ими дисциплин.
select L.LectureRoom, T.Name
from Teachers T, Lectures L, Subjects S
where T.Id = L.TeacherId and L.SubjectId =S.Id

select  distinct L.LectureRoom
from Teachers T, Lectures L
 where exists(
select dISTINCT S.Name
from Subjects S, Teachers T
where exists(
select s.Id
from Subjects S, Lectures l
where exists(
select *
from Teachers T, Lectures L, Subjects S
where T.Id = L.TeacherId and S.Id=L.SubjectId )))

--10. Вывести количество лекций в каждый день недели.????

--11. Вывести номера аудиторий и количество кафедр, чьи лекции в них читаются. Готово 28-08-2023 15:11
select L.LectureRoom, D.Name
from Subjects S, Lectures L, GroupsLectures GL, Groups G,
		Departments D
		where S.Id = L.SubjectId and GL.LectureId = L.Id and
				GL.GroupId = G.Id and G.DepartmentId = d.Id
--12. Вывести названия факультетов и количество дисциплин, которые на них читаются.


select * 
from Groups
select * 
from GroupsLectures
select * 
from Lectures 
select * 
from Departments
select * 
from Faculties
select * 
from  Subjects order by Subjects.Id
select * 
from Teachers order by Teachers.Id
select * from Departments