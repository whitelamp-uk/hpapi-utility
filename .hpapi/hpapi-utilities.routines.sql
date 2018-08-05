-- Adminer 4.6.2 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';

DELIMITER $$

DROP PROCEDURE IF EXISTS `hpapiUUID`$$
CREATE PROCEDURE `hpapiUUID`(
  IN        `dateYyyymmdd` CHAR(8) CHARSET ascii
 ,IN        `timeHhmmss` CHAR(6) CHARSET ascii
)
BEGIN
  SELECT
    CONCAT (`dateYyyymmdd`,`timeHhmmss`,'::',UUID()) AS `uuid`
  ;
END$$




DELIMITER ;

