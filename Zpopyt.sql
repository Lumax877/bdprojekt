/* Zapytanie wyswietla ile umow zostalo podpisanych w poszczegolnym oddziale*/
CREATE VIEW popyt AS
SELECT Oddzial, COUNT(Rodzaj_konta_bankowego) AS 'Ilosc kont'
FROM projekt.podpisane_umowy
GROUP BY Oddzial
ORDER BY COUNT(Rodzaj_konta_bankowego) DESC;