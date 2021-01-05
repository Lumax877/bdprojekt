/*Zapytanie pokazuje pracownika z najdluzszym stazem w banku*/
CREATE VIEW najwierniejszy_pracownik AS
SELECT Oddzial, Data_zatrudnienia, Imie, Nazwisko, Stanowisko
FROM pracownicy
WHERE Data_zatrudnienia = (SELECT MIN(Data_zatrudnienia) FROM pracownicy);