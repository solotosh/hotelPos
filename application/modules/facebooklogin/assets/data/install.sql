INSERT INTO `language` (`id`, `phrase`, `english`) VALUES (NULL, 'facebooklogin', 'Facebook Login'),(NULL, 'add_facebook_app', 'Facebook Setting'),(NULL, 'api_key', 'Api Key'),(NULL, 'secret_key', 'Secret Key'),(NULL, 'facebook_api', 'Facebook Api'),(NULL, 'facebook_login', 'Facebook Login');
ALTER TABLE `customer_info` ADD `facebook_id` varchar(100) NULL DEFAULT NULL  AFTER `cuntomer_no`;
INSERT INTO `sec_menu_item` (`menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES ('add_facebook_app', 'facebookloginback', 'facebooklogin', '0', '0', '3', '2020-12-03 00:00:00');
INSERT INTO `sec_menu_item` (`menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) SELECT 'facebook_api', 'showsetting', 'facebooklogin', sec_menu_item.menu_id, '0', '3', '2020-12-03 00:00:00' FROM sec_menu_item WHERE sec_menu_item.menu_title = 'add_facebook_app';