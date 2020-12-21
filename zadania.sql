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
3. Select nazwa, waga*ilosc from zasob where YEAR(dataPozyskania) between 2000 AND 2007;

zad 5/lab_05
1. select nazwa, waga*0.7 as masa_bez_odpadkow, waga*0.3 as odpadki from zasob where rodzaj='jedzenie';
2. select * from zasob where rodzaj is NOT NULL;
3. select distinct(rodzaj), nazwa from zasob where nazwa like 'Ba%' or nazwa like '%os' order by nazwa ASC;

zad 1/lab_06
1. select avg(waga) as srednia_waga from kreatura where rodzaj='wiking';
2. select rodzaj, avg(waga) as srednia_waga, count(nazwa) as liczba_kreatur from kreatura group by rodzaj;
3. SELECT AVG(YEAR(CURDATE())-YEAR(dataUr)) AS sredni_wiek, rodzaj FROM kreatura GROUP BY rodzaj;

zad 2/lab_06
1. select avg(waga), rodzaj as waga from zasob group by rodzaj;
2. select nazwa, avg(waga) as waga from zasob where ilosc>=4 group by nazwa having sum(waga)>10;
*) 
3. select rodzaj, count(nazwa) as nazwa from zasob where ilosc >= 1 group by rodzaj; 

zad 3/lab_06
1. select k.nazwa, k.idKreatury, sum(e.ilosc) from kreatura k join ekwipunek e on k.idKreatury=e.idKreatury group by e.idKreatury;
2. select k.nazwa, z.nazwa from kreatura k join ekwipunek e on k.idKreatury=e.idKreatury join zasob z on e.idZasobu=z.idZasobu;
3. select k.nazwa, e.ilosc from kreatura k left join ekwipunek e on k.idKreatury=e.idKreatury where ilosc is null;
   select idKreatury from kreatura where idKreatury not in (select idKreatury from ekwipunek where idKreatury is not null);
 
zad 4/lab_06 
1. select kreatura.nazwa, kreatura.dataUr, zasob.nazwa  from kreatura Join ekwipunek on ekwipunek.idKreatury = kreatura.idKreatury join zasob on ekwipunek.idZasobu = zasob.idZasobu where kreatura.dataUr between 1670 and 1679 AND kreatura.rodzaj='wiking';
2. SELECT k.nazwa as Kreatura FROM kreatura k INNER JOIN ekwipunek e ON k.idKreatury=e.idKreatury INNER JOIN zasob z ON e.idZasobu=z.idZasobu WHERE z.rodzaj='jedzenie' ORDER BY k.dataUr DESC LIMIT 0,5;
3. select kreatura.nazwa as kreatura1, kretura.nazwa as kreatura2 from kreatura inner join kreatura1 on kreatura1.idKreatury=kreatura.idKreatury-5; 
   
zad 5/lab_06
1. select kreatura.rodzaj, sum(zasob.waga*zasob.ilosc) as waga, sum(zasob.ilosc) as ilosc from kreatura inner join ekwipunek on ekwipunek.idKreatury=kreatura.idKreatury   join zasob on ekwipunek.idZasobu=zasob.idZasobu where kreatura.rodzaj NOT LIKE 'waz' AND zasob.ilosc<30 GROUP BY kreatura.rodzaj;
2. (z nazwa, zduplikowane)
select 'najmlodsza',a.maxData, b.nazwa, a.rodzaj
from (select max(dataUr) maxData, rodzaj from kreatura group by rodzaj) a,
(select nazwa, dataUr from kreatura) b where a.maxData = b.dataUr
union
select 'najstarsza',a.minData, b.nazwa, a.rodzaj
from (select min(dataUr) minData, rodzaj from kreatura group by rodzaj) a,
(select nazwa, dataUr from kreatura) b
where a.minData = b.dataUr; 
 
2*) (bez nazw, ale nie sa zduplikowane)
select a.nazwa, a.rodzaj, a.dataUr from kreatura a, (SELECT min(dataUr) min, max(dataUr) max
from kreatura group by rodzaj) b WHERE b.min = a.dataUr OR b.max=a.dataUr;

zad 1/lab_7
1. use wikinowie;
2. select nazwa from kreatury where idKreatury not in (select id_uczestnika from uczestnicy);
3. 

zad 2/lab_07
1. select wyprawa.nazwa, count(uczestnicy.id_uczestnika) as ilosc, group_concat(kreatura.nazwa) from wyprawa join uczestnicy on
uczestnicy.id_wyprawy=wyprawa.id_wyprawy join kreatura on kreatura.idKreatury=uczestnicy.id_uczestnika group by wyprawa.nazwa;
2. select idEtapu, wyprawa.id_wyprawy, sektor.nazwa, data_rozpoczecia, kreatura.nazwa 
from kreatura join uczestnicy on kreatura.idKreatury=uczestnicy.id_uczestnika
join wyprawa on uczestnicy.id_wyprawy=wyprawa.id_wyprawy
join etapy_wyprawy on wyprawa.id_wyprawy=etapy_wyprawy.idWyprawy
join sektor on etapy_wyprawy.sektor=sektor.id_sektora 
where kreatura.idKreatury = wyprawa.kierownik order by data_rozpoczecia, kolejnosc;

zad 3/lab_07
1) select sektor.nazwa, count(sektor.id_sektora) as ilosc from etapy_wyprawy join sektor on 
sektor.id_sektora=etapy_wyprawy.sektor group by sektor.id_sektora;
2)SELECT wyprawa.nazwa, SUM(LENGTH(etapy_wyprawy.dziennik)) FROM wyprawa JOIN etapy_wyprawy ON wyprawa.id_wyprawy = etapy_wyprawy.idWyprawy GROUP BY wyprawa.nazwa HAVING SUM(LENGTH(etapy_wyprawy.dziennik)) < 400;

zad 4/lab_07
1)
2)
SELECT w.nazwa,
COUNT(DISTINCT(uczestnicy.id_uczestnika)),
SUM(ekwipunek.ilosc*z.waga)/COUNT(DISTINCT(uczestnicy.id_uczestnika)) AS "średnia waga"
FROM wyprawa
LEFT JOIN uczestnicy ON wyprawa.id_wyprawy = uczestnicy.id_wyprawy
LEFT JOIN kreatura ON uczestnicy.id_uczestnika = kreatura.idKreatury
LEFT JOIN ekwipunek ON kreatura.idKreatury= ekwipunek.idKreatury
LEFT JOIN zasob ON ekwipunek.idZasobu = zasob.idZasobu
GROUP BY wyprawa.nazwa;


zad 1/lab_08
1.
DELIMITER //
CREATE TRIGGER kreatura_before_insert
BEFORE INSERT ON kreatura
FOR EACH ROW
BEGIN
  IF NEW.waga < 0
  THEN
    SET NEW.waga = 0;
  END IF;
END
//
DELIMITER ;

Zad 2/lab_08
create table archiwum_wypraw (id_wyprawy int primary key, nazwa varchar(50), data_rozpoczecia date, data_zakonczenia date, kierownik varchar(50));

DELIMITER $$
create trigger uczestnicy_after_delete_wyprawa before delete on wyprawa for each row begin insert into archiwum_wypraw values (old.id_wyprawy, old.nazwa, old.data_rozpoczecia, old.data_zakonczenia, (SELECT nazwa as kierownik from kreatura where kreatura.idKreatury=OLD.kierownik));
END
$$
DELIMITER ;


Zad 3/lab_08
1. 
DELIMITER $$
create procedure eliksir_sily(in udzwig int)
begin
update kreatura set udzwig = 1.2 * udzwig where id_kreatury = udzwig;
end
$$
DELIMITER ;

2. ????

zad 4/lab_08
1. CREATE TABLE system_alarmowy(id_alarmu int not null auto_increment, wiadomosc);


DELIMITER $$

CREATE TRIGGER uczestnicy_after_insert
AFTER INSERT ON uczestnicy
FOR EACH ROW
BEGIN

IF ( SELECT id_uczestnika=14 from uczestnicy where id_wyprawy=NEW.id_wyprawy) AND
(SELECT sektor=7 FROM etapy_wyprawy WHERE idWyprawy=NEW.id_wyprawy)
THEN
INSERT INTO system_alarmowy VALUES(default,'Tesciowa nadchodzi');
END IF;
END
$$

DELIMITER ;



CWICZENIA - 2
1. select pracownik.imie, pracownik.nazwisko, dzial.nazwa from pracownik join dzial on pracownik.dzial=dzial.id_dzialu;
2. select towar.nazwa_towaru, kategoria.nazwa_kategori, stan_magazynowy.ilosc, jednostka_miary.nazwa from towar join kategoria on towar.kategoria=kategoria.id_kategori join stan_magazynowy on stan_magazynowy.towar=towar.id_towaru join jednostka_miary on stan_magazynowy.jm=jednostka_miary.id_jednostki order by stan_magazynowy.ilosc DESC;
3. SELECT jednostka_miary.nazwa FROM jednostka_miary JOIN stan_magazynowy ON jednostka_miary.id_jednostki=stan_magazynowy.jm WHERE stan_magazynowy.jm NOT IN(3,4);
4.
5.select * FROM jednostka_miary LEFT JOIN stan_magazynowy ON jednostka_miary.id_jednostki=stan_magazynowy.jm where stan_magazynowy.jm IS NULL;
6. select zamowienie.numer_zamowienia, towar.nazwa_towaru, stan_magazynowy.ilosc, pozycja_zamowienia.cena from stan_magazynowy join towar on stan_magazynowy.towar=towar.id_towaru join pozycja_zamowienia on towar.id_towaru=pozycja_zamowienia.towar join zamowienie on zamowienie.id_zamowienia=pozycja_zamowienia.zamowienie where year(zamowienie.data_zamowienia) = 2018; 
8. select * from pozycja_zamowienia join zamowienie on pozycja_zamowienia.zamowienie=zamowienie.id_zamowienia order by zamowienie.data_zamowienia ASC LIMIT 5;
10. SELECT * FROM adres_klienta WHERE kod NOT REGEXP '[0-9]{2}-[0-9]{3}';

CWICZENIA - 3
1. SELECT imie, nazwisko, YEAR(data_urodzenia) as rok_urodzenia from pracownik;
2. SELECT imie, nazwisko, YEAR(current_date())-YEAR(data_urodzenia) as wiek from pracownik;
3. select dzial.nazwa, count(pracownik.id_pracownika) as ilosc from dzial join pracownik on pracownik.dzial = dzial.id_dzialu group by dzial.nazwa;
4. select kategoria.nazwa_kategori, sum(stan_magazynowy.ilosc) from kategoria join towar on  kategoria.id_kategori=towar.kategoria join stan_magazynowy on towar.id_towaru=stan_magazynowy.towar group by kategoria.nazwa_kategori;
