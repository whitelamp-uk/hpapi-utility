-- Adminer 4.6.2 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';

DELIMITER $$

DROP PROCEDURE IF EXISTS `hpapiUUID`$$
CREATE PROCEDURE `hpapiUUID`(
  IN        `dateYyyymmdd` INT(8) UNSIGNED
 ,IN        `timeHhmmss` INT(6) UNSIGNED
)
BEGIN
  SELECT
    CONCAT (`dateYyyymmdd`,`timeHhmmss`,'::',UUID()) AS `uuid`
  ;
END$$




DELIMITER ;

