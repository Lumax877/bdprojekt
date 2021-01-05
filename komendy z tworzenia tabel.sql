CREATE DATABASE projekt;

CREATE TABLE Klienci (
ID_Klienta int primary key auto_increment,
Imie varchar(20),
Nazwisko varchar(20),
Plec ENUM('Kobieta','Mezczyzna'),
Wiek INT
);

CREATE TABLE karty_platnicze (
ID_Karty int primary key auto_increment,
Numer_karty bigint UNIQUE,
Rodzaj_karty ENUM('kredytowa','debetowa','przedplacona','wirtualna'),
Wlasciciel INT,
Data_wygasniecia DATE
);

CREATE TABLE Konta (
ID_Konta int primary key auto_increment,
ID_klienta int,
Rodzaj_konta_bankowego ENUM('osobiste','firmowe','oszczednosciowe','mlodziezowe'),
Numer_konta_bankowego bigint UNIQUE,
Data_zawarcia_umowy date,
Przy_pracowniku INT
);

CREATE TABLE Pracownicy (
ID_pracownika int primary key auto_increment,
Imie varchar(20),
Nazwisko varchar(20),
Plec ENUM('Kobieta','Mezczyzna'),
Data_urodzenia date,
Data_zatrudnienia date,
Stanowisko ENUM('doradca_klienta','analityk','audytor','bankowiec'),
Oddzial INT
);

CREATE TABLE Oddzialy_banku (
ID_oddzialu int primary key auto_increment,
Miejscowosc varchar(30),
Ulica varchar(20),
Kod_pocztowy varchar(10)
);

INSERT INTO klienci (imie,nazwisko,plec,wiek)
values 
('stefan','czarnecki','mezczyzna',34),
('michal','jasinski','mezczyzna',39),
('kazimiera','solejuk','kobieta',52),
('damian','gregorczyk','mezczyzna',43),
('katarzyna','czarnecka','kobieta',33),
('wieslawa','obremska','kobieta',39),
('rafal','kowalski','mezczyzna',57),
('karolina','rotuniewicz','kobieta',17),
('przemyslaw','jasinski','mezczyzna',39),
('karol','nowak','mezczyzna',59);

INSERT INTO karty_kredytowe (numer_karty,rodzaj_karty,wlasciciel,data_wygasniecia)
values 
(2137694206661488,'debetowa',10,'2025-04-02'),
(4739751605067397,'debetowa',8,'2025-04-06'),
(3976919932812194,'debetowa',5,'2026-07-08'),
(5511939633222667,'wirtualna',3,'2027-12-21'),
(9263433332466779,'debetowa',1,'2023-08-17'),
(8139384940182936,'debetowa',2,'2029-03-14'),
(3118522065555328,'kredytowa',6,'2024-06-15'),
(7812753369409985,'kredytowa',9,'2025-07-26'),
(9545515215179186,'debetowa',4,'2025-10-30'),
(5980009665716799,'debetowa',7,'2026-01-16');

INSERT INTO konta (ID_klienta, Rodzaj_konta_bankowego, Numer_konta_bankowego, Data_zawarcia_umowy, Przy_pracowniku)
values
(1, 'osobiste', 11188946668186987341534886, '2012-05-17', 14),
(3, 'oszczednosciowe', 91954885819825231019687376, '2001-06-13', 23),
(2, 'osobiste', 70941451172198858549846074, '2004-03-24', 17),
(5, 'osobiste', 57785854339796503659765809, '1999-07-16', 14),
(6, 'osobiste', 73863374644419432843119907, '2010-08-24', 15),
(7, 'firmowe', 21608592812319655423783389, '2012-11-09', 16),
(9, 'oszczednosciowe', 52995999506970882729911565, '2014-10-14', 17),
(10, 'osobiste', 21444196607613079106999289, '2001-05-27', 16),
(4, 'osobiste', 30939098871012259589186627, '2007-12-01', 23),
(8, 'mlodziezowe', 22527274155275973461616780, '2015-04-03', 14);

INSERT INTO  pracownicy (Imie,Nazwisko,Plec,Data_urodzenia,Data_zatrudnienia,Stanowisko,Oddzial)
values 
('Malgorzata','Morawska','Kobieta','1972-07-04','2010-05-03','doradca_klienta',1),
('Karol','Malkiewicz','Mezczyzna','1980-05-17','2008-03-01','doradca_klienta',1),
('Katarzyna','Czerwinska','Kobieta','1989-03-26','2014-09-02','doradca_klienta',2),
('Michal','Karolewski','Mezczyzna','1984-05-14','2001-08-03','doradca_klienta',3),
('Wojciech','Konarzewski','Mezczyzna','1985-09-27','2010-05-04','analityk',1),
('Adrian','Zielewicz','Mezczyzna','1989-11-26','2012-07-13','analityk',1),
('Patryk','Okunda','Mezczyzna','1989-01-25','2008-09-14','analityk',3),
('Michalina','Leonowicz','Kobieta','1987-04-14','2011-04-05','bankowiec',1),
('Leon','Ziemczyk','Mezczyzna','1978-08-13','2010-11-03','bankowiec',2),
('Krystyna','Marukiewicz','Kobieta','1984-05-04','2005-05-07','doradca_klienta',3),
('Szymon','Darwicki','Mezczyzna','1976-12-16','1999-03-02','audytor',1),
('Marta','Raskolnin','Kobieta','1990-07-13','2001-11-02','bankowiec',1),
('Aleksander','Brodowski','Mezczyzna','1986-05-16','2004-07-02','bankowiec',1);

INSERT INTO  oddzialy_banku (miejscowosc,ulica,kod_pocztowy)
values 
('Warszawa','Dzwigowa 12','01-376'),
('Olsztyn','Bociania 17','11-041'),
('Ketrzyn','Wojska Polskiego 22','11-409');

ALTER TABLE Karty_kredytowe
ADD FOREIGN KEY (Wlasciciel)
REFERENCES klienci (ID_klienta);

ALTER TABLE Konta
ADD FOREIGN KEY (ID_klienta)
REFERENCES klienci (ID_klienta);

ALTER TABLE Konta
ADD FOREIGN KEY (Przy_pracowniku)
REFERENCES Pracownicy (ID_pracownika);

ALTER TABLE Pracownicy
ADD FOREIGN KEY (Oddzial)
REFERENCES Oddzialy_banku (ID_oddzialu);

ALTER TABLE `projekt`.`konta` 
DROP FOREIGN KEY `konta_ibfk_2`;
ALTER TABLE `projekt`.`konta` 
ADD CONSTRAINT `konta_ibfk_2`
  FOREIGN KEY (`ID_klienta`)
  REFERENCES `projekt`.`klienci` (`ID_Klienta`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

ALTER TABLE `projekt`.`karty_platnicze` 
DROP FOREIGN KEY `karty_platnicze_ibfk_1`;
ALTER TABLE `projekt`.`karty_platnicze` 
ADD CONSTRAINT `karty_platnicze_ibfk_1`
  FOREIGN KEY (`Wlasciciel`)
  REFERENCES `projekt`.`klienci` (`ID_Klienta`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

ALTER TABLE `projekt`.`konta` 
DROP FOREIGN KEY `konta_ibfk_1`;
ALTER TABLE `projekt`.`konta` 
ADD CONSTRAINT `konta_ibfk_1`
  FOREIGN KEY (`Przy_pracowniku`)
  REFERENCES `projekt`.`pracownicy` (`ID_pracownika`)
  ON DELETE SET NULL
  ON UPDATE RESTRICT;

ALTER TABLE `projekt`.`pracownicy` 
DROP FOREIGN KEY `pracownicy_ibfk_1`;
ALTER TABLE `projekt`.`pracownicy` 
ADD CONSTRAINT `pracownicy_ibfk_1`
  FOREIGN KEY (`Oddzial`)
  REFERENCES `projekt`.`oddzialy_banku` (`ID_oddzialu`)
  ON DELETE SET NULL
  ON UPDATE CASCADE;

