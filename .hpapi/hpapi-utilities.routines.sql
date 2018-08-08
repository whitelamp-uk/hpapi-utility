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

DROP PROCEDURE IF EXISTS `hpapiUsergroups`$$
CREATE PROCEDURE `hpapiUsergroups`(
  IN        `userUUID` CHAR(52) CHARSET ascii
 ,IN        `authenticated` INT(1) UNSIGNED
)
BEGIN
  SELECT
    `usergroup_Usergroup` AS `usergroup`
   ,`usergroup_Name` AS `name` 
   ,`level_Name` AS `securityLevel`
   ,`level_Notes` AS `securityNotes`
  FROM `hpapi_usergroup`
  LEFT JOIN `hpapi_membership`
         ON `membership_Usergroup`=`usergroup_Usergroup`
        AND (
             `membership_Usergroup`='anon'
          OR (
               authenticated>'0'
           AND `membership_User_UUID`=userUUID
          )
        )
  LEFT JOIN `hpapi_level`
         ON `level_Level`=`usergroup_Level`
  WHERE `membership_Usergroup` IS NOT NULL
  ORDER BY `level_Level`
  ;
END$$



DELIMITER ;

