/*Zapytanie wyświetla wszystkich klientów banku razem z ich kartami platniczymi*/
CREATE VIEW klienci_i_karty AS
SELECT klienci.ID_Klienta, klienci.Imie, klienci.Nazwisko, klienci.Plec, karty_platnicze.numer_karty, karty_platnicze.rodzaj_karty, karty_platnicze.Data_wygasniecia
FROM klienci
INNER JOIN karty_platnicze ON klienci.ID_klienta = karty_platnicze.Wlasciciel;



