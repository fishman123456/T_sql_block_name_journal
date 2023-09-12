--Домашнее задание №4
---------------добавлять таблицы, согласно п/п  !!!!
--Многотабличные базы данных
--1. Вывести все возможные пары строк преподавателей и групп.
--2. Вывести названия факультетов, фонд финансирования
--кафедр которых превышает фонд финансирования фа-
--культета.
--3. Вывести фамилии кураторов групп и названия групп, ко-
--торые они курируют.
--4. Вывести имена и фамилии преподавателей, которые читают
--лекции у группы “P107”.
--5. Вывести фамилии преподавателей и названия факультетов
--на которых они читают лекции.
--6. Вывести названия кафедр и названия групп, которые к
--ним относятся.
--7. Вывести названия дисциплин, которые читает препода-
--ватель “Samantha Adams”.
--8. Вывести названия кафедр, на которых читается дисциплина
--"Database Theory"
--9. Вывести названия групп, которые относятся к факультету
--“Computer Science”.
--10. Вывести названия групп 5-го курса, а также название фа-
--культетов, к которым они относятся.
--11. Вывести полные имена преподавателей и лекции, которые
--они читают (названия дисциплин и групп), причем отобрать
--только те лекции, которые читаются в аудитории “B103”.
--Создание базы данных Академия

--п/п 01
create database Academy
--п/п 02
use Academy


--1. Кураторы (Curators)
--■ Идентификатор (Id). Уникальный идентификатор куратора.
--▷ Тип данных int
--▷ Авто приращение.
--▷ Не может содержать null-значения.
--▷ Первичный ключ.
--■ Имя (Name). Имя куратора.
--▷ Тип данных nvarchar(max)
--▷ Не может содержать null-значения.
--▷ Не может быть пустым.
--■ Фамилия (Surname). Фамилия куратора.
--▷ Тип данных nvarchar(max)
--▷ Не может содержать null-значения.
--▷ Не может быть пустым.
--п/п 2
create table Curators
(
Id int identity(1,1) not null primary key,
Name nvarchar(max) not null check(Name<>''),
Surname nvarchar(max) not null check(Surname<>'')
)

--2. Кафедры (Departments)
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
-- п/п 5
create table Departments
(
Id int identity(1,1) not null primary key,
Financing money not null check(Financing>0) default 0,
Name nvarchar(max) not null check(Name<>''),
FacultyId int not null,
FOREIGN KEY (FacultyId)  REFERENCES Faculties (Id)
)

--3. Факультеты (Faculties)
--■ Идентификатор (Id). Уникальный идентификатор факультета.
--▷ Тип данных int
--▷ Авто приращение.
--▷ Не может содержать null-значения.
--▷ Первичный ключ.
--■ Финансирование (Financing). Фонд финансирования факультета.
--▷ Тип данных money
--▷ Не может содержать null-значения.
--▷ Не может быть меньше 0.
--▷ Значение по умолчанию 0
--■ Название (Name). Название факультета.
--▷ Тип данных nvarchar(100)
--▷ Не может содержать null-значения.
--▷ Не может быть пустым.
--▷ Должно быть уникальным.
--п/п 1
create table Faculties
(
Id int identity(1,1) not null primary key,
Financing money not null check(Financing>0) default 0,
Name nvarchar(max) not null check(Name<>''),
)

--4. Группы (Groups)
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
-- п/п 7
create table Groups
(
Id int identity(1,1) not null primary key,
Name nvarchar(10) not null check(Name<>'') unique,
Year int not null check(Year>=1 and Year<=5),
DepartmentId int not null,
FOREIGN KEY (DepartmentId)  REFERENCES Departments (Id)
)

--5. Группы и кураторы (GroupsCurators)
--■ Идентификатор (Id). Уникальный идентификатор группы и куратора.
--▷ Тип данных int
--▷ Авто приращение.
--▷ Не может содержать null-значения.
--▷ Первичный ключ.
--■ Идентификатор куратора (CuratorId). Куратор.
--▷ Тип данных int
--▷ Не может содержать null-значения.
--▷ Внешний ключ.
--■ Идентификатор группы (GroupId). Группа.
--▷ Тип данных int
--▷ Не может содержать null-значения.
--▷ Внешний ключ.
-- п/п 8
create table GroupsCurators
(
Id int identity(1,1) not null primary key,
CuratorId int not null, 
FOREIGN KEY (CuratorId)  REFERENCES Curators (Id),
GroupId int not null,
FOREIGN KEY (GroupId)  REFERENCES Groups (Id)
)

--6. Группы и лекции (GroupsLectures)
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
-- п/п 9
create table GroupsLectures
(
Id int identity(1,1) not null primary key,
GroupId int not null,
FOREIGN KEY (GroupId)  REFERENCES Groups (Id),
LectureId int not null,
FOREIGN KEY (LectureId)  REFERENCES Lectures (Id)
)

--7. Лекции (Lectures)
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

--8. Дисциплины (Subjects)
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
-- п/п 3
create table Subjects
(
Id int identity(1,1) not null primary key,
Name nvarchar(100) not null check(Name<>'') unique
)

--9. Преподаватели (Teachers)
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
-- п/п 4
create table Teachers
(
Id int identity(1,1) not null primary key,
Name nvarchar(max) not null check(Name<>''),
Surname nvarchar(max) not null check(Surname<>'')
Sallary money not null check(Sallary>=0)
)
-- добавляем записи в таблицу факультеты
INSERT Faculties VALUES ('Humanities', 500)
INSERT Faculties VALUES ('Design',300)
INSERT Faculties VALUES ('Mathematics',1200)
INSERT Faculties VALUES ('Psychology',800)
INSERT Faculties VALUES ('Physical',550)
INSERT Faculties VALUES ('History',700)
INSERT Faculties VALUES ('Geology',2500)
INSERT Faculties VALUES ('Sciences',1500)
INSERT Faculties VALUES ('Biology',600)
INSERT Faculties VALUES ('Electric',2000)

-- добавляем записи в таблицу кураторы
INSERT Curators VALUES ('Татьяна', 'Богдановская')
INSERT Curators VALUES ('Анатолий', 'Рвбаков')
INSERT Curators VALUES ('Максим', 'Борщинский')
INSERT Curators VALUES ('Оксана', 'Игнатенко')
INSERT Curators VALUES ('Надежда', 'Скударнова')

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
INSERT Departments VALUES ('Кафедра геологии', 830,8)
INSERT Departments VALUES ('Кафедра электропривода', 1830,7)

-- добавляем записи в таблицу группы
INSERT Groups VALUES ('ЗЭПА', 1, 7)
INSERT Groups VALUES ('ЗМЧМ', 2, 6)
INSERT Groups VALUES ('ЗГП', 3, 5)
INSERT Groups VALUES ('ССП', 4, 4)
INSERT Groups VALUES ('МЭП', 5, 1)
INSERT Groups VALUES ('АЭП', 5, 2)
INSERT Groups VALUES ('СТ', 1, 3)

-- добавляем записи в таблицу группы_кураторы
INSERT GroupsCurators VALUES (3,16)
INSERT GroupsCurators VALUES (4,18)
INSERT GroupsCurators VALUES (5,19)
INSERT GroupsCurators VALUES (1,21)
INSERT GroupsCurators VALUES (2,22)
INSERT GroupsCurators VALUES (3,23)

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
INSERT GroupsLectures VALUES (16,10)
INSERT GroupsLectures VALUES (18,9)
INSERT GroupsLectures VALUES (19,8)
INSERT GroupsLectures VALUES (21,7)
INSERT GroupsLectures VALUES (22,6)
INSERT GroupsLectures VALUES (23,5)
INSERT GroupsLectures VALUES (16,4)
INSERT GroupsLectures VALUES (18,3)
INSERT GroupsLectures VALUES (19,2)
INSERT GroupsLectures VALUES (23,1)
--итого 6 часов на создание и заполнение таблицы


-- 22.08.2023 начинаем выполнять запросы
--1. Вывести все возможные пары строк преподавателей и групп. 9:43 готово
select T.Name, G.Name
from Teachers T, Lectures L, GroupsLectures GR, Groups G
where T.Id =L.TeacherId and L.Id = GR.LectureId and GR.GroupId = G.Id

--2. Вывести названия факультетов, фонд финансирования 
--кафедр которых превышает фонд финансирования факультета. 9:50 готово
select * from Departments
select * from Faculties
select * from Departments D, Faculties F
where f.Id = D.FacultyId and F.Financing < D.Financing

--3. Вывести фамилии кураторов групп и названия групп, которые они курируют. 10:02 готово 
select * from Curators C
select * from Groups G
select * from Curators C, Groups G, GroupsCurators GR
where C.Id = GR.CuratorId and GR.GroupId = G.Id

--4. Вывести имена и фамилии преподавателей, которые читают лекции у группы “ЗЭПА”.
select *
from Teachers T, Lectures L, GroupsLectures GR, Groups G
where T.Id = L.TeacherId and L.Id = GR.LectureId and GR.GroupId = G.Id and G.Name like 'ЗЭПА'

--5. Вывести фамилии преподавателей и названия факультетов на которых они читают лекции. 10:27 готово
select T.Surname, F.Name
from Teachers T, Lectures L, GroupsLectures GL, Groups G, Departments D, Faculties F
where T.Id = L.Id and L.Id = GL.LectureId and GL.GroupId = G.Id 
				  and G.DepartmentId = D.Id and D.FacultyId = F.Id

--6. Вывести названия кафедр и названия групп, которые к ним относятся.
select D.Name, G.Name
from Departments D, Groups G
where G.DepartmentId = D.Id

--7. Вывести названия дисциплин, которые читает преподаватель "Ольга Князева". 10:55 готово
select S.Name, T.Name, T.Surname
from Teachers T, Lectures L, Subjects S
where T.Id = L.TeacherId and L.SubjectId = S.Id and T.Name like 'Ольга' and T.Surname like 'Князева'

--8. Вывести названия кафедр, на которых читается дисциплина "Английский язык" 11:06 готово
select d.Name,S.Name
from Departments D, Groups G, GroupsLectures GL, Lectures L, Subjects S
where D.Id = G.DepartmentId and G.Id = GL.GroupId and
		GL.LectureId = L.Id and L.SubjectId = S.Id and s.Name like 'Английский язык'

--9. Вывести названия групп, которые относятся к факультету “Design”. 11:13 готово
select G.Name, F.Name
from Groups G, Departments D, Faculties F
where G.DepartmentId = D.Id and D.FacultyId =F.Id and F.Name like 'Design'


--10. Вывести названия групп 5-го курса, а также название факультетов, к которым они относятся. 11:21 готово
select G.Name, G.Year,F.Name
from Groups G, Departments D, Faculties F
where G.DepartmentId = D.Id and D.FacultyId = F.Id and G.Year = 5

--11. Вывести полные имена преподавателей и лекции, которые
--они читают (названия дисциплин и групп), причем отобрать
--только те лекции, которые читаются в аудитории "402" и "304". готово 11:38
select T.Name, T.Surname, S.Name, G.Name, L.LectureRoom
from Teachers T, Lectures L, Subjects S, GroupsLectures GL, Groups G
where T.Id = L.TeacherId and S.Id = L.SubjectId 
 and L.Id = GL.LectureId and GL.GroupId = G.Id and (L.LectureRoom like'402' or L.LectureRoom like '304')


select * 
from Curators
select * 
from Groups
select * 
from GroupsLectures
select * 
from Lectures
select * 
from Faculties
select * 
from  Subjects order by Subjects.Id
select * 
from Teachers order by Teachers.Id
select * from Departments