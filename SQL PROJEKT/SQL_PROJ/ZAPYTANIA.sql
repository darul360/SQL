--1.Pacjenci o nazwisku zaczynajacym sie na D
	select imie,naziwsko from pacjent where naziwsko like 'D%'

--2.Pacjenci urodzeni po roku 1994
	select naziwsko from pacjent where datepart(yy,data_ur)<1994

--3.Podaj najmlodszego pacjenta
	select top 1 imie,naziwsko,data_ur from pacjent
	order by data_ur desc

--4.Podaj pracownika zarabijacego mniej niz sredni zarobek w szpitalu
	select id_pracownika,imie,nazwisko,placa_calkowita from pracownik
	where placa_calkowita<(select avg(placa_calkowita) from pracownik)

--5.Podaj id pacjentow ktorzy nie otrzymali skierowania na badania po odbyciu wizyty
	select distinct pacjent.id_pacjenta from pacjent 
	left join karta_pacjenta on karta_pacjenta.id_pacjenta = pacjent.id_pacjenta
	left join pobyt on pobyt.id_karty=karta_pacjenta.id_karty
	left join wizyta on wizyta.id_pobytu=pobyt.id_pobytu
	left join skierowanie on skierowanie.id_wizyty=wizyta.id_wizyty
	where skierowanie.id_skierowania is null

--6.Podaj pracownikow ktorzy odbyli przynajmniej jedna wizyte
	select imie,nazwisko from pracownik 
	left join wizyta on wizyta.id_lekarza=pracownik.id_pracownika
	where wizyta.id_wizyty is not null

--7.Podaj lekary o tej samej specalnosci
	select p1.imie,p1.nazwisko ,p1.id_specjalnosci from pracownik p1,pracownik p2
	where p1.id_specjalnosci=p2.id_specjalnosci and p1.id_pracownika!=p2.id_pracownika
	
--8.Podaj procentowy zarobek specjalnosci wzgledem calego szpitala
	select specjalnosci.nazwa_specjalnosci,
	cast(round((cast(sum(placa_calkowita)as float)/cast((select sum(placa_calkowita) from pracownik)as float))*100,2) as varchar)+'%' as udzial
	from pracownik
	left join specjalnosci on specjalnosci.id_specjalnosci=pracownik.id_specjalnosci
	group by specjalnosci.nazwa_specjalnosci

--9.Zawody gdzie zarobek wynosi +5000zł
	select specjalnosci.nazwa_specjalnosci,avg(placa_calkowita)as srednia from pracownik
	left join specjalnosci on specjalnosci.id_specjalnosci=pracownik.id_specjalnosci
	group by specjalnosci.nazwa_specjalnosci
	having avg(placa_calkowita)>5000

--10.Wypisz 3 najbardziej zapracowanych lekarzy 
	select top 3 id_pracownika,imie,nazwisko,count(wizyta.id_wizyty) as ilosc_wizyt from pracownik 
	left join wizyta on wizyta.id_lekarza=pracownik.id_pracownika
	group by imie,nazwisko,id_pracownika
	order by count(wizyta.id_wizyty) desc

--11.Ile skierowan otrzymal kazdy pacjent?
	select p.imie,p.nazwisko,p.id_pacjenta,count(skierowanie.id_skierowania)as skierowania from pacjent p
	left join karta_pacjenta on karta_pacjenta.id_pacjenta = p.id_pacjenta
	left join pobyt on pobyt.id_karty = karta_pacjenta.id_karty
	left join wizyta on wizyta.id_pobytu = pobyt.id_pobytu
	left join skierowanie on skierowanie.id_wizyty = wizyta.id_wizyty
	group by p.imie,p.nazwisko,p.id_pacjenta



--12.Podaj zawody nie wykonywane w szpialu
	select nazwa_specjalnosci from specjalnosci
	where not exists(select id_specjalnosci from pracownik where specjalnosci.id_specjalnosci=pracownik.id_specjalnosci)

--13.Podaj najbardziej chorowitego pacjenta
	select top 1 pacjent.imie,pacjent.nazwisko, count(pobyt.id_pobytu) as ilosc_wizyt from pacjent
	left join karta_pacjenta on karta_pacjenta.id_pacjenta=pacjent.id_pacjenta
	left join pobyt on pobyt.id_karty=karta_pacjenta.id_karty
	group by pacjent.imie,pacjent.nazwisko
	order by count(pobyt.id_pobytu) desc

--14.Jaki procent lekarzy stanowią pediatrzy
	select cast(count(case when nazwa_specjalnosci='Pediatra' then 1 else null end)as float)/cast(count(*)as float)*100 as procent from specjalnosci 
	left join pracownik on pracownik.id_specjalnosci=specjalnosci.id_specjalnosci	
	

--15.Podaj ile lat mial kazdy pacjent w momencie pierwszej wizyty
	select distinct p.imie,p.naziwsko,
	datediff(year,p.data_ur,
	(
	select top 1 pocz_pobytu from pobyt
	left join karta_pacjenta on karta_pacjenta.id_karty=pobyt.id_karty
	where p.id_pacjenta=karta_pacjenta.id_pacjenta
	)) from pacjent p where exists(select id_pacjenta from karta_pacjenta where id_pacjenta=p.id_pacjenta)





	
