--https://learn.microsoft.com/ru-ru/sql/relational-databases/import-export/import-data-from-excel-to-sql?view=sql-server-ver16
-- �������������� �������
-- ������������ ������ �������� �� ������ Excel � SQL Server � ������� ������� Transact-SQL OPENROWSET ��� OPENDATASOURCE. 
-- ����� �������� ���������� �������������� ������.

 --�����!

-- � ���� ������ SQL Azure ���������� ������������� ������ ��������������� �� Excel. 
-- ������� ���������� �������������� ������ � ��������� ���� (CSV).

-- ����� ����������� ��������������� ������� ���������� �������� �������� ad hoc distributed queries � ������������ �������, 
-- ��� �������� � ������� ����. 
-- �������������� �������� ��. � ������ ad hoc distributed queries Server Configuration Option 
-- (�������� ������������ ������� "ad hoc distributed queries").
sp_configure 'show advanced options', 1;
RECONFIGURE;
GO
sp_configure 'ad hoc distributed queries', 1;
RECONFIGURE;
GO
 -- � ����������� ���� ������� ���� ������ ������������� �� ����� Excel Sheet1 � ����� ������� ���� ������ � ������� OPENROWSET.
-- SQL

-- ����������
create database ImportFromExcel_Flotacia
USE ImportFromExcel_Flotacia;
GO
SELECT * INTO ImportFromExcel_Flotacia
FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0',
    'Excel 12.0; Database="F:\�������\�������� �������� � ��\SQL ��� ��������� ������ ����� ������ ������ .xls"', [old_journal]);
GO

SELECT * INTO ImportFromExcel_Flotacia
FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0',
    'Excel 12.0; Database="F:\�������\�������� �������� � ��\SQL ��� ��������� ������ ����� ������ ������ .xls"', [new_journal$]);
GO

-- ���� �������� ��� �� ������ � OPENDATASOURCE.
-- SQL
--����������

USE ImportFromExcel_Flotacia;
GO
SELECT * INTO ImportFromExcel_Flotacia
FROM OPENDATASOURCE('Microsoft.ACE.OLEDB.16.0', --Microsoft.ACE.OLEDB.12.0
    'Data Source=F:\�������\�������� �������� � ��\SQL ��� ��������� ������ ����� ������ ������ .xls Extended Properties=Excel 16.0')...[new_journal$];
GO
-- ����� �������� ��������������� ������ � ������������ �������, � �� ��������� �����, 
-- ����������� ��������� INSERT INTO ... SELECT ... FROM ... 
-- ������ ���������� SELECT ... INTO ... FROM ... �� ���������� ��������.
-- ��� ��������� � ������ Excel ��� ������� ����������� ����������� ��������� SELECT ... FROM ....
EXEC sp_enum_oledb_providers;


USE ImportFromExcel_Flotacia;
-- ������ �� ����������
SELECT  DISTINCT * ����������_������,
FROM old_journal ,new_journal
WHERE  �����������_������_������� = '1091-II-�2-�14.2' or ����������_������ = '1091-II-�2-�14.2'
-- '1091-II-�2-�14.2'
-- INNER JOIN

USE ImportFromExcel_Flotacia;
-- ������ �� ����������
SELECT  *
from new_journal  left join old_journal
-- left join old_journal
on   old_journal.�����������_������_������� = '1091-II-�2-�14.2' 
--new_journal.����������_������ = '309-VI-K1 ' and
--and old_journal.�����������_������_������� ='one'
--where  �����������_������_������� =  ����������_������ 
-- '1091-II-�2-�14.2'
-- INNER JOIN
INSERT old_journal VALUES ('one','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16')
INSERT new_journal VALUES ('one','2','3','4','5','6','7','8','9','10','11','12','13','14')

USE ImportFromExcel_Flotacia;
SELECT  Distinct*
from new_journal2,  new_journal2
-- left join old_journal
where   new_journal2.����������_������ = '1091-II-���-��-S1' --and new_journal2.����������_������ = '1126-II-S2'
or new_journal2.����������_������ = '1091-II-���-��-S2'
or new_journal2.����������_������ = '1091-II-���-��-S3'
or new_journal2.����������_������ = '1091-II-���-��-S4'
or new_journal2.����������_������ = '1091-II-���-��-S5'
or new_journal2.����������_������ = '1091-II-���-��-S6'