--11-09-2023
--electric-cabinet_2022 - шкаф
--siren - сирена сигнальная
--sensor - датчик
--remote_controller_2023 - шкаф 2 вариант
--push_button_post_2023 - кнопочный пост
--electric_motor - эл. двиг
--KTV - кабель троссовый выключатель
--KSL - концевой схода ленты
--Terminal_box - коробка клеммная- кнопочный пост

--- Создадим таблицу 

create table New1 (
id int null,
b1 nvarchar(255) null,
b2 nvarchar(255) null,
b3 nvarchar(255) null,
b4 nvarchar(255) null,
b5 nvarchar(255) null,
b6 nvarchar(255) null,
b7 nvarchar(255) null,
b8 nvarchar(255) null,
b9 nvarchar(255) null,
b10 nvarchar(255) null,
b11 nvarchar(255) null,
b12 nvarchar(255) null,
b13 nvarchar(255) null,
b14 nvarchar(255) null,
b15 nvarchar(255) null,
b16 nvarchar(255) null,
b17 nvarchar(255) null,
b18 nvarchar(255) null,
)
--- Создадим таблицу и скопируем в неё данные 11-09-2023 15:02 -- готово
select *
into New_B_T
from jk56

select *
from New_B_T
---
--найдем по условию Шкаф - Шкаф в таблице  New12
select *
from New_B_T nw
where nw.a2 like '%Шкаф%' and nw.a3 like '%Шкаф%'

--вставим имя блоков шкафы, потом надо хранимую процедуру написать 11-09-2023 16:36
UPDATE New_B_T 
   SET a14 = 'electric-cabinet_2022'
 WHERE a2 like '%Шкаф%' and a3 like '%Шкаф%'

 --вставим имя блоков сирена, потом надо хранимую процедуру написать 11-09-2023 17:04
 select *
from New_B_T nw
where nw.a3 like '%Пост сигнализации%' or nw.a3 like '%Предпусковая сигнализация%'

UPDATE New_B_T 
   SET a14 = 'siren'
 where a3 like '%Пост сигнализации%' or a3 like '%Предпусковая сигнализация%'

  --вставим имя блоков ктв, потом надо хранимую процедуру написать 11-09-2023 17:10
 select *
from New_B_T 
where a3 like '%Аварийный тросовый выключатель%' 

UPDATE New_B_T 
   SET a14 = 'KTV'
 where a3 like '%Аварийный тросовый выключатель%' 

  --вставим имя блоков ктв, потом надо хранимую процедуру написать 11-09-2023 17:15
 select *
from New_B_T 
where a3 like '%Клеммная коробка%' 

UPDATE New_B_T 
   SET a14 = 'Terminal_box'
where a3 like '%Клеммная коробка%' 

  --вставим имя кнопочный пост, потом надо хранимую процедуру написать 11-09-2023 17:15
 select *
from New_B_T 
where a3 like '%Пульт местного управления%' or a3 like '%Кнопочный пост%'

UPDATE New_B_T 
   SET a14 = 'push_button_post_2023'
where a3 like '%Пульт местного управления%' or a3 like '%Кнопочный пост%'

--содаем хранимую процедуру 19-09-2023 8:46
 alter procedure prov_name
 @name1 varchar(100),
  @name2 varchar(100)
  --@name3 varchar(100)
  --@nameblock varchar(100)
as 
select *
from New_B_T 
where (a1 like @name1 and a3  like @name2 ) 
go

exec prov_name ' ','%Шк%'

-- процедура на добавление
 alter procedure add_bname
 @name1 varchar(100),
  @name2 varchar(100),
  @nameblock varchar(100)
as 
UPDATE New_B_T 
   SET a15 = @nameblock
where a1 like @name1 and a3 like @name2

exec prov_name '%','%Термисторная защита%'

-- пользуемся процедурами 12-09-2023 9:10
exec add_bname '%1102%','%ш%','36000'
exec prov_name '%%','%Панель управления%'

select *
from New_B_T 

where a14 is not null 

-- расставляем координаты
UPDATE New_B_T 
   SET a16 = 0, a17 = 0, a18 = 2000
where a2 like @name1 and a3 like @name2

--a3 is not null and a14 is null 

--electric-cabinet_2022 - шкаф
--siren - сирена сигнальная
--sensor - датчик
--remote_controller_2023 - шкаф 2 вариант
--push_button_post_2023 - кнопочный пост
--electric_motor - эл. двиг
--KTV - кабель троссовый выключатель
--KSL - концевой схода ленты
--Terminal_box - коробка клеммная
-- gate_valve - задвижка

--содаем хранимую процедуру 19-09-2023 15:42
 alter procedure prov_name
 @name1 varchar(100),
  @name2 varchar(100),
  @name3 varchar(100)
  --@nameblock varchar(100)
as 
select *
from New_B_T 
where (a1 like @name1 and a2  like @name2  and a3 like @name3) 
go

exec prov_name ' ','%Шк%'

-- процедура на добавление
 alter procedure add_bname
 @name1 varchar(100),
  @name2 varchar(100),
  @xcoor varchar(100),
  @ycoor varchar(100)
as 
UPDATE New_B_T 
   SET a15 = @xcoor, a16 = @ycoor
where a1 like @name1 and a3 like @name2

-- пользуемся процедурами 12-09-2023 15:45

					1		2	 x		y
exec add_bname '%1096-II%','%%','109683',	'-48206'
exec prov_name '%%','%Шкаф%','%%'

select *
from New_B_T 
where  a14 is not null

UPDATE New_B_T 
SET a15 =0
where a15 is  null and a14 is not null


exec add_bname '%1096-III%','%%','111141','-64127'
exec prov_name '%1096-III%','%%','%%'

exec add_bname '%1096-I.1%','%%','109479','-51032'
exec prov_name '%1096-I.1%','%%','%%'

exec add_bname '%1096-I%','%%','111765','-28987'
exec prov_name '%1096-I%','%%','%%'

exec add_bname '%1091-I%','%%','205834','-32745'--16:44 sleep
exec prov_name '%1091-I%','%%','%%'

exec add_bname '%1091-IV%','%%','204985','-58022'
exec prov_name '%1091-IV%','%%','%%'

exec add_bname '%1092-I%','%%','249883','-37241'
exec prov_name '%1092-I%','%%','%%'

exec add_bname '%1091-II%','%%','205947','-40947'
exec prov_name '%1091-II%','%%','%%'

exec add_bname '%1091-III%','%%','204695','-47798'
exec prov_name '%1091-III%','%%','%%'

exec add_bname '%1098.1%','%%','89549','-69739'
exec prov_name '%1098.1%','%%','%%'

exec add_bname '%1814%','%%','156592','35904'
exec prov_name '%1814%','%%','%%'

exec add_bname '%1098%','%%','90346','-58505'
exec prov_name '%1098%','%%','%%'

exec add_bname '%1096-I.1%','%%','109479','-39032'
exec prov_name '%1096-I.1%','%%','%%'

exec add_bname '%1096-I.1%','%%','109479','-45032'
exec prov_name '%1096-I.1%','%%','%%'

exec add_bname '%1821-II%','%%','111588','17075'
exec prov_name '%1821-II%','%%','%%'

exec add_bname '%309-IX%','%%','111014','25926'
exec prov_name '%309-IX%','%%','%%'

exec add_bname '%1821-III%','%%','111905','16337'
exec prov_name '%1821-III%','%%','%%'

exec add_bname '%1821-VI%','%%','112301','13374'
exec prov_name '%1821-VI%%','%%','%%'

exec add_bname '%1088-I%','%%','151665','9417'
exec prov_name '%1088-I%','%%','%%'

exec add_bname '%1821-IV%','%%','112105','14849'
exec prov_name '%1821-I%','%%','%%'

exec add_bname '%1821-V%','%%','112146','14112'
exec prov_name '%1821-V%','%%','%%'

exec add_bname '%1103-II%','%%','134546','15835'
exec prov_name '%1103-II%','%%','%%'

exec add_bname '%329%','%%','109835','32774'
exec prov_name '%329%','%%','%%'

exec add_bname '%328%','%%','99791','32907'
exec prov_name '%328%','%%','%%'

exec add_bname '%1103-I%','%%','87886','13114'
exec prov_name '%1103-I%','%%','%%'

exec add_bname '%309-V%','%%','90688','22239'
exec prov_name '%309-V%','%%','%%'

exec add_bname '%309-VII%','%%','104460','32992'
exec prov_name '%309-VII%','%%','%%'

exec add_bname '%309-VIII%','%%','109246','22198'
exec prov_name '%309-VIII%','%%','%%'

exec add_bname '%309-VI%','%%','98926','24823'
exec prov_name '%309-VI%','%%','%%'

exec add_bname '%309-IV%','%%','85724','25711'
exec prov_name '%309-IV%','%%','%%'

exec add_bname '%1088-II%','%%','151623','8568'
exec prov_name '%1088-II%','%%','%%'

exec add_bname '%1089-X%','%%','141734','-1647'
exec prov_name '%1089-X%','%%','%%'

exec add_bname '%1089-XI%','%%','141650','-2203'
exec prov_name '%1089-XI%','%%','%%'

exec add_bname '%1088-IX%','%%','141720','3052'
exec prov_name '%1088-IX%','%%','%%'

exec add_bname '%1089-IX%','%%','141650','-1058'
exec prov_name '%1089-IX%','%%','%%'


exec add_bname '%1089-XII%','%%','141710','-2862'
exec prov_name '%1089-XII%','%%','%%'


exec add_bname '%1094-I%','%%','136590','27393'
exec prov_name '%1094-I%','%%','%%'

exec add_bname '%309-XI%','%%','99989','17073'
exec prov_name '%309-XI%','%%','%%'

exec add_bname '%1094-III%','%%','130194','20172'
exec prov_name '%1094-III%','%%','%%'

exec add_bname '%1094-II%','%%','126604','26619'
exec prov_name '%1094-II%','%%','%%'

exec add_bname '%1088-V%','%%','151604','6598'
exec prov_name '%1088-V%','%%','%%'

exec add_bname '%1088-VI%','%%','152167','804'
exec prov_name '%1088-VI%','%%','%%'

exec add_bname '%1088-III%','%%','151581','7906'
exec prov_name '%1088-III%','%%','%%'

exec add_bname '%1088-IV%','%%','151567','7204'
exec prov_name '%1088-IV%','%%','%%'

exec add_bname '%1088-VII%','%%','152167','1536'
exec prov_name '%1088-VII%','%%','%%'
exec add_bname '%1088-XI%','%%','141720','4446'
exec prov_name '%1088-XI%','%%','%%'
exec add_bname '%1088-X%','%%','141734','3807'
exec prov_name '%1088-X%','%%','%%'
exec add_bname '%1088-VIII%','%%','151567','5628'
exec prov_name '%1088-VIII%','%%','%%'



exec add_bname '%1088-XII%','%%','141720','4999'
exec prov_name '%1088-XII%','%%','%%'
exec add_bname '%1800-VII%','%%','348087','-44520'
exec prov_name '%1800-VII%','%%','%%'
exec add_bname '%1800-VIII%','%%','348399','-46218'
exec prov_name '%1800-VIII%','%%','%%'
exec add_bname '%1800-V%','%%','347880','-40392'
exec prov_name '%1800-V%','%%','%%'
exec add_bname '%1800-VI%','%%','347796','-42088'
exec prov_name '%1800-VI%','%%','%%'
exec add_bname '%1800-IX%','%%','348149','-47916'
exec prov_name '%1800-IX%','%%','%%'
exec add_bname '%1800-XII%','%%','348441','-53906'
exec prov_name '%1800-XII%','%%','%%'
exec add_bname '%1800-XIII%','%%','348399','-54569'
exec prov_name '%1800-XIII%','%%','%%'
exec add_bname '%1800-X%','%%','348525','-50863'
exec prov_name '%1800-X%','%%','%%'
exec add_bname '%1800-XI%','%%','348483','-52344'
exec prov_name '%1800-XI%','%%','%%'
exec add_bname '%1092-IV%','%%','268628','-44456'
exec prov_name '%1092-IV%','%%','%%'
exec add_bname '%1092-VI%','%%','268321','-50440'
exec prov_name '%1092-VI%','%%','%%'
exec add_bname '%1092-II%','%%','268378','-37241'
exec prov_name '%1092-II%','%%','%%'
exec add_bname '%1092-III%','%%','249511','-44558'
exec prov_name '%1092-III%','%%','%%'
exec add_bname '%1092-V%','%%','248685','-50440'
exec prov_name '%1092-V%','%%','%%'
exec add_bname '%1090-III%','%%','312584','-48029'
exec prov_name '%1090-III%','%%','%%'

exec add_bname '%1090-IV%','%%','311864','-58348'
exec prov_name '%1090-IV%','%%','%%'

exec add_bname '%1090-I%','%%','312531','-34550'
exec prov_name '%1090-I%','%%','%%'

exec add_bname '%1090-II%','%%','312363','-44545'
exec prov_name '%1090-II%','%%','%%'

exec add_bname '%1800-XIV%','%%','348090','-56023'
exec prov_name '%1800-XIV%','%%','%%'

exec add_bname '%1800-I%','%%','347749','-32221'
exec prov_name '%1800-I%','%%','%%'

exec add_bname '%1800-II%','%%','347881','-33483'
exec prov_name '%1800-II%','%%','%%'

exec add_bname '%1800-XV%','%%','348399','-58047'
exec prov_name '%1800-XV%','%%','%%'

exec add_bname '%1800-XVI%','%%','348090','-59582'
exec prov_name '%1800-XVI%','%%','%%'

exec add_bname '%1800-III%','%%','347838','-34870'
exec prov_name '%1800-III%','%%','%%'

exec add_bname '%1800-IV%','%%','348047','-36092'
exec prov_name '%1800-IV%','%%','%%'
----------------------------------------------------- новая база 13-09-2023

use 56new4
--------проверка
select *
from text102 t1, text49 t49
join BlockName b on b.Cab like '%309'
--------------------------------------- НЕ СОДЕРЖИТ ШКАФ 582 работает 13-09-2023, завтра надо применить
select distinct b.ends,b.*
from
BlockName b, text102 t1
where b.Cab like  '%'+ t1.obj+ '%' and b.ends not like '%шкаф%'
--where b.Cab like  '%'+ t1.obj+ '%' and b.NameB not like '%electric-cabinet_2022%'
order by b.id

------------ iner join
select *
from text102 t1
inner join BlockName b on (b.Cab like '%'+ t1.obj+ '%' and b.ends not like '%шкаф%' )
order by b.id
--------------------------------------- координаты шкафов
select *
from BlockName b, TextBoxs tb
where b.NameA like  '%'+ tb.name49 +'%'
order by b.id