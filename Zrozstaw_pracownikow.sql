/*Zapytanie wyświetla kto pracuje w poszczegolnym wydziale*/
CREATE VIEW rozstaw_pracownikow AS
SELECT oddzialy_banku.miejscowosc, oddzialy_banku.ulica, oddzialy_banku.kod_pocztowy, pracownicy.Imie, pracownicy.Nazwisko, pracownicy.Plec, pracownicy.Data_urodzenia, 
pracownicy.Data_zatrudnienia, pracownicy.Stanowisko
FROM oddzialy_banku
INNER JOIN pracownicy ON oddzialy_banku.ID_oddzialu = pracownicy.Oddzial;