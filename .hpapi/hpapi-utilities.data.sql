
SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

INSERT IGNORE INTO `hpapi_call` (`call_Model`, `call_Spr`, `call_Vendor`, `call_Package`, `call_Class`, `call_Method`) VALUES
('HpapiModel',	'hpapiMethodargs',	'whitelamp-uk',	'hpapi-utility',	'\\Hpapi\\Utility',	'describeMethod'),
('HpapiModel',	'hpapiMethods',	'whitelamp-uk',	'hpapi-utility',	'\\Hpapi\\Utility',	'methods'),
('HpapiModel',	'hpapiUsergroups',	'whitelamp-uk',	'hpapi-utility',	'\\Hpapi\\Utility',	'usergroups'),
('HpapiModel',	'hpapiUUID',	'whitelamp-uk',	'hpapi-utility',	'\\Hpapi\\Utility',	'uuid');

INSERT IGNORE INTO `hpapi_method` (`method_Vendor`, `method_Package`, `method_Class`, `method_Method`, `method_Label`, `method_Notes`) VALUES
('whitelamp-uk',	'hpapi-utility',	'\\Hpapi\\Utility',	'describeMethod',	'Method description',	'Method, argument and validation details'),
('whitelamp-uk',	'hpapi-utility',	'\\Hpapi\\Utility',	'methods',	'My methods',	'Methods available to the current user.'),
('whitelamp-uk',	'hpapi-utility',	'\\Hpapi\\Utility',	'usergroups',	'My user groups',	'User groups for the current user.'),
('whitelamp-uk',	'hpapi-utility',	'\\Hpapi\\Utility',	'uuid',	'Get UUID',	'Hpapi default UUID generating method.');

INSERT IGNORE INTO `hpapi_methodarg` (`methodarg_Vendor`, `methodarg_Package`, `methodarg_Class`, `methodarg_Method`, `methodarg_Argument`, `methodarg_Name`, `methodarg_Empty_Allowed`, `methodarg_Pattern`) VALUES
('whitelamp-uk',	'hpapi-utility',	'\\Hpapi\\Utility',	'describeMethod',	1,	'Vendor',	0,	'vendor'),
('whitelamp-uk',	'hpapi-utility',	'\\Hpapi\\Utility',	'describeMethod',	2,	'Package',	0,	'package'),
('whitelamp-uk',	'hpapi-utility',	'\\Hpapi\\Utility',	'describeMethod',	3,	'Class',	0,	'class'),
('whitelamp-uk',	'hpapi-utility',	'\\Hpapi\\Utility',	'describeMethod',	4,	'Method',	0,	'method'),
('whitelamp-uk',	'hpapi-utility',	'\\Hpapi\\Utility',	'uuid',	1,	'Date (yyyymmdd)',	1,	'yyyymmdd'),
('whitelamp-uk',	'hpapi-utility',	'\\Hpapi\\Utility',	'uuid',	2,	'Time (hhmmss)',	1,	'hhmmss');

INSERT IGNORE INTO `hpapi_sprarg` (`sprarg_Model`, `sprarg_Spr`, `sprarg_Argument`, `sprarg_Name`, `sprarg_Empty_Allowed`, `sprarg_Pattern`) VALUES
('HpapiModel',	'hpapiMethodargs',	1,	'API key',	0,	'uuid-hpapi'),
('HpapiModel',	'hpapiMethodargs',	2,	'Email',	1,	'email'),
('HpapiModel',	'hpapiMethodargs',	3,	'Vendor',	0,	'vendor'),
('HpapiModel',	'hpapiMethodargs',	4,	'Package',	0,	'package'),
('HpapiModel',	'hpapiMethodargs',	5,	'Class',	0,	'class'),
('HpapiModel',	'hpapiMethodargs',	6,	'Method',	0,	'method'),
('HpapiModel',	'hpapiMethods',	1,	'User UUID',	0,	'uuid-hpapi'),
('HpapiModel',	'hpapiMethods',	2,	'Fully authenticated?',	0,	'db-boolean'),
('HpapiModel',	'hpapiUsergroups',	1,	'User UUID',	0,	'uuid-hpapi'),
('HpapiModel',	'hpapiUsergroups',	2,	'Fully authenticated?',	0,	'db-boolean'),
('HpapiModel',	'hpapiUUID',	1,	'Date (yyyymmdd)',	0,	'yyyymmdd'),
('HpapiModel',	'hpapiUUID',	2,	'Time (hhmmss)',	0,	'hhmmss');

INSERT IGNORE INTO `hpapi_run` (`run_Usergroup`, `run_Vendor`, `run_Package`, `run_Class`, `run_Method`) VALUES
('anon',	'whitelamp-uk',	'hpapi-utility',	'\\Hpapi\\Utility',	'describeMethod'),
('anon',	'whitelamp-uk',	'hpapi-utility',	'\\Hpapi\\Utility',	'methods'),
('anon',	'whitelamp-uk',	'hpapi-utility',	'\\Hpapi\\Utility',	'usergroups'),
('anon',	'whitelamp-uk',	'hpapi-utility',	'\\Hpapi\\Utility',	'uuid');

INSERT IGNORE INTO `hpapi_spr` (`spr_Model`, `spr_Spr`, `spr_Notes`) VALUES
('HpapiModel',	'hpapiMethodargs',	'Used by \\Hpapi\\Hpapi::authenticate() on every request but registered here because it is also deployed by \\Hpapi\\Utility::describeMethod()'),
('HpapiModel',	'hpapiMethods',	'List of methods for a user UUID (authenticated or not).'),
('HpapiModel',	'hpapiSprargs',	'List of stored procedure arguments for a given method.'),
('HpapiModel',	'hpapiUsergroups',	'Usergroups for a user UUID.'),
('HpapiModel',	'hpapiUUID',	'Return UUID based on YYMMDD, HHMMSS and UUID v4.');

