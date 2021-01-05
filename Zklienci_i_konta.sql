/*Zapytanie wyświetla wszystkich klientów banku i ich konta bankowe*/
CREATE VIEW klienci_i_konta AS
SELECT klienci.ID_Klienta, klienci.Imie, klienci.Nazwisko, klienci.Plec, klienci.Wiek, konta.rodzaj_konta_bankowego, konta.numer_konta_bankowego, konta.data_zawarcia_umowy
FROM klienci
INNER JOIN konta ON klienci.ID_klienta = konta.ID_klienta;