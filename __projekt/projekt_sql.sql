-- MySQL Script generated by MySQL Workbench
-- Fri Dec 18 18:24:03 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema miksztoa
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema miksztoa
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `miksztoa` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `miksztoa` ;

-- -----------------------------------------------------
-- Table `miksztoa`.`sztab_szkoleniowy`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `miksztoa`.`sztab_szkoleniowy` (
  `id_sztab` INT NOT NULL,
  `trener` VARCHAR(45) NOT NULL,
  `II trener` VARCHAR(45) NULL DEFAULT NULL,
  `trener bramkarzy` VARCHAR(45) NULL DEFAULT NULL,
  `Analityk` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_sztab`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `miksztoa`.`Druzyna`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `miksztoa`.`Druzyna` (
  `id_druzyna` INT NOT NULL AUTO_INCREMENT,
  `nazwa` VARCHAR(45) NULL DEFAULT NULL,
  `kraj` VARCHAR(45) NOT NULL,
  `koszyk` ENUM('1', '2', '3', '4') NOT NULL,
  `id_sztab` INT NOT NULL,
  `grupa` ENUM('A', 'B', 'C', 'D') NOT NULL,
  PRIMARY KEY (`id_druzyna`),
  INDEX `fk_Druzyna_sztab_szkoleniowy1_idx` (`id_sztab` ASC) VISIBLE,
  CONSTRAINT `fk_Druzyna_sztab_szkoleniowy1`
    FOREIGN KEY (`id_sztab`)
    REFERENCES `miksztoa`.`sztab_szkoleniowy` (`id_sztab`))
ENGINE = InnoDB
AUTO_INCREMENT = 17
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `miksztoa`.`Zawodnicy`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `miksztoa`.`Zawodnicy` (
  `id_zawodnicy` INT NOT NULL AUTO_INCREMENT,
  `imie` VARCHAR(45) NOT NULL,
  `nazwisko` VARCHAR(45) NOT NULL,
  `numer` INT NOT NULL,
  `id_druzyna` INT NOT NULL,
  `narodowosc` VARCHAR(45) NOT NULL,
  `Pozycja` ENUM('bramkarz', 'obronca', 'pomocnik', 'napastnik') NOT NULL,
  PRIMARY KEY (`id_zawodnicy`),
  INDEX `fk_Zawodnicy_Druzyna1_idx` (`id_druzyna` ASC) VISIBLE,
  CONSTRAINT `fk_Zawodnicy_Druzyna1`
    FOREIGN KEY (`id_druzyna`)
    REFERENCES `miksztoa`.`Druzyna` (`id_druzyna`))
ENGINE = InnoDB
AUTO_INCREMENT = 65
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `miksztoa`.`sedziowie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `miksztoa`.`sedziowie` (
  `id_sedzia` INT NOT NULL AUTO_INCREMENT,
  `imie` VARCHAR(45) NOT NULL,
  `nazwisko` VARCHAR(45) NOT NULL,
  `narodowosc` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_sedzia`))
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `miksztoa`.`stadion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `miksztoa`.`stadion` (
  `id_stadionu` INT NOT NULL AUTO_INCREMENT,
  `nazwa` VARCHAR(45) NOT NULL,
  `kraj` VARCHAR(45) NOT NULL,
  `pojemnosc` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_stadionu`))
ENGINE = InnoDB
AUTO_INCREMENT = 17
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `miksztoa`.`mecz`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `miksztoa`.`mecz` (
  `id_mecz` INT NOT NULL,
  `data` DATE NULL DEFAULT NULL,
  `druzyna_a` INT NOT NULL,
  `druzyna_b` INT NOT NULL,
  `wynik` VARCHAR(50) NOT NULL,
  `id_sedzia` INT NOT NULL,
  `id_stadionu` INT NOT NULL,
  `etap_rozgrywek` ENUM('grupa', 'cwiercfinal', 'polfinal', 'final') NULL DEFAULT NULL,
  `ilosc_widzow` VARCHAR(250) NULL DEFAULT NULL,
  PRIMARY KEY (`id_mecz`),
  INDEX `druzyna_a` (`druzyna_a` ASC) VISIBLE,
  INDEX `druzyna_b` (`druzyna_b` ASC) VISIBLE,
  INDEX `id_sedzia` (`id_sedzia` ASC) VISIBLE,
  INDEX `id_stadionu` (`id_stadionu` ASC) VISIBLE,
  CONSTRAINT `mecz_ibfk_1`
    FOREIGN KEY (`druzyna_a`)
    REFERENCES `miksztoa`.`Druzyna` (`id_druzyna`),
  CONSTRAINT `mecz_ibfk_2`
    FOREIGN KEY (`druzyna_b`)
    REFERENCES `miksztoa`.`Druzyna` (`id_druzyna`),
  CONSTRAINT `mecz_ibfk_3`
    FOREIGN KEY (`id_sedzia`)
    REFERENCES `miksztoa`.`sedziowie` (`id_sedzia`),
  CONSTRAINT `mecz_ibfk_4`
    FOREIGN KEY (`id_stadionu`)
    REFERENCES `miksztoa`.`stadion` (`id_stadionu`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `miksztoa`.`gole`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `miksztoa`.`gole` (
  `id_gol` INT NOT NULL,
  `id_mecz` INT NULL DEFAULT NULL,
  `id_druzyna` INT NULL DEFAULT NULL,
  `id_zawodnicy` INT NULL DEFAULT NULL,
  `typ` ENUM('z gry', 'karny', 'rzut wolny') NULL DEFAULT NULL,
  `notka` VARCHAR(254) NULL DEFAULT NULL,
  PRIMARY KEY (`id_gol`),
  INDEX `id_druzyna` (`id_druzyna` ASC) VISIBLE,
  INDEX `id_zawodnicy` (`id_zawodnicy` ASC) VISIBLE,
  INDEX `id_mecz` (`id_mecz` ASC) VISIBLE,
  CONSTRAINT `gole_ibfk_1`
    FOREIGN KEY (`id_druzyna`)
    REFERENCES `miksztoa`.`Druzyna` (`id_druzyna`),
  CONSTRAINT `gole_ibfk_2`
    FOREIGN KEY (`id_zawodnicy`)
    REFERENCES `miksztoa`.`Zawodnicy` (`id_zawodnicy`),
  CONSTRAINT `gole_ibfk_3`
    FOREIGN KEY (`id_mecz`)
    REFERENCES `miksztoa`.`mecz` (`id_mecz`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `miksztoa`.`starzyZawodnicy`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `miksztoa`.`starzyZawodnicy` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_zawodnicy` INT NOT NULL,
  `imie` VARCHAR(45) NOT NULL,
  `nazwisko` VARCHAR(45) NOT NULL,
  `id_druzyna` INT NOT NULL,
  `narodowosc` VARCHAR(45) NOT NULL,
  `Pozycja` ENUM('napastnik', 'bramkarz', 'obronca', 'pomocnik') NOT NULL,
  `data_zmiany` DATETIME NULL DEFAULT NULL,
  `akcja` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `miksztoa` ;

-- -----------------------------------------------------
-- function ilosc_goli
-- -----------------------------------------------------

DELIMITER $$
USE `miksztoa`$$
CREATE DEFINER=`miksztoa`@`localhost` FUNCTION `ilosc_goli`() RETURNS int
BEGIN
    DECLARE ile INT;
    SELECT COUNT(*) INTO @ile FROM gole;
    RETURN @ile;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure mecz
-- -----------------------------------------------------

DELIMITER $$
USE `miksztoa`$$
CREATE DEFINER=`miksztoa`@`localhost` PROCEDURE `mecz`(IN id int)
select mecz.etap_rozgrywek ,mecz.id_mecz, d.nazwa as Druzyna_A, mecz.wynik as wynik,  w.nazwa as Druzyna_B, mecz.data, t1.trener as trener_A, t2.trener as trener_B, concat(sedziowie.imie,' ',sedziowie.nazwisko) as sedzia, stadion.nazwa as stadion from mecz join Druzyna d on mecz.druzyna_a=d.id_druzyna join Druzyna w on mecz.druzyna_b=w.id_druzyna join sztab_szkoleniowy t1 on d.id_sztab=t1.id_sztab join sztab_szkoleniowy t2 on w.id_sztab=t2.id_sztab join sedziowie on mecz.id_sedzia=sedziowie.id_sedzia join stadion on mecz.id_stadionu=stadion.id_stadionu
 where mecz.id_mecz = id;$$

DELIMITER ;
USE `miksztoa`;

DELIMITER $$
USE `miksztoa`$$
CREATE
DEFINER=`miksztoa`@`localhost`
TRIGGER `miksztoa`.`zmiany`
BEFORE UPDATE ON `miksztoa`.`Zawodnicy`
FOR EACH ROW
INSERT INTO starzyZawodnicy
 SET akcja = 'update',
id_zawodnicy = old.id_zawodnicy,
imie = old.imie,
nazwisko = old.nazwisko,
id_druzyna = old.id_druzyna,
narodowosc = old.narodowosc,
pozycja = old.pozycja,
data_zmiany = NOW()$$

USE `miksztoa`$$
CREATE
DEFINER=`miksztoa`@`localhost`
TRIGGER `miksztoa`.`pandemia`
BEFORE INSERT ON `miksztoa`.`mecz`
FOR EACH ROW
BEGIN
  IF NEW.data > 2020-07-29
  THEN
    SET NEW.ilosc_widzow ='Brak widzow z powodu pandemii';
  END IF;
END$$


DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;