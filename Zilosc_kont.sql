/*Zapytanie wyświetla ile poszczegolnych kont jest zalozonych w banku*/
CREATE VIEW ilosc_kont AS
SELECT COUNT(rodzaj_konta_bankowego) AS 'Liczba kont', Rodzaj_konta_bankowego AS 'Rodzaj konta'
FROM konta
GROUP BY rodzaj_konta_bankowego;