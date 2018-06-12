-----------------------SEKCJA PACJENTA--------------------------------
----------------------------------------------------------------------

insert into pacjent values(1,'Maciej','Kowalski','1997-06-23');
insert into pacjent values(2,'Waldemar','Drekst','1970-01-01');
insert into pacjent values(3,'Piotr','Romaniuk','1924-08-12');
insert into pacjent values(4,'Katarzyna','Rajewska','1965-11-23');
insert into pacjent values(5,'Agnieszka','Wellzer','2003-12-30');
insert into pacjent values(6,'Adrianna','Piotrowska','1988-05-06');
insert into pacjent values(7,'Adam','Kowalski','1970-01-12');
insert into pacjent values(8,'Witold','Drekst','1972-05-09');
insert into pacjent values(9,'Piotr','Romaniuk','1974-01-22');
insert into pacjent values(10,'Maria','Ziemowicz','1986-03-15');
insert into pacjent values(11,'Zofia','Tuper','1989-01-01');

--OSTATNICH DWOCH PACJENTOW NIE OTRZYMALO REJESTRACJI(NP.BRAK UBEZPIECZENIA)--
insert into karta_pacjenta values('K001',1,'2003-12-04')
insert into karta_pacjenta values('K002',2,'2001-11-08')
insert into karta_pacjenta values('K003',3,'2011-10-12')
insert into karta_pacjenta values('K004',4,'2013-09-16')
insert into karta_pacjenta values('K005',5,'2004-08-20')
insert into karta_pacjenta values('K006',6,'1988-07-21')
insert into karta_pacjenta values('K007',7,'2006-06-23')
insert into karta_pacjenta values('K008',8,'2010-05-25')
insert into karta_pacjenta values('K009',9,'1990-04-27')
-----------------------SEKCJA LEKARZY--------------------------------
---------------------------------------------------------------------
insert into specjalnosci values(1,'Laryngolog');
insert into specjalnosci values(2,'Pediatra');
insert into specjalnosci values(3,'Ortopeda');
insert into specjalnosci values(4,'Pulmonolog');
insert into specjalnosci values(5,'Ginekolog');
insert into specjalnosci values(6,'Okulista');
insert into specjalnosci values(7,'Kardiolog');
insert into specjalnosci values(8,'Fizjolog');
insert into specjalnosci values(9,'Reumatolog');


--DWOCH LEKARZY O TEJ SAMEJ SPECJALNOSCI A ZARAZEM BRACIA--
insert into pracownik values(1,1,'Andrzej','Lavoide',4500)
insert into pracownik values(2,2,'Michal','Dandrewicz',7300)
insert into pracownik values(3,3,'Adrian','Kreatywny',2200)
insert into pracownik values(4,4,'Krzysztof','Staff',6000)
insert into pracownik values(5,5,'Miroslaw','Stary',3500)
insert into pracownik values(6,6,'Jedrzej','Dropicki',6700)
insert into pracownik values(7,7,'Lukasz','Walewski',9000)
insert into pracownik values(8,2,'Marcin','Lavoide',10000)
-------------------------------------------------------------------

--PACJENT 1
	insert into pobyt values(1,'K001','2004-11-12','2004-11-19')
	insert into pobyt values(2,'K001','2011-10-09','2011-10-18')
--PACJENT 2
	insert into pobyt values(3,'K002','2005-01-12','2005-01-23')
	insert into pobyt values(4,'K002','2007-06-15','2007-06-29')
	insert into pobyt values(5,'K002','2014-09-22','2014-09-22')
--PACJENT 3
	insert into pobyt values(6,'K003','2012-03-10','2012-03-19')
	insert into pobyt values(7,'K003','2016-05-19','2016-05-26')
--PACJENT 4
	insert into pobyt values(8,'K004','2013-11-12','2013-12-12')
	insert into pobyt values(9,'K004','2014-05-24','2014-05-30')
	insert into pobyt values(10,'K004','2016-03-15','2016-07-15')
	insert into pobyt values(11,'K004','2018-06-18','2018-06-28')
--PACJENT 5
	insert into pobyt values(12,'K005','2008-10-02','2008-10-07')
--PACJENT 6
	insert into pobyt values(13,'K006','1991-04-17','1991-04-29')
--PACJENT 7
	insert into pobyt values(14,'K007','2008-07-25','2008-08-25')
	insert into pobyt values(15,'K007','2010-11-12','2010-11-19')
--PACJENT 8
	insert into pobyt values(16,'K008','2011-11-12','2011-11-26')
	insert into pobyt values(17,'K008','2018-10-17','2018-10-29')
--PACJENT 9
	insert into pobyt values(18,'K009','1995-06-11','1995-06-11')


--PACJENT 1
insert into wizyta values('W01',1,1)
insert into wizyta values('W02',5,2)
--PACJENT 2
insert into wizyta values('W03',3,3)
insert into wizyta values('W04',4,3)

insert into wizyta values('W05',5,4)

insert into wizyta values('W06',6,5)
insert into wizyta values('W07',7,5)
--PACJENT 3
insert into wizyta values('W08',8,6)
insert into wizyta values('W09',7,7)
--PACJENT 4
insert into wizyta values('W10',1,8)
insert into wizyta values('W11',4,8)

insert into wizyta values('W12',6,9)

insert into wizyta values('W13',8,10)

insert into wizyta values('W14',7,11)
insert into wizyta values('W15',1,11)
--PACJENT 5
insert into wizyta values('W16',3,12)
--PACJENT 6
insert into wizyta values('W17',6,13)
--PACJENT 7
insert into wizyta values('W18',8,14)
insert into wizyta values('W19',4,15)
--PACJENT 8
insert into wizyta values('W20',5,16)
insert into wizyta values('W21',7,16)
insert into wizyta values('W22',2,17)
--PACJENT 9
insert into wizyta values('W23',1,18)



insert into skierowanie values('S01','W01','2004-11-12','Badanie oczu')
insert into skierowanie values('S02','W02','2005-01-12','Badanie krtani')

insert into skierowanie values('S03','W03','2005-01-17','Badanie pluc')

insert into skierowanie values('S04','W05','2007-06-15','Badanie kostki')
insert into skierowanie values('S05','W05','2007-06-15','Badanie kolana')


insert into skierowanie values('S06','W08','2012-03-10','Kolanoskopia')
insert into skierowanie values('S07','W09','2016-05-19','Operacja wyrostka')

insert into skierowanie values('S08','W12','2014-05-24','Chemioterapia')

insert into skierowanie values('S10','W15','2018-06-22','Nastawianie barku')

insert into skierowanie values('S11','W17','1991-04-17','Łamanie ręki')

insert into skierowanie values('S12','W19','2010-11-12','Wycięcie migdałków')

insert into skierowanie values('S13','W20','2016-03-19','Amputacja palca')

insert into skierowanie values('S14','W23','1995-06-11','Rehabilitacja')
insert into skierowanie values('S15','W23','1995-06-11','Wycięcie żylaków')
insert into skierowanie values('S16','W23','1995-06-11','Wymrażanie pieprzyków')
