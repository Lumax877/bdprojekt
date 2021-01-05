/*Trigger po dodaniu nowego klienta dodaje dla niego kolumny w tabelach 'karty_platnicze' i 'konta' jako swego rodzaju "przypomnienie" o pózniejszym wypełnieniu tych miejsc */
CREATE DEFINER=`root`@`localhost` TRIGGER `klienci_AFTER_INSERT` AFTER INSERT ON `klienci` FOR EACH ROW BEGIN

INSERT INTO karty_platnicze SET Wlasciciel = NEW.ID_klienta;
INSERT INTO konta SET ID_klienta = NEW.ID_klienta;
END