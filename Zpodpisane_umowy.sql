/*Zapytanie wyświetla przy których zawarciach umowy poszczególny doradca klienta był obecny*/
CREATE VIEW podpisane_umowy AS
SELECT pracownicy.Imie, pracownicy.nazwisko, pracownicy.Plec, pracownicy.Data_zatrudnienia, pracownicy.Oddzial, konta.ID_klienta, konta.Rodzaj_konta_bankowego, 
konta.Numer_konta_bankowego, konta.Data_zawarcia_umowy
FROM pracownicy
INNER JOIN konta ON pracownicy.ID_pracownika = konta.Przy_pracowniku
ORDER BY Imie DESC;