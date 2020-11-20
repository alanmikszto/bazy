create table postac (id_postaci int auto_increment, nazwa varchar(50) NOT NULL, rodzaj enum('wiking','kobieta', 'ptak', 'syrenta'), data_urodzenia date, wiek int, funkcja varchar(200), pesel varchar(11) primary key);
Insert into pracownik values (default, 'Piotr', 'Kowal', '1982-03-11', sprzedawca),
(default, 'Adam', 'Nowakowski', '1991-04-24', 'magazynier'),
(default, 'Ala', 'Nowak', '1998-11-13', 'ksiegowa');

create table dzial (id int auto_increment primary key, nazwa varchar(255));

Insert into dzial values (default, 'sprzedaz'), (default,'ksiegowosc'), (default, 'magazyn');

ALTER TABLE stanowisko ALTER pracownik SET DEFAULT 'sprzedawca';

ALTER TABLE pracownik ADD pensja float(5,2) after 'stanowisko';

UPDATE pracownik SET pensja=1001.23 WHERE nazwisko='Piotr';


ALTER TABLE dzial RENAME COLUMN id TO id_dzialu;
ALTER TABLE pracownik RENAME COLUMN id TO id_prawcownik;

DELETE FROM pracownik WHERE pensja <> MAX(pensja);


zad2/lab_03:

1.UPDATE postac SET wiek=88 where nazwa=tesciowa;
create table walizka (id_walizka int NOT NULL primary key auto_increment, pojemnosc int unsigned, kolor enum('rozowy','czerwony','teczowy','zolty');
Alter table walizka add id_wlasciciel int;
alter table walizka add foreign key (id_wlasciciel) references postac(id_postaci) ON delete cascade;
alter table walizka alter kolor set default 'rozowy';

insert into walizka values(default, 10, 'rozowy', 1);
insert into walizka values(default, 8, default, 3);

insert ino walizka(id_wlasciciel) values(1); - bjorn

zad3/lab_03:
1.
create table izba(adres_budynku varchar(250),
nazwa_izby varchar(250),
metraz int unsigned,
wlasciciel int,
primary key(adres_budynku, nazwa_izby),
foreign key (wlasciciel) references postac(id_postaci) on delete set null);
 2.
 Alter table izba add column kolor varchar(255) after metraz;
 3.
 alter table izba alter kolor set default 'czarny';
 
insert into izba values('poniatowskiego','spizarnia',5, default, 1);


zad4/lab_03:

create table przetwory (id_przetworu int primary key, rok_produkcji int default 1654, id_wykonawcy int, zawartosc varchar(255), dodatek varchar(255), id_konsumenta int);
alter table przetwory alter dodatek set default 'papryczka chilli';
alter table przetwory add foreign key (id_wykonawcy) references postac(id_postaci);,
alter table przetwory add foreign key (id_konsumenta) references postac(id_postaci);
insert into przetwory values (1, default, 1, 'paparyczka bigos', default,3);

zad1/lab_04

a) select * from postac order by wiek DESC;
	
b) alter postac table drop foreign key przetwory_ibfk_1
	alter table postac drop primary key;

zad 2/lab_04:
Alter table add column pesel varchar(11) primary key;
alter table postac midify rodzaj enum('wiking','kobieta','ptak','syrena','waz');
insert into postac values(default, 'gertruda Nieszczera', 


zad 3/lab_04
a) select nazwa from postac where nazwa like '%a';
b) update statek set ladownosc=ladownosc*0.7 where data_wodowania between '1901-01-01' and '2000-12-31';
c) Alter table postac add check (wiek <= 100);

zad 4/lab_04
a) insert into postac values(5, 'loko', 'wiking', '1831-11-08', 74, 'brak', '0493033331');
b) create table marynarz like postac;
c)select * from postac;
insert into marynarz values(6, 'loko', 'wiking','1821-01-01', 74, 'brak', '0493033331', NULL),
(1, 'bjorn', 'wiking', '1921-01-01', 24, 'kapitan','12345448910', 1), (2, 'adam', 'wiking', '1911-01-01', 34, 'brak', '12312313310', 1),
(3, 'ads', 'wiking', '1941-01-01', 44, 'brak', '32113213310', 1);

zad 5/lab_04
a) Update postac set statek=NULL where statek=1;
b) Delete from postac where rodzaj=wiking limit 1;
c) delete from statek;
d) drop table statek;
e) create table zwierz(id int primary key auto_increment, nazwa varchar(50), wiek int);
f) insert into marynarz * from postac where rodzaj='waz','ptak';

zad 1/lab_05
1. create table kreatura like wikingowie.kreatura
	create table zasob like wikingowie.zasob;
	create table ekwipunek like wikingowie.ekwipunek
	insert into kreatura select * from wikingowie.kreatura;
	insert into zasob select * from wikingowie.zasob;
	insert into ekwipunek select * from wikingowie.ekwipunek;
	alter table ekwipunek add foreign key (idKreatury) references kreatura(idKreatury);
	alter table ekwipunek add foreign key (idZasobu) references zasob(idZasobu);
	
2. select * from zasob;
3. select * from zasob where rodzaj='jedzenie';
4. select idZasobu, ilosc from ekwipunek where idKreatury IN(1,2,5); ALBO
select idZasobu, ilosc from ekwipunek where idKreatury =1 or idKreatury=2 or idKreatury=5;

zad 2/lab_05
1. Select * from kreatura where rodzaj='wiedzma' and udzwig>=50;
2. select * from zasob where waga between 2 AND 5;
3. select * from kreatura where nazwa LIKE '%or%' AND udzwig between 30 and 70;

zad 3/lab_05
1.select * from zasob where month(dataPozyskania) in (7,8);
2. select * from zasob where rodzaj is not null order by waga asc;
3. select * from kreatura order by dataUr ASC LIMIT 5;



zad 4/lab_05
1. select distinct(rodzaj) from zasob;
2. select concat (nazwa,' ',rodzaj) as nazwa_rodzaj from kreatura where rodzaj like 'wi%';
3. 