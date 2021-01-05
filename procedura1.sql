/* Procedura stosowana do przedłużenia ważności kart debetowych na zyczenie klienta */
CREATE DEFINER=`root`@`localhost` PROCEDURE `odnowienie karty`(liczba INTEGER)
BEGIN
UPDATE karty_platnicze
SET Data_wygasniecia = DATE_ADD(Data_wygasniecia, INTERVAL 15 YEAR)
WHERE Wlasciciel = liczba;
END