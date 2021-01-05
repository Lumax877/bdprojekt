/* Procedura do analizy popularnosci na rynku w okreslonym roku */
CREATE DEFINER=`root`@`localhost` PROCEDURE `zainteresowanie w skali roku`(rok varchar(20))
BEGIN

SELECT 
        Data_zawarcia_umowy,
        Rodzaj_konta_bankowego,
        ID_klienta
    FROM
       konta
    WHERE
		YEAR(Data_zawarcia_umowy) = rok;
END