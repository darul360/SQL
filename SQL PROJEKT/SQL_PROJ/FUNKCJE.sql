--1. Tworzy pacjenta i generuje id inne niz zawarte w bazie
go 
create procedure TWORZ_PACJENT @imie varchar(10) ,@nazwisko varchar(10),@data_ur datetime
as
begin
	declare @identyfikator int
	set @identyfikator = (select top 1 id_pacjenta from pacjent order by id_pacjenta desc) + 1

	insert into pacjent values(@identyfikator,@imie,@nazwisko,@data_ur)
end

--2. Podwy¿sza przychód specjalnoœciom o konkretny procent
go
create procedure AKTUALIZUJ_PRACOWNIK @id_pracownika int,@procent float
as
	begin
		declare @payment int,@npayment float
		set @payment = (select placa_calkowita from pracownik where id_pracownika=@id_pracownika)
		set @npayment =(select round((@payment + @payment*(@procent/100)),2))

		update pracownik	
		set placa_calkowita = @npayment
		where id_pracownika = @id_pracownika
	end
--3. Usuwanie rejestracji utworzonych pomiêdzy datami oraz wszelkich danych
go
create procedure USUN_KARTE @start smalldatetime,@koniec smalldatetime
as
begin
	delete from karta_pacjenta where data_rejestracji between @start and @koniec
end
--4.Funkcja œredni zarobek dla ka¿dej specjalnoœci
go
create function POKAZ_PRACOWNIKOW (@nazwa_sp varchar(14))
returns varchar(15)
as
begin
declare @placa int

	select @placa = (select avg(placa_calkowita) from pracownik,specjalnosci 
					where specjalnosci.id_specjalnosci=pracownik.id_specjalnosci and nazwa_specjalnosci=@nazwa_sp)

	return cast(@placa as varchar(15))
end

--1 TEST
go
begin

select * from pacjent
declare @imie varchar(10) = 'Tester',@nazwisko varchar(10) = 'Tester',@data_ur datetime = getdate()-100
execute TWORZ_PACJENT @imie,@nazwisko,@data_ur 
select * from pacjent where imie=@imie and naziwsko = @nazwisko
end

--2 TEST
go
begin
select * from pracownik
declare @id_pracownika int = 1,@procent int = 20
select placa_calkowita from pracownik where id_pracownika=@id_pracownika
execute AKTUALIZUJ_PRACOWNIK @id_pracownika,@procent
select placa_calkowita from pracownik where id_pracownika=@id_pracownika
end

--3 ustawiono tryb kaskadowy foreign keys w celu dynamicznego usuwania rejestrów
go
begin
select * from karta_pacjenta
select * from wizyta
declare @start smalldatetime = '2002-01-01',@koniec smalldatetime = '2004-12-12'
execute USUN_KARTE @start,@koniec
end
select * from pobyt
--4
go
begin
select nazwa_specjalnosci,dbo.POKAZ_PRACOWNIKOW(nazwa_specjalnosci) as zarobek from specjalnosci
end
