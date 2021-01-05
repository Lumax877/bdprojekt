/* Zapytanie pokazuje id klientow, ktorzy maja wiecej niz jedno konto w banku */ 
CREATE VIEW multi_klienci AS
SELECT DISTINCT ID_klienta 
FROM konta
WHERE ID_klienta IN ( SELECT ID_klienta FROM konta GROUP BY ID_klienta HAVING COUNT(*) > 1);