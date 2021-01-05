/* Trigger automatycznie wstawia dzisiejszą datę przy rejestracji nowego pracownika */
CREATE DEFINER=`root`@`localhost` TRIGGER `pracownicy_BEFORE_INSERT` BEFORE INSERT ON `pracownicy` FOR EACH ROW BEGIN

SET NEW.Data_zatrudnienia = now();

END