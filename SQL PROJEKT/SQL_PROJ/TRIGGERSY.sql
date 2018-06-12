-- 1. Dodaje lekarza , je¿eli nie ma ¿adnego o takim imieniu i nazwisku [INSERT]
create trigger dod_lekarz
on Szpital..pracownik
instead of insert
as
	if not exists(
			select id_pracownika
			from Szpital..pracownik
			where imie in(select imie from inserted) 
						and nazwisko in(select nazwisko from inserted))
	begin
		insert into Szpital..pracownik (id_pracownika ,id_specjalnosci,imie ,nazwisko,placa_calkowita)
		select id_pracownika ,id_specjalnosci,imie ,nazwisko,placa_calkowita from inserted
	end
	else
	begin
		print 'Lekarz o tych danych juz istnieje'
	end

--2.W przypadku usuniêcia specjalnoœci z szpitala dodaje wpis[DELETE]
go
create trigger archiwizacja
on specjalnosci
after delete
as
begin
	declare @specjalnosc varchar(14) = (select nazwa_specjalnosci from deleted)
	insert into zdarzenia values('Usunieto specjalnosc : '+@specjalnosc+' w dniu : '+cast(GETDATE() as varchar(20)))
end

--3.W momencie aktualizacji placy pracownika dodaje wpis do dziennika zdarzeñ
go
create trigger aktualizacja 
on pracownik
after update
as
begin
	declare @pracownik int = (select id_pracownika from deleted)
	declare @placa_old int = (select placa_calkowita from deleted)
	declare @placa_new int = (select placa_calkowita from inserted)
	declare @diff int = @placa_new-@placa_old
	insert into zdarzenia values('Pracownik '+cast(@pracownik as varchar(3))+'otrzyma³ podwy¿kê w wysokoœci '+cast(@diff as varchar(9)))
end



--test 1
go
begin
insert into pracownik values(9,2,'Tester','Testowy',13000)
end
--test2
go
begin
delete from specjalnosci where nazwa_specjalnosci ='Kardiolog'
select * from specjalnosci
end
--test3
go
begin
update pracownik set placa_calkowita=7000
where id_pracownika=1
SELECT TOP 1 * FROM zdarzenia ORDER BY id_zdarzenia DESC
end
