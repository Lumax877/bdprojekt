/*Zapytanie wyświetla ile poszczegolnych osób piastuje okreslona funkcje*/
CREATE VIEW kadra_pracownikow AS
SELECT Stanowisko, COUNT(Stanowisko) AS 'Liczba pracownikow'
FROM pracownicy
GROUP BY Stanowisko;