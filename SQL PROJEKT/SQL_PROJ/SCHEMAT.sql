if exists(select 1 from master.dbo.sysdatabases where name = 'Szpital') drop database Szpital
GO
CREATE DATABASE Szpital

go        --ok
create table Szpital..pacjent(
id_pacjenta int NOT null primary key,
imie varchar(10),
nazwisko varchar(10),
data_ur datetime
)



go
create table Szpital..karta_pacjenta(
id_karty varchar(4) primary key,
id_pacjenta int unique not null,
data_rejestracji smalldatetime,
constraint pacjentt_fk foreign key(id_pacjenta) references Szpital..pacjent(id_pacjenta)
on delete cascade
);
go
create table Szpital..pobyt(
id_pobytu int primary key,
id_karty varchar(4),
pocz_pobytu smalldatetime,
koniec_pobytu smalldatetime,
constraint karta_fk foreign key(id_karty) references Szpital..karta_pacjenta(id_karty)
on delete cascade
);
go        --ok
create table Szpital..specjalnosci(
id_specjalnosci int not null primary key,
nazwa_specjalnosci varchar(14),
);

go        --ok
create table Szpital..pracownik(
id_pracownika int not null primary key,
id_specjalnosci int null,

imie varchar(10),
nazwisko varchar(10),
placa_calkowita int null,

constraint specjalnosc_fk foreign key(id_specjalnosci) references
Szpital..specjalnosci(id_specjalnosci)
on delete set null
)


go
create table Szpital..wizyta(
id_wizyty varchar(3) constraint wizyta_pk primary key,

        id_lekarza int not null,
        id_pobytu int not null,

constraint lekarz_fk foreign key(id_lekarza) references Szpital..pracownik(id_pracownika),
constraint pobyt_fk foreign key(id_pobytu) references Szpital..pobyt(id_pobytu)
on delete cascade 
);

go
create table Szpital..skierowanie(
id_skierowania varchar(3) primary key not null,
id_wizyty varchar(3) not null,
data_skierowania smalldatetime not null,
badanie varchar(30) not null,

constraint wizyta_fk foreign key (id_wizyty) references Szpital..wizyta(id_wizyty)
on delete cascade
);
go
create table Szpital..zdarzenia(
id_zdarzenia int not null IDENTITY(1,1) ,
opis_zdarzenia varchar(100) not null
)
