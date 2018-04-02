--1
declare @napis varchar(13)
set @napis = 'Czesc, to ja.'
print @napis
--2
declare @numer float
set @numer = 123
print 'ZMIENNA=' + cast (@numer as varchar)
--3
declare @zmienna int
set @zmienna = -1
if(@zmienna>0)
print @zmienna
else
print 'BLAD'
--4
declare @i int
set @i=1
while (@i<5)
begin
print 'zmienna ma wartosc '+cast (@i as varchar)
set @i+=1
end
--5
declare @j int
set @j=3
while (@j<8)
begin

if(@j=3 or @j=5 or @j=7)
begin
if(@j=3)
print cast (@j as varchar)+' poczatek'

if(@j=5)
print cast (@j as varchar)+' srodek'

if(@j=7)
print cast (@j as varchar)+' koniec'
end

else
print @j

set @j+=1
end

--6
CREATE DATABASE baza_fajna;
use baza_fajna
CREATE TABLE ODDZIALY(
NR_ODD int,
NAZWA_ODD varchar(30)
);

insert into        ODDZIALY(NR_ODD,NAZWA_ODD)
values(1,'zarzad')
insert into        ODDZIALY(NR_ODD,NAZWA_ODD)
values(2,'zarzad')
insert into        ODDZIALY(NR_ODD,NAZWA_ODD)
values(3,'zarzad')
insert into        ODDZIALY(NR_ODD,NAZWA_ODD)
values(4,'zarzad')

--7
go
create proc search_proc @max int=1
as 
select 'Nazwa oddzialu to : '+ [NAZWA_ODD]
from ODDZIALY
where NR_ODD=@max

--exec search_proc

--8
begin
        DECLARE @flag varchar(30)
        DECLARE kursor scroll CURSOR  
                FOR SELECT 'NR ODDZIALU TO : ' + cast(NR_ODD as varchar) FROM ODDZIALY  
        OPEN kursor
        FETCH NEXT FROM kursor into @flag;
        WHILE @@FETCH_STATUS=0
        begin
        print @flag 
                FETCH NEXT FROM kursor into @flag;
        end
close kursor
deallocate kursor
end

--9
begin
        declare @numer int, @counter int
        set @counter =0
        declare kursor scroll CURSOR
                FOR SELECT NR_ODD FROM ODDZIALY
        OPEN kursor
        FETCH NEXT FROM kursor into @numer
        WHILE @@FETCH_STATUS=0
                begin
                                if(@numer>2)
                                        begin
                                        DELETE FROM ODDZIALY
                                        WHERE NR_ODD=@numer
                                        set @counter+=1
                                        end

                                FETCH NEXT FROM kursor into @numer;
                end
        print 'Liczba usunietych rekordow : ' + cast(@counter as varchar)
        close kursor
        deallocate kursor
end
--select * from ODDZIALY

--10
begin
declare @id int
        declare kursor scroll CURSOR
                FOR SELECT NR_ODD FROM ODDZIALY
        OPEN kursor
        FETCH NEXT FROM kursor into @id
        WHILE @@FETCH_STATUS=0
                begin
                                if not exists(select NR_ODD from ODDZIALY where NR_ODD=3)
                                        begin
										insert into ODDZIALY(NR_ODD,NAZWA_ODD)
										values(3,'zarzad_fajny')
										break;
                                        end
                                if exists(select NR_ODD from ODDZIALY where NR_ODD=3)
                                        begin
                                        UPDATE ODDZIALY
                                        SET NAZWA_ODD='fajny_oddzial'
                                        WHERE NR_ODD = 3;
                                        end

                                FETCH NEXT FROM kursor into @id;
                end
        close kursor
        deallocate kursor
end
DELETE FROM ODDZIALY;
select * from ODDZIALY