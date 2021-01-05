/* Zapytanie wyswietla konta oszczednosciowe, ktore sa objete premia procentowa */
CREATE VIEW program_oszczednosciowy_przyszly_senior AS
SELECT ID_klienta, Imie, Nazwisko, rodzaj_konta_bankowego, numer_konta_bankowego
FROM projekt.klienci_i_konta
WHERE rodzaj_konta_bankowego='oszczednosciowe' AND ID_klienta IN (SELECT ID_klienta
FROM klienci
WHERE wiek > 50);