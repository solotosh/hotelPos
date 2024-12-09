SET sql_mode = '';
--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `about` text,
  `waiter_kitchenToken` text,
  `email` varchar(100) NOT NULL,
  `password` varchar(32) NOT NULL,
  `password_reset_token` varchar(20) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_logout` datetime DEFAULT NULL,
  `ip_address` varchar(14) DEFAULT NULL,
  `counter` int DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `is_admin` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=179 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `firstname`, `lastname`, `about`, `waiter_kitchenToken`, `email`, `password`, `password_reset_token`, `image`, `last_login`, `last_logout`, `ip_address`, `counter`, `status`, `is_admin`) VALUES(2, 'John', 'Doe', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum', '', 'admin@example.com', '827ccb0eea8a706c4c34a16891f84e7b', '', './assets/img/user/m2.png', '2023-07-03 14:37:58', '2021-11-07 16:02:03', '::1', NULL, 1, 1);
INSERT INTO `user` (`id`, `firstname`, `lastname`, `about`, `waiter_kitchenToken`, `email`, `password`, `password_reset_token`, `image`, `last_login`, `last_logout`, `ip_address`, `counter`, `status`, `is_admin`) VALUES(165, 'Hm', 'Isahaq', NULL, NULL, 'hmisahaq@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0);
INSERT INTO `user` (`id`, `firstname`, `lastname`, `about`, `waiter_kitchenToken`, `email`, `password`, `password_reset_token`, `image`, `last_login`, `last_logout`, `ip_address`, `counter`, `status`, `is_admin`) VALUES(166, 'Ainal', 'Haque', NULL, NULL, 'ainal@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '2020-12-17 12:30:42', '2020-12-17 12:30:31', '::1', NULL, 1, 0);
INSERT INTO `user` (`id`, `firstname`, `lastname`, `about`, `waiter_kitchenToken`, `email`, `password`, `password_reset_token`, `image`, `last_login`, `last_logout`, `ip_address`, `counter`, `status`, `is_admin`) VALUES(168, 'Manik ', 'Hassan', NULL, NULL, 'manik@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0);
INSERT INTO `user` (`id`, `firstname`, `lastname`, `about`, `waiter_kitchenToken`, `email`, `password`, `password_reset_token`, `image`, `last_login`, `last_logout`, `ip_address`, `counter`, `status`, `is_admin`) VALUES(177, 'Di', 'Maria', NULL, NULL, 'dimaria@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `accesslog`
--

DROP TABLE IF EXISTS `accesslog`;
CREATE TABLE IF NOT EXISTS `accesslog` (
  `sl_no` bigint NOT NULL AUTO_INCREMENT,
  `action_page` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `action_done` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `remarks` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `entry_date` datetime DEFAULT NULL,
  PRIMARY KEY (`sl_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `acc_account_name`
--

DROP TABLE IF EXISTS `acc_account_name`;
CREATE TABLE IF NOT EXISTS `acc_account_name` (
  `account_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `account_name` varchar(255) NOT NULL,
  `account_type` int NOT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `acc_coa`
--

DROP TABLE IF EXISTS `acc_coa`;
CREATE TABLE IF NOT EXISTS `acc_coa` (
  `HeadCode` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `HeadName` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `PHeadName` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `HeadLevel` int NOT NULL,
  `IsActive` tinyint(1) NOT NULL,
  `IsTransaction` tinyint(1) NOT NULL,
  `IsGL` tinyint(1) NOT NULL,
  `HeadType` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `IsBudget` tinyint(1) NOT NULL,
  `IsDepreciation` tinyint(1) NOT NULL,
  `DepreciationRate` decimal(18,2) NOT NULL,
  `CreateBy` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `CreateDate` datetime NOT NULL,
  `UpdateBy` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `UpdateDate` datetime NOT NULL,
  PRIMARY KEY (`HeadName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `acc_coa`
--

INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('502020000001', '145454-HmIsahaq', 'Account Payable', 2, 1, 1, 0, 'L', 0, 0, 0.00, 'John Doe', '2018-12-17 15:10:19', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('4021403', 'AC', 'Repair and Maintenance', 3, 1, 1, 0, 'E', 0, 0, 0.00, 'admin', '2015-10-15 19:33:55', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('50202', 'Account Payable', 'Current Liabilities', 2, 1, 0, 1, 'L', 0, 0, 0.00, 'admin', '2015-10-15 19:50:43', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('10203', 'Account Receivable', 'Current Asset', 2, 1, 0, 0, 'A', 0, 0, 0.00, '', '0000-00-00 00:00:00', 'admin', '2013-09-18 15:29:35');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('1020201', 'Advance', 'Advance, Deposit And Pre-payments', 3, 1, 0, 1, 'A', 0, 0, 0.00, 'Zoherul', '2015-05-31 13:29:12', 'admin', '2015-12-31 16:46:32');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('102020103', 'Advance House Rent', 'Advance', 4, 1, 1, 0, 'A', 0, 0, 0.00, 'admin', '2016-10-02 16:55:38', 'admin', '2016-10-02 16:57:32');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('10202', 'Advance, Deposit And Pre-payments', 'Current Asset', 2, 1, 0, 0, 'A', 0, 0, 0.00, '', '0000-00-00 00:00:00', 'admin', '2015-12-31 16:46:24');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('4020602', 'Advertisement and Publicity', 'Promonational Expence', 3, 1, 1, 0, 'E', 0, 0, 0.00, 'admin', '2015-10-15 18:51:44', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('1010410', 'Air Cooler', 'Others Assets', 3, 1, 1, 0, 'A', 0, 0, 0.00, 'admin', '2016-05-23 12:13:55', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('4020603', 'AIT Against Advertisement', 'Promonational Expence', 3, 1, 1, 0, 'E', 0, 0, 0.00, 'admin', '2015-10-15 18:52:09', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('1', 'Assets', 'COA', 0, 1, 0, 0, 'A', 0, 0, 0.00, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('1010204', 'Attendance Machine', 'Office Equipment', 3, 1, 1, 0, 'A', 0, 0, 0.00, 'admin', '2015-10-15 15:49:31', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('40216', 'Audit Fee', 'Other Expenses', 2, 1, 1, 1, 'E', 0, 0, 0.00, 'admin', '2017-07-18 12:54:30', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('4021002', 'Bank Charge', 'Financial Expenses', 3, 1, 1, 0, 'E', 0, 0, 0.00, 'admin', '2015-10-15 19:21:03', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('30203', 'Bank Interest', 'Other Income', 2, 1, 1, 1, 'I', 0, 0, 0.00, 'Obaidul', '2015-01-03 14:49:54', 'admin', '2016-09-25 11:04:19');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('1010104', 'Book Shelf', 'Furniture & Fixturers', 3, 1, 1, 0, 'A', 0, 0, 0.00, 'admin', '2015-10-15 15:46:11', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('1010407', 'Books and Journal', 'Others Assets', 3, 1, 1, 0, 'A', 0, 0, 0.00, 'admin', '2016-03-27 10:45:37', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('102010207', 'Brac Bank', 'Cash At Bank', 4, 1, 1, 0, 'A', 0, 0, 0.00, '2', '2020-01-18 10:10:31', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('4020604', 'Business Development Expenses', 'Promonational Expence', 3, 1, 1, 0, 'E', 0, 0, 0.00, 'admin', '2015-10-15 18:52:29', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('4020606', 'Campaign Expenses', 'Promonational Expence', 3, 1, 1, 0, 'E', 0, 0, 0.00, 'admin', '2015-10-15 18:52:57', 'admin', '2016-09-19 14:52:48');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('4020502', 'Campus Rent', 'House Rent', 3, 1, 1, 0, 'E', 0, 0, 0.00, 'admin', '2015-10-15 18:46:53', 'admin', '2017-04-27 17:02:39');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('40212', 'Car Running Expenses', 'Other Expenses', 2, 1, 0, 1, 'E', 0, 0, 0.00, 'admin', '2015-10-15 19:28:43', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('10201', 'Cash & Cash Equivalent', 'Current Asset', 2, 1, 0, 1, 'A', 0, 0, 0.00, '', '0000-00-00 00:00:00', 'admin', '2015-10-15 15:57:55');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('1020102', 'Cash At Bank', 'Cash & Cash Equivalent', 3, 1, 0, 0, 'A', 0, 0, 0.00, '2', '2018-07-19 13:43:59', 'admin', '2015-10-15 15:32:42');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('1020101', 'Cash In Hand', 'Cash & Cash Equivalent', 3, 1, 1, 1, 'A', 0, 0, 0.00, '2', '2018-07-31 12:56:28', 'admin', '2016-05-23 12:05:43');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('30101', 'Cash Sale', 'Store Income', 1, 1, 1, 1, 'I', 0, 0, 0.00, '2', '2018-07-08 07:51:26', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('1010207', 'CCTV', 'Office Equipment', 3, 1, 1, 0, 'A', 0, 0, 0.00, 'admin', '2015-10-15 15:51:24', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('102020102', 'CEO Current A/C', 'Advance', 4, 1, 1, 0, 'A', 0, 0, 0.00, 'admin', '2016-09-25 11:54:54', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('102010206', 'City Bank', 'Cash At Bank', 4, 1, 1, 0, 'A', 0, 0, 0.00, '2', '2020-01-18 10:09:32', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('1010101', 'Class Room Chair', 'Furniture & Fixturers', 3, 1, 1, 0, 'A', 0, 0, 0.00, 'admin', '2015-10-15 15:45:29', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('4021407', 'Close Circuit Cemera', 'Repair and Maintenance', 3, 1, 1, 0, 'E', 0, 0, 0.00, 'admin', '2015-10-15 19:35:35', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('4020601', 'Commision on Admission', 'Promonational Expence', 3, 1, 1, 0, 'E', 0, 0, 0.00, 'admin', '2015-10-15 18:51:21', 'admin', '2016-09-19 14:42:54');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('1010206', 'Computer', 'Office Equipment', 3, 1, 1, 0, 'A', 0, 0, 0.00, 'admin', '2015-10-15 15:51:09', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('4021410', 'Computer (R)', 'Repair and Maintenance', 3, 1, 1, 0, 'E', 0, 0, 0.00, 'Zoherul', '2016-03-24 12:38:52', 'Zoherul', '2016-03-24 12:41:40');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('1010102', 'Computer Table', 'Furniture & Fixturers', 3, 1, 1, 0, 'A', 0, 0, 0.00, 'admin', '2015-10-15 15:45:44', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('301020401', 'Continuing Registration fee - UoL (Income)', 'Registration Fee (UOL) Income', 4, 1, 1, 0, 'I', 0, 0, 0.00, 'admin', '2015-10-15 17:40:40', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('4020904', 'Contratuall Staff Salary', 'Salary & Allowances', 3, 1, 1, 0, 'E', 0, 0, 0.00, 'admin', '2015-10-15 19:12:34', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('403', 'Cost of Sale', 'Expence', 0, 1, 1, 0, 'E', 0, 0, 0.00, '2', '2018-07-08 10:37:16', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('30102', 'Credit Sale', 'Store Income', 1, 1, 1, 1, 'I', 0, 0, 0.00, '2', '2018-07-08 07:51:34', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('4020709', 'Cultural Expense', 'Miscellaneous Expenses', 3, 1, 1, 0, 'E', 0, 0, 0.00, 'nasmud', '2017-04-29 12:45:10', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('102', 'Current Asset', 'Assets', 1, 1, 0, 0, 'A', 0, 0, 0.00, '2', '2018-12-06 13:54:42', 'admin', '2018-07-07 11:23:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('502', 'Current Liabilities', 'Liabilities', 1, 1, 0, 0, 'L', 0, 0, 0.00, 'anwarul', '2014-08-30 13:18:20', 'admin', '2015-10-15 19:49:21');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('102030101', 'cusL-0001-Walkin', 'Customer Receivable', 4, 1, 1, 0, 'A', 0, 0, 0.00, '2', '2019-01-08 09:14:48', '', '2020-11-17 11:41:07');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('102030108', 'cusL-0002-Jamil', 'Customer Receivable', 4, 1, 1, 0, 'A', 0, 0, 0.00, '2', '2021-08-25 14:12:02', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('102030109', 'cusL-0004-Kabir khan', 'Customer Receivable', 4, 1, 1, 0, 'A', 0, 0, 0.00, '36', '2021-08-31 14:03:18', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('102030115', 'cusL-0005-jaman', 'Customer Receivable', 4, 1, 1, 0, 'A', 0, 0, 0.00, '53', '2023-07-03 15:50:20', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('102030110', 'cusL-0007-jamil', 'Customer Receivable', 4, 1, 1, 0, 'A', 0, 0, 0.00, '39', '2021-09-05 19:38:26', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('102030111', 'cusL-0008-kamal', 'Customer Receivable', 4, 1, 1, 0, 'A', 0, 0, 0.00, '40', '2021-09-19 11:53:13', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('102030112', 'cusL-0009-shakil', 'Customer Receivable', 4, 1, 1, 0, 'A', 0, 0, 0.00, '41', '2021-10-26 10:20:44', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('102030113', 'cusL-0010-shakil', 'Customer Receivable', 4, 1, 1, 0, 'A', 0, 0, 0.00, '42', '2021-10-26 10:23:52', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('102030104', 'cusL-0018-jamildasd', 'Customer Receivable', 4, 1, 1, 0, 'A', 0, 0, 0.00, '20', '2021-01-05 14:14:11', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('102030114', 'cusL-0019- ', 'Customer Receivable', 4, 1, 1, 0, 'A', 0, 0, 0.00, '0', '2021-11-10 14:06:32', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('102030105', 'cusL-0021-jamil', 'Customer Receivable', 4, 1, 1, 0, 'A', 0, 0, 0.00, '25', '2021-01-31 14:17:07', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('102030106', 'cusL-0022-Saiful Hassan', 'Customer Receivable', 4, 1, 1, 0, 'A', 0, 0, 0.00, '26', '2021-01-31 18:18:33', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('102030107', 'cusL-0023-jamil', 'Customer Receivable', 4, 1, 1, 0, 'A', 0, 0, 0.00, '27', '2021-02-03 10:12:50', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('1020301', 'Customer Receivable', 'Account Receivable', 3, 1, 0, 1, 'A', 0, 0, 0.00, '2', '2019-01-08 09:15:08', 'admin', '2018-07-07 12:31:42');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('40100002', 'cw-Chichawatni', 'Store Expenses', 2, 1, 1, 0, 'E', 0, 0, 0.00, '2', '2018-08-02 16:30:41', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('1020202', 'Deposit', 'Advance, Deposit And Pre-payments', 3, 1, 0, 0, 'A', 0, 0, 0.00, 'admin', '2015-10-15 15:40:42', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('4020605', 'Design & Printing Expense', 'Promonational Expence', 3, 1, 1, 0, 'E', 0, 0, 0.00, 'admin', '2015-10-15 18:55:00', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('4020404', 'Dish Bill', 'Utility Expenses', 3, 1, 1, 0, 'E', 0, 0, 0.00, 'admin', '2015-10-15 18:58:21', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('40215', 'Dividend', 'Other Expenses', 2, 1, 1, 1, 'E', 0, 0, 0.00, 'admin', '2016-09-25 14:07:55', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('4020403', 'Drinking Water Bill', 'Utility Expenses', 3, 1, 1, 0, 'E', 0, 0, 0.00, 'admin', '2015-10-15 18:58:10', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('1010211', 'DSLR Camera', 'Office Equipment', 3, 1, 1, 0, 'A', 0, 0, 0.00, 'admin', '2015-10-15 15:53:17', 'admin', '2016-01-02 16:23:25');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('102010205', 'Dutch-Bangla Bank', 'Cash At Bank', 4, 1, 1, 0, 'A', 0, 0, 0.00, '2', '2020-01-18 09:49:13', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('502020000007', 'E3Y1WJMB-John Maria', 'Account Payable', 2, 1, 1, 0, 'L', 0, 0, 0.00, 'John Doe', '2019-01-27 05:55:58', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('502020000010', 'E4Y91CAX-onlineorder', 'Account Payable', 2, 1, 1, 0, 'L', 0, 0, 0.00, 'John Doe', '2019-02-03 11:20:44', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('502020000004', 'E97E9SJT-Manik Hassan', 'Account Payable', 2, 1, 1, 0, 'L', 0, 0, 0.00, 'John Doe', '2019-01-09 14:32:22', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('4020908', 'Earned Leave', 'Salary & Allowances', 3, 1, 1, 0, 'E', 0, 0, 0.00, 'admin', '2015-10-15 19:13:38', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('502020000006', 'EBK2UPRA-John Carlos', 'Account Payable', 2, 1, 1, 0, 'L', 0, 0, 0.00, 'John Doe', '2019-01-27 05:51:09', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('4020607', 'Education Fair Expenses', 'Promonational Expence', 3, 1, 1, 0, 'E', 0, 0, 0.00, 'admin', '2015-10-15 18:53:42', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('502020000011', 'EK9BYZVY-test sdafdssdfds', 'Account Payable', 2, 1, 1, 0, 'L', 0, 0, 0.00, 'John Doe', '2019-02-24 14:07:53', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('1010602', 'Electric Equipment', 'Electrical Equipment', 3, 1, 1, 0, 'A', 0, 0, 0.00, 'admin', '2016-03-27 10:44:51', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('1010203', 'Electric Kettle', 'Office Equipment', 3, 1, 1, 0, 'A', 0, 0, 0.00, 'admin', '2015-10-15 15:49:07', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('10106', 'Electrical Equipment', 'Non Current Assets', 2, 1, 0, 1, 'A', 0, 0, 0.00, 'admin', '2016-03-27 10:43:44', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('4020407', 'Electricity Bill', 'Utility Expenses', 3, 1, 1, 0, 'E', 0, 0, 0.00, 'admin', '2015-10-15 18:59:31', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('10202010501', 'employ', 'Salary', 5, 1, 0, 0, 'A', 0, 0, 0.00, 'admin', '2018-07-05 11:47:10', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('405', 'Entertainment', 'Expense', 1, 1, 1, 0, 'E', 1, 1, 1.00, '2', '2020-01-18 07:49:00', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('502020000012', 'ENVBUZKE-kabirkhan', 'Account Payable', 2, 1, 1, 0, 'L', 0, 0, 0.00, 'John Doe', '2020-10-12 10:57:33', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('502020000002', 'EQLAJFUW-AinalHaque', 'Account Payable', 2, 1, 1, 0, 'L', 0, 0, 0.00, 'John Doe', '2018-12-17 15:08:43', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('2', 'Equity', 'COA', 0, 1, 0, 0, 'L', 0, 0, 0.00, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('502020000009', 'EU3APTYY-JohnDoe', 'Account Payable', 2, 1, 1, 0, 'L', 0, 0, 0.00, 'John Doe', '2019-01-27 06:02:46', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('502020000005', 'EW9PM201-test emp', 'Account Payable', 2, 1, 1, 0, 'L', 0, 0, 0.00, 'John Doe', '2019-01-09 14:38:15', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('502020000008', 'EXL9WSCL-Mitchel Santner', 'Account Payable', 2, 1, 1, 0, 'L', 0, 0, 0.00, 'John Doe', '2019-01-27 05:58:55', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('4', 'Expense', 'COA', 0, 1, 0, 0, 'E', 0, 0, 0.00, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('502020000003', 'EY2T1OWA-jahangirAhmad', 'Account Payable', 2, 1, 1, 0, 'L', 0, 0, 0.00, 'John Doe', '2018-12-17 15:11:13', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('502020000013', 'EZR0A9IB-DiMaria', 'Account Payable', 2, 1, 1, 0, 'L', 0, 0, 0.00, 'John Doe', '2021-11-14 10:54:22', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('4020903', 'Faculty,Staff Salary & Allowances', 'Salary & Allowances', 3, 1, 1, 0, 'E', 0, 0, 0.00, 'admin', '2015-10-15 19:12:21', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('4021404', 'Fax Machine', 'Repair and Maintenance', 3, 1, 1, 0, 'E', 0, 0, 0.00, 'admin', '2015-10-15 19:34:15', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('4020905', 'Festival & Incentive Bonus', 'Salary & Allowances', 3, 1, 1, 0, 'E', 0, 0, 0.00, 'admin', '2015-10-15 19:12:48', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('1010103', 'File Cabinet', 'Furniture & Fixturers', 3, 1, 1, 0, 'A', 0, 0, 0.00, 'admin', '2015-10-15 15:46:02', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('40210', 'Financial Expenses', 'Other Expenses', 2, 1, 0, 1, 'E', 0, 0, 0.00, 'anwarul', '2013-08-20 12:24:31', 'admin', '2015-10-15 19:20:36');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('1010403', 'Fire Extingushier', 'Others Assets', 3, 1, 1, 0, 'A', 0, 0, 0.00, 'admin', '2016-03-27 10:39:32', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('4021408', 'Furniture', 'Repair and Maintenance', 3, 1, 1, 0, 'E', 0, 0, 0.00, 'admin', '2015-10-15 19:35:47', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('10101', 'Furniture & Fixturers', 'Non Current Assets', 2, 1, 0, 1, 'A', 0, 0, 0.00, 'anwarul', '2013-08-20 16:18:15', 'anwarul', '2013-08-21 13:35:40');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('4020406', 'Gas Bill', 'Utility Expenses', 3, 1, 1, 0, 'E', 0, 0, 0.00, 'admin', '2015-10-15 18:59:20', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('20201', 'General Reserve', 'Reserve & Surplus', 2, 1, 1, 0, 'L', 0, 0, 0.00, 'admin', '2016-09-25 14:07:12', 'admin', '2016-10-02 17:48:49');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('10105', 'Generator', 'Non Current Assets', 2, 1, 1, 1, 'A', 0, 0, 0.00, 'Zoherul', '2016-02-27 16:02:35', 'admin', '2016-05-23 12:05:18');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('4021414', 'Generator Repair', 'Repair and Maintenance', 3, 1, 1, 0, 'E', 0, 0, 0.00, 'Zoherul', '2016-06-16 10:21:05', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('40213', 'Generator Running Expenses', 'Other Expenses', 2, 1, 0, 1, 'E', 0, 0, 0.00, 'admin', '2015-10-15 19:29:29', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('10103', 'Groceries and Cutleries', 'Non Current Assets', 2, 1, 1, 1, 'A', 0, 0, 0.00, '2', '2018-07-12 10:02:55', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('1010408', 'Gym Equipment', 'Others Assets', 3, 1, 1, 0, 'A', 0, 0, 0.00, 'admin', '2016-03-27 10:46:03', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('4020907', 'Honorarium', 'Salary & Allowances', 3, 1, 1, 0, 'E', 0, 0, 0.00, 'admin', '2015-10-15 19:13:26', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('40205', 'House Rent', 'Other Expenses', 2, 1, 0, 1, 'E', 0, 0, 0.00, 'anwarul', '2013-08-24 10:26:56', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('40100001', 'HP-Hasilpur', 'Academic Expenses', 2, 1, 1, 0, 'E', 0, 0, 0.00, '2', '2018-07-29 03:44:23', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('4020702', 'HR Recruitment Expenses', 'Miscellaneous Expenses', 3, 1, 1, 0, 'E', 0, 0, 0.00, 'admin', '2016-09-25 12:55:49', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('4020703', 'Incentive on Admission', 'Miscellaneous Expenses', 3, 1, 1, 0, 'E', 0, 0, 0.00, 'admin', '2016-09-25 12:56:09', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('3', 'Income', 'COA', 0, 1, 0, 0, 'I', 0, 0, 0.00, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('5020302', 'Income Tax Payable', 'Liabilities for Expenses', 3, 1, 0, 1, 'L', 0, 0, 0.00, 'admin', '2016-09-19 11:18:17', 'admin', '2016-09-28 13:18:35');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('102020302', 'Insurance Premium', 'Prepayment', 4, 1, 1, 0, 'A', 0, 0, 0.00, 'admin', '2016-09-19 13:10:57', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('4021001', 'Interest on Loan', 'Financial Expenses', 3, 1, 1, 0, 'E', 0, 0, 0.00, 'admin', '2015-10-15 19:20:53', 'admin', '2016-09-19 14:53:34');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('4020401', 'Internet Bill', 'Utility Expenses', 3, 1, 1, 0, 'E', 0, 0, 0.00, 'admin', '2015-10-15 18:56:55', 'admin', '2015-10-15 18:57:32');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('10107', 'Inventory', 'Non Current Assets', 1, 1, 0, 0, 'A', 0, 0, 0.00, '2', '2018-07-07 15:21:58', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('102010309', 'iyzico', 'Online Payment', 2, 1, 1, 0, 'A', 0, 0, 0.00, '2', '2020-10-18 14:32:35', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('10205010101', 'Jahangir', 'Hasan', 1, 1, 0, 0, 'A', 0, 0, 0.00, '2', '2018-07-07 10:40:56', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('1010210', 'LCD TV', 'Office Equipment', 3, 1, 1, 0, 'A', 0, 0, 0.00, 'admin', '2015-10-15 15:52:27', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('30103', 'Lease Sale', 'Store Income', 1, 1, 1, 1, 'I', 0, 0, 0.00, '2', '2018-07-08 07:51:52', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('5', 'Liabilities', 'COA', 0, 1, 0, 0, 'L', 0, 0, 0.00, 'admin', '2013-07-04 12:32:07', 'admin', '2015-10-15 19:46:54');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('50203', 'Liabilities for Expenses', 'Current Liabilities', 2, 1, 0, 0, 'L', 0, 0, 0.00, 'admin', '2015-10-15 19:50:59', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('4020707', 'Library Expenses', 'Miscellaneous Expenses', 3, 1, 1, 0, 'E', 0, 0, 0.00, 'admin', '2017-01-10 15:34:54', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('4021409', 'Lift', 'Repair and Maintenance', 3, 1, 1, 0, 'E', 0, 0, 0.00, 'admin', '2015-10-15 19:36:12', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('50101', 'Long Term Borrowing', 'Non Current Liabilities', 2, 1, 0, 1, 'L', 0, 0, 0.00, 'admin', '2013-07-04 12:32:26', 'admin', '2015-10-15 19:47:40');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('4020608', 'Marketing & Promotion Exp.', 'Promonational Expence', 3, 1, 1, 0, 'E', 0, 0, 0.00, 'admin', '2015-10-15 18:53:59', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('4020901', 'Medical Allowance', 'Salary & Allowances', 3, 1, 1, 0, 'E', 0, 0, 0.00, 'admin', '2015-10-15 19:11:33', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('1010411', 'Metal Ditector', 'Others Assets', 3, 1, 1, 0, 'A', 0, 0, 0.00, 'Zoherul', '2016-08-22 10:55:22', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('4021413', 'Micro Oven', 'Repair and Maintenance', 3, 1, 1, 0, 'E', 0, 0, 0.00, 'Zoherul', '2016-05-12 14:53:51', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('30202', 'Miscellaneous (Income)', 'Other Income', 2, 1, 1, 1, 'I', 0, 0, 0.00, 'anwarul', '2014-02-06 15:26:31', 'admin', '2016-09-25 11:04:35');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('4020909', 'Miscellaneous Benifit', 'Salary & Allowances', 3, 1, 1, 0, 'E', 0, 0, 0.00, 'admin', '2015-10-15 19:13:53', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('4020701', 'Miscellaneous Exp', 'Miscellaneous Expenses', 3, 1, 1, 0, 'E', 0, 0, 0.00, 'admin', '2016-09-25 12:54:39', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('40207', 'Miscellaneous Expenses', 'Other Expenses', 2, 1, 0, 1, 'E', 0, 0, 0.00, 'anwarul', '2014-04-26 16:49:56', 'admin', '2016-09-25 12:54:19');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('1010401', 'Mobile Phone', 'Others Assets', 3, 1, 1, 0, 'A', 0, 0, 0.00, 'admin', '2016-01-29 10:43:30', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('102020101', 'Mr Ashiqur Rahman', 'Advance', 4, 1, 1, 0, 'A', 0, 0, 0.00, 'admin', '2015-12-31 16:47:23', 'admin', '2016-09-25 11:55:13');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('1010212', 'Network Accessories', 'Office Equipment', 3, 1, 1, 0, 'A', 0, 0, 0.00, 'admin', '2016-01-02 16:23:32', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('102020106', 'new head dfhgfh', 'Advance', 3, 1, 0, 0, 'A', 0, 0, 0.00, '2', '2020-01-16 06:25:10', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('4020408', 'News Paper Bill', 'Utility Expenses', 3, 1, 1, 0, 'E', 0, 0, 0.00, 'admin', '2016-01-02 15:55:57', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('101', 'Non Current Assets', 'Assets', 1, 1, 0, 0, 'A', 0, 0, 0.00, '', '0000-00-00 00:00:00', 'admin', '2015-10-15 15:29:11');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('501', 'Non Current Liabilities', 'Liabilities', 1, 1, 0, 0, 'L', 0, 0, 0.00, 'anwarul', '2014-08-30 13:18:20', 'admin', '2015-10-15 19:49:21');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('406', 'Office Accessories', 'Expense', 1, 1, 1, 0, 'E', 1, 1, 1.00, '2', '2020-01-18 07:51:32', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('1010404', 'Office Decoration', 'Others Assets', 3, 1, 1, 0, 'A', 0, 0, 0.00, 'admin', '2016-03-27 10:40:02', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('10102', 'Office Equipment', 'Non Current Assets', 2, 1, 0, 1, 'A', 0, 0, 0.00, 'anwarul', '2013-12-06 18:08:00', 'admin', '2015-10-15 15:48:21');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('4021401', 'Office Repair & Maintenance', 'Repair and Maintenance', 3, 1, 1, 0, 'E', 0, 0, 0.00, 'admin', '2015-10-15 19:33:15', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('30201', 'Office Stationary (Income)', 'Other Income', 2, 1, 1, 1, 'I', 0, 0, 0.00, 'anwarul', '2013-07-17 15:21:06', 'admin', '2016-09-25 11:04:50');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('1020103', 'Online Payment', 'Cash & Cash Equivalent', 2, 1, 0, 1, 'A', 0, 0, 0.00, '2', '2020-10-18 14:26:41', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('102010308', 'Orange Money payment', 'Online Payment', 2, 1, 1, 0, 'A', 0, 0, 0.00, '2', '2020-10-18 14:32:11', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('402', 'Other Expenses', 'Expense', 1, 1, 0, 0, 'E', 0, 0, 0.00, '2', '2018-07-07 14:00:16', 'admin', '2015-10-15 18:37:42');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('302', 'Other Income', 'Income', 1, 1, 0, 0, 'I', 0, 0, 0.00, '2', '2018-07-07 13:40:57', 'admin', '2016-09-25 11:04:09');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('40211', 'Others (Non Academic Expenses)', 'Other Expenses', 2, 1, 0, 1, 'E', 0, 0, 0.00, 'Obaidul', '2014-12-03 16:05:42', 'admin', '2015-10-15 19:22:09');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('30205', 'Others (Non-Academic Income)', 'Other Income', 2, 1, 0, 1, 'I', 0, 0, 0.00, 'admin', '2015-10-15 17:23:49', 'admin', '2015-10-15 17:57:52');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('10104', 'Others Assets', 'Non Current Assets', 2, 1, 0, 1, 'A', 0, 0, 0.00, 'admin', '2016-01-29 10:43:16', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('4020910', 'Outstanding Salary', 'Salary & Allowances', 3, 1, 1, 0, 'E', 0, 0, 0.00, 'Zoherul', '2016-04-24 11:56:50', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('4021405', 'Oven', 'Repair and Maintenance', 3, 1, 1, 0, 'E', 0, 0, 0.00, 'admin', '2015-10-15 19:34:31', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('4021412', 'PABX-Repair', 'Repair and Maintenance', 3, 1, 1, 0, 'E', 0, 0, 0.00, 'Zoherul', '2016-04-24 14:40:18', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('4020902', 'Part-time Staff Salary', 'Salary & Allowances', 3, 1, 1, 0, 'E', 0, 0, 0.00, 'admin', '2015-10-15 19:12:06', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('102010301', 'Paypal', 'Online Payment', 2, 1, 1, 0, 'A', 0, 0, 0.00, '2', '2020-10-18 14:27:41', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('102010306', 'Paystack Payments', 'Online Payment', 2, 1, 1, 0, 'A', 0, 0, 0.00, '2', '2020-10-18 14:30:55', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('102010307', 'Paytm Payments', 'Online Payment', 2, 1, 1, 0, 'A', 0, 0, 0.00, '2', '2020-10-18 14:31:23', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('1010202', 'Photocopy & Fax Machine', 'Office Equipment', 3, 1, 1, 0, 'A', 0, 0, 0.00, 'admin', '2015-10-15 15:47:27', 'admin', '2016-05-23 12:14:40');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('4021411', 'Photocopy Machine Repair', 'Repair and Maintenance', 3, 1, 1, 0, 'E', 0, 0, 0.00, 'Zoherul', '2016-04-24 12:40:02', 'admin', '2017-04-27 17:03:17');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('3020503', 'Practical Fee', 'Others (Non-Academic Income)', 3, 1, 1, 1, 'I', 0, 0, 0.00, 'admin', '2017-07-22 18:00:37', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('1020203', 'Prepayment', 'Advance, Deposit And Pre-payments', 3, 1, 0, 1, 'A', 0, 0, 0.00, 'admin', '2015-10-15 15:40:51', 'admin', '2015-12-31 16:49:58');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('1010201', 'Printer', 'Office Equipment', 3, 1, 1, 0, 'A', 0, 0, 0.00, 'admin', '2015-10-15 15:47:15', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('407', 'Product Purchase', 'Expense', 0, 1, 0, 0, 'E', 0, 0, 0.00, '2', '2020-01-23 07:09:10', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('3020502', 'Professional Training Course(Oracal-1)', 'Others (Non-Academic Income)', 3, 1, 1, 0, 'I', 0, 0, 0.00, 'nasim', '2017-06-22 13:28:05', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('30207', 'Professional Training Course(Oracal)', 'Other Income', 2, 1, 0, 1, 'I', 0, 0, 0.00, 'nasim', '2017-06-22 13:24:16', 'nasim', '2017-06-22 13:25:56');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('1010208', 'Projector', 'Office Equipment', 3, 1, 1, 0, 'A', 0, 0, 0.00, 'admin', '2015-10-15 15:51:44', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('40206', 'Promonational Expense', 'Other Expenses', 2, 1, 0, 1, 'E', 0, 0, 0.00, 'anwarul', '2013-07-11 13:48:57', 'anwarul', '2013-07-17 14:23:03');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('40214', 'Repair and Maintenance', 'Other Expenses', 2, 1, 0, 1, 'E', 0, 0, 0.00, 'admin', '2015-10-15 19:32:46', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('202', 'Reserve & Surplus', 'Equity', 1, 1, 0, 1, 'L', 0, 0, 0.00, 'admin', '2016-09-25 14:06:34', 'admin', '2016-10-02 17:48:57');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('20102', 'Retained Earnings', 'Share Holders Equity', 2, 1, 1, 1, 'L', 0, 0, 0.00, 'admin', '2016-05-23 11:20:40', 'admin', '2016-09-25 14:05:06');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('4020708', 'River Cruse', 'Miscellaneous Expenses', 3, 1, 1, 0, 'E', 0, 0, 0.00, 'admin', '2017-04-24 15:35:25', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('102010311', 'RMA PAYMENT GATEWAY', 'Online Payment', 2, 1, 1, 0, 'A', 0, 0, 0.00, '2', '2020-10-18 14:33:12', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('102020105', 'Salary', 'Advance', 4, 1, 0, 0, 'A', 0, 0, 0.00, 'admin', '2018-07-05 11:46:44', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('40209', 'Salary & Allowances', 'Other Expenses', 2, 1, 0, 1, 'E', 0, 0, 0.00, 'anwarul', '2013-12-12 11:22:58', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('404', 'Sale Discount', 'Expense', 1, 1, 1, 0, 'E', 0, 0, 0.00, '2', '2018-07-19 10:15:11', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('303', 'Sale Income', 'Income', 0, 1, 1, 1, 'I', 0, 0, 0.00, '2', '2020-01-23 06:58:20', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('1010406', 'Security Equipment', 'Others Assets', 3, 1, 1, 0, 'A', 0, 0, 0.00, 'admin', '2016-03-27 10:41:30', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('30104', 'Service Charge Income', 'Store Income', 1, 1, 1, 0, 'I', 0, 0, 0.00, '2', '2020-12-30 11:23:32', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('20101', 'Share Capital', 'Share Holders Equity', 2, 1, 0, 1, 'L', 0, 0, 0.00, 'anwarul', '2013-12-08 19:37:32', 'admin', '2015-10-15 19:45:35');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('201', 'Share Holders Equity', 'Equity', 1, 1, 0, 0, 'L', 0, 0, 0.00, '', '0000-00-00 00:00:00', 'admin', '2015-10-15 19:43:51');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('50201', 'Short Term Borrowing', 'Current Liabilities', 2, 1, 0, 1, 'L', 0, 0, 0.00, 'admin', '2015-10-15 19:50:30', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('102010310', 'SIPS Office', 'Online Payment', 2, 1, 1, 0, 'A', 0, 0, 0.00, '2', '2020-10-18 14:32:54', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('4020906', 'Special Allowances', 'Salary & Allowances', 3, 1, 1, 0, 'E', 0, 0, 0.00, 'admin', '2015-10-15 19:13:13', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('50102', 'Sponsors Loan', 'Non Current Liabilities', 2, 1, 0, 1, 'L', 0, 0, 0.00, 'admin', '2015-10-15 19:48:02', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('4020706', 'Sports Expense', 'Miscellaneous Expenses', 3, 1, 1, 0, 'E', 0, 0, 0.00, 'nasmud', '2016-11-09 13:16:53', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('102010304', 'Square Payments', 'Online Payment', 2, 1, 1, 0, 'A', 0, 0, 0.00, '2', '2020-10-18 14:29:32', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('102010302', 'SSLCommerz', 'Online Payment', 2, 1, 1, 0, 'A', 0, 0, 0.00, '2', '2020-10-18 14:28:06', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('401', 'Store Expenses', 'Expense', 1, 1, 0, 0, 'E', 0, 0, 0.00, '2', '2018-07-07 13:38:59', 'admin', '2015-10-15 17:58:46');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('301', 'Store Income', 'Income', 1, 1, 0, 0, 'I', 0, 0, 0.00, '2', '2018-07-07 13:40:37', 'admin', '2015-09-17 17:00:02');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('102010305', 'Stripe Payment', 'Online Payment', 2, 1, 1, 0, 'A', 0, 0, 0.00, '2', '2020-10-18 14:29:59', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('3020501', 'Students Info. Correction Fee', 'Others (Non-Academic Income)', 3, 1, 1, 0, 'I', 0, 0, 0.00, 'admin', '2015-10-15 17:24:45', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('1010601', 'Sub Station', 'Electrical Equipment', 3, 1, 1, 0, 'A', 0, 0, 0.00, 'admin', '2016-03-27 10:44:11', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('502020501', 'sup_002-Kamal Hossain', 'Suppliers', 4, 1, 1, 0, 'L', 0, 0, 0.00, '2', '2020-01-18 10:49:49', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('502020504', 'sup_002-Supplier_1', 'Suppliers', 4, 1, 1, 0, 'L', 0, 0, 0.00, '2', '2020-09-08 14:26:40', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('502020502', 'sup_003-Maruf', 'Suppliers', 4, 1, 1, 0, 'L', 0, 0, 0.00, '2', '2020-01-18 10:56:31', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('502020503', 'sup_004-Saiful', 'Suppliers', 4, 1, 1, 0, 'L', 0, 0, 0.00, '2', '2020-01-18 10:57:04', '2', '2020-01-21 13:10:59');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('5020205', 'Suppliers', 'Account Payable', 3, 1, 0, 1, 'L', 0, 0, 0.00, '2', '2018-12-15 06:50:12', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('4020704', 'TB Care Expenses', 'Miscellaneous Expenses', 3, 1, 1, 0, 'E', 0, 0, 0.00, 'admin', '2016-10-08 13:03:04', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('4020501', 'TDS on House Rent', 'House Rent', 3, 1, 1, 0, 'E', 0, 0, 0.00, 'admin', '2015-10-15 18:44:07', 'admin', '2016-09-19 14:40:16');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('502030201', 'TDS Payable House Rent', 'Income Tax Payable', 4, 1, 1, 0, 'L', 0, 0, 0.00, 'admin', '2016-09-19 11:19:42', 'admin', '2016-09-28 13:19:37');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('502030203', 'TDS Payable on Advertisement Bill', 'Income Tax Payable', 4, 1, 1, 0, 'L', 0, 0, 0.00, 'admin', '2016-09-28 13:20:51', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('502030202', 'TDS Payable on Salary', 'Income Tax Payable', 4, 1, 1, 0, 'L', 0, 0, 0.00, 'admin', '2016-09-28 13:20:17', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('4021402', 'Tea Kettle', 'Repair and Maintenance', 3, 1, 1, 0, 'E', 0, 0, 0.00, 'admin', '2015-10-15 19:33:45', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('4020402', 'Telephone Bill', 'Utility Expenses', 3, 1, 1, 0, 'E', 0, 0, 0.00, 'admin', '2015-10-15 18:57:59', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('1010209', 'Telephone Set & PABX', 'Office Equipment', 3, 1, 1, 0, 'A', 0, 0, 0.00, 'admin', '2015-10-15 15:51:57', 'admin', '2016-10-02 17:10:40');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('102020104', 'Test', 'Advance', 4, 1, 1, 0, 'A', 0, 0, 0.00, 'admin', '2018-07-05 11:42:48', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('40203', 'Travelling & Conveyance', 'Other Expenses', 2, 1, 1, 1, 'E', 0, 0, 0.00, 'admin', '2013-07-08 16:22:06', 'admin', '2015-10-15 18:45:13');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('4021406', 'TV', 'Repair and Maintenance', 3, 1, 1, 0, 'E', 0, 0, 0.00, 'admin', '2015-10-15 19:35:07', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('102010303', 'Two Checkout', 'Online Payment', 2, 1, 1, 0, 'A', 0, 0, 0.00, '2', '2020-10-18 14:28:29', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('1010205', 'UPS', 'Office Equipment', 3, 1, 1, 0, 'A', 0, 0, 0.00, 'admin', '2015-10-15 15:50:38', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('40204', 'Utility Expenses', 'Other Expenses', 2, 1, 0, 1, 'E', 0, 0, 0.00, 'anwarul', '2013-07-11 16:20:24', 'admin', '2016-01-02 15:55:22');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('4020503', 'VAT on House Rent Exp', 'House Rent', 3, 1, 1, 0, 'E', 0, 0, 0.00, 'admin', '2015-10-15 18:49:22', 'admin', '2016-09-25 14:00:52');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('5020301', 'VAT Payable', 'Liabilities for Expenses', 3, 1, 0, 1, 'L', 0, 0, 0.00, 'admin', '2015-10-15 19:51:11', 'admin', '2016-09-28 13:23:53');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('502030101', 'VAT- TAX', 'VAT Payable', 3, 1, 1, 0, 'L', 0, 0, 0.00, '2', '2020-12-30 10:58:49', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('1010409', 'Vehicle A/C', 'Others Assets', 3, 1, 1, 0, 'A', 0, 0, 0.00, 'Zoherul', '2016-05-12 12:13:21', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('1010405', 'Voltage Stablizer', 'Others Assets', 3, 1, 1, 0, 'A', 0, 0, 0.00, 'admin', '2016-03-27 10:40:59', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('1010105', 'Waiting Sofa - Steel', 'Furniture & Fixturers', 3, 1, 1, 0, 'A', 0, 0, 0.00, 'admin', '2015-10-15 15:46:29', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('4020405', 'WASA Bill', 'Utility Expenses', 3, 1, 1, 0, 'E', 0, 0, 0.00, 'admin', '2015-10-15 18:58:51', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('1010402', 'Water Purifier', 'Others Assets', 3, 1, 1, 0, 'A', 0, 0, 0.00, 'admin', '2016-01-29 11:14:11', '', '0000-00-00 00:00:00');
INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES('4020705', 'Website Development Expenses', 'Miscellaneous Expenses', 3, 1, 1, 0, 'E', 0, 0, 0.00, 'admin', '2016-10-15 12:42:47', '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `acc_customer_income`
--

DROP TABLE IF EXISTS `acc_customer_income`;
CREATE TABLE IF NOT EXISTS `acc_customer_income` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Customer_Id` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `VNo` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Date` date NOT NULL,
  `Amount` decimal(10,2) NOT NULL,
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `acc_glsummarybalance`
--

DROP TABLE IF EXISTS `acc_glsummarybalance`;
CREATE TABLE IF NOT EXISTS `acc_glsummarybalance` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `COAID` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Debit` decimal(18,2) DEFAULT NULL,
  `Credit` decimal(18,2) DEFAULT NULL,
  `FYear` int DEFAULT NULL,
  `CreateBy` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `acc_income_expence`
--

DROP TABLE IF EXISTS `acc_income_expence`;
CREATE TABLE IF NOT EXISTS `acc_income_expence` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `VNo` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Student_Id` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Date` date NOT NULL,
  `Paymode` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Perpose` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Narration` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `StoreID` int NOT NULL,
  `COAID` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Amount` decimal(10,2) NOT NULL,
  `IsApprove` tinyint NOT NULL,
  `CreateBy` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `CreateDate` datetime NOT NULL,
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `acc_temp`
--

DROP TABLE IF EXISTS `acc_temp`;
CREATE TABLE IF NOT EXISTS `acc_temp` (
  `COAID` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Debit` decimal(18,2) NOT NULL,
  `Credit` decimal(18,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `acc_transaction`
--

DROP TABLE IF EXISTS `acc_transaction`;
CREATE TABLE IF NOT EXISTS `acc_transaction` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `VNo` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Vtype` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `VDate` date DEFAULT NULL,
  `COAID` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Narration` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Debit` decimal(18,2) DEFAULT NULL,
  `Credit` decimal(18,2) DEFAULT NULL,
  `StoreID` int NOT NULL,
  `IsPosted` char(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `CreateBy` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `UpdateDate` datetime DEFAULT NULL,
  `IsAppove` char(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `acn_account_transaction`
--

DROP TABLE IF EXISTS `acn_account_transaction`;
CREATE TABLE IF NOT EXISTS `acn_account_transaction` (
  `account_tran_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `account_id` int NOT NULL,
  `transaction_description` varchar(255) NOT NULL,
  `amount` varchar(25) NOT NULL,
  `tran_date` date NOT NULL,
  `payment_id` int NOT NULL,
  `create_by_id` varchar(25) NOT NULL,
  PRIMARY KEY (`account_tran_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `add_ons`
--

DROP TABLE IF EXISTS `add_ons`;
CREATE TABLE IF NOT EXISTS `add_ons` (
  `add_on_id` int NOT NULL AUTO_INCREMENT,
  `add_on_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `is_active` tinyint NOT NULL,
  PRIMARY KEY (`add_on_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `award`
--

DROP TABLE IF EXISTS `award`;
CREATE TABLE IF NOT EXISTS `award` (
  `award_id` int NOT NULL AUTO_INCREMENT,
  `award_name` varchar(50) NOT NULL,
  `aw_description` varchar(200) NOT NULL,
  `awr_gift_item` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `employee_id` varchar(30) NOT NULL,
  `awarded_by` varchar(30) NOT NULL,
  PRIMARY KEY (`award_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bank_summary`
--

DROP TABLE IF EXISTS `bank_summary`;
CREATE TABLE IF NOT EXISTS `bank_summary` (
  `bank_id` varchar(250) DEFAULT NULL,
  `description` text,
  `deposite_id` varchar(250) DEFAULT NULL,
  `date` varchar(250) DEFAULT NULL,
  `ac_type` varchar(50) DEFAULT NULL,
  `dr` float DEFAULT NULL,
  `cr` float DEFAULT NULL,
  `ammount` float DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
CREATE TABLE IF NOT EXISTS `bill` (
  `bill_id` bigint NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `order_id` bigint NOT NULL,
  `total_amount` float NOT NULL,
  `discount` float NOT NULL,
  `service_charge` float NOT NULL,
  `shipping_type` int DEFAULT NULL COMMENT '1=home,2=pickup,3=none',
  `delivarydate` datetime DEFAULT NULL,
  `VAT` float NOT NULL,
  `bill_amount` float NOT NULL,
  `bill_date` date NOT NULL,
  `bill_time` time NOT NULL,
  `create_at` datetime DEFAULT '1970-01-01 01:01:01',
  `bill_status` tinyint(1) NOT NULL COMMENT '0=unpaid, 1=paid',
  `payment_method_id` tinyint NOT NULL,
  `create_by` int NOT NULL,
  `create_date` date NOT NULL,
  `update_by` int NOT NULL,
  `update_date` date NOT NULL,
  PRIMARY KEY (`bill_id`),
  KEY `order_id` (`order_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bill_card_payment`
--

DROP TABLE IF EXISTS `bill_card_payment`;
CREATE TABLE IF NOT EXISTS `bill_card_payment` (
  `row_id` bigint NOT NULL AUTO_INCREMENT,
  `bill_id` bigint NOT NULL,
  `multipay_id` int DEFAULT NULL,
  `card_no` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `terminal_name` int NOT NULL,
  `bank_name` int DEFAULT NULL,
  PRIMARY KEY (`row_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `candidate_basic_info`
--

DROP TABLE IF EXISTS `candidate_basic_info`;
CREATE TABLE IF NOT EXISTS `candidate_basic_info` (
  `can_id` varchar(20) NOT NULL,
  `first_name` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `last_name` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `email` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `alter_phone` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `present_address` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `parmanent_address` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `picture` text,
  `ssn` varchar(50) NOT NULL,
  `state` varchar(30) NOT NULL,
  `city` varchar(30) NOT NULL,
  `zip` int NOT NULL,
  PRIMARY KEY (`can_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `candidate_education_info`
--

DROP TABLE IF EXISTS `candidate_education_info`;
CREATE TABLE IF NOT EXISTS `candidate_education_info` (
  `can_edu_id` int NOT NULL AUTO_INCREMENT,
  `can_id` varchar(30) NOT NULL,
  `degree_name` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `university_name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `cgp` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `comments` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sequencee` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`can_edu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `candidate_interview`
--

DROP TABLE IF EXISTS `candidate_interview`;
CREATE TABLE IF NOT EXISTS `candidate_interview` (
  `can_int_id` int NOT NULL AUTO_INCREMENT,
  `can_id` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `job_adv_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `interview_date` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `interviewer_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `interview_marks` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `written_total_marks` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `mcq_total_marks` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `total_marks` varchar(30) NOT NULL,
  `recommandation` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `selection` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `details` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`can_int_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `candidate_selection`
--

DROP TABLE IF EXISTS `candidate_selection`;
CREATE TABLE IF NOT EXISTS `candidate_selection` (
  `can_sel_id` int NOT NULL AUTO_INCREMENT,
  `can_id` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `employee_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pos_id` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `selection_terms` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`can_sel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `candidate_shortlist`
--

DROP TABLE IF EXISTS `candidate_shortlist`;
CREATE TABLE IF NOT EXISTS `candidate_shortlist` (
  `can_short_id` int NOT NULL AUTO_INCREMENT,
  `can_id` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `job_adv_id` int NOT NULL,
  `date_of_shortlist` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `interview_date` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`can_short_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `candidate_workexperience`
--

DROP TABLE IF EXISTS `candidate_workexperience`;
CREATE TABLE IF NOT EXISTS `candidate_workexperience` (
  `can_workexp_id` int NOT NULL AUTO_INCREMENT,
  `can_id` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `company_name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `working_period` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `duties` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `supervisor` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `sequencee` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`can_workexp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `check_addones`
--

DROP TABLE IF EXISTS `check_addones`;
CREATE TABLE IF NOT EXISTS `check_addones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_menuid` int NOT NULL,
  `sub_order_id` int NOT NULL,
  `status` tinyint DEFAULT NULL COMMENT '1=insert, 0=notinserted',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `common_setting`
--

DROP TABLE IF EXISTS `common_setting`;
CREATE TABLE IF NOT EXISTS `common_setting` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` text,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `phone_optional` varchar(30) DEFAULT NULL,
  `logo` varchar(50) DEFAULT NULL,
  `logo_footer` varchar(255) DEFAULT NULL,
  `ismembership` int NOT NULL DEFAULT '0' COMMENT '1=enable,0=disable',
  `powerbytxt` text,
  `web_onoff` int DEFAULT '1' COMMENT '1=enable,0=disable',
  `backgroundcolorweb` varchar(30) DEFAULT NULL,
  `webheaderfontcolor` varchar(20) DEFAULT NULL,
  `backgroundcolorqr` varchar(30) DEFAULT NULL,
  `qrheaderfontcolor` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `common_setting`
--

INSERT INTO `common_setting` (`id`, `address`, `email`, `phone`, `phone_optional`, `logo`, `logo_footer`, `ismembership`, `powerbytxt`, `web_onoff`, `backgroundcolorweb`, `webheaderfontcolor`, `backgroundcolorqr`, `qrheaderfontcolor`) VALUES(1, '<p>123 Suspendis matti, <br> Visaosang Building VST District, <br> NY Accums, North American</p>', 'support@bdtask.com', '0123456789', '+88 01715 222 333', 'assets/img/2021-01-02/b.png', 'assets/img/2021-01-02/b1.png', 1, '© 2019 Hungry All Right Reserved. Developed by BDTASK.\r\n', 1, NULL, NULL, '#030303', '#ffffff');

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
CREATE TABLE IF NOT EXISTS `currency` (
  `currencyid` int NOT NULL AUTO_INCREMENT,
  `currencyname` varchar(50) NOT NULL,
  `curr_icon` varchar(50) NOT NULL,
  `position` int NOT NULL DEFAULT '1' COMMENT '1=left.2=right',
  `curr_rate` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`currencyid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`currencyid`, `currencyname`, `curr_icon`, `position`, `curr_rate`) VALUES(1, 'BDT', 'BDT', 2, 83.00);
INSERT INTO `currency` (`currencyid`, `currencyname`, `curr_icon`, `position`, `curr_rate`) VALUES(2, 'USD', '$', 1, 1.00);
INSERT INTO `currency` (`currencyid`, `currencyname`, `curr_icon`, `position`, `curr_rate`) VALUES(3, 'INR', 'R', 1, 0.50);

-- --------------------------------------------------------

--
-- Table structure for table `customer_info`
--

DROP TABLE IF EXISTS `customer_info`;
CREATE TABLE IF NOT EXISTS `customer_info` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `cuntomer_no` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `membership_type` int DEFAULT NULL COMMENT '1=bronze,2=silver,3=gold,4=platinum,5vip',
  `customer_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `customer_email` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_token` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `customer_address` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_phone` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `customer_picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `favorite_delivery_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `crdate` date DEFAULT NULL,
  `is_active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customer_info`
--

INSERT INTO `customer_info` (`customer_id`, `cuntomer_no`, `membership_type`, `customer_name`, `customer_email`, `password`, `customer_token`, `customer_address`, `customer_phone`, `customer_picture`, `favorite_delivery_address`, `crdate`, `is_active`) VALUES(1, 'cusL-0001', 2, 'Walkin', 'test@gmail.com', NULL, 'cO_Sa2fwscE:APA91bEFDD0sbV52pZPwJEl8MEUCcHBg2wIGjKfelfbiytAj4nJlPsKf8sSupfElBq-nm36DCkjYDEoUcA7qvtzKu4vDqjutF23f6Y_0uw4L_PlJIrtl61y4s-t5OKFAmdaU9OUQTtYS', 'dhaka', '8801717426371', NULL, 'ddd', NULL, 1);
INSERT INTO `customer_info` (`customer_id`, `cuntomer_no`, `membership_type`, `customer_name`, `customer_email`, `password`, `customer_token`, `customer_address`, `customer_phone`, `customer_picture`, `favorite_delivery_address`, `crdate`, `is_active`) VALUES(36, 'cusL-0004', 1, 'Kabir khan', 'kabir@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', NULL, 'DDD sgfsrgrg', '1732432434', 'assets/img/icons/2021-11-10/m.png', NULL, '2021-08-31', 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer_membership_map`
--

DROP TABLE IF EXISTS `customer_membership_map`;
CREATE TABLE IF NOT EXISTS `customer_membership_map` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `membership_id` int NOT NULL,
  `active_date` date NOT NULL,
  `active_by` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_order`
--

DROP TABLE IF EXISTS `customer_order`;
CREATE TABLE IF NOT EXISTS `customer_order` (
  `order_id` bigint NOT NULL AUTO_INCREMENT,
  `saleinvoice` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `marge_order_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_id` int NOT NULL,
  `cutomertype` int NOT NULL,
  `isthirdparty` int NOT NULL DEFAULT '0' COMMENT '0=normal,1>all Third Party',
  `thirdpartyinvoiceid` int DEFAULT NULL,
  `waiter_id` int DEFAULT NULL,
  `kitchen` int DEFAULT NULL,
  `order_date` date NOT NULL,
  `order_time` time NOT NULL,
  `cookedtime` time NOT NULL DEFAULT '00:15:00',
  `table_no` int DEFAULT NULL,
  `tokenno` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `totalamount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `customerpaid` decimal(10,2) DEFAULT '0.00',
  `customer_note` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `anyreason` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `order_status` tinyint(1) NOT NULL COMMENT '1=Pending, 2=Processing, 3=Ready, 4=Served,5=Cancel',
  `nofification` int NOT NULL DEFAULT '0' COMMENT '0=unseen,1=seen',
  `orderacceptreject` int DEFAULT NULL,
  `splitpay_status` tinyint NOT NULL DEFAULT '0' COMMENT '0=no split,1=split',
  `isupdate` int DEFAULT NULL,
  `shipping_date` datetime DEFAULT '1790-01-01 01:01:01',
  `tokenprint` int NOT NULL DEFAULT '0' COMMENT '1=print done,0=not done',
  `invoiceprint` int DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`customer_id`),
  KEY `cutomertype` (`cutomertype`),
  KEY `waiter_id` (`waiter_id`),
  KEY `kitchen` (`kitchen`),
  KEY `thirdpartyinvoiceid` (`thirdpartyinvoiceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_type`
--

DROP TABLE IF EXISTS `customer_type`;
CREATE TABLE IF NOT EXISTS `customer_type` (
  `customer_type_id` int NOT NULL AUTO_INCREMENT,
  `customer_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ordering` int DEFAULT '0',
  PRIMARY KEY (`customer_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customer_type`
--

INSERT INTO `customer_type` (`customer_type_id`, `customer_type`, `ordering`) VALUES(1, 'Walk In Customer', 0);
INSERT INTO `customer_type` (`customer_type_id`, `customer_type`, `ordering`) VALUES(2, 'Online Customer', 0);
INSERT INTO `customer_type` (`customer_type_id`, `customer_type`, `ordering`) VALUES(3, 'Third Party', 0);
INSERT INTO `customer_type` (`customer_type_id`, `customer_type`, `ordering`) VALUES(4, 'Take Way', 0);
INSERT INTO `customer_type` (`customer_type_id`, `customer_type`, `ordering`) VALUES(99, 'QR Customer', 0);

-- --------------------------------------------------------

--
-- Table structure for table `custom_table`
--

DROP TABLE IF EXISTS `custom_table`;
CREATE TABLE IF NOT EXISTS `custom_table` (
  `custom_id` int NOT NULL AUTO_INCREMENT,
  `custom_field` varchar(100) NOT NULL,
  `custom_data_type` int NOT NULL,
  `custom_data` text NOT NULL,
  `employee_id` varchar(20) NOT NULL,
  PRIMARY KEY (`custom_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `custom_table`
--

INSERT INTO `custom_table` (`custom_id`, `custom_field`, `custom_data_type`, `custom_data`, `employee_id`) VALUES(52, 'Chinese Cuisine', 1, 'coffee roastery located on a busy corner site in Farringdon\'s Exmouth Market. With glazed frontage on two sides ', 'EU3APTYY');
INSERT INTO `custom_table` (`custom_id`, `custom_field`, `custom_data_type`, `custom_data`, `employee_id`) VALUES(54, 'French Suicine', 1, 'coffee roastery located on a busy corner site in Farringdon\'s Exmouth Market. With glazed frontage on two sides ', 'EXL9WSCL');
INSERT INTO `custom_table` (`custom_id`, `custom_field`, `custom_data_type`, `custom_data`, `employee_id`) VALUES(55, 'Chinese Cuisine', 1, 'coffee roastery located on a busy corner site in Farringdon\'s Exmouth Market. With glazed frontage on two sides ', 'E3Y1WJMB');
INSERT INTO `custom_table` (`custom_id`, `custom_field`, `custom_data_type`, `custom_data`, `employee_id`) VALUES(56, 'Kitchen Lead', 1, 'coffee roastery located on a busy corner site in Farringdon\'s Exmouth Market. With glazed frontage on two sides ', 'EBK2UPRA');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
CREATE TABLE IF NOT EXISTS `department` (
  `dept_id` int NOT NULL AUTO_INCREMENT,
  `department_name` varchar(100) NOT NULL,
  `parent_id` int NOT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`dept_id`, `department_name`, `parent_id`) VALUES(8, 'ACCOUNTING', 0);
INSERT INTO `department` (`dept_id`, `department_name`, `parent_id`) VALUES(9, 'Human Resource', 0);
INSERT INTO `department` (`dept_id`, `department_name`, `parent_id`) VALUES(10, 'Delivery department', 0);
INSERT INTO `department` (`dept_id`, `department_name`, `parent_id`) VALUES(11, 'Garage and Parking', 0);
INSERT INTO `department` (`dept_id`, `department_name`, `parent_id`) VALUES(12, 'Manager', 0);
INSERT INTO `department` (`dept_id`, `department_name`, `parent_id`) VALUES(13, 'Restaurant', 0);
INSERT INTO `department` (`dept_id`, `department_name`, `parent_id`) VALUES(14, 'Waiter', 13);
INSERT INTO `department` (`dept_id`, `department_name`, `parent_id`) VALUES(15, 'Senior Accountant', 8);
INSERT INTO `department` (`dept_id`, `department_name`, `parent_id`) VALUES(16, 'Kitchen Manager', 12);
INSERT INTO `department` (`dept_id`, `department_name`, `parent_id`) VALUES(17, 'Chef', 13);
INSERT INTO `department` (`dept_id`, `department_name`, `parent_id`) VALUES(18, 'Sales Manager', 12);

-- --------------------------------------------------------

--
-- Table structure for table `duty_type`
--

DROP TABLE IF EXISTS `duty_type`;
CREATE TABLE IF NOT EXISTS `duty_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `duty_type`
--

INSERT INTO `duty_type` (`id`, `type_name`) VALUES(1, 'Full Time');
INSERT INTO `duty_type` (`id`, `type_name`) VALUES(2, 'Part Time');
INSERT INTO `duty_type` (`id`, `type_name`) VALUES(3, 'Contructual');
INSERT INTO `duty_type` (`id`, `type_name`) VALUES(4, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `email_config`
--

DROP TABLE IF EXISTS `email_config`;
CREATE TABLE IF NOT EXISTS `email_config` (
  `email_config_id` int NOT NULL AUTO_INCREMENT,
  `smtp_host` varchar(200) DEFAULT NULL,
  `smtp_port` varchar(200) DEFAULT NULL,
  `smtp_password` varchar(200) DEFAULT NULL,
  `protocol` text NOT NULL,
  `mailpath` text NOT NULL,
  `mailtype` text NOT NULL,
  `sender` text NOT NULL,
  `api_key` varchar(250) DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`email_config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `email_config`
--

INSERT INTO `email_config` (`email_config_id`, `smtp_host`, `smtp_port`, `smtp_password`, `protocol`, `mailpath`, `mailtype`, `sender`, `api_key`, `status`) VALUES(1, 'ssl://smtp.googlemail.com', '465', '123456', 'SMTP', '/usr/sbin/sendmail', 'html', 'ainalcse@gmail.com', '22c4c92a-e5a8-4293-b64c-befc9248521e', 1);

-- --------------------------------------------------------

--
-- Table structure for table `employee_benifit`
--

DROP TABLE IF EXISTS `employee_benifit`;
CREATE TABLE IF NOT EXISTS `employee_benifit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bnf_cl_code` varchar(100) NOT NULL,
  `bnf_cl_code_des` varchar(250) NOT NULL,
  `bnff_acural_date` date NOT NULL,
  `bnf_status` tinyint NOT NULL,
  `employee_id` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employee_history`
--

DROP TABLE IF EXISTS `employee_history`;
CREATE TABLE IF NOT EXISTS `employee_history` (
  `emp_his_id` int NOT NULL AUTO_INCREMENT,
  `employee_id` varchar(30) NOT NULL,
  `pos_id` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(32) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `alter_phone` varchar(30) DEFAULT NULL,
  `present_address` varchar(100) DEFAULT NULL,
  `parmanent_address` varchar(100) DEFAULT NULL,
  `picture` text,
  `degree_name` varchar(30) DEFAULT NULL,
  `university_name` varchar(50) DEFAULT NULL,
  `cgp` varchar(30) DEFAULT NULL,
  `passing_year` varchar(30) DEFAULT NULL,
  `company_name` varchar(30) DEFAULT NULL,
  `working_period` varchar(30) DEFAULT NULL,
  `duties` varchar(30) DEFAULT NULL,
  `supervisor` varchar(30) DEFAULT NULL,
  `signature` text,
  `is_admin` int NOT NULL DEFAULT '0',
  `dept_id` int DEFAULT NULL,
  `division_id` int NOT NULL,
  `maiden_name` varchar(50) DEFAULT NULL,
  `state` varchar(30) NOT NULL,
  `city` varchar(30) NOT NULL,
  `zip` int NOT NULL,
  `citizenship` int NOT NULL,
  `duty_type` int NOT NULL,
  `hire_date` date NOT NULL,
  `original_hire_date` date NOT NULL,
  `termination_date` date NOT NULL,
  `termination_reason` text NOT NULL,
  `voluntary_termination` int NOT NULL,
  `rehire_date` date NOT NULL,
  `rate_type` int NOT NULL,
  `rate` float NOT NULL,
  `pay_frequency` int NOT NULL,
  `pay_frequency_txt` varchar(50) NOT NULL,
  `hourly_rate2` float NOT NULL,
  `hourly_rate3` float NOT NULL,
  `home_department` varchar(100) NOT NULL,
  `department_text` varchar(100) NOT NULL,
  `class_code` varchar(50) DEFAULT NULL,
  `class_code_desc` varchar(100) DEFAULT NULL,
  `class_acc_date` date DEFAULT NULL,
  `class_status` tinyint DEFAULT NULL,
  `is_super_visor` int DEFAULT NULL,
  `super_visor_id` varchar(30) NOT NULL,
  `supervisor_report` text NOT NULL,
  `dob` date NOT NULL,
  `gender` int NOT NULL,
  `country` varchar(120) DEFAULT NULL,
  `marital_status` int NOT NULL,
  `ethnic_group` varchar(100) NOT NULL,
  `eeo_class_gp` varchar(100) NOT NULL,
  `ssn` varchar(50) DEFAULT NULL,
  `work_in_state` int NOT NULL,
  `live_in_state` int NOT NULL,
  `home_email` varchar(50) NOT NULL,
  `business_email` varchar(50) NOT NULL,
  `home_phone` varchar(30) NOT NULL,
  `business_phone` varchar(30) NOT NULL,
  `cell_phone` varchar(30) NOT NULL,
  `emerg_contct` varchar(30) NOT NULL,
  `emrg_h_phone` varchar(30) NOT NULL,
  `emrg_w_phone` varchar(30) NOT NULL,
  `emgr_contct_relation` varchar(50) NOT NULL,
  `alt_em_contct` varchar(30) NOT NULL,
  `alt_emg_h_phone` varchar(30) NOT NULL,
  `alt_emg_w_phone` varchar(30) NOT NULL,
  PRIMARY KEY (`emp_his_id`)
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee_history`
--

INSERT INTO `employee_history` (`emp_his_id`, `employee_id`, `pos_id`, `first_name`, `middle_name`, `last_name`, `email`, `phone`, `alter_phone`, `present_address`, `parmanent_address`, `picture`, `degree_name`, `university_name`, `cgp`, `passing_year`, `company_name`, `working_period`, `duties`, `supervisor`, `signature`, `is_admin`, `dept_id`, `division_id`, `maiden_name`, `state`, `city`, `zip`, `citizenship`, `duty_type`, `hire_date`, `original_hire_date`, `termination_date`, `termination_reason`, `voluntary_termination`, `rehire_date`, `rate_type`, `rate`, `pay_frequency`, `pay_frequency_txt`, `hourly_rate2`, `hourly_rate3`, `home_department`, `department_text`, `class_code`, `class_code_desc`, `class_acc_date`, `class_status`, `is_super_visor`, `super_visor_id`, `supervisor_report`, `dob`, `gender`, `country`, `marital_status`, `ethnic_group`, `eeo_class_gp`, `ssn`, `work_in_state`, `live_in_state`, `home_email`, `business_email`, `home_phone`, `business_phone`, `cell_phone`, `emerg_contct`, `emrg_h_phone`, `emrg_w_phone`, `emgr_contct_relation`, `alt_em_contct`, `alt_emg_h_phone`, `alt_emg_w_phone`) VALUES(162, 'EY2T1OWA', '4', 'jahangir', NULL, 'Ahmad', 'jahangir@gmail.com', '0195511016', NULL, NULL, NULL, './application/modules/employee/assets/images/2018-09-20/pra.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 15, 3, NULL, 'New York', 'New', 234234, 0, 1, '2018-09-19', '2018-09-19', '2018-09-19', 'sdfasdf', 2, '2018-09-26', 1, 323, 2, '234', 324234, 2523, '234', '234532', '', '', '1970-01-01', 1, NULL, '0', 'dfasdfsdf', '2018-09-19', 1, 'Bangladesh', 2, 'sunni', '234324', '23423', 1, 1, 'u@gmail.com', 'b@gmail.com', 'dsfsdf', 'dsfdsf', 'sdfsdf', '42342323', '234234', '234234', '2343', '234', '324234', '324324');
INSERT INTO `employee_history` (`emp_his_id`, `employee_id`, `pos_id`, `first_name`, `middle_name`, `last_name`, `email`, `phone`, `alter_phone`, `present_address`, `parmanent_address`, `picture`, `degree_name`, `university_name`, `cgp`, `passing_year`, `company_name`, `working_period`, `duties`, `supervisor`, `signature`, `is_admin`, `dept_id`, `division_id`, `maiden_name`, `state`, `city`, `zip`, `citizenship`, `duty_type`, `hire_date`, `original_hire_date`, `termination_date`, `termination_reason`, `voluntary_termination`, `rehire_date`, `rate_type`, `rate`, `pay_frequency`, `pay_frequency_txt`, `hourly_rate2`, `hourly_rate3`, `home_department`, `department_text`, `class_code`, `class_code_desc`, `class_acc_date`, `class_status`, `is_super_visor`, `super_visor_id`, `supervisor_report`, `dob`, `gender`, `country`, `marital_status`, `ethnic_group`, `eeo_class_gp`, `ssn`, `work_in_state`, `live_in_state`, `home_email`, `business_email`, `home_phone`, `business_phone`, `cell_phone`, `emerg_contct`, `emrg_h_phone`, `emrg_w_phone`, `emgr_contct_relation`, `alt_em_contct`, `alt_emg_h_phone`, `alt_emg_w_phone`) VALUES(165, '145454', '6', 'Hm', NULL, 'Isahaq', 'hmisahaq@gmail.com', '2344098234', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 14, 6, NULL, 'Alabama', 'deom', 3243, 0, 1, '2018-09-20', '2018-09-20', '2018-09-29', 'fsdf', 1, '2018-09-29', 1, 234, 3, '234', 0, 0, '', '', '', '', '1970-01-01', 1, NULL, '0', '324', '2018-09-29', 1, 'Bangladesh', 1, 'sdfsdf', '', '23423', 1, 1, '234', 'sd', '82309423', '', '234', '324234', '34242', '546456', '', '', '', '');
INSERT INTO `employee_history` (`emp_his_id`, `employee_id`, `pos_id`, `first_name`, `middle_name`, `last_name`, `email`, `phone`, `alter_phone`, `present_address`, `parmanent_address`, `picture`, `degree_name`, `university_name`, `cgp`, `passing_year`, `company_name`, `working_period`, `duties`, `supervisor`, `signature`, `is_admin`, `dept_id`, `division_id`, `maiden_name`, `state`, `city`, `zip`, `citizenship`, `duty_type`, `hire_date`, `original_hire_date`, `termination_date`, `termination_reason`, `voluntary_termination`, `rehire_date`, `rate_type`, `rate`, `pay_frequency`, `pay_frequency_txt`, `hourly_rate2`, `hourly_rate3`, `home_department`, `department_text`, `class_code`, `class_code_desc`, `class_acc_date`, `class_status`, `is_super_visor`, `super_visor_id`, `supervisor_report`, `dob`, `gender`, `country`, `marital_status`, `ethnic_group`, `eeo_class_gp`, `ssn`, `work_in_state`, `live_in_state`, `home_email`, `business_email`, `home_phone`, `business_phone`, `cell_phone`, `emerg_contct`, `emrg_h_phone`, `emrg_w_phone`, `emgr_contct_relation`, `alt_em_contct`, `alt_emg_h_phone`, `alt_emg_w_phone`) VALUES(166, 'EQLAJFUW', '6', 'Ainal', '', 'Haque', 'ainal@gmail.com', '01715234991', NULL, NULL, NULL, './application/modules/hrm/assets/images/2019-01-22/u.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 14, 0, NULL, 'Alabama', '', 0, 1, 1, '2018-11-12', '2018-11-12', '2018-11-12', '', 1, '2018-11-12', 1, 100, 1, '', 0, 0, '', '', '', '', '2018-11-12', 1, NULL, '0', '', '2018-11-12', 1, 'Bangladesh', 1, '', '', '3425', 1, 1, '', '', '017123657332', '', '017123657332', '017123657332', '017123657332', '017123657332', '', '', '', '');
INSERT INTO `employee_history` (`emp_his_id`, `employee_id`, `pos_id`, `first_name`, `middle_name`, `last_name`, `email`, `phone`, `alter_phone`, `present_address`, `parmanent_address`, `picture`, `degree_name`, `university_name`, `cgp`, `passing_year`, `company_name`, `working_period`, `duties`, `supervisor`, `signature`, `is_admin`, `dept_id`, `division_id`, `maiden_name`, `state`, `city`, `zip`, `citizenship`, `duty_type`, `hire_date`, `original_hire_date`, `termination_date`, `termination_reason`, `voluntary_termination`, `rehire_date`, `rate_type`, `rate`, `pay_frequency`, `pay_frequency_txt`, `hourly_rate2`, `hourly_rate3`, `home_department`, `department_text`, `class_code`, `class_code_desc`, `class_acc_date`, `class_status`, `is_super_visor`, `super_visor_id`, `supervisor_report`, `dob`, `gender`, `country`, `marital_status`, `ethnic_group`, `eeo_class_gp`, `ssn`, `work_in_state`, `live_in_state`, `home_email`, `business_email`, `home_phone`, `business_phone`, `cell_phone`, `emerg_contct`, `emrg_h_phone`, `emrg_w_phone`, `emgr_contct_relation`, `alt_em_contct`, `alt_emg_h_phone`, `alt_emg_w_phone`) VALUES(168, 'E97E9SJT', '6', 'Manik ', '', 'Hassan', 'manik@gmail.com', '01913251229', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 14, 0, NULL, 'Alabama', 'Dhaka', 143325, 1, 1, '2019-01-01', '2019-01-01', '2021-01-31', 'sdfs', 1, '2022-01-09', 1, 100, 1, '', 0, 0, '', '', '', '', '2019-01-09', 1, NULL, '0', '', '1970-01-01', 1, 'Bangladesh', 1, '', '', 'e4dfg', 1, 1, '', '', '34353636', '', '3636', '345345', '3453', '3453', '', '', '', '');
INSERT INTO `employee_history` (`emp_his_id`, `employee_id`, `pos_id`, `first_name`, `middle_name`, `last_name`, `email`, `phone`, `alter_phone`, `present_address`, `parmanent_address`, `picture`, `degree_name`, `university_name`, `cgp`, `passing_year`, `company_name`, `working_period`, `duties`, `supervisor`, `signature`, `is_admin`, `dept_id`, `division_id`, `maiden_name`, `state`, `city`, `zip`, `citizenship`, `duty_type`, `hire_date`, `original_hire_date`, `termination_date`, `termination_reason`, `voluntary_termination`, `rehire_date`, `rate_type`, `rate`, `pay_frequency`, `pay_frequency_txt`, `hourly_rate2`, `hourly_rate3`, `home_department`, `department_text`, `class_code`, `class_code_desc`, `class_acc_date`, `class_status`, `is_super_visor`, `super_visor_id`, `supervisor_report`, `dob`, `gender`, `country`, `marital_status`, `ethnic_group`, `eeo_class_gp`, `ssn`, `work_in_state`, `live_in_state`, `home_email`, `business_email`, `home_phone`, `business_phone`, `cell_phone`, `emerg_contct`, `emrg_h_phone`, `emrg_w_phone`, `emgr_contct_relation`, `alt_em_contct`, `alt_emg_h_phone`, `alt_emg_w_phone`) VALUES(177, 'EZR0A9IB', '1', 'Di', NULL, 'Maria', 'dimaria@gmail.com', '25423456272', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 17, 0, NULL, 'Oklahoma', '', 0, 1, 1, '2021-07-01', '2021-07-01', '2022-02-28', '', 1, '2022-02-28', 1, 200, 1, '', 0, 0, '', '', NULL, NULL, NULL, NULL, NULL, '1', '', '2000-09-01', 1, 'United State', 1, '', '', '', 1, 1, '', '', '457568234', '', '2323223', '366879', '889995454', '234245654', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `employee_performance`
--

DROP TABLE IF EXISTS `employee_performance`;
CREATE TABLE IF NOT EXISTS `employee_performance` (
  `emp_per_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `employee_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `note` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `date` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `note_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `number_of_star` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `updated_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`emp_per_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `employee_salary_payment`
--

DROP TABLE IF EXISTS `employee_salary_payment`;
CREATE TABLE IF NOT EXISTS `employee_salary_payment` (
  `emp_sal_pay_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `employee_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `total_salary` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `total_working_minutes` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `working_period` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `payment_due` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `payment_date` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `paid_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`emp_sal_pay_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `employee_salary_setup`
--

DROP TABLE IF EXISTS `employee_salary_setup`;
CREATE TABLE IF NOT EXISTS `employee_salary_setup` (
  `e_s_s_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `employee_id` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `sal_type` varchar(30) NOT NULL,
  `salary_type_id` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `amount` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `create_date` date DEFAULT NULL,
  `update_date` datetime(6) DEFAULT NULL,
  `update_id` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `gross_salary` float NOT NULL,
  PRIMARY KEY (`e_s_s_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `employee_sal_pay_type`
--

DROP TABLE IF EXISTS `employee_sal_pay_type`;
CREATE TABLE IF NOT EXISTS `employee_sal_pay_type` (
  `emp_sal_pay_type_id` int UNSIGNED NOT NULL,
  `payment_period` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `emp_attendance`
--

DROP TABLE IF EXISTS `emp_attendance`;
CREATE TABLE IF NOT EXISTS `emp_attendance` (
  `att_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `employee_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `date` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `sign_in` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sign_out` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `staytime` time DEFAULT NULL,
  PRIMARY KEY (`att_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `expense`
--

DROP TABLE IF EXISTS `expense`;
CREATE TABLE IF NOT EXISTS `expense` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `type` varchar(100) NOT NULL,
  `voucher_no` varchar(50) NOT NULL,
  `amount` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `expense_item`
--

DROP TABLE IF EXISTS `expense_item`;
CREATE TABLE IF NOT EXISTS `expense_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `expense_item_name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `foodvariable`
--

DROP TABLE IF EXISTS `foodvariable`;
CREATE TABLE IF NOT EXISTS `foodvariable` (
  `availableID` int NOT NULL AUTO_INCREMENT,
  `foodid` int NOT NULL,
  `availtime` varchar(50) NOT NULL,
  `availday` varchar(30) NOT NULL,
  `is_active` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`availableID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gender`
--

DROP TABLE IF EXISTS `gender`;
CREATE TABLE IF NOT EXISTS `gender` (
  `id` int NOT NULL AUTO_INCREMENT,
  `gender_name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gender`
--

INSERT INTO `gender` (`id`, `gender_name`) VALUES(1, 'Male');
INSERT INTO `gender` (`id`, `gender_name`) VALUES(2, 'Female');
INSERT INTO `gender` (`id`, `gender_name`) VALUES(3, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `grand_loan`
--

DROP TABLE IF EXISTS `grand_loan`;
CREATE TABLE IF NOT EXISTS `grand_loan` (
  `loan_id` int NOT NULL AUTO_INCREMENT,
  `employee_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `permission_by` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `loan_details` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `amount` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `interest_rate` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `installment` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `installment_period` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `repayment_amount` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `date_of_approve` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `repayment_start_date` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created_by` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `updated_by` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `loan_status` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`loan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
CREATE TABLE IF NOT EXISTS `ingredients` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ingredient_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `uom_id` int NOT NULL,
  `stock_qty` decimal(10,2) NOT NULL DEFAULT '0.00',
  `min_stock` decimal(10,2) NOT NULL DEFAULT '1.00',
  `status` int NOT NULL DEFAULT '0' COMMENT '0=kitchenitems,1=otheritems',
  `is_active` tinyint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_category`
--

DROP TABLE IF EXISTS `item_category`;
CREATE TABLE IF NOT EXISTS `item_category` (
  `CategoryID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `CategoryImage` varchar(255) DEFAULT NULL,
  `Position` int DEFAULT NULL,
  `CategoryIsActive` int DEFAULT NULL,
  `offerstartdate` date DEFAULT '0000-00-00',
  `offerendate` date NOT NULL DEFAULT '0000-00-00',
  `isoffer` int DEFAULT '0',
  `parentid` int DEFAULT '0',
  `UserIDInserted` int NOT NULL DEFAULT '0',
  `UserIDUpdated` int NOT NULL DEFAULT '0',
  `UserIDLocked` int NOT NULL DEFAULT '0',
  `DateInserted` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DateUpdated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DateLocked` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`CategoryID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `item_foods`
--

DROP TABLE IF EXISTS `item_foods`;
CREATE TABLE IF NOT EXISTS `item_foods` (
  `ProductsID` int NOT NULL AUTO_INCREMENT,
  `CategoryID` int NOT NULL,
  `ProductName` varchar(255) DEFAULT NULL,
  `ProductImage` varchar(200) DEFAULT NULL,
  `bigthumb` varchar(255) NOT NULL,
  `medium_thumb` varchar(255) NOT NULL,
  `small_thumb` varchar(255) NOT NULL,
  `component` text,
  `descrip` text,
  `itemnotes` varchar(255) DEFAULT NULL,
  `menutype` varchar(25) DEFAULT NULL,
  `productvat` decimal(10,3) DEFAULT '0.000',
  `special` int NOT NULL DEFAULT '0',
  `OffersRate` int NOT NULL DEFAULT '0' COMMENT '1=offer rate',
  `offerIsavailable` int NOT NULL DEFAULT '0' COMMENT '1=offer available,0=No Offer',
  `offerstartdate` date DEFAULT '0000-00-00',
  `offerendate` date DEFAULT '0000-00-00',
  `Position` int DEFAULT NULL,
  `kitchenid` int NOT NULL,
  `isgroup` int DEFAULT NULL,
  `is_customqty` int DEFAULT '0',
  `cookedtime` time NOT NULL DEFAULT '00:00:00',
  `ProductsIsActive` int DEFAULT NULL,
  `UserIDInserted` int NOT NULL DEFAULT '0',
  `UserIDUpdated` int NOT NULL DEFAULT '0',
  `UserIDLocked` int NOT NULL DEFAULT '0',
  `DateInserted` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DateUpdated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DateLocked` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `tax0` text,
  `tax1` text,
  PRIMARY KEY (`ProductsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `job_advertisement`
--

DROP TABLE IF EXISTS `job_advertisement`;
CREATE TABLE IF NOT EXISTS `job_advertisement` (
  `job_adv_id` int UNSIGNED NOT NULL,
  `pos_id` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `adv_circular_date` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `circular_dadeline` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `adv_file` tinytext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `adv_details` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
CREATE TABLE IF NOT EXISTS `language` (
  `id` int NOT NULL AUTO_INCREMENT,
  `phrase` varchar(100) NOT NULL,
  `english` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phrase` (`phrase`)
) ENGINE=InnoDB AUTO_INCREMENT=2340 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(2, 'login', 'Login');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(3, 'email', 'Email Address');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(4, 'password', 'Password');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(5, 'reset', 'Reset');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(6, 'dashboard', 'Dashboard');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(7, 'home', 'Home');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(8, 'profile', 'Profile');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(9, 'profile_setting', 'Profile Setting');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(10, 'firstname', 'First Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(11, 'lastname', 'Last Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(12, 'about', 'About');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(13, 'preview', 'Preview');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(14, 'image', 'Image');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(15, 'save', 'Save');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(16, 'upload_successfully', 'Upload Successfully!');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(17, 'user_added_successfully', 'User Added Successfully!');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(18, 'please_try_again', 'Please Try Again...');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(19, 'inbox_message', 'Inbox Messages');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(20, 'sent_message', 'Sent Message');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(21, 'message_details', 'Message Details');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(22, 'new_message', 'New Message');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(23, 'receiver_name', 'Receiver Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(24, 'sender_name', 'Sender Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(25, 'subject', 'Subject');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(26, 'message', 'Message');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(27, 'message_sent', 'Message Sent!');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(28, 'ip_address', 'IP Address');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(29, 'last_login', 'Last Login');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(30, 'last_logout', 'Last Logout');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(31, 'status', 'Status');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(33, 'send', 'Send');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(34, 'date', 'Date');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(35, 'action', 'Action');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(36, 'sl_no', 'SL No.');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(37, 'are_you_sure', 'Are You Sure ? ');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(38, 'application_setting', 'Application Setting');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(39, 'application_title', 'Application Title');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(41, 'phone', 'Phone');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(42, 'favicon', 'Favicon');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(43, 'logo', 'Logo');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(44, 'language', 'Language');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(45, 'left_to_right', 'Left To Right');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(46, 'right_to_left', 'Right To Left');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(47, 'footer_text', 'Footer Text');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(48, 'site_align', 'Application Alignment');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(49, 'welcome_back', 'Welcome Back!');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(50, 'please_contact_with_admin', 'Please Contact With Admin');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(51, 'incorrect_email_or_password', 'Incorrect Email/Password');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(52, 'select_option', 'Select Option');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(53, 'ftp_setting', 'Data Synchronize [FTP Setting]');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(54, 'hostname', 'Host Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(55, 'username', 'User Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(56, 'ftp_port', 'FTP Port');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(57, 'ftp_debug', 'FTP Debug');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(58, 'project_root', 'Project Root');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(59, 'update_successfully', 'Update Successfully');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(60, 'save_successfully', 'Save Successfully!');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(61, 'delete_successfully', 'Delete Successfully!');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(62, 'internet_connection', 'Internet Connection');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(63, 'ok', 'Okay');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(64, 'not_available', 'Not Available');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(65, 'available', 'Available');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(66, 'outgoing_file', 'Outgoing File');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(67, 'incoming_file', 'Incoming File');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(68, 'data_synchronize', 'Data Synchronize');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(69, 'unable_to_upload_file_please_check_configuration', 'Unable to upload file! please check configuration');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(70, 'please_configure_synchronizer_settings', 'Please configure synchronizer settings');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(71, 'download_successfully', 'Download Successfully');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(72, 'unable_to_download_file_please_check_configuration', 'Unable to download file! please check configuration');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(73, 'data_import_first', 'Data Import First');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(74, 'data_import_successfully', 'Data Import Successfully!');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(75, 'unable_to_import_data_please_check_config_or_sql_file', 'Unable to Import Data! Please Check Configuration / SQL File.');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(76, 'download_data_from_server', 'Download Data from Server');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(77, 'data_import_to_database', 'Data Import To Database');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(79, 'data_upload_to_server', 'Data Upload to Server');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(81, 'ooops_something_went_wrong', ' Ops Something Went Wrong...');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(82, 'module_permission_list', 'Module Permission List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(83, 'user_permission', 'User Permission');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(84, 'add_module_permission', 'Add Module Permission');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(85, 'module_permission_added_successfully', 'Module Permission Added Successfully!');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(86, 'update_module_permission', 'Update Module Permission');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(87, 'download', 'Download');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(88, 'module_name', 'Module Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(89, 'create', 'Create');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(90, 'read', 'Read');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(91, 'update', 'Update');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(92, 'delete', 'Delete');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(93, 'module_list', 'Module List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(94, 'add_module', 'Add Module');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(95, 'directory', 'Module Directory');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(96, 'description', 'Description');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(97, 'image_upload_successfully', 'Image Upload Successfully!');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(98, 'module_added_successfully', 'Module Added Successfully');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(99, 'inactive', 'Inactive');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(100, 'active', 'Active');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(101, 'user_list', 'User List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(102, 'see_all_message', 'See All Messages');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(103, 'setting', 'Setting');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(104, 'logout', 'Logout');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(105, 'admin', 'Admin');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(106, 'add_user', 'Add User');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(107, 'user', 'User');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(108, 'module', 'Module');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(109, 'new', 'New');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(110, 'inbox', 'Inbox');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(111, 'sent', 'Sent');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(112, 'synchronize', 'Synchronize');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(113, 'data_synchronizer', 'Data Synchronizer');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(114, 'module_permission', 'Module Permission');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(115, 'backup_now', 'Backup Now!');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(116, 'restore_now', 'Restore Now!');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(117, 'backup_and_restore', 'Backup and Restore');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(118, 'captcha', 'Captcha Word');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(119, 'database_backup', 'Database Backup');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(120, 'restore_successfully', 'Restore Successfully');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(121, 'backup_successfully', 'Backup Successfully');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(122, 'filename', 'File Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(123, 'file_information', 'File Information');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(125, 'backup_date', 'Backup Date');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(126, 'overwrite', 'Overwrite');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(127, 'invalid_file', 'Invalid File!');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(128, 'invalid_module', 'Invalid Module');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(129, 'remove_successfully', 'Remove Successfully!');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(130, 'install', 'Install');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(131, 'uninstall', 'Uninstall');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(132, 'tables_are_not_available_in_database', 'Tables are not available in database.sql');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(133, 'no_tables_are_registered_in_config', 'No tables are registered in config.php');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(134, 'enquiry', 'Enquiry');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(135, 'read_unread', 'Read/Unread');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(136, 'enquiry_information', 'Enquiry Information');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(137, 'user_agent', 'User Agent');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(138, 'checked_by', 'Checked By');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(139, 'new_enquiry', 'New Enquiry');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(140, 'crud', 'Crud');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(141, 'view', 'View');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(144, 'ph', 'Phone');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(145, 'cid', 'SL No');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(146, 'view_atn', 'Attendance View');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(147, 'mang', 'Employee Management');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(148, 'designation', 'Designation');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(149, 'test', 'Test');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(150, 'sl', 'SL');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(151, 'bdtask', 'BDTASK');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(152, 'practice', 'Practice');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(153, 'branch_name', 'Branch Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(154, 'chairman_name', 'Chairman');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(155, 'b_photo', 'Photo');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(156, 'b_address', 'Address');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(157, 'position', 'Designation');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(158, 'advertisement', 'Advertisement');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(159, 'position_name', 'Position');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(160, 'position_details', 'Details');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(161, 'circularprocess', 'Recruitment');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(162, 'pos_id', 'Position');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(163, 'adv_circular_date', 'Publish Date');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(164, 'circular_dadeline', 'Deadline');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(165, 'adv_file', 'Documents');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(166, 'adv_details', 'Details');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(167, 'attendance', 'Attendance');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(168, 'employee', 'Employee');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(169, 'emp_id', 'Employee Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(170, 'sign_in', 'Sign In');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(171, 'sign_out', 'Sign Out');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(172, 'staytime', 'Stay Time');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(173, 'abc', 'abc');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(174, 'first_name', 'First Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(175, 'last_name', 'Last Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(176, 'alter_phone', 'Alternative Phone');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(177, 'present_address', 'Present Address');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(178, 'parmanent_address', 'Permanent Address');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(179, 'candidateinfo', 'Candidate Info');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(180, 'add_advertisement', 'Add Advertisement');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(181, 'advertisement_list', 'Manage Advertisement ');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(182, 'candidate_basic_info', 'Candidate Information');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(183, 'can_basicinfo_list', 'Manage Candidate');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(184, 'add_canbasic_info', 'Add New Candidate');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(185, 'candidate_education_info', 'Candidate Educational Info');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(186, 'can_educationinfo_list', 'Candidate Edu Info List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(187, 'add_edu_info', 'Add Educational Info');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(188, 'can_id', 'Candidate Id');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(189, 'degree_name', 'Obtained Degree');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(190, 'university_name', 'University');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(191, 'cgp', 'CGPA');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(192, 'comments', 'Comments');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(193, 'signature', 'Signature');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(194, 'candidate_workexperience', 'Candidate Work Experience');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(195, 'can_workexperience_list', 'Work Experience List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(196, 'add_can_experience', 'Add Work Experience');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(197, 'company_name', 'Company Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(198, 'working_period', 'Working Period');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(199, 'duties', 'Duties');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(200, 'supervisor', 'Supervisor');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(201, 'candidate_workexpe', 'Candidate Work Experience');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(202, 'candidate_shortlist', 'Candidate Shortlist');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(203, 'shortlist_view', 'Manage Shortlist');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(204, 'add_shortlist', 'Add Shortlist');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(205, 'date_of_shortlist', 'Shortlist Date');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(206, 'interview_date', 'Interview Date');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(207, 'submit', 'Submit');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(208, 'candidate_id', 'Your ID');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(209, 'job_adv_id', 'Job Position');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(210, 'sequence', 'Sequence');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(211, 'candidate_interview', 'Interview');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(212, 'interview_list', 'Interview list');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(213, 'add_interview', 'Add interview');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(214, 'interviewer_id', 'Interviewer');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(215, 'interview_marks', 'Viva Marks');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(216, 'written_total_marks', 'Written Total Marks');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(217, 'mcq_total_marks', 'MCQ Total Marks');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(218, 'recommandation', 'Recommendation');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(219, 'selection', 'Selection');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(220, 'details', 'Details');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(221, 'candidate_selection', 'Candidate Selection');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(222, 'selection_list', 'Selection List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(223, 'add_selection', 'Add Selection');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(224, 'employee_id', 'Employee Id');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(225, 'position_id', '1');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(226, 'selection_terms', 'Selection Terms');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(227, 'total_marks', 'Total Marks');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(228, 'photo', 'Picture');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(229, 'your_id', 'Your ID');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(230, 'change_image', 'Change Photo');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(231, 'picture', 'Photograph');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(232, 'ad', 'Add');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(233, 'write_y_p_info', 'Write Your Personal Information');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(234, 'emp_position', 'Employee Position');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(235, 'add_pos', 'Add Position');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(236, 'list_pos', 'List of Position');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(237, 'emp_salary_stup', 'Employee Salary Setup');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(238, 'add_salary_stup', 'Add Salary Setup');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(239, 'list_salarystup', 'List of Salary Setup');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(240, 'emp_sal_name', 'Salary Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(241, 'emp_sal_type', 'Salary Type');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(242, 'emp_performance', 'Employee Performance');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(243, 'add_performance', 'Add Performance');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(244, 'list_performance', 'List of Performance');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(245, 'note', 'Note');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(246, 'note_by', 'Note By');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(247, 'number_of_star', 'Number of Star');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(248, 'updated_by', 'Updated By');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(249, 'emp_sal_payment', 'Manage Employee Salary');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(250, 'add_payment', 'Add Payment');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(251, 'list_payment', 'List of payment');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(252, 'total_salary', 'Total Salary');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(253, 'total_working_minutes', 'Working Hour');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(254, 'payment_due', 'Payment Type');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(255, 'payment_date', 'Date');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(256, 'paid_by', 'Paid By');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(257, 'view_employee_payment', 'Employee Payment List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(258, 'sal_payment_type', 'Salary Payment Type');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(259, 'add_payment_type', 'Add Payment Type');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(260, 'list_payment_type', 'List of Payment Type');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(261, 'payment_period', 'Payment Period');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(262, 'payment_type', 'Payment Type');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(263, 'time', 'Punch Time');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(264, 'shift', 'Shift');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(265, 'location', 'Location');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(266, 'logtype', 'Log Type');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(267, 'branch', 'Location');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(268, 'student', 'Students');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(269, 'csv', 'CSV');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(270, 'save_successfull', 'Your Data Save Successfully');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(271, 'successfully_updated', 'Your Data Successfully Updated');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(272, 'atn_form', 'Attendance Form');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(273, 'atn_report', 'Attendance Report');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(274, 'end_date', 'To');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(275, 'start_date', 'From');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(276, 'done', 'Done');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(277, 'employee_id_se', 'Write Employee Id or name here ');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(278, 'attendance_repor', 'Attendance Report');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(279, 'e_time', 'End Time');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(280, 's_time', 'Start Time');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(281, 'atn_datewiserer', 'Date Wise Report');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(282, 'atn_report_id', 'Date And Id base Report');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(283, 'atn_report_time', 'Date And Time report');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(284, 'payroll', 'Payroll');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(285, 'loan', 'Loan');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(286, 'loan_grand', 'Grant Loan');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(287, 'add_loan', 'Add Loan');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(288, 'loan_list', 'List of Loan');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(289, 'loan_details', 'Loan Details');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(290, 'amount', 'Amount');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(291, 'interest_rate', 'Interest Percentage');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(292, 'installment_period', 'Installment Period');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(293, 'repayment_amount', 'Repayment Total');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(294, 'date_of_approve', 'Approved Date');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(295, 'repayment_start_date', 'Repayment From');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(296, 'permission_by', 'Permitted By');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(297, 'grand', 'Grand');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(298, 'installment', 'Installment');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(299, 'loan_status', 'Status');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(300, 'installment_period_m', 'Installment Period in Month');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(301, 'successfully_inserted', 'Your loan Successfully Granted');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(302, 'loan_installment', 'Loan Installment');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(303, 'add_installment', 'Add Installment');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(304, 'installment_list', 'List of Installment');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(305, 'loan_id', 'Loan No');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(306, 'installment_amount', 'Installment Amount');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(307, 'payment', 'Payment');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(308, 'received_by', 'Receiver');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(309, 'installment_no', 'Install No');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(310, 'notes', 'Notes');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(311, 'paid', 'Paid');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(312, 'loan_report', 'Loan Report');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(313, 'e_r_id', 'Enter Your Employee ID');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(314, 'leave', 'Leave');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(315, 'add_leave', 'Add Leave');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(316, 'list_leave', 'List of Leave');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(317, 'dayname', 'Weekly Leave Day');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(318, 'holiday', 'Holiday');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(319, 'list_holiday', 'List of Holidays');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(320, 'no_of_days', 'Number of Days');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(321, 'holiday_name', 'Holiday Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(322, 'set', 'Set');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(323, 'tax', 'Tax');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(324, 'tax_setup', 'Tax Setup');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(325, 'add_tax_setup', 'Add Tax Setup');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(326, 'list_tax_setup', 'List of Tax setup');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(327, 'tax_collection', 'Tax collection');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(328, 'start_amount', 'Start Amount');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(329, 'end_amount', 'End Amount');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(330, 'rate', 'Tax Rate');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(331, 'date_start', 'Date Start');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(332, 'amount_tax', 'Tax Amount');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(333, 'collection_by', 'Collection By');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(334, 'date_end', 'Date End');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(335, 'income_net_period', 'Income  Net period');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(336, 'default_amount', 'Default Amount');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(337, 'add_sal_type', 'Add Salary Type');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(338, 'list_sal_type', 'Salary Type List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(339, 'salary_type_setup', 'Salary Type Setup');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(340, 'salary_setup', 'Salary Setup');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(341, 'add_sal_setup', 'Add Salary Setup');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(342, 'list_sal_setup', 'Salary Setup List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(343, 'salary_type_id', 'Salary Type');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(344, 'salary_generate', 'Salary Generate');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(345, 'add_sal_generate', 'Generate Now');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(346, 'list_sal_generate', 'Generated Salary List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(347, 'gdate', 'Generate Date');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(348, 'start_dates', 'Start Date');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(349, 'generate', 'Generate ');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(350, 'successfully_saved_saletup', ' Set up Successful');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(351, 's_date', 'Start Date');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(352, 'e_date', 'End Date');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(353, 'salary_payable', 'Payable Salary');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(354, 'tax_manager', 'Tax');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(355, 'generate_by', 'Generated By');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(356, 'successfully_paid', 'Successfully Paid');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(357, 'direct_empl', ' Employee');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(358, 'add_emp_info', 'Add New Employee');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(359, 'new_empl_pos', 'Add New Employee Position');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(360, 'manage', 'Manage Designation');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(361, 'ad_advertisement', 'ADD POSITION');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(362, 'moduless', 'Modules');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(363, 'next', 'Next');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(364, 'finish', 'Finish');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(365, 'request', 'Request');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(366, 'successfully_saved', 'Your Data Successfully Saved');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(367, 'sal_type', 'Salary Type');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(368, 'sal_name', 'Salary Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(369, 'leave_application', 'Leave Application');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(370, 'apply_strt_date', 'Application Start Date');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(371, 'apply_end_date', 'Application End date');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(372, 'leave_aprv_strt_date', 'Approved Start Date');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(373, 'leave_aprv_end_date', 'Approved End Date');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(374, 'num_aprv_day', 'Approved Day');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(375, 'reason', 'Reason');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(376, 'approve_date', 'Approved Date');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(377, 'leave_type', 'Leave Type');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(378, 'apply_hard_copy', 'Application Hard Copy');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(379, 'approved_by', 'Approved By');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(380, 'notice', 'Notice Board');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(381, 'noticeboard', 'Notice Board');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(382, 'notice_descriptiion', 'Description');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(383, 'notice_date', 'Notice Date');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(384, 'notice_type', 'Notice Type');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(385, 'notice_by', 'Notice By');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(386, 'notice_attachment', 'Attachment');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(387, 'account_name', 'Account Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(388, 'account_type', 'Account Type');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(389, 'account_id', 'Account Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(390, 'transaction_description', 'Description');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(391, 'payment_id', 'Payment');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(392, 'create_by_id', 'Created By');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(393, 'account', 'Account');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(394, 'account_add', 'Add Account');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(395, 'account_transaction', 'Transaction');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(396, 'award', 'Award');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(397, 'new_award', 'New Award');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(398, 'award_name', 'Award Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(399, 'aw_description', 'Award Description');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(400, 'awr_gift_item', 'Gift Item');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(401, 'awarded_by', 'Award By');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(402, 'employee_name', 'Employee Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(403, 'employee_list', 'Atn List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(404, 'department', 'Department');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(405, 'department_name', 'Department Name ');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(406, 'clockout', 'Clock Out');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(407, 'se_account_id', 'Select Account Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(408, 'division', 'Division');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(409, 'add_division', 'Add Division');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(410, 'update_division', 'Update Division');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(411, 'division_name', 'Division Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(412, 'division_list', 'Manage Division ');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(413, 'designation_list', 'Designation List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(414, 'manage_designation', 'Manage Designation');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(415, 'add_designation', 'Add Designation');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(416, 'select_division', 'Select Division');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(417, 'select_designation', 'Select Designation');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(418, 'asset', 'Asset');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(419, 'asset_type', 'Asset Type');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(420, 'add_type', 'Add Type');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(421, 'type_list', 'Type List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(422, 'type_name', 'Type Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(423, 'select_type', 'Select Type');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(424, 'equipment_name', 'Equipment Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(425, 'model', 'Model');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(426, 'serial_no', 'Serial No');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(427, 'equipment', 'Equipment');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(428, 'add_equipment', 'Add Equipment');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(429, 'equipment_list', 'Equipment List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(430, 'type', 'Type');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(431, 'equipment_maping', 'Equipment Mapping');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(432, 'add_maping', 'Add Mapping');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(433, 'maping_list', 'Mapping List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(434, 'update_equipment', 'Update Equipment');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(435, 'select_employee', 'Select Employee');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(436, 'select_equipment', 'Select Equipment');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(437, 'basic_info', 'Basic Information');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(438, 'middle_name', 'Middle Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(441, 'zip_code', 'Zip Code');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(442, 'maiden_name', 'Maiden Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(443, 'add_employee', 'Add Employee');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(444, 'manage_employee', 'Manage Employee');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(445, 'employee_update_form', 'Employee Update Form');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(446, 'what_you_search', 'What You Search');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(448, 'duty_type', 'Duty Type');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(449, 'hire_date', 'Hire Date');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(450, 'original_h_date', 'Original Hire Date');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(451, 'voluntary_termination', 'Voluntary Termination');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(452, 'termination_reason', 'Termination Reason');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(453, 'termination_date', 'Termination Date');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(454, 're_hire_date', 'Re Hire Date');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(455, 'rate_type', 'Rate Type');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(456, 'pay_frequency', 'Pay Frequency');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(457, 'pay_frequency_txt', 'Pay Frequency Text');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(458, 'hourly_rate2', 'Hourly Rate2');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(459, 'hourly_rate3', 'Hourly Rate3');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(460, 'home_department', 'Home Department');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(461, 'department_text', 'Department Text');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(462, 'benifit_class_code', 'Benefit Class code');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(463, 'benifit_desc', 'Benefit Description');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(464, 'benifit_acc_date', 'Benefit Accrual Date');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(465, 'benifit_sta', 'Benefit Status');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(466, 'super_visor_name', 'Supervisor Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(467, 'is_super_visor', 'Is Supervisor');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(468, 'supervisor_report', 'Supervisor Report');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(469, 'dob', 'Date of Birth');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(470, 'gender', 'Gender');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(471, 'marital_stats', 'Marital Status');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(472, 'ethnic_group', 'Ethnic Group');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(473, 'eeo_class_gp', 'EEO Class');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(474, 'ssn', 'SSN');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(475, 'work_in_state', 'Work in State');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(476, 'live_in_state', 'Live in State');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(477, 'home_email', 'Home Email');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(478, 'business_email', 'Business Email');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(479, 'home_phone', 'Home Phone');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(480, 'business_phone', 'Business Phone');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(481, 'cell_phone', 'Cell Phone');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(482, 'emerg_contct', 'Emergency Contact');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(483, 'emerg_home_phone', 'Emergency Home Phone');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(484, 'emrg_w_phone', 'Emergency Work Phone');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(485, 'emer_con_rela', 'Emergency Contact Relation');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(486, 'alt_em_contct', 'Alter Emergency Contact');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(487, 'alt_emg_h_phone', 'Alt Emergency Home Phone');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(488, 'alt_emg_w_phone', 'Alt Emergency  Work Phone');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(489, 'reports', 'Reports');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(490, 'employee_reports', 'Employee Reports');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(491, 'demographic_report', 'Demographic Report');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(492, 'posting_report', 'Positional Report');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(493, 'custom_report', 'Custom Report');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(494, 'benifit_report', 'Benefit Report');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(495, 'demographic_info', 'Demographical Information');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(496, 'positional_info', 'Positional Info');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(497, 'assets_info', 'Assets Information');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(498, 'custom_field', 'Custom Field');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(499, 'custom_value', 'Custom Data');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(500, 'adhoc_report', 'Adhoc Report');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(501, 'asset_assignment', 'Asset Assignment');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(502, 'assign_asset', 'Assign Assets');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(503, 'assign_list', 'Assign List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(504, 'update_assign', 'Update Assign');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(505, 'citizenship', 'Citizenship');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(506, 'class_sta', 'Class status');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(507, 'class_acc_date', 'Class Accrual date');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(508, 'class_descript', 'Class Description');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(509, 'class_code', 'Class Code');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(510, 'return_asset', 'Return Assets');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(511, 'dept_id', 'Department ID');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(512, 'parent_id', 'Parent ID');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(513, 'equipment_id', 'Equipment ID');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(514, 'issue_date', 'Issue Date');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(515, 'damarage_desc', 'Damarage Description');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(516, 'return_date', 'Return Date');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(517, 'is_assign', 'Is Assign');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(518, 'emp_his_id', 'Employee History ID');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(519, 'damarage_descript', 'Damage Description');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(520, 'return', 'Return');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(521, 'return_successfull', 'Return Successful');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(522, 'return_list', 'Return List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(523, 'custom_data', 'Custom Data');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(524, 'passing_year', 'Passing Year');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(525, 'is_admin', 'Is Admin');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(526, 'zip', 'Zip Code');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(527, 'original_hire_date', 'Original Hire Date');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(528, 'rehire_date', 'Rehire Date');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(529, 'class_code_desc', 'Class Code Description');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(530, 'class_status', 'Class Status');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(531, 'super_visor_id', 'Supervisor ID');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(532, 'marital_status', 'Marital Status');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(533, 'emrg_h_phone', 'Emergency Home Phone');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(534, 'emgr_contct_relation', 'Emergency Contact Relation');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(535, 'id', 'ID');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(536, 'type_id', 'Equipment Type');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(537, 'custom_id', 'Custom ID');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(538, 'custom_data_type', 'Custom Data Type');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(539, 'role_permission', 'Role Permission');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(540, 'permission_setup', 'Permission Setup');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(541, 'add_role', 'Add Role');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(542, 'role_list', 'Role List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(543, 'user_access_role', 'User Access Role');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(544, 'menu_item_list', 'Menu Item List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(545, 'ins_menu_for_application', 'Ins Menu  For Application');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(547, 'page_url', 'Page URL');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(549, 'role', 'Role');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(550, 'role_name', 'Role Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(551, 'single_checkin', 'Single Check In');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(552, 'bulk_checkin', 'Bulk Check In');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(553, 'manage_attendance', 'Manage Attendance');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(554, 'attendance_list', 'Attendance List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(557, 'stay', 'Stay');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(558, 'attendance_report', 'Attendance Report');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(559, 'work_hour', 'Work Hour');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(560, 'cancel', 'Cancel');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(561, 'confirm_clock', 'Confirm Checkout');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(562, 'add_attendance', 'Add Attendance');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(563, 'upload_csv', 'Upload CSV');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(564, 'import_attendance', 'Import Attendance');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(565, 'manage_account', 'Manage Account');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(566, 'add_account', 'Add Account');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(567, 'add_new_account', 'Add New Account');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(568, 'account_details', 'Account Details');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(569, 'manage_transaction', 'Manage Transaction');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(570, 'add_expence', 'Add Experience');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(571, 'add_income', 'Add Income');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(572, 'return_now', 'Return Now !!');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(573, 'manage_award', 'Manage Award');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(574, 'add_new_award', 'Add New Award');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(575, 'personal_information', 'Personal Information');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(576, 'educational_information', 'Educational Information');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(577, 'past_experience', 'Past Experience');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(578, 'basic_information', 'Basic Information');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(579, 'result', 'Result');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(580, 'institute_name', 'Institute Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(581, 'education', 'Education');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(582, 'manage_shortlist', 'Manage Short List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(583, 'manage_interview', 'Manage Interview');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(584, 'manage_selection', 'Manage Selection');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(585, 'add_new_dept', 'Add New Department');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(586, 'manage_dept', 'Manage Department');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(587, 'successfully_checkout', 'Checkout Successful !');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(588, 'grant_loan', 'Grant Loan');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(589, 'successfully_installed', 'Successfully Installed');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(590, 'total_loan', 'Total Loan');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(591, 'total_amount', 'Total Amount');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(592, 'filter', 'Filter');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(593, 'weekly_holiday', 'Weekly Holiday');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(594, 'manage_application', 'Manage Application');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(595, 'add_application', 'Add Application');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(596, 'manage_holiday', 'Manage Holiday');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(597, 'add_more_holiday', 'Add More Holiday');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(598, 'manage_weekly_holiday', 'Manage Weekly Holiday');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(599, 'add_weekly_holiday', 'Add Weekly Holiday');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(600, 'manage_granted_loan', 'Manage Granted Loan');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(601, 'manage_installment', 'Manage Installment');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(602, 'add_new_notice', 'Add New Notice');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(603, 'manage_notice', 'Manage Notice');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(604, 'salary_type', 'Salary Type');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(605, 'manage_salary_generate', 'Manage Salary Generate');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(606, 'generate_now', 'Generate Now');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(607, 'add_salary_setup', 'Add Salary Setup');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(608, 'manage_salary_setup', 'Manage Salary Setup');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(609, 'add_salary_type', 'Add Salary Type');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(610, 'manage_salary_type', 'Manage Salary Type');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(611, 'manage_tax_setup', 'Manage Tax Setup');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(612, 'setup_tax', 'Setup Tax');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(613, 'add_more', 'Add More');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(614, 'tax_rate', 'Tax Rate');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(615, 'no', 'No');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(616, 'setup', 'Setup');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(617, 'biographicalinfo', 'Bio-Graphical Information');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(618, 'positional_information', 'Positional Information');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(620, 'benifits', 'Benefits');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(621, 'others_leave_application', 'Others Leave');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(622, 'add_leave_type', 'Add Leave Type');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(623, 'others_leave', 'Apply Leave');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(624, 'number_of_leave_days', 'Number of Leave Days');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(627, 'add_category', 'Add Category');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(630, 'add_food', 'Add Food');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(634, 'category_subtitle', 'Category Subtitle');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(635, 'update_category', 'Update Category');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(636, 'update_fooditem', 'Update Food Item');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(713, 'food_list', 'Food List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(717, 'category_name', 'Category Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(718, 'category_list', 'Category List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(719, 'itemmanage', 'Food Management');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(720, 'manage_category', 'Manage Category');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(721, 'manage_food', 'Manage Food');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(722, 'offerdate', 'Offer Start Date');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(723, 'manage_addons', 'Manage Add-ons');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(724, 'add_adons', 'Add Add-ons');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(725, 'menu_addons', 'Add-ons Menu');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(726, 'addons_list', 'Add-ons List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(727, 'assign_adons', 'Add-ons Assign');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(728, 'assign_adons_list', 'Add-ons Assign List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(729, 'update_adons', 'Update Add-ons');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(730, 'item_name', 'Food Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(731, 'price', 'Price');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(732, 'offerenddate', 'Offer End Date');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(733, 'units', 'Unit and Ingredients');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(734, 'manage_unitmeasurement', 'Unit Measurement');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(735, 'unit_list', 'Unit Measurement List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(736, 'unit_add', 'Add Unit');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(737, 'unit_update', 'Unit Update');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(738, 'unit_name', 'Unit Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(739, 'manage_ingradient', 'Manage Ingredients');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(740, 'ingradient_list', 'Ingredient List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(741, 'add_ingredient', 'Add Ingredient');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(742, 'ingredient_name', 'Ingredient Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(743, 'unit_short_name', 'Short Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(744, 'update_ingredient', 'Update Ingredient');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(745, 'component', 'Components');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(746, 'vat_tax', 'Vat');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(748, 'food_varient', 'Food Variant');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(749, 'food_availablity', 'Food Availability');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(750, 'add_varient', 'Add Variant');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(751, 'varient_name', 'Variant Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(752, 'variant_list', 'Variant List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(753, 'variant_edit', 'Update Variant');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(754, 'food_availablelist', 'Food Available List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(755, 'add_availablity', 'Add Available Day & Time');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(756, 'edit_availablity', 'Update Available Day & Time');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(757, 'available_day', 'Available Day');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(758, 'available_time', 'Available Time');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(759, 'membership_management', 'Membership Management');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(760, 'membership_list', 'Membership List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(761, 'membership_name', 'Membership Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(762, 'discount', 'Discount');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(763, 'other_facilities', 'Other Facilities');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(764, 'membership_add', 'Add Membership');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(765, 'membership_edit', 'Update Membership');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(766, 'payment_setting', 'Payment Method Setting');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(767, 'paymentmethod_list', 'Payment Method List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(768, 'payment_add', 'Add Payment Method');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(769, 'payment_edit', 'Update Payment Method');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(770, 'payment_name', 'Payment Method Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(771, 'shipping_setting', 'Shipping Method Setting');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(772, 'shipping_list', 'Shipping Method List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(773, 'shipping_name', 'Shipping Method Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(774, 'shipping_add', 'Add Shipping Method');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(775, 'shipping_edit', 'Update Shipping Method');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(776, 'shippingrate', 'Shipping Rate');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(777, 'supplier_manage', 'Supplier Manage');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(778, 'supplier_name', 'Supplier Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(779, 'supplier_list', 'Supplier List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(780, 'mobile', 'Mobile');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(781, 'address', 'Address');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(782, 'supplier_add', 'Add Supplier');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(783, 'supplier_edit', 'Update Supplier');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(784, 'purchase_item', 'Purchase Item');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(785, 'purchase', 'Purchase Manage');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(786, 'purchase_list', 'Purchase List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(787, 'purchase_add', 'Add Purchase');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(788, 'purchase_edit', 'Update Purchase');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(789, 'quantity', 'Quantity');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(790, 'supplier_information', 'Supplier Information');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(791, 'add_new_order', 'Add New Order');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(792, 'pending_order', 'Pending Order');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(793, 'processing_order', 'Processing Order');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(794, 'cancel_order', 'Cancel Order');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(795, 'complete_order', 'Complete Order');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(796, 'pos_invoice', 'POS Invoice');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(797, 'ordermanage', 'Manage Order');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(798, 'table_manage', 'Manage Table');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(799, 'table_edit', 'Update Table');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(800, 'table_list', 'Table List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(801, 'table_name', 'Table Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(802, 'customer_type', 'Customer Type');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(803, 'customertype_list', 'Customer Type List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(804, 'production', 'Production');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(805, 'add_table', 'Table Add');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(806, 'table_add', 'Add Table');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(807, 'add_new_table', 'Add Table');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(808, 'order_list', 'Order List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(809, 'currency', 'Currency');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(810, 'currency_list', 'Currency List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(811, 'currency_name', 'Currency Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(812, 'currency_add', 'Add Currency');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(813, 'currency_edit', 'Update Currency');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(814, 'currency_icon', 'Currency Icon');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(815, 'currency_rate', 'Conversion Rate');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(816, 'report', 'Report');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(817, 'purchase_report', 'Purchase Report');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(818, 'purchase_report_ingredient', 'Stock Report (Kitchen)');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(819, 'stock_report', 'Stock Report');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(820, 'sell_report', 'Sales Report');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(821, 'stock_report_product_wise', 'Stock Report (Food Items)');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(822, 'accounts', 'Accounts');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(823, 'c_o_a', 'Chart of Accounts');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(824, 'debit_voucher', 'Debit Voucher');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(825, 'credit_voucher', 'Credit Voucher');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(826, 'contra_voucher', 'Contra Voucher');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(827, 'journal_voucher', 'Journal Voucher');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(828, 'voucher_approval', 'Voucher Approval');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(829, 'account_report', 'Accounts Report');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(830, 'voucher_report', 'Voucher Report');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(831, 'cash_book', 'Cash Book');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(832, 'bank_book', 'Bank Book');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(833, 'general_ledger', 'General Ledger');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(834, 'trial_balance', 'Trial Balance');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(835, 'profit_loss', 'Profit Loss');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(836, 'cash_flow', 'Cash Flow');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(837, 'coa_print', 'COA Print');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(838, 'in_quantity', 'In Quantity');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(839, 'out_quantity', 'Out Quantity');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(840, 'stock', 'Stock');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(841, 'find', 'Find');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(842, 'from_date', 'From');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(843, 'to_date', 'To');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(844, 'approved', 'Approved');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(845, 'total_ammount', 'Total Amount');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(846, 'total_purchase', 'Total Purchase');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(847, 'total_sale', 'Total Sale');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(848, 'csv_file_informaion', 'CSV File Information');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(849, 'import_product_csv', 'Import product (CSV)');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(851, 'production_set_list', 'Production Set List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(852, 'production_add', 'Add Production');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(853, 'production_list', 'Production List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(854, 'billing_from', 'Billing From');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(855, 'invoice', 'Invoice');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(856, 'invoice_no', 'Invoice No');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(857, 'billing_date', 'Billing Date');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(858, 'billing_to', 'Billing To');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(859, 'reservation', 'Reservation');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(860, 'take_reservation', 'Take A Reservation');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(861, 'update_table', 'Table Update');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(862, 'reserve_time', 'Reservation Table');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(863, 'reservation_table', 'Add Booking');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(864, 'table_setting', 'Table Setting');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(865, 'capacity', 'Capacity');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(866, 'icon', 'Icon');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(867, 'purchase_return', 'Purchase Return');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(868, 'purchase_qty', 'Purchase Qty');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(869, 'return_qty', 'Return Qty');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(870, 'total', 'Total');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(871, 'select', 'Select');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(872, 'return_invoice', 'Return Invoice');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(873, 'invoice_view', 'View Invoice');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(874, 'grand_total', 'Grand Total');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(875, 'supplier', 'Supplier');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(876, 'po_no', 'Invoice No');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(877, 'grant', 'Grant');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(878, 'hrm', 'Human Resource');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(879, 'departmentfrm', 'Add Department');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(880, 'benefits', 'Benefits');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(881, 'class', 'Class');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(882, 'biographical_info', 'Biographical Info');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(883, 'additional_address', 'Additional Address');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(884, 'custom', 'Custom');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(885, 'pay_now', 'Pay Now ??');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(886, 'paymentmethod_setup', 'Payment Setup');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(887, 'add_paymentsetup', 'Add New Payment Setup');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(888, 'edit_setup', 'Update Setup');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(889, 'marchantid', 'Marchant ID');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(890, 'order_successfully', 'Your Payment was Completed!!!.');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(891, 'order_fail', 'Payment Incomplete!!!');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(892, 'voucher_no', 'Voucher No');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(893, 'remark', 'Remark');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(894, 'code', 'Code');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(895, 'debit', 'Debit');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(896, 'credit', 'Credit');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(897, 'template_name', 'Template Name ');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(898, 'sms_template', 'SMS Template');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(899, 'sms_template_warning', 'Please Use ');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(900, 'userid', 'User ID');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(901, 'from', 'From');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(902, 'opening_cash_and_equivalent', 'Opening Cash & Equivalent');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(903, 'amount_in_Dollar', 'Amount In Dollar');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(904, 'pre_balance', 'Pre Balance');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(905, 'current_balance', 'Current Balance');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(906, 'with_details', 'With Details');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(907, 'credit_account_head', 'Credit Account Head');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(908, 'gl_head', 'GL Head');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(909, 'transaction_head', 'Transaction Head');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(910, 'confirm', 'Confirm');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(911, 's_rate', 'Rate');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(912, 'web_setting', 'Web Setting');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(913, 'banner_setting', 'Banner Setting');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(914, 'menu_setting', 'Menu Setting');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(915, 'widget_setting', 'Widget Setting');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(916, 'add_banner', 'Add Banner');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(917, 'bannertype', 'Add Banner Type');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(918, 'banner_list', 'Banner List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(919, 'title', 'Title');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(920, 'subtitle', 'Sub Title');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(921, 'banner_type', 'Banner Type');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(922, 'link_url', 'Link URL');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(923, 'banner_edit', 'Banner Update');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(924, 'menu_name', 'Menu Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(925, 'menu_url', 'Menu Slug');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(926, 'sub_menu', 'Sub Menu');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(927, 'add_menu', 'Add Menu');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(928, 'parent_menu', 'Parent Menu');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(929, 'widget_name', 'Widget Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(930, 'widget_title', 'Widget Title');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(931, 'widget_desc', 'Description');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(932, 'add_widget', 'Add New');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(933, 'common_setting', 'Common Setting');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(934, 'bannersize', 'Banner Size');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(936, 'height', 'Height');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(937, 'exclusive', 'Exclusive');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(938, 'best_Offers', 'Best Offer');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(939, 'invalid_size', 'Invalid Size');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(940, 'confirm_reservation', 'Confirm Reservation');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(941, 'food_details', 'Food Details');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(942, 'email_setting', 'Email Setting');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(943, 'contact_email_list', 'Contact List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(944, 'subscribelist', 'Subscribe List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(945, 'contact_send', 'Your Contact Information Send Successfully.');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(946, 'couponlist', 'Coupon List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(947, 'add_coupon', 'Add Coupon');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(948, 'coupon_Code', 'Coupon Code');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(949, 'coupon_rate', 'Coupon Value');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(950, 'coupon_startdate', 'Start Date');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(951, 'coupon_enddate', 'End Date');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(952, 'coupon_edit', 'Update Coupon');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(953, 'rating', 'Rating ');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(954, 'add_rating', 'Add Rating');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(955, 'reviewtxt', 'Review Text');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(956, 'rating_edit', 'Rating Update');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(957, 'customer_rating', 'Customer Rating');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(958, 'country_list', 'Country List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(959, 'countryname', 'Country Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(960, 'add_country', 'Add Country');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(961, 'edit_country', 'Update Country');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(962, 'add_state', 'Add State');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(963, 'edit_state', 'State Update');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(964, 'state', 'State');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(965, 'city', 'City');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(966, 'add_city', 'Add City');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(967, 'edit_city', 'City Update');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(968, 'country', 'Country');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(969, 'state_list', 'State List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(970, 'city_list', 'All City');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(971, 'server_setting', 'App Setting');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(972, 'netip', 'Your Local Host Full URL');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(974, 'onlinebdname', 'Online Database Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(975, 'dbuser', 'Database User');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(976, 'dbpassword', 'Database Password');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(977, 'dbhost', 'Database Host Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(978, 'social_setting', 'Social Setting');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(979, 'url_link', 'URL');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(980, 'sicon', 'Select Icon');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(981, 'ord_failed', 'Order Failed!!!');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(982, 'failed_msg', 'Order not placed due to some reason. Please Try Again!!!. Thank You !!!');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(983, 'ord_succ', 'Order Placed Successfully!!!');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(984, 'succ_smg', 'Are you Sure to Print This Invoice????');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(985, 'no_order_run', 'No Order Running');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(986, 'thirdpartycustomer_list', 'Third-Party Customers');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(987, '3rd_customer_list', 'Third-Party Customers List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(988, '3rdcompany_name', 'Company Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(989, 'add_3rdparty_comapny', 'Add New Company');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(990, 'update_3rdparty', 'Update Company');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(991, 'commision', 'Commission');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(992, 'list_of_card_terminal', 'Card Terminal List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(993, 'add_new_terminal', 'Add New Terminal');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(994, 'update_terminal', 'Update Terminal');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(995, 'card_terminal_name', 'Card Terminal Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(996, 'list_of_bank', 'Bank List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(997, 'add_bank', 'Add New Bank');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(998, 'update_bank', 'Update Bank');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(999, 'bank_name', 'Bank Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1000, 'sell_report_filter', 'Sale Report Filtering');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1001, 'sms_setting', 'SMS Setting');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1002, 'sms_configuration', 'SMS Configuration');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1003, 'sms_temp', 'SMS Template');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1004, 'candidate_name', 'Candidate Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1005, 'assign1_role', 'Assign Role');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1006, 'customer_list', 'Customer List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1007, 'customer_name', 'Customer Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1008, 'update_ord', 'Update Order');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1009, 'final_report', 'Final Report');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1010, 'ehrm', 'HRM');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1011, 'add_expense_item', 'Add Expense Item');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1012, 'manage_expense_item', 'Manage Expense Item');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1013, 'add_expense', 'Add Expense');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1014, 'manage_expense', 'Manage Expense');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1015, 'expense_statement', 'Expense Statement');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1016, 'expense_type', 'Expense Type');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1017, 'expense_item_name', 'Expense Item Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1018, 'expense', 'Expense');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1020, 'signature_pic', 'Signature Picture');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1021, 'branch1', 'Branch');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1022, 'ac_no', 'A/C Number');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1023, 'ac_name', 'A/C Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1024, 'bank_transaction', 'Bank Transaction');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1025, 'bank', 'Bank');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1027, 'bank_ledger', 'Bank Ledger');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1028, 'note_name', 'Note Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1029, 'balance', 'Balance');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1030, 'previous_balance', 'Previous Credit Balance');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1031, 'manage_supplier_ledger', 'Manage supplier Ledger');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1032, 'supplier_ledger', 'Supplier Ledger');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1033, 'print', 'Print');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1034, 'select_supplier', 'Select Supplier');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1035, 'deposite_id', 'Deposit ID');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1036, 'print_date', 'Print Date');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1037, 'manage_bank', 'Manage Bank');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1038, 'add_new_bank', 'Add New Bank');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1039, 'bank_list', 'Bank List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1040, 'bank_edit', 'Bank Edit');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1041, 'debit_plus', 'Debit (+)');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1042, 'credit_minus', 'Credit (-)');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1043, 'withdraw_deposite_id', 'Withdraw / Deposit ID');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1044, 'cash_adjustment', 'Cash Adjustment');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1045, 'adjustment_type', 'Adjustment Type');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1046, 'supplier_payment', 'Supplier Payment');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1047, 'prepared_by', 'Prepared By');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1048, 'authorized_signature', 'Authorized Signature');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1049, 'chairman', 'Chairman');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1050, 'kitchen_dashboard', 'Kitchen Dashboard');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1051, 'counter_dashboard', 'Counter Dashboard');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1052, 'nw_order', 'New Order');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1053, 'ongoingorder', 'On Going Order');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1054, 'tdayorder', 'Today Order');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1055, 'onlineord', 'Online Order ');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1056, 'table', 'Table');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1057, 'waiter', 'Waiter');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1058, 'del_company', 'Delivery Company');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1059, 'cookedtime', 'Cooking Time');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1060, 'ord_num', 'Order Number');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1061, 'cmplt', 'Complete');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1062, 'sl_payment', 'Select Your Payment Method');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1063, 'paymd', 'Payment Method');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1064, 'crd_terminal', 'Card Terminal');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1065, 'sl_bank', 'Select Bank');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1066, 'lstdigit', 'Last 4 Digit');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1067, 'cuspayment', 'Customer Payment');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1068, 'cng_amount', 'Changes Amount');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1069, 'pay_print', 'Pay Now & Print Invoice');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1070, 'payn', 'Pay Now');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1071, 'ordid', 'Order ID');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1072, 'can_reason', 'Cancel Reason');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1073, 'can_ord', 'Cancel Order');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1074, 'close', 'Close');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1075, 'add_customer', 'Add Customer');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1076, 'fav_addesrr', 'Favorite Address');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1077, 'tabltno', 'Table No');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1078, 'ordate', 'Order Date');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1079, 'payment_status', 'Payment Status');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1080, 'ordtcoun', 'Order Time Countdown Board');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1081, 'remtime', 'Remaining Time');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1082, 'ordtime', 'Order Time');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1083, 'ord', 'Order');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1084, 'tok', 'Token');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1085, 'view_ord', 'View Order');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1086, 'fdready', 'Food Ready');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1087, 'fdnready', 'Food Not Ready');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1088, 'foodrfs', 'Food is Ready for Served!!');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1089, 'foodnrfs', 'Food Not Ready for Served');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1090, 'ordready', 'Order Ready');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1091, 'sele_by_date', 'Sale By Date');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1092, 'withdetails', 'With Details');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1093, 'topeneqv', 'Total Opening Cash & Cash Equivalent');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1094, 'cashopen', 'Cashflow from Operating Activities');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1095, 'payact', 'Payment for Other Operating Activities');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1096, 'cash_gand_lie', 'Cash generated from Operating Activities before Changing in Operating Assets & Liabilities');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1097, 'casfactive', 'Cashflow from Non Operating Activities');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1098, 'cashnonlia', 'Cash generated from Non Operating Activities before Changing in Operating Assets & Liabilities');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1099, 'incdre', 'Increase/Decrease in Operating Assets & Liabilities');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1100, 'Tincdre', 'Total Increase/Decrease');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1101, 'netopenactv', 'Net Cash From Operating/Non Operating Activities');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1102, 'cfact', 'Cash Flow from Investing Activities');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1103, 'ncuia', 'Net Cash Used Investing Activities');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1104, 'cfffa', 'Cash Flow from Financing Activities');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1105, 'netcufa', 'Net  Cash Used Financing Activities');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1106, 'ncio', 'Net Cash Inflow/Outflow');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1107, 'pflos', 'Profit Loss');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1108, 'clcEq', 'Closing Cash & Cash Equivalent:');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1109, 'TcccE', 'Total Closing Cash & Cash Equivalent');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1110, 'pp_by', 'Prepared By');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1111, 'act', 'Accounts');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1112, 'ausig', 'Authorized Signature');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1113, 'particls', 'Particulars');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1114, 'back', 'Back');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1115, 'bk_vouchar', 'Bank Book Voucher');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1116, 'errorajdata', 'Error get data from ajax');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1117, 'reach_limit', 'You have reached the limit of adding');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1118, 'inpt', 'inputs');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1119, 'cantdel', 'There only one row you can\'t delete.');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1120, 'slsuplier', 'Select Supplier');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1121, 'ptype', 'Payment Type');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1122, 'casp', 'Cash Payment');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1123, 'bnkp', 'Bank Payment');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1124, 'slbank', 'Select Bank');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1125, 'cscrv', 'Cash Credit Voucher');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1126, 'ac_code', 'Account Code');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1127, 'ac_head', 'Account Head');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1128, 'iword', 'In word');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1129, 'ac_office', 'Accounts Officer');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1130, 'latestv', 'Latest version');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1131, 'after19', 'Auto Update Feature working On  after 1.9');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1132, 'crver', 'Current version');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1133, 'notesupdate', 'note: strongly recommended to backup your <b>SOURCE FILE</b> and <b>DATABASE</b> before update.');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1134, 'noupdates', 'No Update available');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1135, 'lic_pur_key', 'License/Purchase key');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1136, 'lifeord', 'Lifetime Orders');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1137, 'tdaysell', 'Today Sale');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1138, 'tcustomer', 'Total Customer');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1139, 'tdeliv', 'Total Delivered');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1140, 'treserv', 'Total Reservation');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1141, 'latestord', 'Latest Order');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1142, 'latest_reser', 'Latest Reservation');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1143, 'ord_number', 'Order No.');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1144, 'latestolorder', 'Latest Online Order');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1145, 'monsalamntorder', 'Monthly Sales Amount and Order');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1146, 'onlineofline', 'Online Vs Offline Order & Sales');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1147, 'pending_ord', 'Pending Order');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1148, 'onlinesamnt', 'Online Sale Amount');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1149, 'onlineordnum', 'Online Order Number');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1150, 'offsalamnt', 'Offline Sale Amount');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1151, 'offlordnum', 'Offline Order Number');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1152, 'saleamnt', 'Sale Amount');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1153, 'ordnumb', 'Order Number');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1154, 'store_name', 'Store Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1155, 'opent', 'Available On');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1156, 'closeTime', 'Closing Time');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1157, 'sldistype', 'Select Discount Type');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1158, 'distype', 'Discount Type');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1159, 'percent', 'Percent');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1160, 'sl_se_ch_ty', 'Select Service Charge Type');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1161, 'vatset', 'VAT Setting(%)');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1162, 'mindeltime', 'Min. Delivery Time');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1163, 'dateformat', 'Date Format');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1164, 'sedateformat', 'Seletet Date Format');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1165, 'add_menu_item', 'Add Menu Item');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1166, 'menu_title', 'Menu Title');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1167, 'can_create', 'Can Create');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1168, 'can_read', 'Can Read');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1169, 'can_edit', 'Can Edit');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1170, 'can_delete', 'Can Delete');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1171, 'smsrankgateway', 'To get <b>50</b> free SMS from smsrank.com click');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1172, 'ranktext', ' and register in registration section click Already Envato user and put your envato purchase key and product id  after registration put your username and password into the password and user name field this form.');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1173, 'managementsection', 'This Section is Use Only for Store Management.');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1174, 'width', 'Width');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1175, 'protocal', 'Protocol');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1176, 'mailpath', 'Mail Path');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1177, 'Mail_type', 'Mail Type');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1178, 'smtp_host', 'SMTP Host');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1179, 'smtp_post', 'SMTP Port');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1180, 'sender_email', 'Sender Email');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1181, 'smtp_password', 'SMTP Password');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1183, 'powered_by', 'Powered By Text');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1184, 'item_information', 'Item Information');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1185, 'size', 'Size');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1186, 'qty', 'Quantity');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1187, 'addons_name', 'Add-ons Name ');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1188, 'addons_qty', 'Add-ons Qty');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1190, 'item', 'Item');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1191, 'unit_price', 'Unit Price');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1192, 'total_price', 'Total Price');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1193, 'order_status', 'Order Status');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1194, 'served', 'Served');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1195, 'cancel_reason', 'Cancel Reason');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1196, 'customer_order', 'Customer Notes');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1197, 'customerpicktime', 'Customer Pick-up Date and time');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1199, 'service_chrg', 'Service Charge');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1200, 'customer_paid_amount', 'Customer Paid Amount');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1201, 'change_due', 'Change Due');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1202, 'total_due', 'Total Due');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1203, 'powerbybdtask', 'Powered  By: BDTASK, www.bdtask.com');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1204, 'recept', 'Receipt  No');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1205, 'orderno', 'Order No.');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1206, 'ref_page', 'Refresh Page');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1207, 'orderid', 'Order ID');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1208, 'all', 'All');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1209, 'vat_tax1', 'Vat/Tax');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1210, 'ord_uodate_success', 'Order Update Successfully!!!');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1211, 'do_print_token', 'Do you Want to Print Token No.???');

INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1212, 'req_failed', 'Request Failed, Please check your code and try again!');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1213, 'ord_places', 'Order Placed Successfully');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1214, 'do_print_in', 'Do you Want to Print Invoice???');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1215, 'ord_complte', 'Order Completed');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1216, 'ord_com_sucs', 'Order Completed Successfully');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1217, 'token_no', 'Token NO');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1218, 'qr-order', 'QR Order');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1219, 'cuschange', 'Customer Change');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1220, 'order_successfully_placed', 'Order Has Been Placed Successfully!');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1221, 'kitchen_setting', 'kitchen Setting');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1222, 'kitchen_name', 'Kitchen Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1223, 'kitchen_user_assign', 'Assign Kitchen User');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1224, 'kitchen_list', 'Kitchen List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1225, 'add_kitchen', 'Add Kitchen');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1226, 'kitchen_assign', 'Kitchen Assign');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1227, 'kitchen_edit', 'Kitchen Edit');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1228, 'please_try_again_userassign', 'This user is already assign in this kitchen');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1229, 'select_kitchen', 'Select Kitchen');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1230, 'memberid', 'Member ID');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1231, 'member_name', 'Member Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1232, 'add_member', 'Add New Member');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1233, 'update_member', 'Update Member');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1234, 'member_list', 'Member List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1236, 'meminfo', 'Member Manage');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1237, 'blocked', 'Blocked');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1238, 'memberid_exist', 'Member ID Already Exists. Please Try Another.');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1239, 'add_new_payment_type', 'Add New Payment Method');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1240, 'sell_report_items', 'Items Sales Report');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1241, 'sell_report_waiters', 'Waiters Sales Report');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1242, 'sell_report_delvirytype', 'Delivery Type Sales Report');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1243, 'sell_report_casher', 'Sale Report Cashier');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1244, 'ready_all_ietm', 'All Item Ready');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1245, 'unpaid_sell', 'Unpaid Sale');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1246, 'kitchen_sell', 'Kitchen Sales Report');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1247, 'order_total', 'Total Order ');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1248, 'scharge_report', 'Service Charge Report ');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1249, 'seo_setting', 'SEO Setting');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1250, 'seo_title', 'Title');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1251, 'seo_keyword', 'Keyword');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1252, 'seo_description', 'Description');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1257, 'buy_now', 'Buy Now');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1264, 'purchase_key', 'Purchase Key');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1271, 'kitchen_status', 'Kitchen Status');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1278, 'habittrack', 'Customer Habit List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1279, 'review_rating', 'Review & Rating');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1280, 'pos_setting', 'POS Setting');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1286, 'month', 'Month');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1287, 'sl_option', 'Select Option');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1288, 'sl_product', 'Search Product');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1289, 'quickorder', 'Quick Order');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1290, 'placeorder', 'Place Order');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1291, 'type_slorder', 'Type and Select Order');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1292, 'mergeord', 'Merge Order');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1293, 'Processingod', 'Processing...');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1294, 'sLengthMenu', 'Display _MENU_ records per page');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1295, 'sInfo', 'Showing _START_ to _END_ of _TOTAL_ entries');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1296, 'sInfoEmpty', 'Showing 0 to 0 of 0 entries');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1297, 'sInfoFiltered', '(Filtered from _MAX_ Total Records)');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1298, 'sLoadingRecords', 'Loading...');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1299, 'sZeroRecords', 'Nothing found - sorry');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1300, 'sEmptyTable', 'No Data Available in Table');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1301, 'sFirst', 'First');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1302, 'sLast', 'Last');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1303, 'sPrevious', 'Previous');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1304, 'sNext', 'Next');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1305, 'sSortAscending', 'Activate to sort column ascending');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1306, 'sSortDescending', 'Activate to Sort Column Descending');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1307, '_sign', 'Show %d Rows');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1308, '_0sign', 'No Row Selected');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1309, '_1sign', '1 Line Selected');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1310, 'copy', 'Copy');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1312, 'excel', 'Excel');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1313, 'pdf', 'Pdf');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1314, 'colvis', 'Column Visibility');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1316, 'no_orderfound', 'No Order Found!!!');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1317, 'prepared', 'Prepared');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1318, 'accept', 'Accept');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1319, 'reject', 'Reject');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1320, 'ready', 'Ready');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1321, 'processing', 'Processing');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1322, 'kitnotacpt', 'Kitchen Not Accept');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1425, 'person', 'Person');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1426, 'before_time', 'Running Time');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1427, 'select_this_table', 'Select This Table');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1428, 'seat', 'Seat');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1429, 'seat_time', 'Time');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1430, '+', 'Add');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1431, 'clear', 'Clear');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1432, 'no_customer', 'No Customer');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1433, 'table_map', 'Table Map');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1434, 'add', 'Add');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1435, 'itemsincart', 'Item(s) in Cart');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1436, 'view_cart', 'View Cart');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1437, 'morderlist', 'My Order List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1438, 'edit', 'Edit');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1439, 'foodde', 'Food Details');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1440, 'cartlist', 'Cart List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1441, 'subtotal', 'Subtotal');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1442, 'ordnote', 'Order Notes');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1443, 'upsummery', 'Update Summery');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1444, 'upsumlist', 'Update Summery List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1445, 'mkpayment', 'Make Payment');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1446, 'foodnote', 'Food Note');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1447, 'addnotesi', 'Add Note');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1448, 'thirdparty_orderid', 'Third-party Order ID');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1456, 'themes', 'Themes');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1457, 'menu_type', 'Menu Type');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1458, 'add_menu_type', 'Add Menu Type');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1459, 'menutype_edit', 'Menu Type Edit');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1460, 'menu_type_name', 'Menu Type');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1461, 'storetime', 'Manage Store Time');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1462, 'day_name', 'Day');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1463, 'saturday', 'Saturday');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1464, 'sunday', 'Sunday');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1465, 'monday', 'Monday');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1466, 'tuesday', 'Tuesday');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1467, 'wednesday', 'Wednesday');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1468, 'thursday', 'Thursday');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1469, 'friday', 'Friday');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1470, 'footer_logo', 'Footer Logo');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1471, 'contact_us', 'Contact Us');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1472, 'opening_time', 'Available On');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1473, 'ourstore', 'Our Store');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1474, 'call_reservation', 'Call for Reservations');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1475, 'item_available', 'Items Available');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1479, 'membership_card', 'Bar Code');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1480, 'barcode_start', 'From Barcode');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1481, 'barcode_end', 'To Barcode');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1494, 'commission', 'Commission');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1495, 'sale_by_table', 'Sale By Table');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1496, 'stock_limit', 'Re-Stock Level');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1497, 'ingredients', 'Ingredients');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1498, 'stock_out_ingredients', 'Stock Out Ingredients');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1499, 'office_addres1', 'Office Address');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1500, 'call_us', 'Call Us');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1501, 'email_us', 'Email Us');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1502, 'upload_theme', 'Upload Theme');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1503, 'discount_type', 'Discount Type');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1504, 'confirm_password', 'Confirm Password');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1559, 'wastemangment', 'Waste Management');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1590, 'add_group_item', 'Add Group Item');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1591, 'update_group_item', 'Update Group Item');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1592, 'production_setting', 'Production Setting');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1593, 'select_auto', 'Select auto Production');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1594, 'split', 'Split');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1595, 'tinvat', 'TIN OR VAT NUM.');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1596, 'bill', 'Bill');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1597, 'checkin', 'Check In');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1598, 'checkout', 'Check Out');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1599, 'totalpayment', 'Total payment');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1600, 'thanssuport', 'Thank You for Your Support');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1601, 'thanks_you', 'Thank you very much');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1602, 'opening_balance', 'Opening Balance');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1603, 'transaction_date', 'Date');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1604, 'voucher_type', 'Voucher Type');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1605, 'particulars', 'Head Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1606, 'total_empolyee', 'Total Employee');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1607, 'apply_day', 'Days');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1608, 'loan_no', 'Loan No.');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1609, 'add_floor', 'Add Floor');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1610, 'floor_name', 'Floor Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1611, 'edit_floor', 'Edit Floor');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1612, 'floor_list', 'Floor List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1613, 'floor_select', 'Floor Select');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1614, 'add_to_cart_more', 'Add Multiple Variant');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1615, 'kitchen_printers', 'Kitchen printer Setting');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1616, 'printer_list', 'Printer List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1617, 'add_printer', 'Add Printer');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1618, 'ip_port', 'Your Online URL');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1625, 'counter_list', 'Counter List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1626, 'add_counter', 'Add Counter');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1627, 'edit_counter', 'Edit Counter');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1628, 'counter_no', 'Counter Number');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1629, 'add_opening_balance', 'Add Opening Balance');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1630, 'add_closing_balance', 'Add Closing Balance');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1632, 'sell_report_cashregister', 'Cash Register Report');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1633, 'closing_balance', 'Closing Balance');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1634, 'factory_reset', 'Factory Reset');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1635, 'fresettext', 'Note: Strongly recommended to backup your SOURCE file and DATABASE before resetting because all transactional data will be cleared after running the factory reset.');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1636, 'bill_by', 'Bill By');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1640, 'type_table', 'Type and Select Table');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1648, 'sound_setting', 'Sound Setting');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1649, 'is_sound', 'Is Sound Enable');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1650, 'upload_notify', 'Upload Notification Sound');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1651, 'upload_order', 'Upload order Add Sound');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1655, 'room_list', 'Room List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1656, 'add_room', 'Add Room');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1657, 'room_no', 'Room No');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1658, 'room_qr', 'All Room QR');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1659, 'restaurant_closed', 'Restaurant is Closed!!');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1660, 'closed_msg', 'You order Only when restaurant is open. Our opening and closing Time is:');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1661, 'privactp', 'Privacy Policy');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1662, 'terms_condition', 'Terms & conditions');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1663, 'refundp', 'Refund Policies');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1664, 'reservation_on_off', 'Reservation On Off');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1665, 'unavailable_day', 'Unavailable Day');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1666, 'unavaildate', 'Unavailable Date');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1667, 'add_unavailablity', 'Add Unavailability');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1668, 'edit_unavailablity', 'Edit Unavailability');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1669, 'unavailable_time', 'Unavailable Time');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1670, 'max_reserveperson', 'Max Reserve Person');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1671, 'reservasetting', 'Reservation Setting');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1672, 'webon', 'Website ON');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1673, 'weboff', 'Website Off');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1674, 'webdisable', 'Web site ON/Off');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1675, 'placr_setting', 'Place order Setting');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1676, 'quick_ord', 'Quick Order Setting');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1677, 'shippingtime', 'Shipping Date & Time');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1678, 'search_food_item', 'Search Food Item');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1679, 'search_category', 'Search Category');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1680, 'check_availablity', 'Check Availability');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1681, 'subscribe_paragraph', 'Subscribe to Receive Our Weekly Promotion');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1682, 'shipping_method', 'Shipping Method');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1683, 'please_select_shipping_method', 'Please Select Shipping Method');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1684, 'autoupdate', 'Auto Update');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1685, 'coa_head', 'COA Head');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1686, 'apps_addons', 'Apps Add-ons');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1687, 'download_apps_playstore', 'Please Download Apps on Playstore');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1688, 'kitchen_app', 'Kitchen App');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1689, 'waiter_app', 'Waiter App');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1690, 'customer_app', 'Customer App');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1691, 'if_you_need_the_above_all_apps', 'If you need the above all apps, please feel free to contact us.');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1692, 'do_you_want_proceed', 'Do You Want to Proceed?');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1693, 'is_offer', 'Offer');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1694, 'is_special', 'Special');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1695, 'is_custome_quantity', 'Custom Quantity');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1696, 'kitchenitemsell', 'Kitchen Sell');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1697, 'due_marge', 'Due Merge');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1698, 'book_table', 'Book Table');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1699, 'reserve_table', 'Reserve Table');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1700, 'see_more', 'See More');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1701, 'food_name', 'Food Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1702, 'category', 'Category');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1703, 'search', 'Search');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1704, 'read_more', 'Read more');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1705, 'item_has_been_successfully_added', 'Item has been successfully added');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1706, 'add_to_cart', 'add to cart');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1707, 'view_full_menu', 'View Full Menu');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1709, 'subscribe_to_newsletter', 'Subscribe to Newsletter');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1710, 'subscribe', 'subscribe');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1711, 'get_directions', 'Get Directions');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1712, 'teams_of_use', 'Teams of use');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1713, 'privacy_policy', 'Privacy Policy');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1714, 'contact', 'Contact');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1715, 'please_enter_your_email', 'Please Enter Your email !!');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1716, 'please_enter_valid_email', 'Please enter a valid Email');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1717, 'thanks_for_subscription', 'Thanks for Subscription');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1718, 'note_added', 'Note Added');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1719, 'posting_failed', 'Posting failed');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1720, 'our_service_is_closed_on_this_date_and_time', 'Our service is Closed on this date and time !!!');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1721, 'reservation_time_closed_try_later', 'Reservation Time is closed!! Please try later.');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1722, 'select_date', 'Please select date');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1723, 'select_time', 'Please select Time');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1724, 'enter_number_of_people', 'Please enter the number of people');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1725, 'select_after_hour_current_time', 'Please select after 1 hour to Current time');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1726, 'no_free_seat_to_the_reservation', 'Currently, there is no free seat to the reservation');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1727, 'search_topics_or_keywords', 'Search topics or keywords');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1728, 'no_data_found', 'No Data Found');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1729, 'please_wait', 'Please Wait');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1730, 'reservation_contact', 'Contact No.');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1731, 'reservation_time', 'Expected Time');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1732, 'reservation_date', 'Expected Date');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1733, 'reservation_person', 'Total Person');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1734, 'deal_of_the_day', 'Deal of the day');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1735, 'cart', 'Cart');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1736, 'unavailable', 'Unavailable');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1737, 'write_comments', 'Write Your Comments');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1738, 'get_in_touch', 'Get In Touch');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1739, 'forgot_password', 'Forgot Password');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1740, 'shopping_details_information_msg', 'If you have shopped with us before, please enter your details in the boxes below.');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1741, 'remember_me', 'Remember Me');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1742, 'or', 'OR');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1743, 'register', 'Register');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1744, 'enter_your_phone_or_email', 'Please enter your Phone or Email.');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1745, 'password_not_empty', 'Password Not Empty.');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1746, 'failed_login_msg', 'Failed Login: Check your Email and password!');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1747, 'email_not_registered_msg', 'Failed: Email has not been registered yet.!!!');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1748, 'have_been_sent_email', 'Success: We have been sent an email to this');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1749, 'check_your_new_password', 'Email Address. Please check your New Password..!!!');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1750, 'profile_picture', 'Profile Picture');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1751, 'my_profile', 'My Profile');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1752, 'my_reservation', 'My Reservation');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1753, 'profile_update', 'Profile Update');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1754, 'name', 'Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1755, 'returning_customer', 'Returning customer?');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1756, 'click_login', 'Click here to login');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1757, 'checkout_msg', 'If you have shopped with us before, please enter your details in the boxes below. If you are a new customer, please proceed to the Billing & Shipping section.');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1758, 'username_or_email', 'Username or Email');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1759, 'billing_address', 'Billing Address');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1760, 'select_country', 'Select Country');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1761, 'select_state', 'Select State');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1762, 'town_city', 'Town / City');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1763, 'select_city', 'Select City');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1764, 'street_address', 'Street Address');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1765, 'postcode_zip', 'Postcode / ZIP');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1766, 'create_account', 'Create an Account?');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1767, 'create_account_password', 'Create account password');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1768, 'shipping_different_address', 'Ship to a Different Address?');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1769, 'your_order', 'Your Order');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1770, 'product', 'Product');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1771, 'total_vat', 'Total VAT');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1772, 'coupon_discount', 'Coupon Discount');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1773, 'service', 'Service');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1774, 'tag', 'Tag');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1775, 'review', 'Review');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1776, 'average_user_rating', 'Average User Rating');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1777, 'rating_breakdown', 'Rating Breakdown');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1778, 'complete_success', '100% Complete (success)');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1779, '80_complete_primary', '80% Complete (primary)');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1780, '60_complete_info', '60% Complete (info)');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1781, '40_complete_warning', '40% Complete (warning)');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1782, '20_complete_danger', '20% Complete (danger)');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1783, 'rate_it', 'Rate It');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1784, 'french_chicken_burger_tomato_sauce', 'French Chicken Burger With Hot tomato Sauce');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1785, 'review_submit', 'Review Submit');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1786, 'related_items', 'Related Items');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1787, 'pickup', 'Pickup');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1788, 'dine_in', 'Dine-in');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1789, 'enter_coupon_code', 'Enter coupon code');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1790, '00_15_min', '00:15 MIN');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1791, 'go_to_checkout', 'Go to Checkout');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1798, 'timezone', 'Time Zome');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1799, 'discountrate', 'Discount Rate');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1800, 'vat', 'Vat');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1801, 'loan_issue_id', 'Loan Issue ID');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1802, 'repayment', 'Re-payment');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1803, 'loan_report_details', 'Loan Details');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1804, 'balance_sheet', 'Balance Sheet');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1813, 'purdate', 'Purchase Date');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1814, 'expdate', 'Expiry Date');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1815, 'parent_cat', 'Parent Category');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1816, 'set_productioncost', 'Set Production Cost Per Unit');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1817, 'set_productionunit', 'Set Production Unit');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1818, 'production_set', 'Production Set');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1819, 'production_set_for', 'Production Set For');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1820, 'serving_unit', 'Serving Unit');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1821, 'kit_dashoard_setting', 'Kitchen Dashboard Setting');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1822, 'kot_reftime', 'Kitchen Refresh time In Second');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1823, 'bulk_upload', 'Bulk Upload');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(1824, 'upload_food_csv', 'Upload Food Item csv');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(2202, 'appcartempty', 'Your Cart is empty!!!.Please add some food.');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(2203, 'apporderempty', 'You Order List is empty!!! Please Place A Order First!!!');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(2244, 'topselleingitem', 'Top selling Item');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(2252, 'logininfo', 'Login Info');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(2253, 'newuser', 'New User');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(2254, 'orloginwith', 'or login with');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(2255, 'registerinfo', 'Registration Info');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(2256, 'register_txt', 'If you have shopped with us before, please enter your details in the boxes below.');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(2257, 'customerinfo', 'Customer Info');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(2258, 'delvtype', 'Delivery Type');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(2259, 'delv_date', 'Delivery Date');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(2260, 'delvtime', 'Delivery Time');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(2261, 'yourcart', 'Your Cart');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(2262, 'items', 'items');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(2263, 'delivarycrg', 'Delivery charge');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(2264, 'offercodegift', 'Offer code / gift card code');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(2265, 'apply', 'Apply');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(2266, 'proceedtocart', 'Proceed to Checkout');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(2267, 'delv_address', 'Delivary address List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(2268, 'create_address', 'Create Address');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(2269, 'seeallmenu', 'See all menu');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(2270, 'sendymsg', 'Send Your Message');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(2271, 'send_us', 'Send Us Message');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(2297, 'number_of_tax', 'Number of tax');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(2300, 'tax_name', 'Tax Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(2302, 'closing_note', 'Closing Note');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(2304, 'close_resister_and_print_summery', 'Close Resister and print Summery');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(2305, 'previous', 'Previous');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(2306, 'unpaid', 'Unpaid');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(2307, 'check_item', 'Check Item');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(2308, 'check_item_message', 'Please check at least one item!!');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(2309, 'yes', 'Yes');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(2311, 'time_over', 'Time Over');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(2312, 'add_phrase', 'Add Phrase');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(2313, 'crd_terminal_message', 'Please Select Card Terminal!!!');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(2314, 'language_list', 'Language List');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(2315, 'commission_setting', 'Commission Setting');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(2316, 'pending', 'Pending');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(2317, 'current_register', 'Current Register');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(2318, 'due', 'Due');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(2319, 'due_invoice', 'Due Invoice');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(2320, 'payable_amount', 'Payable Amount');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(2321, 'isinclusivetax', 'Is Tax Inclusive?');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(2322, 'showhidevattin', 'Show/Hide(VAT/TIN)');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(2323, 'custfldname', 'Custom Field Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(2324, 'custfldtype', 'Custom Field Type');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(2325, 'customvalue', 'Custom Value');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(2326, 'cash_in_hand', 'Cash In Hand');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(2327, 'booked', 'Booked');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(2328, 'realease', 'Release\r\n');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(2329, 'liveortest', 'Live Or Test');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(2330, 'live', 'Live Mode');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES(2331, 'test_mode', 'Test Mode');

-- --------------------------------------------------------

--
-- Table structure for table `leave_apply`
--

DROP TABLE IF EXISTS `leave_apply`;
CREATE TABLE IF NOT EXISTS `leave_apply` (
  `leave_appl_id` int NOT NULL AUTO_INCREMENT,
  `employee_id` varchar(20) NOT NULL,
  `leave_type_id` int NOT NULL,
  `apply_strt_date` varchar(20) NOT NULL,
  `apply_end_date` varchar(20) NOT NULL,
  `apply_day` int NOT NULL,
  `leave_aprv_strt_date` varchar(20) NOT NULL,
  `leave_aprv_end_date` varchar(20) NOT NULL,
  `num_aprv_day` varchar(15) NOT NULL,
  `reason` varchar(100) NOT NULL,
  `apply_hard_copy` text,
  `apply_date` varchar(20) NOT NULL,
  `approve_date` varchar(20) NOT NULL,
  `approved_by` varchar(30) NOT NULL,
  `leave_type` varchar(50) NOT NULL,
  PRIMARY KEY (`leave_appl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `leave_type`
--

DROP TABLE IF EXISTS `leave_type`;
CREATE TABLE IF NOT EXISTS `leave_type` (
  `leave_type_id` int NOT NULL AUTO_INCREMENT,
  `leave_type` varchar(50) NOT NULL,
  `leave_days` int NOT NULL,
  PRIMARY KEY (`leave_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `loan_installment`
--

DROP TABLE IF EXISTS `loan_installment`;
CREATE TABLE IF NOT EXISTS `loan_installment` (
  `loan_inst_id` int NOT NULL AUTO_INCREMENT,
  `employee_id` varchar(21) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `loan_id` varchar(21) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `installment_amount` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `payment` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `date` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `received_by` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `installment_no` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '1',
  `notes` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`loan_inst_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `marital_info`
--

DROP TABLE IF EXISTS `marital_info`;
CREATE TABLE IF NOT EXISTS `marital_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `marital_sta` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `marital_info`
--

INSERT INTO `marital_info` (`id`, `marital_sta`) VALUES(1, 'Single');
INSERT INTO `marital_info` (`id`, `marital_sta`) VALUES(2, 'Married');
INSERT INTO `marital_info` (`id`, `marital_sta`) VALUES(3, 'Divorced');
INSERT INTO `marital_info` (`id`, `marital_sta`) VALUES(4, 'Widowed');
INSERT INTO `marital_info` (`id`, `marital_sta`) VALUES(5, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `membership`
--

DROP TABLE IF EXISTS `membership`;
CREATE TABLE IF NOT EXISTS `membership` (
  `id` int NOT NULL AUTO_INCREMENT,
  `membership_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `discount` float NOT NULL,
  `other_facilities` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `create_by` int NOT NULL,
  `create_date` date NOT NULL,
  `update_by` int NOT NULL,
  `update_date` date NOT NULL,
  `startpoint` int NOT NULL,
  `endpoint` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `membership`
--

INSERT INTO `membership` (`id`, `membership_name`, `discount`, `other_facilities`, `create_by`, `create_date`, `update_by`, `update_date`, `startpoint`, `endpoint`) VALUES(1, 'Normal User', 0, '', 2, '2018-11-07', 2, '2018-11-07', 0, 0);
INSERT INTO `membership` (`id`, `membership_name`, `discount`, `other_facilities`, `create_by`, `create_date`, `update_by`, `update_date`, `startpoint`, `endpoint`) VALUES(2, 'Premium Member', 0, '', 1, '2020-11-04', 0, '0000-00-00', 250, 999);
INSERT INTO `membership` (`id`, `membership_name`, `discount`, `other_facilities`, `create_by`, `create_date`, `update_by`, `update_date`, `startpoint`, `endpoint`) VALUES(3, 'VIP', 0, '', 1, '2020-11-04', 0, '0000-00-00', 1001, 5000000);

-- --------------------------------------------------------

--
-- Table structure for table `menu_add_on`
--

DROP TABLE IF EXISTS `menu_add_on`;
CREATE TABLE IF NOT EXISTS `menu_add_on` (
  `row_id` bigint NOT NULL AUTO_INCREMENT,
  `menu_id` int NOT NULL,
  `add_on_id` int NOT NULL,
  `is_active` tinyint NOT NULL,
  PRIMARY KEY (`row_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
CREATE TABLE IF NOT EXISTS `message` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sender_id` int NOT NULL,
  `receiver_id` int NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `datetime` datetime NOT NULL,
  `sender_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=unseen, 1=seen, 2=delete',
  `receiver_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=unseen, 1=seen, 2=delete',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `module`
--

DROP TABLE IF EXISTS `module`;
CREATE TABLE IF NOT EXISTS `module` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text,
  `image` varchar(255) NOT NULL,
  `directory` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `module_permission`
--

DROP TABLE IF EXISTS `module_permission`;
CREATE TABLE IF NOT EXISTS `module_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fk_module_id` int NOT NULL,
  `fk_user_id` int NOT NULL,
  `create` tinyint(1) DEFAULT NULL,
  `read` tinyint(1) DEFAULT NULL,
  `update` tinyint(1) DEFAULT NULL,
  `delete` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_module_id` (`fk_module_id`),
  KEY `fk_user_id` (`fk_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `module_purchase_key`
--

DROP TABLE IF EXISTS `module_purchase_key`;
CREATE TABLE IF NOT EXISTS `module_purchase_key` (
  `id` int NOT NULL AUTO_INCREMENT,
  `identity` varchar(250) DEFAULT NULL,
  `purchase_key` varchar(255) DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `multipay_bill`
--

DROP TABLE IF EXISTS `multipay_bill`;
CREATE TABLE IF NOT EXISTS `multipay_bill` (
  `multipay_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `multipayid` varchar(30) DEFAULT NULL,
  `payment_type_id` int NOT NULL,
  `amount` float NOT NULL,
  PRIMARY KEY (`multipay_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_menu`
--

DROP TABLE IF EXISTS `order_menu`;
CREATE TABLE IF NOT EXISTS `order_menu` (
  `row_id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` bigint NOT NULL,
  `menu_id` int NOT NULL,
  `price` decimal(19,3) DEFAULT '0.000',
  `groupmid` int DEFAULT '0',
  `notes` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `menuqty` float NOT NULL,
  `add_on_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `addonsqty` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `varientid` int NOT NULL,
  `groupvarient` int DEFAULT NULL,
  `addonsuid` int DEFAULT NULL,
  `qroupqty` int DEFAULT NULL,
  `isgroup` int DEFAULT '0',
  `food_status` int DEFAULT '0',
  `allfoodready` int DEFAULT NULL,
  `isupdate` int DEFAULT NULL,
  PRIMARY KEY (`row_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `paymentsetup`
--

DROP TABLE IF EXISTS `paymentsetup`;
CREATE TABLE IF NOT EXISTS `paymentsetup` (
  `setupid` int NOT NULL AUTO_INCREMENT,
  `paymentid` int NOT NULL,
  `marchantid` varchar(255) DEFAULT NULL,
  `password` varchar(120) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `currency` varchar(20) NOT NULL,
  `Islive` int NOT NULL,
  `status` int NOT NULL,
  `edit_url` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`setupid`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `paymentsetup`
--

INSERT INTO `paymentsetup` (`setupid`, `paymentid`, `marchantid`, `password`, `email`, `currency`, `Islive`, `status`, `edit_url`) VALUES(1, 5, 'bdtas5e772deb8ff87', 'bdtas5e772deb8ff87@ssl', 'ainalcse@gmail.com', 'BDT', 0, 1, NULL);
INSERT INTO `paymentsetup` (`setupid`, `paymentid`, `marchantid`, `password`, `email`, `currency`, `Islive`, `status`, `edit_url`) VALUES(2, 3, '', '', 'tareq7500personal2@gmail.com', 'USD', 0, 1, NULL);
INSERT INTO `paymentsetup` (`setupid`, `paymentid`, `marchantid`, `password`, `email`, `currency`, `Islive`, `status`, `edit_url`) VALUES(3, 2, '901400787', '', 'ainalcse@gmail.com', 'USD', 0, 1, NULL);
INSERT INTO `paymentsetup` (`setupid`, `paymentid`, `marchantid`, `password`, `email`, `currency`, `Islive`, `status`, `edit_url`) VALUES(4, 6, '002020000000001', '002020000000001_KEY1', '1', '', 0, 1, NULL);
INSERT INTO `paymentsetup` (`setupid`, `paymentid`, `marchantid`, `password`, `email`, `currency`, `Islive`, `status`, `edit_url`) VALUES(5, 7, 'BE10000072', 'BE10000072', 'karmadorji@gmail.com', 'BTN', 0, 1, NULL);
INSERT INTO `paymentsetup` (`setupid`, `paymentid`, `marchantid`, `password`, `email`, `currency`, `Islive`, `status`, `edit_url`) VALUES(6, 8, 'sandbox-sq0idb-ShIOgPUIHSXxsjCPG4oh_A', 'EAAAEE3gxSvOVaHIq-5A5P_yFkUbkAfUM2-JiQju2FTxQ4n7epxmvKpaOhECxHcN', '5SNY8GNKAZM00', 'AUD', 0, 1, NULL);
INSERT INTO `paymentsetup` (`setupid`, `paymentid`, `marchantid`, `password`, `email`, `currency`, `Islive`, `status`, `edit_url`) VALUES(7, 9, 'sk_test_ol4WUcbGsqxNJItpeOi1ecDT00k5mDyC2G', 'pk_test_TrVFpmZBkgasCE6WTPkZgMPr00UzVVOqgp', 'ainalcse@gmail.com', 'USD', 0, 1, NULL);
INSERT INTO `paymentsetup` (`setupid`, `paymentid`, `marchantid`, `password`, `email`, `currency`, `Islive`, `status`, `edit_url`) VALUES(8, 10, 'sk_test_71353c2613675acb967ea532f4c4c8105ea175b8', 'pk_test_328da55755b88b1aaed96c5cda215b2fd887edb9', 'ainalcse@gmail.com', 'NGN', 0, 1, NULL);
INSERT INTO `paymentsetup` (`setupid`, `paymentid`, `marchantid`, `password`, `email`, `currency`, `Islive`, `status`, `edit_url`) VALUES(9, 11, NULL, '', '', '', 0, 0, NULL);
INSERT INTO `paymentsetup` (`setupid`, `paymentid`, `marchantid`, `password`, `email`, `currency`, `Islive`, `status`, `edit_url`) VALUES(10, 12, '7BUkXCbuHDcx1ZyQqmcKVtsLnFxF0r3f', 'vmUIfeoHXpZSKc20Wt50d6hqeIY5FcWtFR6prg0Ubak8IvmmZEFDDpQr5ZMEdnoS', '', 'XAF', 0, 1, NULL);
INSERT INTO `paymentsetup` (`setupid`, `paymentid`, `marchantid`, `password`, `email`, `currency`, `Islive`, `status`, `edit_url`) VALUES(12, 13, 'sandbox-5rd4uUC2yAz7LWDaalyJAOEsH2rxrqVB', 'sandbox-FsKRCZpk0BpdUss3wVsNLhvs5Ty5PSpi', '', 'BDT', 0, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payment_method`
--

DROP TABLE IF EXISTS `payment_method`;
CREATE TABLE IF NOT EXISTS `payment_method` (
  `payment_method_id` tinyint NOT NULL AUTO_INCREMENT,
  `payment_method` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `modulename` varchar(50) CHARACTER SET utf8 COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`payment_method_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payment_method`
--

INSERT INTO `payment_method` (`payment_method_id`, `payment_method`, `is_active`, `modulename`) VALUES(1, 'Card Payment', 1, '');
INSERT INTO `payment_method` (`payment_method_id`, `payment_method`, `is_active`, `modulename`) VALUES(2, 'Two Checkout', 1, '');
INSERT INTO `payment_method` (`payment_method_id`, `payment_method`, `is_active`, `modulename`) VALUES(3, 'Paypal', 1, '');
INSERT INTO `payment_method` (`payment_method_id`, `payment_method`, `is_active`, `modulename`) VALUES(4, 'Cash Payment', 1, '');
INSERT INTO `payment_method` (`payment_method_id`, `payment_method`, `is_active`, `modulename`) VALUES(5, 'SSLCommerz', 1, '');
INSERT INTO `payment_method` (`payment_method_id`, `payment_method`, `is_active`, `modulename`) VALUES(6, 'SIPS Office', 1, '');
INSERT INTO `payment_method` (`payment_method_id`, `payment_method`, `is_active`, `modulename`) VALUES(7, 'RMA PAYMENT GATEWAY', 1, '');
INSERT INTO `payment_method` (`payment_method_id`, `payment_method`, `is_active`, `modulename`) VALUES(8, 'Square Payments', 1, '');
INSERT INTO `payment_method` (`payment_method_id`, `payment_method`, `is_active`, `modulename`) VALUES(9, 'Stripe Payment', 1, '');
INSERT INTO `payment_method` (`payment_method_id`, `payment_method`, `is_active`, `modulename`) VALUES(10, 'Paystack Payments', 1, '');
INSERT INTO `payment_method` (`payment_method_id`, `payment_method`, `is_active`, `modulename`) VALUES(11, 'Paytm Payments', 1, '');
INSERT INTO `payment_method` (`payment_method_id`, `payment_method`, `is_active`, `modulename`) VALUES(12, 'Orange Money payment', 1, '');
INSERT INTO `payment_method` (`payment_method_id`, `payment_method`, `is_active`, `modulename`) VALUES(13, 'iyzico', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `payroll_commission_setting`
--

DROP TABLE IF EXISTS `payroll_commission_setting`;
CREATE TABLE IF NOT EXISTS `payroll_commission_setting` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pos_id` int NOT NULL,
  `rate` int NOT NULL,
  `create_by` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_holiday`
--

DROP TABLE IF EXISTS `payroll_holiday`;
CREATE TABLE IF NOT EXISTS `payroll_holiday` (
  `payrl_holi_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `holiday_name` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `start_date` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `end_date` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_of_days` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created_by` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `updated_by` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`payrl_holi_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_tax_setup`
--

DROP TABLE IF EXISTS `payroll_tax_setup`;
CREATE TABLE IF NOT EXISTS `payroll_tax_setup` (
  `tax_setup_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `start_amount` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `end_amount` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `rate` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`tax_setup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pay_frequency`
--

DROP TABLE IF EXISTS `pay_frequency`;
CREATE TABLE IF NOT EXISTS `pay_frequency` (
  `id` int NOT NULL AUTO_INCREMENT,
  `frequency_name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pay_frequency`
--

INSERT INTO `pay_frequency` (`id`, `frequency_name`) VALUES(1, 'Weekly');
INSERT INTO `pay_frequency` (`id`, `frequency_name`) VALUES(2, 'Biweekly');
INSERT INTO `pay_frequency` (`id`, `frequency_name`) VALUES(3, 'Annual');
INSERT INTO `pay_frequency` (`id`, `frequency_name`) VALUES(4, 'Monthly');

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
CREATE TABLE IF NOT EXISTS `position` (
  `pos_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `position_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `position_details` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`pos_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `position`
--

INSERT INTO `position` (`pos_id`, `position_name`, `position_details`) VALUES(1, 'chef', 'Responsible for the pastry shop in a foodservice establishment. Ensures that the products produced in the pastry shop meet the quality standards in conjunction with the executive chef.');
INSERT INTO `position` (`pos_id`, `position_name`, `position_details`) VALUES(2, 'HRM', 'Recruits and hires qualified employees, creates in-house job-training programs, and assists employees with their career needs.');
INSERT INTO `position` (`pos_id`, `position_name`, `position_details`) VALUES(3, 'Kitchen manager', 'Supervises and coordinates activities concerning all back-of-the-house operations and personnel, including food preparation, kitchen and storeroom areas.');
INSERT INTO `position` (`pos_id`, `position_name`, `position_details`) VALUES(4, 'Counter server', 'Responsible for providing quick and efficient service to customers. Greets customers, takes their food and beverage orders, rings orders into register, and prepares and serves hot and cold drinks.');
INSERT INTO `position` (`pos_id`, `position_name`, `position_details`) VALUES(6, 'Waiter', 'Most waiters and waitresses, also called servers, work in full-service restaurants. They greet customers, take food orders, bring food and drinks to the tables and take payment and make change.');
INSERT INTO `position` (`pos_id`, `position_name`, `position_details`) VALUES(7, 'Accounts', 'Play a key role in every restaurant. ');
INSERT INTO `position` (`pos_id`, `position_name`, `position_details`) VALUES(8, 'Salesman', 'A salesman is someone who works in sales, with the main function of selling products or services to others either by visiting locations');

-- --------------------------------------------------------

--
-- Table structure for table `production`
--

DROP TABLE IF EXISTS `production`;
CREATE TABLE IF NOT EXISTS `production` (
  `productionid` int NOT NULL AUTO_INCREMENT,
  `itemid` int NOT NULL,
  `itemvid` int DEFAULT NULL,
  `itemquantity` int NOT NULL,
  `savedby` int NOT NULL,
  `saveddate` date NOT NULL,
  `productionexpiredate` date NOT NULL,
  PRIMARY KEY (`productionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `production_details`
--

DROP TABLE IF EXISTS `production_details`;
CREATE TABLE IF NOT EXISTS `production_details` (
  `pro_detailsid` int NOT NULL AUTO_INCREMENT,
  `foodid` int NOT NULL,
  `pvarientid` int DEFAULT NULL,
  `ingredientid` int NOT NULL,
  `qty` decimal(10,2) NOT NULL DEFAULT '0.00',
  `unitname` varchar(100) NOT NULL,
  `createdby` int NOT NULL,
  `created_date` date NOT NULL,
  PRIMARY KEY (`pro_detailsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `purchaseitem`
--

DROP TABLE IF EXISTS `purchaseitem`;
CREATE TABLE IF NOT EXISTS `purchaseitem` (
  `purID` int NOT NULL AUTO_INCREMENT,
  `invoiceid` varchar(50) DEFAULT NULL,
  `suplierID` int NOT NULL,
  `paymenttype` int DEFAULT NULL,
  `bankid` int DEFAULT NULL,
  `total_price` decimal(19,3) NOT NULL DEFAULT '0.000',
  `paid_amount` decimal(19,3) DEFAULT '0.000',
  `details` text,
  `purchasedate` date NOT NULL,
  `purchaseexpiredate` date NOT NULL,
  `savedby` int NOT NULL,
  PRIMARY KEY (`purID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_details`
--

DROP TABLE IF EXISTS `purchase_details`;
CREATE TABLE IF NOT EXISTS `purchase_details` (
  `detailsid` int NOT NULL AUTO_INCREMENT,
  `purchaseid` int NOT NULL,
  `indredientid` int NOT NULL,
  `quantity` decimal(19,3) NOT NULL DEFAULT '0.000',
  `unitname` varchar(80) NOT NULL,
  `price` decimal(19,3) NOT NULL DEFAULT '0.000',
  `totalprice` decimal(19,3) NOT NULL DEFAULT '0.000',
  `purchaseby` int NOT NULL,
  `purchasedate` date NOT NULL,
  `purchaseexpiredate` date NOT NULL,
  PRIMARY KEY (`detailsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_return`
--

DROP TABLE IF EXISTS `purchase_return`;
CREATE TABLE IF NOT EXISTS `purchase_return` (
  `preturn_id` int NOT NULL AUTO_INCREMENT,
  `supplier_id` int NOT NULL,
  `po_no` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `return_date` date NOT NULL,
  `totalamount` float NOT NULL,
  `totaldiscount` float NOT NULL,
  `return_reason` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `createby` int NOT NULL,
  `createdate` datetime NOT NULL,
  `updateby` int NOT NULL,
  `updatedate` datetime NOT NULL,
  PRIMARY KEY (`preturn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_return_details`
--

DROP TABLE IF EXISTS `purchase_return_details`;
CREATE TABLE IF NOT EXISTS `purchase_return_details` (
  `preturn_id` int NOT NULL,
  `product_id` bigint NOT NULL,
  `qty` int NOT NULL,
  `product_rate` float NOT NULL,
  `store_id` int NOT NULL,
  `discount` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rate_type`
--

DROP TABLE IF EXISTS `rate_type`;
CREATE TABLE IF NOT EXISTS `rate_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `r_type_name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rate_type`
--

INSERT INTO `rate_type` (`id`, `r_type_name`) VALUES(1, 'Hourly');
INSERT INTO `rate_type` (`id`, `r_type_name`) VALUES(2, 'Salary');

-- --------------------------------------------------------

--
-- Table structure for table `reservationofday`
--

DROP TABLE IF EXISTS `reservationofday`;
CREATE TABLE IF NOT EXISTS `reservationofday` (
  `offdayid` int NOT NULL AUTO_INCREMENT,
  `offdaydate` date NOT NULL,
  `availtime` varchar(50) NOT NULL,
  `is_active` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`offdayid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rest_table`
--

DROP TABLE IF EXISTS `rest_table`;
CREATE TABLE IF NOT EXISTS `rest_table` (
  `tableid` int NOT NULL AUTO_INCREMENT,
  `tablename` varchar(50) NOT NULL,
  `person_capicity` int NOT NULL,
  `table_icon` varchar(255) NOT NULL,
  `floor` int DEFAULT '0',
  `status` int NOT NULL DEFAULT '0' COMMENT '1=booked,0=free',
  PRIMARY KEY (`tableid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rest_table`
--

INSERT INTO `rest_table` (`tableid`, `tablename`, `person_capicity`, `table_icon`, `floor`, `status`) VALUES(1, '1', 2, 'assets/img/icons/resttable/1.png', 3, 1);
INSERT INTO `rest_table` (`tableid`, `tablename`, `person_capicity`, `table_icon`, `floor`, `status`) VALUES(2, '2', 4, 'assets/img/icons/resttable/4.png', 1, 1);
INSERT INTO `rest_table` (`tableid`, `tablename`, `person_capicity`, `table_icon`, `floor`, `status`) VALUES(3, '3', 2, 'assets/img/icons/resttable/2.png', 1, 0);
INSERT INTO `rest_table` (`tableid`, `tablename`, `person_capicity`, `table_icon`, `floor`, `status`) VALUES(6, '6', 3, 'assets/img/icons/resttable/3.png', 1, 0);
INSERT INTO `rest_table` (`tableid`, `tablename`, `person_capicity`, `table_icon`, `floor`, `status`) VALUES(7, '7', 8, 'assets/img/icons/resttable/8.png', 1, 1);
INSERT INTO `rest_table` (`tableid`, `tablename`, `person_capicity`, `table_icon`, `floor`, `status`) VALUES(8, '8', 4, 'assets/img/icons/resttable/4.png', 3, 1);
INSERT INTO `rest_table` (`tableid`, `tablename`, `person_capicity`, `table_icon`, `floor`, `status`) VALUES(9, '9', 3, 'assets/img/icons/resttable/3.png', 1, 0);
INSERT INTO `rest_table` (`tableid`, `tablename`, `person_capicity`, `table_icon`, `floor`, `status`) VALUES(10, 'VIP', 8, 'assets/img/icons/resttable/7.png', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `role_permission`
--

DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE IF NOT EXISTS `role_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fk_module_id` int NOT NULL,
  `role_id` int NOT NULL,
  `create` tinyint(1) DEFAULT NULL,
  `read` tinyint(1) DEFAULT NULL,
  `update` tinyint(1) DEFAULT NULL,
  `delete` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_module_id` (`fk_module_id`),
  KEY `fk_user_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `salary_setup_header`
--

DROP TABLE IF EXISTS `salary_setup_header`;
CREATE TABLE IF NOT EXISTS `salary_setup_header` (
  `s_s_h_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `employee_id` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `salary_payable` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `absent_deduct` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tax_manager` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`s_s_h_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `salary_sheet_generate`
--

DROP TABLE IF EXISTS `salary_sheet_generate`;
CREATE TABLE IF NOT EXISTS `salary_sheet_generate` (
  `ssg_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `employee_id` varchar(20) NOT NULL,
  `name` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `gdate` varchar(20) DEFAULT NULL,
  `start_date` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `end_date` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `generate_by` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`ssg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `salary_type`
--

DROP TABLE IF EXISTS `salary_type`;
CREATE TABLE IF NOT EXISTS `salary_type` (
  `salary_type_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `sal_name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `emp_sal_type` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `default_amount` varchar(30) NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`salary_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `salary_type`
--

INSERT INTO `salary_type` (`salary_type_id`, `sal_name`, `emp_sal_type`, `default_amount`, `status`) VALUES(1, 'House Rent', '1', '', '');
INSERT INTO `salary_type` (`salary_type_id`, `sal_name`, `emp_sal_type`, `default_amount`, `status`) VALUES(2, 'Medical', '1', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `sec_menu_item`
--

DROP TABLE IF EXISTS `sec_menu_item`;
CREATE TABLE IF NOT EXISTS `sec_menu_item` (
  `menu_id` int NOT NULL AUTO_INCREMENT,
  `menu_title` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `page_url` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `module` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_menu` int DEFAULT NULL,
  `is_report` tinyint(1) DEFAULT NULL,
  `createby` int NOT NULL,
  `createdate` datetime NOT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1520 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sec_menu_item`
--

INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(1, 'manage_category', '', 'itemmanage', 0, 0, 2, '2018-11-05 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(2, 'category_list', 'item_category', 'itemmanage', 0, 0, 2, '2018-11-05 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(3, 'add_category', 'create', 'itemmanage', 2, 0, 2, '2018-11-05 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(4, 'manage_food', '', 'itemmanage', 0, 0, 2, '2018-11-05 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(5, 'food_list', 'item_food', 'itemmanage', 0, 0, 2, '2018-11-05 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(6, 'add_food', 'index', 'itemmanage', 5, 0, 2, '2018-11-05 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(7, 'food_varient', 'foodvarientlist', 'itemmanage', 5, 0, 2, '2018-11-07 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(8, 'add_varient', 'addvariant', 'itemmanage', 5, 0, 2, '2018-11-07 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(9, 'food_availablity', 'availablelist', 'itemmanage', 5, 0, 2, '2018-11-07 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(10, 'add_availablity', 'addavailable', 'itemmanage', 5, 0, 2, '2018-11-07 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(11, 'manage_addons', '', 'itemmanage', 0, 0, 2, '2018-11-05 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(12, 'addons_list', 'menu_addons', 'itemmanage', 0, 0, 2, '2018-11-05 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(13, 'add_adons', 'create', 'itemmanage', 8, 0, 2, '2018-11-05 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(14, 'manage_unitmeasurement', '', 'units', 0, 0, 2, '2018-11-05 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(15, 'unit_list', 'unitmeasurement', 'units', 0, 0, 2, '2018-11-05 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(16, 'unit_add', 'create', 'units', 12, 0, 2, '2018-11-05 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(17, 'manage_ingradient', '', 'units', 0, 0, 2, '2018-11-05 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(18, 'ingradient_list', 'ingradient', 'units', 0, 0, 2, '2018-11-05 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(19, 'add_ingredient', 'create', 'units', 15, 0, 2, '2018-11-05 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(20, 'assign_adons_list', 'assignaddons', 'itemmanage', 8, 0, 2, '2018-11-06 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(21, 'assign_adons', 'assignaddonscreate', 'itemmanage', 8, 0, 2, '2018-11-06 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(28, 'membership_management', '', 'setting', 0, 0, 2, '2018-11-12 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(29, 'membership_list', 'index', 'setting', 28, 0, 2, '2018-11-12 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(30, 'membership_add', 'create', 'setting', 29, 0, 2, '2018-11-12 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(31, 'payment_setting', '', 'setting', 0, 0, 2, '2018-11-12 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(32, 'paymentmethod_list', 'index', 'setting', 31, 0, 2, '2018-11-12 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(33, 'payment_add', 'create', 'setting', 32, 0, 2, '2018-11-12 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(34, 'shipping_setting', '', 'setting', 0, 0, 2, '2018-11-12 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(35, 'shipping_list', 'index', 'setting', 34, 0, 2, '2018-11-12 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(36, 'shipping_add', 'create', 'setting', 35, 0, 2, '2018-11-12 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(37, 'supplier_manage', '', 'setting', 0, 0, 2, '2018-11-12 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(38, 'supplier_list', 'index', 'setting', 37, 0, 2, '2018-11-12 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(39, 'supplier_add', 'create', 'setting', 38, 0, 2, '2018-11-12 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(40, 'purchase_item', 'index', 'purchase', 0, 0, 2, '2018-11-12 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(41, 'purchase_add', 'create', 'purchase', 40, 0, 2, '2018-11-12 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(42, 'table_manage', '', 'setting', 0, 0, 2, '2018-11-13 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(43, 'add_new_table', 'create', 'setting', 44, 0, 2, '2018-11-13 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(44, 'table_list', 'restauranttable', 'setting', 42, 0, 2, '2018-11-13 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(45, 'ordermanage', 'index', 'ordermanage', 0, 0, 2, '2018-11-22 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(46, 'add_new_order', 'neworder', 'ordermanage', 45, 0, 2, '2018-11-22 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(47, 'order_list', 'orderlist', 'ordermanage', 45, 0, 2, '2018-11-22 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(48, 'pending_order', 'pendingorder', 'ordermanage', 45, 0, 2, '2018-11-22 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(49, 'processing_order', 'processing', 'ordermanage', 45, 0, 2, '2018-11-22 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(50, 'complete_order', 'completelist', 'ordermanage', 45, 0, 2, '2018-11-22 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(51, 'cancel_order', 'cancellist', 'ordermanage', 45, 0, 2, '2018-11-22 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(52, 'pos_invoice', 'pos_invoice', 'ordermanage', 45, 0, 2, '2018-11-22 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(53, 'c_o_a', 'treeview', 'accounts', 0, 0, 2, '2018-12-17 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(54, 'debit_voucher', 'debit_voucher', 'accounts', 0, 0, 2, '2018-12-17 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(55, 'credit_voucher', 'credit_voucher', 'accounts', 0, 0, 2, '2018-12-17 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(56, 'contra_voucher', 'contra_voucher', 'accounts', 0, 0, 2, '2018-12-17 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(57, 'journal_voucher', 'journal_voucher', 'accounts', 0, 0, 2, '2018-12-17 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(58, 'voucher_approval', 'voucher_approval', 'accounts', 0, 0, 2, '2018-12-17 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(59, 'account_report', '', 'accounts', 0, 0, 2, '2018-12-17 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(60, 'voucher_report', 'coa', 'accounts', 59, 0, 2, '2018-12-17 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(61, 'cash_book', 'cash_book', 'accounts', 59, 0, 2, '2018-12-17 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(62, 'bank_book', 'bank_book', 'accounts', 59, 0, 2, '2018-12-17 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(63, 'general_ledger', 'general_ledger', 'accounts', 59, 0, 2, '2018-12-17 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(64, 'trial_balance', 'trial_balance', 'accounts', 59, 0, 2, '2018-12-17 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(65, 'profit_loss', 'profit_loss_report', 'accounts', 59, 0, 2, '2018-12-17 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(66, 'cash_flow', 'cash_flow_report', 'accounts', 59, 0, 2, '2018-12-17 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(67, 'coa_print', 'coa_print', 'accounts', 59, 0, 2, '2018-12-17 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(68, 'hrm', '', 'hrm', 0, 0, 2, '2018-12-18 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(69, 'attendance', 'Home', 'hrm', 0, 0, 2, '2018-12-18 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(70, 'atn_form', 'atnview', 'hrm', 69, 0, 2, '2018-12-18 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(71, 'atn_report', 'attendance_list', 'hrm', 69, 0, 2, '2018-12-18 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(72, 'award', 'Award_controller', 'hrm', 0, 0, 2, '2018-12-18 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(73, 'new_award', 'create_award', 'hrm', 72, 0, 2, '2018-12-18 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(74, 'circularprocess', 'Candidate', 'hrm', 0, 0, 2, '2018-12-18 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(75, 'add_canbasic_info', 'caninfo_create', 'hrm', 74, 0, 2, '2018-12-18 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(76, 'can_basicinfo_list', 'canInfoview', 'hrm', 74, 0, 2, '2018-12-18 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(77, 'candidate_basic_info', 'Candidate_select', 'hrm', 0, 0, 2, '2018-12-18 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(78, 'candidate_shortlist', 'shortlist_form', 'hrm', 77, 0, 2, '2018-12-18 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(79, 'candidate_interview', 'interview_form', 'hrm', 77, 0, 2, '2018-12-18 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(80, 'candidate_selection', 'selection_form', 'hrm', 77, 0, 2, '2018-12-18 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(81, 'department', 'Department_controller', 'hrm', 0, 0, 2, '2018-12-18 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(82, 'departmentfrm', 'create_dept', 'hrm', 81, 0, 2, '2018-12-18 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(83, 'division', 'Division_controller', 'hrm', 0, 0, 2, '2018-12-18 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(84, 'add_division', 'division_form', 'hrm', 83, 0, 2, '2018-12-18 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(85, 'ehrm', 'Employees', 'hrm', 0, 0, 2, '2018-12-18 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(86, 'division_list', 'position_form', 'hrm', 87, 0, 2, '2018-12-18 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(87, 'designation', 'create_position', 'hrm', 87, 0, 2, '2018-12-18 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(88, 'add_employee', 'viewEmhistory', 'hrm', 87, 0, 2, '2018-12-18 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(89, 'manage_employee', 'manageemployee', 'hrm', 87, 0, 2, '2018-12-18 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(91, 'emp_sal_payment', 'paymentview', 'hrm', 87, 0, 2, '2018-12-18 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(92, 'leave', 'leave', 'hrm', 0, 0, 2, '2018-12-18 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(93, 'weekly_holiday', 'weeklyform', 'hrm', 92, 0, 2, '2018-12-18 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(94, 'holiday', 'holiday_form', 'hrm', 92, 0, 2, '2018-12-18 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(95, 'others_leave_application', 'others_leave', 'hrm', 92, 0, 2, '2018-12-18 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(96, 'add_leave_type', 'leave_type_form', 'hrm', 92, 0, 2, '2018-12-18 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(97, 'leave_application', 'others_leave', 'hrm', 92, 0, 2, '2018-12-18 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(98, 'loan', 'loan', 'hrm', 0, 0, 2, '2018-12-18 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(99, 'loan_grand', 'create_grandloan', 'hrm', 98, 0, 2, '2018-12-18 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(100, 'loan_installment', 'create_installment', 'hrm', 98, 0, 2, '2018-12-19 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(101, 'manage_installment', 'installmentView', 'hrm', 98, 0, 2, '2018-12-19 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(102, 'manage_granted_loan', 'loan_view', 'hrm', 98, 0, 2, '2018-12-19 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(103, 'loan_report', 'loan_report', 'hrm', 98, 0, 2, '2018-12-19 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(104, 'payroll', 'Payroll', 'hrm', 0, 0, 2, '2018-12-19 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(105, 'salary_type_setup', 'create_salary_setup', 'hrm', 104, 0, 2, '2018-12-19 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(106, 'manage_salary_setup', 'emp_salary_setup_view', 'hrm', 104, 0, 2, '2018-12-19 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(107, 'salary_setup', 'create_s_setup', 'hrm', 104, 0, 2, '2018-12-19 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(108, 'manage_salary_type', 'salary_setup_view', 'hrm', 104, 0, 2, '2018-12-19 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(109, 'salary_generate', 'create_salary_generate', 'hrm', 104, 0, 2, '2018-12-19 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(110, 'manage_salary_generate', 'salary_generate_view', 'hrm', 104, 0, 2, '2018-12-19 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(111, 'purchase_return', 'return_form', 'purchase', 40, 0, 2, '2018-12-19 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(112, 'return_invoice', 'return_invoice', 'purchase', 40, 0, 2, '2018-12-19 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(113, 'report', 'reports', 'report', 0, 0, 2, '2018-12-19 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(114, 'purchase_report', 'index', 'report', 113, 0, 2, '2018-12-19 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(115, 'stock_report_product_wise', 'productwise', 'report', 113, 0, 2, '2018-12-19 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(116, 'purchase_report_ingredient', 'ingredientwise', 'report', 113, 0, 2, '2018-12-19 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(117, 'sell_report', 'sellrpt', 'report', 113, 0, 2, '2018-12-19 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(118, 'table_setting', 'tablesetting', 'setting', 44, 0, 2, '2018-12-19 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(119, 'customer_type', '', 'setting', 0, 0, 2, '2018-12-19 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(120, 'customertype_list', 'customertype', 'setting', 0, 0, 2, '2018-12-19 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(121, 'add_type', 'create', 'setting', 120, 0, 2, '2018-12-19 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(122, 'currency', '', 'setting', 0, 0, 2, '2018-12-19 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(123, 'currency_list', 'currency', 'setting', 0, 0, 2, '2018-12-19 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(124, 'currency_add', 'create', 'setting', 123, 0, 2, '2018-12-19 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(125, 'production', '', 'production', 0, 0, 2, '2018-12-19 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(126, 'production_set_list', 'production', 'production', 0, 0, 2, '2018-12-19 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(127, 'set_productionunit', 'productionunit', 'production', 126, 0, 2, '2018-12-19 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(128, 'production_add', 'create', 'production', 126, 0, 2, '2018-12-19 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(129, 'production_list', 'addproduction', 'production', 126, 0, 2, '2018-12-19 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(130, 'reservation', '', 'reservation', 0, 0, 2, '2018-12-19 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(131, 'reservation_table', 'tablebooking', 'reservation', 130, 0, 2, '2018-12-19 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(132, 'update_ord', 'updateorder', 'ordermanage', 45, 0, 2, '2019-12-11 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(133, 'kitchen_dashboard', 'kitchen', 'ordermanage', 45, 0, 2, '2020-02-13 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(134, 'counter_dashboard', 'counterboard', 'ordermanage', 45, 0, 2, '2020-02-16 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(191, 'counter_list', 'counterlist', 'ordermanage', 45, 0, 2, '2021-03-28 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(192, 'pos_setting', 'possetting', 'ordermanage', 45, 0, 2, '2021-03-28 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(193, 'sound_setting', 'soundsetting', 'ordermanage', 45, 0, 2, '2021-03-28 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(194, 'supplier_ledger', 'supplier_ledger_report', 'purchase', 38, 0, 2, '2021-03-28 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(195, 'stock_out_ingredients', 'stock_out_ingredients', 'purchase', 40, 0, 2, '2021-03-28 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(196, 'sell_report_items', 'sellrptItems', 'report', 117, 0, 2, '2021-01-21 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(197, 'scharge_report', 'servicerpt', 'report', 113, 0, 2, '2021-01-21 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(198, 'sell_report_waiters', 'sellrptwaiter', 'report', 113, 0, 2, '2021-01-21 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(199, 'kitchen_sell', 'kichansrpt', 'report', 113, 0, 2, '2021-01-21 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(200, 'sell_report_delvirytype', 'sellrptdelvirytype', 'report', 113, 0, 2, '2021-01-21 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(201, 'sell_report_casher', 'sellrptCasher', 'report', 113, 0, 2, '2021-01-21 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(202, 'unpaid_sell', 'unpaid_sell', 'report', 113, 0, 2, '2021-01-21 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(203, 'sell_report_filter', 'sellrpt2', 'report', 113, 0, 2, '2021-01-21 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(204, 'sele_by_date', 'sellrptbydate', 'report', 113, 0, 2, '2021-01-21 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(205, 'production_setting', 'possetting', 'production', 125, 0, 2, '2021-03-28 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(206, 'kitchen_setting', 'kitchensetting', 'setting', 0, 0, 2, '2021-03-28 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(207, 'kitchen_assign', 'assignkitchen', 'setting', 206, 0, 2, '2021-03-28 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(208, 'sms_setting', 'smsetting', 'setting', 0, 0, 2, '2021-03-28 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(209, 'sms_configuration', 'sms_configuration', 'setting', 208, 0, 2, '2021-03-28 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(210, 'sms_temp', 'sms_template', 'setting', 208, 0, 2, '2021-03-28 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(211, 'bank', 'bank_list', 'setting', 0, 0, 2, '2021-03-28 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(212, 'list_of_bank', 'index', 'setting', 211, 0, 2, '2021-03-28 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(213, 'language', 'language', 'setting', 0, 0, 2, '2021-03-28 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(214, 'application_setting', 'setting', 'setting', 0, 0, 2, '2021-03-28 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(215, 'server_setting', 'serversetting', 'setting', 0, 0, 2, '2021-03-28 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(216, 'factory_reset', 'factoryreset', 'setting', 214, 0, 2, '2021-03-28 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(217, 'country', 'country_city_list', 'setting', 0, 0, 2, '2021-03-28 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(218, 'state', 'statelist', 'setting', 217, 0, 2, '2021-03-28 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(219, 'city', 'citylist', 'setting', 217, 0, 2, '2021-03-28 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(220, 'commission', 'Commissionsetting/payroll_commission', 'setting', 0, 0, 2, '2021-03-28 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(221, 'supplier_payment', 'supplier_payments', 'accounts', 59, 0, 2, '2021-03-28 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(222, 'cash_adjustment', 'cash_adjustment', 'accounts', 59, 0, 2, '2021-03-28 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(223, 'balance_sheet', 'balance_sheet', 'accounts', 59, 0, 2, '2021-03-28 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(224, 'expense', 'Cexpense', 'hrm', 0, 0, 2, '2021-03-28 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(225, 'unavailable_day', 'unavailablelist', 'reservation', 130, 0, 2, '2021-03-28 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(226, 'reservasetting', 'setting', 'reservation', 130, 0, 2, '2021-03-28 00:00:00');
INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `is_report`, `createby`, `createdate`) VALUES(1388, 'dashboard', 'home', 'dashboard', 0, 0, 2, '2021-09-02 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `sec_role_permission`
--

DROP TABLE IF EXISTS `sec_role_permission`;
CREATE TABLE IF NOT EXISTS `sec_role_permission` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` int NOT NULL,
  `menu_id` int NOT NULL,
  `can_access` tinyint(1) NOT NULL,
  `can_create` tinyint(1) NOT NULL,
  `can_edit` tinyint(1) NOT NULL,
  `can_delete` tinyint(1) NOT NULL,
  `createby` int NOT NULL,
  `createdate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=696 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sec_role_permission`
--

INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(520, 3, 53, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(521, 3, 54, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(522, 3, 55, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(523, 3, 56, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(524, 3, 57, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(525, 3, 58, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(526, 3, 59, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(527, 3, 60, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(528, 3, 61, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(529, 3, 62, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(530, 3, 63, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(531, 3, 64, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(532, 3, 65, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(533, 3, 66, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(534, 3, 67, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(535, 3, 221, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(536, 3, 222, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(537, 3, 223, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(538, 3, 1388, 1, 1, 1, 1, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(539, 3, 68, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(540, 3, 69, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(541, 3, 70, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(542, 3, 71, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(543, 3, 72, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(544, 3, 73, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(545, 3, 74, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(546, 3, 75, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(547, 3, 76, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(548, 3, 77, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(549, 3, 78, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(550, 3, 79, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(551, 3, 80, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(552, 3, 81, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(553, 3, 82, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(554, 3, 83, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(555, 3, 84, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(556, 3, 85, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(557, 3, 86, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(558, 3, 87, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(559, 3, 88, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(560, 3, 89, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(561, 3, 90, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(562, 3, 91, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(563, 3, 92, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(564, 3, 93, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(565, 3, 94, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(566, 3, 95, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(567, 3, 96, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(568, 3, 97, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(569, 3, 98, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(570, 3, 99, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(571, 3, 100, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(572, 3, 101, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(573, 3, 102, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(574, 3, 103, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(575, 3, 104, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(576, 3, 105, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(577, 3, 106, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(578, 3, 107, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(579, 3, 108, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(580, 3, 109, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(581, 3, 110, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(582, 3, 224, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(583, 3, 1, 1, 1, 1, 1, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(584, 3, 2, 1, 1, 1, 1, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(585, 3, 3, 1, 1, 1, 1, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(586, 3, 4, 1, 1, 1, 1, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(587, 3, 5, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(588, 3, 6, 1, 1, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(589, 3, 7, 1, 1, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(590, 3, 8, 1, 1, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(591, 3, 9, 1, 1, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(592, 3, 10, 1, 1, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(593, 3, 11, 1, 1, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(594, 3, 12, 1, 1, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(595, 3, 13, 1, 1, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(596, 3, 20, 1, 1, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(597, 3, 21, 1, 1, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(598, 3, 1382, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(599, 3, 1383, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(600, 3, 1384, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(601, 3, 1385, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(602, 3, 1386, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(603, 3, 1387, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(604, 3, 45, 1, 1, 1, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(605, 3, 46, 1, 1, 1, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(606, 3, 47, 1, 1, 1, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(607, 3, 48, 1, 1, 1, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(608, 3, 49, 1, 1, 1, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(609, 3, 50, 1, 1, 1, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(610, 3, 51, 1, 1, 1, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(611, 3, 52, 1, 1, 1, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(612, 3, 132, 1, 1, 1, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(613, 3, 133, 1, 1, 1, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(614, 3, 134, 1, 1, 1, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(615, 3, 191, 1, 1, 1, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(616, 3, 192, 1, 1, 1, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(617, 3, 193, 1, 1, 1, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(618, 3, 125, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(619, 3, 126, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(620, 3, 127, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(621, 3, 128, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(622, 3, 129, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(623, 3, 205, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(624, 3, 40, 1, 1, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(625, 3, 41, 1, 1, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(626, 3, 111, 1, 1, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(627, 3, 112, 1, 1, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(628, 3, 194, 1, 1, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(629, 3, 195, 1, 1, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(630, 3, 227, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(631, 3, 228, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(632, 3, 229, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(633, 3, 113, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(634, 3, 114, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(635, 3, 115, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(636, 3, 116, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(637, 3, 117, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(638, 3, 196, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(639, 3, 197, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(640, 3, 198, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(641, 3, 199, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(642, 3, 200, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(643, 3, 201, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(644, 3, 202, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(645, 3, 203, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(646, 3, 204, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(647, 3, 130, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(648, 3, 131, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(649, 3, 225, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(650, 3, 226, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(651, 3, 28, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(652, 3, 29, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(653, 3, 30, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(654, 3, 31, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(655, 3, 32, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(656, 3, 33, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(657, 3, 34, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(658, 3, 35, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(659, 3, 36, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(660, 3, 37, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(661, 3, 38, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(662, 3, 39, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(663, 3, 42, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(664, 3, 43, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(665, 3, 44, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(666, 3, 118, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(667, 3, 119, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(668, 3, 120, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(669, 3, 121, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(670, 3, 122, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(671, 3, 123, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(672, 3, 124, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(673, 3, 206, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(674, 3, 207, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(675, 3, 208, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(676, 3, 209, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(677, 3, 210, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(678, 3, 211, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(679, 3, 212, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(680, 3, 213, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(681, 3, 214, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(682, 3, 215, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(683, 3, 216, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(684, 3, 217, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(685, 3, 218, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(686, 3, 219, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(687, 3, 220, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(688, 3, 14, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(689, 3, 15, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(690, 3, 16, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(691, 3, 17, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(692, 3, 18, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(693, 3, 19, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(694, 3, 230, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');
INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES(695, 3, 231, 0, 0, 0, 0, 2, '2021-09-02 05:42:45');

-- --------------------------------------------------------

--
-- Table structure for table `sec_role_tbl`
--

DROP TABLE IF EXISTS `sec_role_tbl`;
CREATE TABLE IF NOT EXISTS `sec_role_tbl` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` text NOT NULL,
  `role_description` text NOT NULL,
  `create_by` int DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `role_status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sec_role_tbl`
--

INSERT INTO `sec_role_tbl` (`role_id`, `role_name`, `role_description`, `create_by`, `date_time`, `role_status`) VALUES(1, 'kitchen', 'manage kitchen', 2, '2020-10-12 10:27:03', 1);
INSERT INTO `sec_role_tbl` (`role_id`, `role_name`, `role_description`, `create_by`, `date_time`, `role_status`) VALUES(2, 'Counter', 'Display Order timing', 2, '2020-10-12 10:27:45', 1);
INSERT INTO `sec_role_tbl` (`role_id`, `role_name`, `role_description`, `create_by`, `date_time`, `role_status`) VALUES(3, 'Waiter', 'Order Taken and served food', 2, '2020-10-12 10:29:13', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sec_user_access_tbl`
--

DROP TABLE IF EXISTS `sec_user_access_tbl`;
CREATE TABLE IF NOT EXISTS `sec_user_access_tbl` (
  `role_acc_id` int NOT NULL AUTO_INCREMENT,
  `fk_role_id` int NOT NULL,
  `fk_user_id` int NOT NULL,
  PRIMARY KEY (`role_acc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sec_user_access_tbl`
--

INSERT INTO `sec_user_access_tbl` (`role_acc_id`, `fk_role_id`, `fk_user_id`) VALUES(1, 3, 172);

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

DROP TABLE IF EXISTS `setting`;
CREATE TABLE IF NOT EXISTS `setting` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `storename` varchar(100) DEFAULT NULL,
  `address` text,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `logo` varchar(50) DEFAULT NULL,
  `logoweb` varchar(255) DEFAULT NULL,
  `favicon` varchar(100) DEFAULT NULL,
  `opentime` varchar(255) DEFAULT NULL,
  `closetime` varchar(255) DEFAULT NULL,
  `vat` decimal(10,2) NOT NULL DEFAULT '0.00',
  `isvatnumshow` int DEFAULT '0',
  `vattinno` varchar(30) DEFAULT NULL,
  `isvatinclusive` int NOT NULL DEFAULT '0',
  `discount_type` int NOT NULL DEFAULT '0' COMMENT '0=amount,1=percent',
  `discountrate` decimal(19,3) DEFAULT '0.000',
  `servicecharge` decimal(10,0) NOT NULL DEFAULT '0',
  `service_chargeType` int NOT NULL DEFAULT '0' COMMENT '0=amount,1=percent',
  `currency` int DEFAULT '0',
  `min_prepare_time` varchar(50) DEFAULT NULL,
  `language` varchar(100) DEFAULT NULL,
  `timezone` varchar(150) NOT NULL,
  `dateformat` text NOT NULL,
  `site_align` varchar(50) DEFAULT NULL,
  `kitchenrefreshtime` int DEFAULT '5',
  `powerbytxt` text,
  `footer_text` varchar(255) DEFAULT NULL,
  `reservation_open` varchar(30) DEFAULT NULL,
  `reservation_close` varchar(30) DEFAULT NULL,
  `maxreserveperson` int DEFAULT NULL,
  `printtype` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id`, `title`, `storename`, `address`, `email`, `phone`, `logo`, `logoweb`, `favicon`, `opentime`, `closetime`, `vat`, `isvatnumshow`, `vattinno`, `isvatinclusive`, `discount_type`, `discountrate`, `servicecharge`, `service_chargeType`, `currency`, `min_prepare_time`, `language`, `timezone`, `dateformat`, `site_align`, `kitchenrefreshtime`, `powerbytxt`, `footer_text`, `reservation_open`, `reservation_close`, `maxreserveperson`, `printtype`) VALUES(2, 'Bhojon Restaurant', 'Dhaka Restaurant', '98 Green Road, Farmgate, Dhaka-1215.', 'bdtask@gmail.com', '0123456789', 'assets/img/icons/2019-10-29/h.png', NULL, 'assets/img/icons/m.png', '9:00AM', '10:00PM', 7.50, NULL, '23457586', 1, 1, 5.000, 20, 1, 2, '1:00 Hour', 'english', 'Asia/Dhaka', 'd/m/Y', 'LTR', 15, 'Powered By: BDTASK, www.bdtask.com\r\n', '2020', '09:00:00', '22:00:00', 20, 2);

-- --------------------------------------------------------

--
-- Table structure for table `shipping_method`
--

DROP TABLE IF EXISTS `shipping_method`;
CREATE TABLE IF NOT EXISTS `shipping_method` (
  `ship_id` int NOT NULL AUTO_INCREMENT,
  `shipping_method` varchar(150) NOT NULL,
  `shippingrate` decimal(10,2) NOT NULL DEFAULT '0.00',
  `payment_method` varchar(255) DEFAULT NULL,
  `is_active` int NOT NULL DEFAULT '0',
  `shiptype` int DEFAULT NULL COMMENT '1=dinein,2=pickup,3=home',
  PRIMARY KEY (`ship_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shipping_method`
--

INSERT INTO `shipping_method` (`ship_id`, `shipping_method`, `shippingrate`, `payment_method`, `is_active`, `shiptype`) VALUES(1, 'Home Delivary', 60.00, '9, 8, 5, 4, 3, 1', 1, 3);
INSERT INTO `shipping_method` (`ship_id`, `shipping_method`, `shippingrate`, `payment_method`, `is_active`, `shiptype`) VALUES(2, 'Pickup', 0.00, '4, 3, 1', 1, 2);
INSERT INTO `shipping_method` (`ship_id`, `shipping_method`, `shippingrate`, `payment_method`, `is_active`, `shiptype`) VALUES(3, 'Dine-in', 0.00, '9, 8, 5, 4, 3', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sms_configuration`
--

DROP TABLE IF EXISTS `sms_configuration`;
CREATE TABLE IF NOT EXISTS `sms_configuration` (
  `id` int NOT NULL AUTO_INCREMENT,
  `link` text NOT NULL,
  `gateway` varchar(200) NOT NULL,
  `user_name` varchar(200) NOT NULL,
  `password` varchar(255) NOT NULL,
  `sms_from` varchar(200) NOT NULL,
  `userid` varchar(100) NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sms_configuration`
--

INSERT INTO `sms_configuration` (`id`, `link`, `gateway`, `user_name`, `password`, `sms_from`, `userid`, `status`) VALUES(1, 'http://smsrank.com/', 'SMS Rank', 'rabbani', '123456', 'smsrank', '', 1);
INSERT INTO `sms_configuration` (`id`, `link`, `gateway`, `user_name`, `password`, `sms_from`, `userid`, `status`) VALUES(2, 'https://www.nexmo.com/', 'nexmo', '50489b88', 'z1cBmtrDeQrOaqhg', 'restaurant', '', 0);
INSERT INTO `sms_configuration` (`id`, `link`, `gateway`, `user_name`, `password`, `sms_from`, `userid`, `status`) VALUES(3, 'https://www.budgetsms.net/', 'budgetsms', 'user1', '1e753da74', 'budgetsms', '21547', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sms_template`
--

DROP TABLE IF EXISTS `sms_template`;
CREATE TABLE IF NOT EXISTS `sms_template` (
  `id` int NOT NULL AUTO_INCREMENT,
  `template_name` varchar(255) NOT NULL,
  `message` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `default_status` tinyint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sms_template`
--

INSERT INTO `sms_template` (`id`, `template_name`, `message`, `type`, `status`, `default_status`, `created_at`, `updated_at`) VALUES(1, 'one', 'your Order {id} is cancel for some reason.', 'Cancel', 0, 0, '2018-12-30 18:08:07', '0000-00-00 00:00:00');
INSERT INTO `sms_template` (`id`, `template_name`, `message`, `type`, `status`, `default_status`, `created_at`, `updated_at`) VALUES(2, 'two', 'your order {id} is completed', 'CompleteOrder', 0, 1, '2018-12-30 19:58:19', '0000-00-00 00:00:00');
INSERT INTO `sms_template` (`id`, `template_name`, `message`, `type`, `status`, `default_status`, `created_at`, `updated_at`) VALUES(3, 'three', 'your order {id} is processing', 'Processing', 0, 1, '2018-11-06 18:00:46', '0000-00-00 00:00:00');
INSERT INTO `sms_template` (`id`, `template_name`, `message`, `type`, `status`, `default_status`, `created_at`, `updated_at`) VALUES(8, 'four', 'Your Order Has been Placed Successfully.', 'Neworder', 1, 0, '2018-12-30 19:59:32', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `subscribe_emaillist`
--

DROP TABLE IF EXISTS `subscribe_emaillist`;
CREATE TABLE IF NOT EXISTS `subscribe_emaillist` (
  `emailid` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `dateinsert` datetime NOT NULL,
  PRIMARY KEY (`emailid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sub_order`
--

DROP TABLE IF EXISTS `sub_order`;
CREATE TABLE IF NOT EXISTS `sub_order` (
  `sub_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `customer_id` int DEFAULT NULL,
  `vat` float DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT '0.00',
  `s_charge` float DEFAULT NULL,
  `total_price` float DEFAULT NULL,
  `status` int NOT NULL DEFAULT '0' COMMENT '0=unpaid,1=paid',
  `order_menu_id` text,
  `adons_id` varchar(20) DEFAULT NULL,
  `adons_qty` varchar(20) DEFAULT NULL,
  `invoiceprint` int DEFAULT NULL,
  PRIMARY KEY (`sub_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
CREATE TABLE IF NOT EXISTS `supplier` (
  `supid` int NOT NULL AUTO_INCREMENT,
  `suplier_code` varchar(255) NOT NULL,
  `supName` varchar(100) NOT NULL,
  `supEmail` varchar(100) NOT NULL,
  `supMobile` varchar(50) NOT NULL,
  `supAddress` text NOT NULL,
  PRIMARY KEY (`supid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_ledger`
--

DROP TABLE IF EXISTS `supplier_ledger`;
CREATE TABLE IF NOT EXISTS `supplier_ledger` (
  `id` int NOT NULL AUTO_INCREMENT,
  `transaction_id` varchar(100) NOT NULL,
  `supplier_id` bigint DEFAULT NULL,
  `chalan_no` varchar(100) DEFAULT NULL,
  `deposit_no` varchar(50) DEFAULT NULL,
  `amount` decimal(19,3) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `payment_type` varchar(255) DEFAULT NULL,
  `cheque_no` varchar(255) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `d_c` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `synchronizer_setting`
--

DROP TABLE IF EXISTS `synchronizer_setting`;
CREATE TABLE IF NOT EXISTS `synchronizer_setting` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hostname` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `port` varchar(10) NOT NULL,
  `debug` varchar(10) NOT NULL,
  `project_root` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `synchronizer_setting`
--

INSERT INTO `synchronizer_setting` (`id`, `hostname`, `username`, `password`, `port`, `debug`, `project_root`) VALUES(8, '70.35.198.244', 'softest3bdtask', 'Ux5O~MBJ#odK', '21', 'true', './public_html/');

-- --------------------------------------------------------

--
-- Table structure for table `table_details`
--

DROP TABLE IF EXISTS `table_details`;
CREATE TABLE IF NOT EXISTS `table_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `table_id` int NOT NULL,
  `customer_id` int DEFAULT NULL,
  `order_id` int NOT NULL,
  `time_enter` time NOT NULL,
  `total_people` int NOT NULL,
  `delete_at` int NOT NULL DEFAULT '0',
  `created_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `table_setting`
--

DROP TABLE IF EXISTS `table_setting`;
CREATE TABLE IF NOT EXISTS `table_setting` (
  `settingid` int NOT NULL AUTO_INCREMENT,
  `tableid` int NOT NULL,
  `iconpos` text NOT NULL,
  PRIMARY KEY (`settingid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `table_setting`
--

INSERT INTO `table_setting` (`settingid`, `tableid`, `iconpos`) VALUES(1, 2, 'position: relative; left: 186px; top: 231px;');
INSERT INTO `table_setting` (`settingid`, `tableid`, `iconpos`) VALUES(2, 4, 'position: relative; left: 87px; top: 17px;');
INSERT INTO `table_setting` (`settingid`, `tableid`, `iconpos`) VALUES(3, 3, 'position: relative; left: -126px; top: 129px;');
INSERT INTO `table_setting` (`settingid`, `tableid`, `iconpos`) VALUES(4, 1, 'position: relative; left: 15px; top: 28px;');
INSERT INTO `table_setting` (`settingid`, `tableid`, `iconpos`) VALUES(5, 8, 'position: relative; left: -336px; top: 224px;');
INSERT INTO `table_setting` (`settingid`, `tableid`, `iconpos`) VALUES(6, 6, 'position: relative; left: -184px; top: 113px;');
INSERT INTO `table_setting` (`settingid`, `tableid`, `iconpos`) VALUES(7, 5, 'position: relative; left: -153px; top: 85px;');
INSERT INTO `table_setting` (`settingid`, `tableid`, `iconpos`) VALUES(8, 7, 'position: relative; left: -372px; top: 223px;');
INSERT INTO `table_setting` (`settingid`, `tableid`, `iconpos`) VALUES(9, 9, 'position: relative; left: -744px; top: 14px;');
INSERT INTO `table_setting` (`settingid`, `tableid`, `iconpos`) VALUES(10, 10, 'position: relative; left: -448px; top: 226px;');

-- --------------------------------------------------------

--
-- Table structure for table `tblreservation`
--

DROP TABLE IF EXISTS `tblreservation`;
CREATE TABLE IF NOT EXISTS `tblreservation` (
  `reserveid` int NOT NULL AUTO_INCREMENT,
  `cid` int NOT NULL,
  `tableid` int NOT NULL,
  `person_capicity` int NOT NULL,
  `formtime` time NOT NULL,
  `totime` time NOT NULL,
  `reserveday` date NOT NULL,
  `customer_notes` text,
  `status` int NOT NULL COMMENT '1=free,2=booked',
  `notif` int NOT NULL DEFAULT '0' COMMENT '0=unseen,1=seen',
  PRIMARY KEY (`reserveid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblserver`
--

DROP TABLE IF EXISTS `tblserver`;
CREATE TABLE IF NOT EXISTS `tblserver` (
  `serverid` int NOT NULL AUTO_INCREMENT,
  `localhost_url` varchar(255) NOT NULL,
  `online_url` varchar(255) NOT NULL,
  PRIMARY KEY (`serverid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblserver`
--

INSERT INTO `tblserver` (`serverid`, `localhost_url`, `online_url`) VALUES(1, 'http://localhost/restaurant_v2', 'http://soft14.bdtask.com/restaurant_v2');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_assign_kitchen`
--

DROP TABLE IF EXISTS `tbl_assign_kitchen`;
CREATE TABLE IF NOT EXISTS `tbl_assign_kitchen` (
  `assignid` int NOT NULL AUTO_INCREMENT,
  `kitchen_id` int NOT NULL,
  `userid` int NOT NULL,
  PRIMARY KEY (`assignid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_assign_kitchen`
--

INSERT INTO `tbl_assign_kitchen` (`assignid`, `kitchen_id`, `userid`) VALUES(2, 1, 177);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bank`
--

DROP TABLE IF EXISTS `tbl_bank`;
CREATE TABLE IF NOT EXISTS `tbl_bank` (
  `bankid` int NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(255) NOT NULL,
  `ac_name` varchar(200) DEFAULT NULL,
  `ac_number` varchar(200) DEFAULT NULL,
  `branch` varchar(200) DEFAULT NULL,
  `signature_pic` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bankid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_bank`
--

INSERT INTO `tbl_bank` (`bankid`, `bank_name`, `ac_name`, `ac_number`, `branch`, `signature_pic`) VALUES(1, 'Dutch-Bangla Bank', 'Ainal Haque', '110535764655', 'Mirpur 10', './application/modules/hrm/assets/images/2020-01-18/c.jpg');
INSERT INTO `tbl_bank` (`bankid`, `bank_name`, `ac_name`, `ac_number`, `branch`, `signature_pic`) VALUES(2, 'City Bank', 'Kamal Hassan', '3869583', 'Uttara', './application/modules/hrm/assets/images/2020-01-18/e.jpg');
INSERT INTO `tbl_bank` (`bankid`, `bank_name`, `ac_name`, `ac_number`, `branch`, `signature_pic`) VALUES(3, 'Brac Bank', 'Robiul Islam', '9356346', 'Motijeel', './application/modules/hrm/assets/images/2020-01-18/f.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_billingaddress`
--

DROP TABLE IF EXISTS `tbl_billingaddress`;
CREATE TABLE IF NOT EXISTS `tbl_billingaddress` (
  `billaddressid` int NOT NULL AUTO_INCREMENT,
  `orderid` int NOT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `companyname` varchar(100) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `city` varchar(70) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `country` varchar(150) DEFAULT NULL,
  `zip` varchar(50) DEFAULT NULL,
  `address` text,
  `address2` text,
  `DateInserted` datetime NOT NULL DEFAULT '1970-01-01 01:01:01',
  PRIMARY KEY (`billaddressid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cancelitem`
--

DROP TABLE IF EXISTS `tbl_cancelitem`;
CREATE TABLE IF NOT EXISTS `tbl_cancelitem` (
  `cancelid` int NOT NULL AUTO_INCREMENT,
  `orderid` int NOT NULL,
  `foodid` int NOT NULL,
  `varientid` int NOT NULL,
  `quantity` decimal(19,3) NOT NULL DEFAULT '0.000',
  PRIMARY KEY (`cancelid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_card_terminal`
--

DROP TABLE IF EXISTS `tbl_card_terminal`;
CREATE TABLE IF NOT EXISTS `tbl_card_terminal` (
  `card_terminalid` int NOT NULL AUTO_INCREMENT,
  `terminal_name` varchar(255) NOT NULL,
  PRIMARY KEY (`card_terminalid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_card_terminal`
--

INSERT INTO `tbl_card_terminal` (`card_terminalid`, `terminal_name`) VALUES(1, 'Nexus Terminal');
INSERT INTO `tbl_card_terminal` (`card_terminalid`, `terminal_name`) VALUES(2, 'Brac Bank Terminal');
INSERT INTO `tbl_card_terminal` (`card_terminalid`, `terminal_name`) VALUES(3, 'Visa-Master Terminal');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cashcounter`
--

DROP TABLE IF EXISTS `tbl_cashcounter`;
CREATE TABLE IF NOT EXISTS `tbl_cashcounter` (
  `ccid` int NOT NULL AUTO_INCREMENT,
  `counterno` int NOT NULL,
  PRIMARY KEY (`ccid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_cashcounter`
--

INSERT INTO `tbl_cashcounter` (`ccid`, `counterno`) VALUES(1, 1);
INSERT INTO `tbl_cashcounter` (`ccid`, `counterno`) VALUES(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cashregister`
--

DROP TABLE IF EXISTS `tbl_cashregister`;
CREATE TABLE IF NOT EXISTS `tbl_cashregister` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` int NOT NULL,
  `counter_no` int NOT NULL,
  `opening_balance` decimal(19,3) NOT NULL DEFAULT '0.000',
  `closing_balance` decimal(19,3) NOT NULL DEFAULT '0.000',
  `openclosedate` date NOT NULL,
  `opendate` datetime DEFAULT '1970-01-01 01:01:01',
  `closedate` datetime DEFAULT '1970-01-01 01:01:01',
  `status` int NOT NULL DEFAULT '0',
  `openingnote` text,
  `closing_note` text,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_city`
--

DROP TABLE IF EXISTS `tbl_city`;
CREATE TABLE IF NOT EXISTS `tbl_city` (
  `cityid` int NOT NULL AUTO_INCREMENT,
  `countryid` int NOT NULL,
  `stateid` int NOT NULL,
  `cityname` varchar(100) NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`cityid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_city`
--

INSERT INTO `tbl_city` (`cityid`, `countryid`, `stateid`, `cityname`, `status`) VALUES(3, 1, 12, 'Savar', 1);
INSERT INTO `tbl_city` (`cityid`, `countryid`, `stateid`, `cityname`, `status`) VALUES(4, 1, 12, 'Gajipur', 1);
INSERT INTO `tbl_city` (`cityid`, `countryid`, `stateid`, `cityname`, `status`) VALUES(5, 1, 12, 'Mirpur', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_country`
--

DROP TABLE IF EXISTS `tbl_country`;
CREATE TABLE IF NOT EXISTS `tbl_country` (
  `countryid` int NOT NULL AUTO_INCREMENT,
  `countryname` varchar(70) NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`countryid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_country`
--

INSERT INTO `tbl_country` (`countryid`, `countryname`, `status`) VALUES(1, 'Bangladesh', 1);
INSERT INTO `tbl_country` (`countryid`, `countryname`, `status`) VALUES(2, 'United State', 1);
INSERT INTO `tbl_country` (`countryid`, `countryname`, `status`) VALUES(3, 'United Kingdom', 1);
INSERT INTO `tbl_country` (`countryid`, `countryname`, `status`) VALUES(4, 'India', 1);
INSERT INTO `tbl_country` (`countryid`, `countryname`, `status`) VALUES(5, 'Vietnam', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_delivaritime`
--

DROP TABLE IF EXISTS `tbl_delivaritime`;
CREATE TABLE IF NOT EXISTS `tbl_delivaritime` (
  `dtimeid` int NOT NULL AUTO_INCREMENT,
  `deltime` varchar(255) NOT NULL,
  PRIMARY KEY (`dtimeid`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_delivaritime`
--

INSERT INTO `tbl_delivaritime` (`dtimeid`, `deltime`) VALUES(1, '10:00-10:30');
INSERT INTO `tbl_delivaritime` (`dtimeid`, `deltime`) VALUES(2, '10:30-11:00');
INSERT INTO `tbl_delivaritime` (`dtimeid`, `deltime`) VALUES(3, '11:00-11:30');
INSERT INTO `tbl_delivaritime` (`dtimeid`, `deltime`) VALUES(4, '11:30-12:00');
INSERT INTO `tbl_delivaritime` (`dtimeid`, `deltime`) VALUES(5, '12:00-12:30');
INSERT INTO `tbl_delivaritime` (`dtimeid`, `deltime`) VALUES(6, '12:30-13:00');
INSERT INTO `tbl_delivaritime` (`dtimeid`, `deltime`) VALUES(7, '13:00-13:30');
INSERT INTO `tbl_delivaritime` (`dtimeid`, `deltime`) VALUES(8, '13:30-14:00');
INSERT INTO `tbl_delivaritime` (`dtimeid`, `deltime`) VALUES(9, '14:00-14:30');
INSERT INTO `tbl_delivaritime` (`dtimeid`, `deltime`) VALUES(10, '14:30-15:00');
INSERT INTO `tbl_delivaritime` (`dtimeid`, `deltime`) VALUES(11, '15:00-15:30');
INSERT INTO `tbl_delivaritime` (`dtimeid`, `deltime`) VALUES(12, '15:30-16:00');
INSERT INTO `tbl_delivaritime` (`dtimeid`, `deltime`) VALUES(13, '16:00-16:30');
INSERT INTO `tbl_delivaritime` (`dtimeid`, `deltime`) VALUES(14, '16:30-17:00');
INSERT INTO `tbl_delivaritime` (`dtimeid`, `deltime`) VALUES(15, '17:00-17:30');
INSERT INTO `tbl_delivaritime` (`dtimeid`, `deltime`) VALUES(16, '17:30-18:00');
INSERT INTO `tbl_delivaritime` (`dtimeid`, `deltime`) VALUES(17, '18:00-18:30');
INSERT INTO `tbl_delivaritime` (`dtimeid`, `deltime`) VALUES(18, '18:30-19:00');
INSERT INTO `tbl_delivaritime` (`dtimeid`, `deltime`) VALUES(19, '19:00-19:30');
INSERT INTO `tbl_delivaritime` (`dtimeid`, `deltime`) VALUES(20, '19:30-20:00');
INSERT INTO `tbl_delivaritime` (`dtimeid`, `deltime`) VALUES(21, '20:00-20:30');
INSERT INTO `tbl_delivaritime` (`dtimeid`, `deltime`) VALUES(22, '20:30-21:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_delivaryaddress`
--

DROP TABLE IF EXISTS `tbl_delivaryaddress`;
CREATE TABLE IF NOT EXISTS `tbl_delivaryaddress` (
  `delivaryid` int NOT NULL AUTO_INCREMENT,
  `deladdress` text NOT NULL,
  PRIMARY KEY (`delivaryid`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_delivaryaddress`
--

INSERT INTO `tbl_delivaryaddress` (`delivaryid`, `deladdress`) VALUES(1, 'Uttara,Road#7,Dhaka-Bangladesh.');
INSERT INTO `tbl_delivaryaddress` (`delivaryid`, `deladdress`) VALUES(2, 'Uttara,Road#5,Dhaka');
INSERT INTO `tbl_delivaryaddress` (`delivaryid`, `deladdress`) VALUES(3, 'Uttara,Road#2,Dhaka');
INSERT INTO `tbl_delivaryaddress` (`delivaryid`, `deladdress`) VALUES(4, 'Uttara,Road#4,Dhaka');
INSERT INTO `tbl_delivaryaddress` (`delivaryid`, `deladdress`) VALUES(5, 'Gulsion Circle,Dhaka-Bangladesh');
INSERT INTO `tbl_delivaryaddress` (`delivaryid`, `deladdress`) VALUES(6, 'Banani, Dhaka-Bangladesh');
INSERT INTO `tbl_delivaryaddress` (`delivaryid`, `deladdress`) VALUES(7, 'Dhanmondi,Road#15 Dhaka-Bangladesh');
INSERT INTO `tbl_delivaryaddress` (`delivaryid`, `deladdress`) VALUES(8, 'Dhanmondi,Road#27 Dhaka-Bangladesh');
INSERT INTO `tbl_delivaryaddress` (`delivaryid`, `deladdress`) VALUES(9, 'Elephantroad, Dhaka-Bangladesh');
INSERT INTO `tbl_delivaryaddress` (`delivaryid`, `deladdress`) VALUES(10, 'Badda,Road#15 Dhaka-Bangladesh');
INSERT INTO `tbl_delivaryaddress` (`delivaryid`, `deladdress`) VALUES(11, 'Rampura,Road#15 Dhaka-Bangladesh');
INSERT INTO `tbl_delivaryaddress` (`delivaryid`, `deladdress`) VALUES(12, 'Khilkhet,Road#15 Dhaka-Bangladesh');
INSERT INTO `tbl_delivaryaddress` (`delivaryid`, `deladdress`) VALUES(13, 'Mohammadpur,Road#15 Dhaka-Bangladesh');
INSERT INTO `tbl_delivaryaddress` (`delivaryid`, `deladdress`) VALUES(14, 'Motijeel,Road#15 Dhaka-Bangladesh');
INSERT INTO `tbl_delivaryaddress` (`delivaryid`, `deladdress`) VALUES(15, 'komlapur,Road#15 Dhaka-Bangladesh');
INSERT INTO `tbl_delivaryaddress` (`delivaryid`, `deladdress`) VALUES(16, 'Newmarket,Road#15 Rajshahi-Bangladesh');
INSERT INTO `tbl_delivaryaddress` (`delivaryid`, `deladdress`) VALUES(17, 'Road#15, Khulna-Bangladesh');
INSERT INTO `tbl_delivaryaddress` (`delivaryid`, `deladdress`) VALUES(18, 'Road#15, Chittagong-Bangladesh');
INSERT INTO `tbl_delivaryaddress` (`delivaryid`, `deladdress`) VALUES(19, 'Agrabad, Chittagong-Bangladesh');
INSERT INTO `tbl_delivaryaddress` (`delivaryid`, `deladdress`) VALUES(20, 'Potengha, Chittagong-Bangladesh');
INSERT INTO `tbl_delivaryaddress` (`delivaryid`, `deladdress`) VALUES(21, 'Kadirgonj,Rail Gate,Nogor Bhabon, Rajshahi.');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_generatedreport`
--

DROP TABLE IF EXISTS `tbl_generatedreport`;
CREATE TABLE IF NOT EXISTS `tbl_generatedreport` (
  `generateid` int NOT NULL AUTO_INCREMENT,
  `order_id` bigint NOT NULL,
  `saleinvoice` varchar(100) NOT NULL,
  `customer_id` int NOT NULL,
  `cutomertype` int NOT NULL,
  `isthirdparty` int NOT NULL DEFAULT '0',
  `waiter_id` int DEFAULT NULL,
  `kitchen` int DEFAULT NULL,
  `order_date` date NOT NULL,
  `order_time` time NOT NULL,
  `table_no` int DEFAULT NULL,
  `tokenno` varchar(30) DEFAULT NULL,
  `totalamount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `customerpaid` decimal(10,2) DEFAULT '0.00',
  `customer_note` text,
  `anyreason` text,
  `order_status` tinyint NOT NULL,
  `nofification` int NOT NULL,
  `orderacceptreject` int DEFAULT NULL,
  `reportDate` date NOT NULL,
  PRIMARY KEY (`generateid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_groupitems`
--

DROP TABLE IF EXISTS `tbl_groupitems`;
CREATE TABLE IF NOT EXISTS `tbl_groupitems` (
  `groupid` int NOT NULL AUTO_INCREMENT,
  `gitemid` int NOT NULL,
  `items` int NOT NULL,
  `item_qty` decimal(10,2) NOT NULL DEFAULT '0.00',
  `varientid` int NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_itemaccepted`
--

DROP TABLE IF EXISTS `tbl_itemaccepted`;
CREATE TABLE IF NOT EXISTS `tbl_itemaccepted` (
  `acid` int NOT NULL AUTO_INCREMENT,
  `orderid` int NOT NULL,
  `menuid` int NOT NULL,
  `varient` int NOT NULL,
  `accepttime` datetime NOT NULL DEFAULT '1970-01-01 01:01:01',
  PRIMARY KEY (`acid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kitchen`
--

DROP TABLE IF EXISTS `tbl_kitchen`;
CREATE TABLE IF NOT EXISTS `tbl_kitchen` (
  `kitchenid` int NOT NULL AUTO_INCREMENT,
  `kitchen_name` varchar(100) NOT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `port` varchar(10) DEFAULT NULL,
  `status` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`kitchenid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_kitchen`
--

INSERT INTO `tbl_kitchen` (`kitchenid`, `kitchen_name`, `ip`, `port`, `status`) VALUES(1, 'Common Kitchen', '192.168.1.87', '9100', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kitchen_order`
--

DROP TABLE IF EXISTS `tbl_kitchen_order`;
CREATE TABLE IF NOT EXISTS `tbl_kitchen_order` (
  `ktid` int NOT NULL AUTO_INCREMENT,
  `kitchenid` int NOT NULL,
  `orderid` int NOT NULL,
  `itemid` int NOT NULL,
  `varient` int DEFAULT NULL,
  `addonsuid` int DEFAULT NULL,
  PRIMARY KEY (`ktid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_menutype`
--

DROP TABLE IF EXISTS `tbl_menutype`;
CREATE TABLE IF NOT EXISTS `tbl_menutype` (
  `menutypeid` int NOT NULL AUTO_INCREMENT,
  `menutype` varchar(120) NOT NULL,
  `menu_icon` varchar(150) DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`menutypeid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_menutype`
--

INSERT INTO `tbl_menutype` (`menutypeid`, `menutype`, `menu_icon`, `status`) VALUES(1, 'Breakfast', './application/modules/itemmanage/assets/images/2020-11-21/b.png', 1);
INSERT INTO `tbl_menutype` (`menutypeid`, `menutype`, `menu_icon`, `status`) VALUES(2, 'Launch', './application/modules/itemmanage/assets/images/2020-11-21/l1.png', 1);
INSERT INTO `tbl_menutype` (`menutypeid`, `menutype`, `menu_icon`, `status`) VALUES(3, 'Dinner', './application/modules/itemmanage/assets/images/2020-11-21/d.png', 1);
INSERT INTO `tbl_menutype` (`menutypeid`, `menutype`, `menu_icon`, `status`) VALUES(4, 'Coffee', './application/modules/itemmanage/assets/images/2020-11-21/c.png', 1);
INSERT INTO `tbl_menutype` (`menutypeid`, `menutype`, `menu_icon`, `status`) VALUES(5, 'Party', './application/modules/itemmanage/assets/images/2020-11-21/p.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_module_purchasekey`
--

DROP TABLE IF EXISTS `tbl_module_purchasekey`;
CREATE TABLE IF NOT EXISTS `tbl_module_purchasekey` (
  `mpid` int NOT NULL AUTO_INCREMENT,
  `module` varchar(25) DEFAULT NULL,
  `purchasekey` varchar(55) DEFAULT NULL,
  `downloaddate` datetime NOT NULL DEFAULT '1970-01-01 01:01:01',
  `updatedate` datetime NOT NULL DEFAULT '1970-01-01 01:01:01',
  PRIMARY KEY (`mpid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_notificationsetting`
--

DROP TABLE IF EXISTS `tbl_notificationsetting`;
CREATE TABLE IF NOT EXISTS `tbl_notificationsetting` (
  `notifid` int NOT NULL AUTO_INCREMENT,
  `firebasewaiterkitchen` text,
  `onesignalcustomer` text NOT NULL,
  `onesignal_ioswaiter` text NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`notifid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_openclose`
--

DROP TABLE IF EXISTS `tbl_openclose`;
CREATE TABLE IF NOT EXISTS `tbl_openclose` (
  `stid` int NOT NULL AUTO_INCREMENT,
  `dayname` varchar(20) NOT NULL,
  `opentime` varchar(15) NOT NULL,
  `closetime` varchar(15) NOT NULL,
  PRIMARY KEY (`stid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_openclose`
--

INSERT INTO `tbl_openclose` (`stid`, `dayname`, `opentime`, `closetime`) VALUES(1, 'Saturday', '08:00', '21:00');
INSERT INTO `tbl_openclose` (`stid`, `dayname`, `opentime`, `closetime`) VALUES(2, 'Sunday', '08:00', '20:00');
INSERT INTO `tbl_openclose` (`stid`, `dayname`, `opentime`, `closetime`) VALUES(3, 'Monday', '08:00', '20:00');
INSERT INTO `tbl_openclose` (`stid`, `dayname`, `opentime`, `closetime`) VALUES(4, 'Tuesday', '08:00', '20:00');
INSERT INTO `tbl_openclose` (`stid`, `dayname`, `opentime`, `closetime`) VALUES(5, 'Wednesday', '08:00', '20:00');
INSERT INTO `tbl_openclose` (`stid`, `dayname`, `opentime`, `closetime`) VALUES(6, 'Thursday', '08:00', '20:00');
INSERT INTO `tbl_openclose` (`stid`, `dayname`, `opentime`, `closetime`) VALUES(7, 'Friday', 'Closed', 'Closed');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_orderprepare`
--

DROP TABLE IF EXISTS `tbl_orderprepare`;
CREATE TABLE IF NOT EXISTS `tbl_orderprepare` (
  `opid` int NOT NULL AUTO_INCREMENT,
  `orderid` int NOT NULL,
  `menuid` int NOT NULL,
  `varient` int NOT NULL,
  `preparetime` datetime NOT NULL DEFAULT '1970-01-01 01:01:01',
  PRIMARY KEY (`opid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_posetting`
--

DROP TABLE IF EXISTS `tbl_posetting`;
CREATE TABLE IF NOT EXISTS `tbl_posetting` (
  `possettingid` int NOT NULL AUTO_INCREMENT,
  `waiter` int NOT NULL DEFAULT '0' COMMENT '1=show,0=hide',
  `tableid` int NOT NULL DEFAULT '0' COMMENT '1=show,0=hide',
  `cooktime` int NOT NULL DEFAULT '0' COMMENT '1=enable,0=disable',
  `productionsetting` tinyint NOT NULL DEFAULT '0' COMMENT '0=manual,1=auto',
  `tablemaping` int NOT NULL DEFAULT '0' COMMENT '1=enable,0=disable',
  `soundenable` int DEFAULT NULL COMMENT '1=enable,0=disable',
  PRIMARY KEY (`possettingid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_posetting`
--

INSERT INTO `tbl_posetting` (`possettingid`, `waiter`, `tableid`, `cooktime`, `productionsetting`, `tablemaping`, `soundenable`) VALUES(1, 1, 1, 1, 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_quickordersetting`
--

DROP TABLE IF EXISTS `tbl_quickordersetting`;
CREATE TABLE IF NOT EXISTS `tbl_quickordersetting` (
  `quickordid` int NOT NULL AUTO_INCREMENT,
  `waiter` int NOT NULL DEFAULT '1' COMMENT '1=show,0=hide',
  `tableid` int NOT NULL DEFAULT '1' COMMENT '1=show,0=hide',
  `cooktime` int NOT NULL DEFAULT '1' COMMENT '1=show,0=hide',
  `soundenable` int NOT NULL DEFAULT '1' COMMENT '1=enable,0=disable	',
  `tablemaping` int NOT NULL DEFAULT '1' COMMENT '1=enable,0=disable',
  PRIMARY KEY (`quickordid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_quickordersetting`
--

INSERT INTO `tbl_quickordersetting` (`quickordid`, `waiter`, `tableid`, `cooktime`, `soundenable`, `tablemaping`) VALUES(1, 1, 1, 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rating`
--

DROP TABLE IF EXISTS `tbl_rating`;
CREATE TABLE IF NOT EXISTS `tbl_rating` (
  `ratingid` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `reviewtxt` text,
  `proid` int NOT NULL,
  `rating` decimal(10,2) NOT NULL DEFAULT '0.00',
  `status` int NOT NULL DEFAULT '0',
  `email` varchar(255) NOT NULL,
  `ratetime` datetime NOT NULL,
  PRIMARY KEY (`ratingid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_room`
--

DROP TABLE IF EXISTS `tbl_room`;
CREATE TABLE IF NOT EXISTS `tbl_room` (
  `id` int NOT NULL AUTO_INCREMENT,
  `roomno` varchar(100) NOT NULL,
  `floorno` int NOT NULL,
  `status` int NOT NULL COMMENT '1=active,0=inactive',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_seoption`
--

DROP TABLE IF EXISTS `tbl_seoption`;
CREATE TABLE IF NOT EXISTS `tbl_seoption` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `title_slug` varchar(255) NOT NULL,
  `keywords` text,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_seoption`
--

INSERT INTO `tbl_seoption` (`id`, `title`, `title_slug`, `keywords`, `description`) VALUES(1, 'Bhojon Home page', 'home', 'restaurant,food,reservation', 'Best Restautant Management Software');
INSERT INTO `tbl_seoption` (`id`, `title`, `title_slug`, `keywords`, `description`) VALUES(3, 'Menu', 'menu', 'Desert,Meet,fish,meet,bevarage', 'Menu Page');
INSERT INTO `tbl_seoption` (`id`, `title`, `title_slug`, `keywords`, `description`) VALUES(4, 'Food Details', 'food_details', 'Meet,solt', 'Details foodÂ  information');
INSERT INTO `tbl_seoption` (`id`, `title`, `title_slug`, `keywords`, `description`) VALUES(5, 'Reservation', 'reservation', 'Table,booking,reservation', 'Table Reservation');
INSERT INTO `tbl_seoption` (`id`, `title`, `title_slug`, `keywords`, `description`) VALUES(6, 'Cart Page', 'cart_page', 'food,menu', 'Cart Page');
INSERT INTO `tbl_seoption` (`id`, `title`, `title_slug`, `keywords`, `description`) VALUES(7, 'Checkout', 'checkout', 'Checkout', 'Checkout');
INSERT INTO `tbl_seoption` (`id`, `title`, `title_slug`, `keywords`, `description`) VALUES(8, 'Login', 'login', 'Login', 'Login');
INSERT INTO `tbl_seoption` (`id`, `title`, `title_slug`, `keywords`, `description`) VALUES(9, 'Registration', 'registration', 'Registration', 'Registration');
INSERT INTO `tbl_seoption` (`id`, `title`, `title_slug`, `keywords`, `description`) VALUES(10, 'Payment information', 'payment_information', 'Online Payment information', 'Payment information');
INSERT INTO `tbl_seoption` (`id`, `title`, `title_slug`, `keywords`, `description`) VALUES(11, 'Stripe Payment information', 'stripe_payment_information', 'Stripe Payment', 'Stripe Payment information');
INSERT INTO `tbl_seoption` (`id`, `title`, `title_slug`, `keywords`, `description`) VALUES(12, 'About us', 'about_us', 'About restaurant', 'About us');
INSERT INTO `tbl_seoption` (`id`, `title`, `title_slug`, `keywords`, `description`) VALUES(13, 'Contact Us', 'contact_us', 'Contact Us', 'Contact Us');
INSERT INTO `tbl_seoption` (`id`, `title`, `title_slug`, `keywords`, `description`) VALUES(14, 'Privacy Policy', 'privacy_policy', 'privacy', 'Privacy Policy');
INSERT INTO `tbl_seoption` (`id`, `title`, `title_slug`, `keywords`, `description`) VALUES(15, 'Our Terms', 'our_terms', 'Our Terms', 'Our Terms');
INSERT INTO `tbl_seoption` (`id`, `title`, `title_slug`, `keywords`, `description`) VALUES(16, 'My Profile', 'my_profile', 'My Profile', 'My Profile');
INSERT INTO `tbl_seoption` (`id`, `title`, `title_slug`, `keywords`, `description`) VALUES(17, 'My Order List', 'my_order_list', 'My Order List', 'My Order List');
INSERT INTO `tbl_seoption` (`id`, `title`, `title_slug`, `keywords`, `description`) VALUES(18, 'View Order', 'view_order', 'View Order', 'View Order');
INSERT INTO `tbl_seoption` (`id`, `title`, `title_slug`, `keywords`, `description`) VALUES(19, 'My Reservation', 'my_reservation', 'My Reservation', 'My Reservation');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_shippingaddress`
--

DROP TABLE IF EXISTS `tbl_shippingaddress`;
CREATE TABLE IF NOT EXISTS `tbl_shippingaddress` (
  `shipaddressid` int NOT NULL AUTO_INCREMENT,
  `orderid` int NOT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `companyname` varchar(100) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `city` varchar(70) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `country` varchar(150) DEFAULT NULL,
  `zip` varchar(50) DEFAULT NULL,
  `address` text,
  `address2` text,
  `DateInserted` datetime NOT NULL DEFAULT '1970-01-01 01:01:01',
  PRIMARY KEY (`shipaddressid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_slider`
--

DROP TABLE IF EXISTS `tbl_slider`;
CREATE TABLE IF NOT EXISTS `tbl_slider` (
  `slid` int NOT NULL AUTO_INCREMENT,
  `Sltypeid` int NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `slink` text,
  `status` int NOT NULL DEFAULT '1',
  `delation_status` int NOT NULL DEFAULT '0',
  `width` int NOT NULL DEFAULT '0',
  `height` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`slid`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_slider`
--

INSERT INTO `tbl_slider` (`slid`, `Sltypeid`, `title`, `subtitle`, `image`, `slink`, `status`, `delation_status`, `width`, `height`) VALUES(1, 1, 'Welcome To', 'Book <span>Your</span> Table', '', '#', 1, 0, 1920, 902);
INSERT INTO `tbl_slider` (`slid`, `Sltypeid`, `title`, `subtitle`, `image`, `slink`, `status`, `delation_status`, `width`, `height`) VALUES(2, 1, 'Find Your', 'Best <span>Cafe</span> Deals', '', '#', 1, 0, 1920, 902);
INSERT INTO `tbl_slider` (`slid`, `Sltypeid`, `title`, `subtitle`, `image`, `slink`, `status`, `delation_status`, `width`, `height`) VALUES(3, 1, 'Exclusive', 'Coffee <span>Shop</span>', '', '#', 1, 0, 1920, 902);
INSERT INTO `tbl_slider` (`slid`, `Sltypeid`, `title`, `subtitle`, `image`, `slink`, `status`, `delation_status`, `width`, `height`) VALUES(4, 2, 'Discover', 'OUR STORY', '', '#', 1, 0, 263, 332);
INSERT INTO `tbl_slider` (`slid`, `Sltypeid`, `title`, `subtitle`, `image`, `slink`, `status`, `delation_status`, `width`, `height`) VALUES(5, 2, 'Discover', 'OUR STORY', '', '#', 1, 0, 263, 332);
INSERT INTO `tbl_slider` (`slid`, `Sltypeid`, `title`, `subtitle`, `image`, `slink`, `status`, `delation_status`, `width`, `height`) VALUES(6, 3, 'Discover', 'OUR MENU', '', '#', 1, 0, 263, 332);
INSERT INTO `tbl_slider` (`slid`, `Sltypeid`, `title`, `subtitle`, `image`, `slink`, `status`, `delation_status`, `width`, `height`) VALUES(7, 3, 'Discover', 'OUR MENU', '', '#', 1, 0, 263, 177);
INSERT INTO `tbl_slider` (`slid`, `Sltypeid`, `title`, `subtitle`, `image`, `slink`, `status`, `delation_status`, `width`, `height`) VALUES(8, 3, 'Discover', 'OUR MENU', '', '#', 1, 0, 263, 177);
INSERT INTO `tbl_slider` (`slid`, `Sltypeid`, `title`, `subtitle`, `image`, `slink`, `status`, `delation_status`, `width`, `height`) VALUES(9, 4, 'right', 'ads', '', '#', 1, 0, 252, 621);
INSERT INTO `tbl_slider` (`slid`, `Sltypeid`, `title`, `subtitle`, `image`, `slink`, `status`, `delation_status`, `width`, `height`) VALUES(10, 5, 'OUR AWESOME STREET', 'FOOD HISTORY', '', '#', 1, 0, 541, 516);
INSERT INTO `tbl_slider` (`slid`, `Sltypeid`, `title`, `subtitle`, `image`, `slink`, `status`, `delation_status`, `width`, `height`) VALUES(11, 6, 'Reservation', 'BOOK YOUR TABLE', 'dummyimage/463x540.jpg', '#', 1, 0, 470, 548);
INSERT INTO `tbl_slider` (`slid`, `Sltypeid`, `title`, `subtitle`, `image`, `slink`, `status`, `delation_status`, `width`, `height`) VALUES(12, 7, 'Our Gallery', 'CHEF SELECTION', '', '#', 1, 0, 340, 277);
INSERT INTO `tbl_slider` (`slid`, `Sltypeid`, `title`, `subtitle`, `image`, `slink`, `status`, `delation_status`, `width`, `height`) VALUES(13, 7, 'Our Gallery', 'CHEF SELECTION', '', '#', 1, 0, 340, 277);
INSERT INTO `tbl_slider` (`slid`, `Sltypeid`, `title`, `subtitle`, `image`, `slink`, `status`, `delation_status`, `width`, `height`) VALUES(14, 7, 'Our Gallery', 'CHEF SELECTION', '', '#', 1, 0, 340, 277);
INSERT INTO `tbl_slider` (`slid`, `Sltypeid`, `title`, `subtitle`, `image`, `slink`, `status`, `delation_status`, `width`, `height`) VALUES(15, 7, 'Our Gallery', 'CHEF SELECTION', '', '#', 1, 0, 340, 277);
INSERT INTO `tbl_slider` (`slid`, `Sltypeid`, `title`, `subtitle`, `image`, `slink`, `status`, `delation_status`, `width`, `height`) VALUES(16, 7, 'Our Gallery', 'CHEF SELECTION', '', '#', 1, 0, 340, 277);
INSERT INTO `tbl_slider` (`slid`, `Sltypeid`, `title`, `subtitle`, `image`, `slink`, `status`, `delation_status`, `width`, `height`) VALUES(17, 7, 'Our Gallery', 'CHEF SELECTION', '', '#', 1, 0, 340, 277);
INSERT INTO `tbl_slider` (`slid`, `Sltypeid`, `title`, `subtitle`, `image`, `slink`, `status`, `delation_status`, `width`, `height`) VALUES(18, 8, 'Offer', 'item offer', '', '#', 1, 0, 250, 533);
INSERT INTO `tbl_slider` (`slid`, `Sltypeid`, `title`, `subtitle`, `image`, `slink`, `status`, `delation_status`, `width`, `height`) VALUES(19, 9, 'Offer', 'food offer', '', '#', 1, 0, 250, 553);
INSERT INTO `tbl_slider` (`slid`, `Sltypeid`, `title`, `subtitle`, `image`, `slink`, `status`, `delation_status`, `width`, `height`) VALUES(20, 10, 'contact us', 'contact', '', '#', 1, 0, 475, 633);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_slider_type`
--

DROP TABLE IF EXISTS `tbl_slider_type`;
CREATE TABLE IF NOT EXISTS `tbl_slider_type` (
  `stype_id` int NOT NULL AUTO_INCREMENT,
  `STypeName` varchar(255) DEFAULT NULL,
  `delation_status` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`stype_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_slider_type`
--

INSERT INTO `tbl_slider_type` (`stype_id`, `STypeName`, `delation_status`) VALUES(1, 'Home Top Slider', 0);
INSERT INTO `tbl_slider_type` (`stype_id`, `STypeName`, `delation_status`) VALUES(2, 'Home our story', 0);
INSERT INTO `tbl_slider_type` (`stype_id`, `STypeName`, `delation_status`) VALUES(3, 'Home our menu', 0);
INSERT INTO `tbl_slider_type` (`stype_id`, `STypeName`, `delation_status`) VALUES(4, 'Menu Page right Banner', 0);
INSERT INTO `tbl_slider_type` (`stype_id`, `STypeName`, `delation_status`) VALUES(5, 'Classic theme Home story', 0);
INSERT INTO `tbl_slider_type` (`stype_id`, `STypeName`, `delation_status`) VALUES(6, 'Classic theme Home reservation', 0);
INSERT INTO `tbl_slider_type` (`stype_id`, `STypeName`, `delation_status`) VALUES(7, 'Classic theme Home gallery', 0);
INSERT INTO `tbl_slider_type` (`stype_id`, `STypeName`, `delation_status`) VALUES(8, 'Menu Page Offer Banner Right', 0);
INSERT INTO `tbl_slider_type` (`stype_id`, `STypeName`, `delation_status`) VALUES(9, 'Cart Page Offer Banner Right', 0);
INSERT INTO `tbl_slider_type` (`stype_id`, `STypeName`, `delation_status`) VALUES(10, 'Contact Us', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sociallink`
--

DROP TABLE IF EXISTS `tbl_sociallink`;
CREATE TABLE IF NOT EXISTS `tbl_sociallink` (
  `sid` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `socialurl` text,
  `icon` varchar(100) NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_sociallink`
--

INSERT INTO `tbl_sociallink` (`sid`, `title`, `socialurl`, `icon`, `status`) VALUES(1, 'Facebook', 'https://www.facebook.com', 'fab fa-facebook', 1);
INSERT INTO `tbl_sociallink` (`sid`, `title`, `socialurl`, `icon`, `status`) VALUES(2, 'Twitter', 'https://www.twitter.com', 'fab fa-twitter', 1);
INSERT INTO `tbl_sociallink` (`sid`, `title`, `socialurl`, `icon`, `status`) VALUES(3, 'Google Plus', 'https://plus.google.com', 'fab fa-google-plus', 1);
INSERT INTO `tbl_sociallink` (`sid`, `title`, `socialurl`, `icon`, `status`) VALUES(4, 'Pinterest', 'https://www.pinterest.com/', 'fab fa-pinterest', 1);
INSERT INTO `tbl_sociallink` (`sid`, `title`, `socialurl`, `icon`, `status`) VALUES(6, 'Linkedin', 'https://linkedin.com', 'fab fa-linkedin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_soundsetting`
--

DROP TABLE IF EXISTS `tbl_soundsetting`;
CREATE TABLE IF NOT EXISTS `tbl_soundsetting` (
  `soundid` int NOT NULL AUTO_INCREMENT,
  `nofitysound` text,
  `addtocartsound` text,
  PRIMARY KEY (`soundid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_soundsetting`
--

INSERT INTO `tbl_soundsetting` (`soundid`, `nofitysound`, `addtocartsound`) VALUES(1, 'assets/2021-03-21/b1.mp3', 'h');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_state`
--

DROP TABLE IF EXISTS `tbl_state`;
CREATE TABLE IF NOT EXISTS `tbl_state` (
  `stateid` int NOT NULL AUTO_INCREMENT,
  `countryid` int NOT NULL,
  `statename` varchar(100) NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`stateid`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_state`
--

INSERT INTO `tbl_state` (`stateid`, `countryid`, `statename`, `status`) VALUES(1, 2, 'Alabama', 1);
INSERT INTO `tbl_state` (`stateid`, `countryid`, `statename`, `status`) VALUES(2, 2, 'Alaska', 1);
INSERT INTO `tbl_state` (`stateid`, `countryid`, `statename`, `status`) VALUES(3, 2, 'Arizona', 1);
INSERT INTO `tbl_state` (`stateid`, `countryid`, `statename`, `status`) VALUES(4, 2, 'Arkansas', 1);
INSERT INTO `tbl_state` (`stateid`, `countryid`, `statename`, `status`) VALUES(5, 2, 'California', 1);
INSERT INTO `tbl_state` (`stateid`, `countryid`, `statename`, `status`) VALUES(6, 2, 'Florida', 1);
INSERT INTO `tbl_state` (`stateid`, `countryid`, `statename`, `status`) VALUES(7, 2, 'New Mexico', 1);
INSERT INTO `tbl_state` (`stateid`, `countryid`, `statename`, `status`) VALUES(8, 2, 'New York', 1);
INSERT INTO `tbl_state` (`stateid`, `countryid`, `statename`, `status`) VALUES(9, 2, 'Oklahoma', 1);
INSERT INTO `tbl_state` (`stateid`, `countryid`, `statename`, `status`) VALUES(10, 2, 'Texas', 1);
INSERT INTO `tbl_state` (`stateid`, `countryid`, `statename`, `status`) VALUES(11, 2, 'Virginia', 1);
INSERT INTO `tbl_state` (`stateid`, `countryid`, `statename`, `status`) VALUES(12, 1, 'Dhaka', 1);
INSERT INTO `tbl_state` (`stateid`, `countryid`, `statename`, `status`) VALUES(13, 1, 'Chittagong', 1);
INSERT INTO `tbl_state` (`stateid`, `countryid`, `statename`, `status`) VALUES(14, 1, 'Rajshahi', 1);
INSERT INTO `tbl_state` (`stateid`, `countryid`, `statename`, `status`) VALUES(15, 1, 'Khulna', 1);
INSERT INTO `tbl_state` (`stateid`, `countryid`, `statename`, `status`) VALUES(16, 1, 'Sylhet', 1);
INSERT INTO `tbl_state` (`stateid`, `countryid`, `statename`, `status`) VALUES(17, 1, 'Barishal', 1);
INSERT INTO `tbl_state` (`stateid`, `countryid`, `statename`, `status`) VALUES(18, 1, 'Rangpur', 1);
INSERT INTO `tbl_state` (`stateid`, `countryid`, `statename`, `status`) VALUES(19, 1, 'Mymensingh', 1);
INSERT INTO `tbl_state` (`stateid`, `countryid`, `statename`, `status`) VALUES(20, 4, 'West Bengal', 1);
INSERT INTO `tbl_state` (`stateid`, `countryid`, `statename`, `status`) VALUES(21, 4, 'Uttar Pradesh', 1);
INSERT INTO `tbl_state` (`stateid`, `countryid`, `statename`, `status`) VALUES(22, 4, 'Tripura', 1);
INSERT INTO `tbl_state` (`stateid`, `countryid`, `statename`, `status`) VALUES(23, 4, 'Telangana', 1);
INSERT INTO `tbl_state` (`stateid`, `countryid`, `statename`, `status`) VALUES(24, 4, 'Tamil Nadu', 1);
INSERT INTO `tbl_state` (`stateid`, `countryid`, `statename`, `status`) VALUES(25, 4, 'Sikkim', 1);
INSERT INTO `tbl_state` (`stateid`, `countryid`, `statename`, `status`) VALUES(26, 4, 'Rajasthan', 1);
INSERT INTO `tbl_state` (`stateid`, `countryid`, `statename`, `status`) VALUES(27, 4, 'Punjab', 1);
INSERT INTO `tbl_state` (`stateid`, `countryid`, `statename`, `status`) VALUES(28, 4, 'Odisha', 1);
INSERT INTO `tbl_state` (`stateid`, `countryid`, `statename`, `status`) VALUES(29, 4, 'Nagaland', 1);
INSERT INTO `tbl_state` (`stateid`, `countryid`, `statename`, `status`) VALUES(30, 4, 'Kerala', 1);
INSERT INTO `tbl_state` (`stateid`, `countryid`, `statename`, `status`) VALUES(31, 4, 'Haryana', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tablefloor`
--

DROP TABLE IF EXISTS `tbl_tablefloor`;
CREATE TABLE IF NOT EXISTS `tbl_tablefloor` (
  `tbfloorid` int NOT NULL AUTO_INCREMENT,
  `floorName` varchar(100) NOT NULL,
  PRIMARY KEY (`tbfloorid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_tablefloor`
--

INSERT INTO `tbl_tablefloor` (`tbfloorid`, `floorName`) VALUES(1, 'First Floor');
INSERT INTO `tbl_tablefloor` (`tbfloorid`, `floorName`) VALUES(2, 'VIP Floor');
INSERT INTO `tbl_tablefloor` (`tbfloorid`, `floorName`) VALUES(3, 'Second Floor');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_thirdparty_customer`
--

DROP TABLE IF EXISTS `tbl_thirdparty_customer`;
CREATE TABLE IF NOT EXISTS `tbl_thirdparty_customer` (
  `companyId` int NOT NULL AUTO_INCREMENT,
  `company_name` varchar(150) NOT NULL,
  `address` text,
  `commision` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`companyId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_thirdparty_customer`
--

INSERT INTO `tbl_thirdparty_customer` (`companyId`, `company_name`, `address`, `commision`) VALUES(1, 'Food Panda', 'Dhaka', 5.00);
INSERT INTO `tbl_thirdparty_customer` (`companyId`, `company_name`, `address`, `commision`) VALUES(2, 'pathao', 'Dhaka', 8.00);
INSERT INTO `tbl_thirdparty_customer` (`companyId`, `company_name`, `address`, `commision`) VALUES(3, 'Hungrynaki', 'Dhaka', 5.00);
INSERT INTO `tbl_thirdparty_customer` (`companyId`, `company_name`, `address`, `commision`) VALUES(4, 'Foodmart', 'Dhaka', 5.00);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_token`
--

DROP TABLE IF EXISTS `tbl_token`;
CREATE TABLE IF NOT EXISTS `tbl_token` (
  `tokenid` int NOT NULL AUTO_INCREMENT,
  `tokencode` varchar(50) NOT NULL,
  `tokenrate` decimal(10,2) NOT NULL DEFAULT '0.00',
  `tokenstartdate` date NOT NULL,
  `tokenendate` date NOT NULL,
  `tokenstatus` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`tokenid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_token`
--

INSERT INTO `tbl_token` (`tokenid`, `tokencode`, `tokenrate`, `tokenstartdate`, `tokenendate`, `tokenstatus`) VALUES(1, 'ABCD', 10.00, '2021-08-28', '2021-12-30', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_updateitems`
--

DROP TABLE IF EXISTS `tbl_updateitems`;
CREATE TABLE IF NOT EXISTS `tbl_updateitems` (
  `updateid` int NOT NULL AUTO_INCREMENT,
  `ordid` int NOT NULL,
  `menuid` int NOT NULL,
  `qty` decimal(10,3) NOT NULL DEFAULT '0.000',
  `adonsqty` varchar(50) DEFAULT NULL,
  `addonsid` varchar(50) DEFAULT NULL,
  `varientid` int NOT NULL,
  `addonsuid` int DEFAULT NULL,
  `isupdate` varchar(5) DEFAULT NULL,
  `insertdate` date DEFAULT '0000-00-00',
  PRIMARY KEY (`updateid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_version_checker`
--

DROP TABLE IF EXISTS `tbl_version_checker`;
CREATE TABLE IF NOT EXISTS `tbl_version_checker` (
  `vid` int NOT NULL AUTO_INCREMENT,
  `version` varchar(10) DEFAULT NULL,
  `disable` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`vid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_version_checker`
--

INSERT INTO `tbl_version_checker` (`vid`, `version`, `disable`) VALUES(1, '2.8', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_waiterappcart`
--

DROP TABLE IF EXISTS `tbl_waiterappcart`;
CREATE TABLE IF NOT EXISTS `tbl_waiterappcart` (
  `weaterappid` int NOT NULL AUTO_INCREMENT,
  `waiterid` int NOT NULL,
  `alladdOnsName` varchar(255) DEFAULT NULL,
  `total_addonsprice` decimal(10,2) DEFAULT '0.00',
  `totaladdons` int DEFAULT NULL,
  `addons_name` varchar(255) DEFAULT NULL,
  `addons_id` int DEFAULT NULL,
  `addons_price` double(10,2) DEFAULT '0.00',
  `addonsQty` int DEFAULT NULL,
  `component` varchar(255) DEFAULT NULL,
  `destcription` text,
  `itemnotes` varchar(255) DEFAULT NULL,
  `offerIsavailable` int DEFAULT '0',
  `offerstartdate` date DEFAULT '0000-00-00',
  `OffersRate` int DEFAULT NULL,
  `offerendate` date DEFAULT '0000-00-00',
  `price` decimal(10,2) DEFAULT '0.00',
  `ProductsID` int NOT NULL,
  `ProductImage` varchar(255) NOT NULL,
  `ProductName` varchar(255) NOT NULL,
  `productvat` int DEFAULT NULL,
  `quantity` int NOT NULL,
  `variantName` varchar(255) NOT NULL,
  `variantid` int NOT NULL,
  `orderid` int DEFAULT NULL,
  PRIMARY KEY (`weaterappid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_widget`
--

DROP TABLE IF EXISTS `tbl_widget`;
CREATE TABLE IF NOT EXISTS `tbl_widget` (
  `widgetid` int NOT NULL AUTO_INCREMENT,
  `widget_name` varchar(100) NOT NULL,
  `widget_title` varchar(150) DEFAULT NULL,
  `widget_desc` text,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`widgetid`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_widget`
--

INSERT INTO `tbl_widget` (`widgetid`, `widget_name`, `widget_title`, `widget_desc`, `status`) VALUES(1, 'Footer left', '', '<p class=\"text-justify\">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard.</p>', 1);
INSERT INTO `tbl_widget` (`widgetid`, `widget_name`, `widget_title`, `widget_desc`, `status`) VALUES(2, 'footermiddle', 'Available On', '<p><strong>Monday - Wednesday</strong>Â 10:00 AM - 7:00 PM</p>\r\n<p><strong>Thursday - Friday</strong>Â 10:00 AM - 11:00 PM</p>\r\n<p><strong>Saturday</strong>Â 12:00 PM - 6:00 PM</p>\r\n<p><strong>Sunday</strong>Â Off</p>', 1);
INSERT INTO `tbl_widget` (`widgetid`, `widget_name`, `widget_title`, `widget_desc`, `status`) VALUES(3, 'Footer right', 'Contact Us', '<p>356, Mannan Plaza ( 4th Floar ) Khilkhet Dhaka</p>\r\n<p><a href=\"../../hungry\">support@bdtask.com</a></p>\r\n<p><a href=\"../../hungry\">+88 01715 222 333</a></p>', 1);
INSERT INTO `tbl_widget` (`widgetid`, `widget_name`, `widget_title`, `widget_desc`, `status`) VALUES(4, 'Our Store', 'Our Store', '<address>123 Suspendis matti,&nbsp;<br />Visaosang Building VST District,&nbsp;<br />NY Accums, North American</address>\r\n<p><a class=\"d-block\" href=\"http://soft9.bdtask.com/hungry-v1/\">0123-456-78910</a><a class=\"d-block\" href=\"http://soft9.bdtask.com/hungry-v1/\">support@domain.com</a></p>', 1);
INSERT INTO `tbl_widget` (`widgetid`, `widget_name`, `widget_title`, `widget_desc`, `status`) VALUES(6, 'Reservation', 'BOOK YOUR TABLE', '<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</p>', 1);
INSERT INTO `tbl_widget` (`widgetid`, `widget_name`, `widget_title`, `widget_desc`, `status`) VALUES(7, 'Our Menu text', 'Our Menu ', '<p>Rosa is a restaurant, bar and coffee roastery located on a busy corner site in Farringdon\'s Exmouth Market. With glazed frontage on two sides of the building, overlooking the market and a bustling London inteon.</p>', 1);
INSERT INTO `tbl_widget` (`widgetid`, `widget_name`, `widget_title`, `widget_desc`, `status`) VALUES(8, 'Specials', 'FOOD MENU', '<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The</p>', 1);
INSERT INTO `tbl_widget` (`widgetid`, `widget_name`, `widget_title`, `widget_desc`, `status`) VALUES(9, 'story text', 'OUR STORY', '<p>Rosa is a restaurant, bar and coffee roastery located on a busy corner site in Farringdon\'s Exmouth Market. With glazed frontage on two sides of the building, overlooking the market and a bustling London inteon.</p>', 1);
INSERT INTO `tbl_widget` (`widgetid`, `widget_name`, `widget_title`, `widget_desc`, `status`) VALUES(10, 'Professional', 'OUR EXPERT CHEFS', '', 1);
INSERT INTO `tbl_widget` (`widgetid`, `widget_name`, `widget_title`, `widget_desc`, `status`) VALUES(11, 'Need Help Booking?', 'Need Help Booking?', '<p class=\"mb-2\">Just call our customer services at any time, we are waiting 24 hours to recieve your calls.</p>\r\n<p><a href=\"#\">+880 1712 123 123</a></p>', 1);
INSERT INTO `tbl_widget` (`widgetid`, `widget_name`, `widget_title`, `widget_desc`, `status`) VALUES(12, 'Privacy', 'Privacy Policy', '<h2>What is Lorem Ipsum</h2>\r\n<p>Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<h3>Contacting us :</h3>\r\n<p>If you have any questions about this Privacy Policy, the practices of this site, or your dealings with this site, please contact us.</p>', 1);
INSERT INTO `tbl_widget` (`widgetid`, `widget_name`, `widget_title`, `widget_desc`, `status`) VALUES(13, 'termscondition', 'Terms of Use', '<h3>Web browser cookies</h3>\r\n<p>Our Site may use cache and \"cookies\" to enhance User experience. User\'s web browser places cookies on their hard drive for record-keeping purposes and sometimes to track information about them. User may choose to set their web browser to refuse cookies, or to alert you when cookies are being sent. If they do so, note that some parts of the Site may not function properly.</p>\r\n<h3>How we use collected information bdtask may collect and use Users personal information for the following purposes:</h3>\r\n<p>To run and operate our Site We may need your information display content on the Site correctly. To improve customer service Information you provide helps us respond to your customer service requests and support needs more efficiently. To personalize user experience We may use information in the aggregate to understand how our Users as a group use the services and resources provided on our Site. To improve our Site We may use feedback you provide to improve our products and services. To run a promotion, contest, survey or other Site feature To send Users information they agreed to receive about topics we think will be of interest to them. To send periodic emails We may use the email address to send User information and updates pertaining to their order. It may also be used to respond to their inquiries, questions, and/or other requests.</p>', 1);
INSERT INTO `tbl_widget` (`widgetid`, `widget_name`, `widget_title`, `widget_desc`, `status`) VALUES(14, 'map', 'Google Map', '<p>&lt;iframe style=\"border: 0;\" src=\"https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d14599.578237069936!2d90.3654215!3d23.8223482!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2sbd!4v1583411739085!5m2!1sen!2sbd\" width=\"300\" height=\"150\" frameborder=\"0\" allowfullscreen=\"allowfullscreen\"&gt;&lt;/iframe&gt;</p>', 1);
INSERT INTO `tbl_widget` (`widgetid`, `widget_name`, `widget_title`, `widget_desc`, `status`) VALUES(15, 'carousal1', 'carousal', '<p>show</p>', 1);
INSERT INTO `tbl_widget` (`widgetid`, `widget_name`, `widget_title`, `widget_desc`, `status`) VALUES(16, 'TASTY MENU TODAY', 'CHEF SELECTION', '', 1);
INSERT INTO `tbl_widget` (`widgetid`, `widget_name`, `widget_title`, `widget_desc`, `status`) VALUES(17, 'FOOD HISTORY', 'OUR AWESOME STREET', '<p class=\"mb-4\">Thing lesser replenish evening called void a sea blessed meat fourth called moveth place behold night own night third in they abundant and don\'t you\'re the upon fruit. Divided open divided appear also saw may fill. whales seed creepeth. Open lessegether he also morning land i saw Man</p>\r\n<p><a class=\"simple_btn\" href=\"#\">Our Story</a></p>', 1);
INSERT INTO `tbl_widget` (`widgetid`, `widget_name`, `widget_title`, `widget_desc`, `status`) VALUES(21, 'Our Gallery', 'Restaurant Photo Gallery', '', 1);
INSERT INTO `tbl_widget` (`widgetid`, `widget_name`, `widget_title`, `widget_desc`, `status`) VALUES(22, 'subfooter', '', '', 1);
INSERT INTO `tbl_widget` (`widgetid`, `widget_name`, `widget_title`, `widget_desc`, `status`) VALUES(23, 'Get In Touch', 'contact', '<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</p>', 1);
INSERT INTO `tbl_widget` (`widgetid`, `widget_name`, `widget_title`, `widget_desc`, `status`) VALUES(24, 'Refund Policies', 'Refund Policies', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard.</p>', 1);

-- --------------------------------------------------------

--
-- Table structure for table `themes`
--

DROP TABLE IF EXISTS `themes`;
CREATE TABLE IF NOT EXISTS `themes` (
  `themeid` int NOT NULL AUTO_INCREMENT,
  `themename` varchar(100) NOT NULL,
  `theme_thumb` varchar(255) DEFAULT NULL,
  `status` int NOT NULL COMMENT '0=inactive,1=active',
  `activedate` date DEFAULT NULL,
  PRIMARY KEY (`themeid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `themes`
--

INSERT INTO `themes` (`themeid`, `themename`, `theme_thumb`, `status`, `activedate`) VALUES(1, 'defaults', NULL, 0, '2020-11-19');
INSERT INTO `themes` (`themeid`, `themename`, `theme_thumb`, `status`, `activedate`) VALUES(3, 'classic', NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `top_menu`
--

DROP TABLE IF EXISTS `top_menu`;
CREATE TABLE IF NOT EXISTS `top_menu` (
  `menuid` int NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(50) NOT NULL,
  `menu_slug` varchar(70) NOT NULL,
  `parentid` int NOT NULL,
  `entrydate` date NOT NULL,
  `isactive` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`menuid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `top_menu`
--

INSERT INTO `top_menu` (`menuid`, `menu_name`, `menu_slug`, `parentid`, `entrydate`, `isactive`) VALUES(1, 'Home', 'home', 0, '2021-09-19', 1);
INSERT INTO `top_menu` (`menuid`, `menu_name`, `menu_slug`, `parentid`, `entrydate`, `isactive`) VALUES(2, 'Reservation', 'reservation', 0, '2019-02-20', 1);
INSERT INTO `top_menu` (`menuid`, `menu_name`, `menu_slug`, `parentid`, `entrydate`, `isactive`) VALUES(3, 'Menu', 'menu', 0, '2021-10-18', 1);
INSERT INTO `top_menu` (`menuid`, `menu_name`, `menu_slug`, `parentid`, `entrydate`, `isactive`) VALUES(4, 'About Us', 'about', 0, '2019-11-25', 1);
INSERT INTO `top_menu` (`menuid`, `menu_name`, `menu_slug`, `parentid`, `entrydate`, `isactive`) VALUES(5, 'Contact Us', 'contact', 0, '2019-01-26', 1);
INSERT INTO `top_menu` (`menuid`, `menu_name`, `menu_slug`, `parentid`, `entrydate`, `isactive`) VALUES(6, 'Pages', 'pages', 0, '2019-11-28', 1);
INSERT INTO `top_menu` (`menuid`, `menu_name`, `menu_slug`, `parentid`, `entrydate`, `isactive`) VALUES(7, 'Cart', 'cart', 6, '2019-01-26', 1);
INSERT INTO `top_menu` (`menuid`, `menu_name`, `menu_slug`, `parentid`, `entrydate`, `isactive`) VALUES(8, 'Details', 'details', 7, '2020-01-15', 1);
INSERT INTO `top_menu` (`menuid`, `menu_name`, `menu_slug`, `parentid`, `entrydate`, `isactive`) VALUES(9, 'Logout', 'hungry/logout', 6, '2019-02-03', 1);
INSERT INTO `top_menu` (`menuid`, `menu_name`, `menu_slug`, `parentid`, `entrydate`, `isactive`) VALUES(10, 'My Profile', 'myprofile', 0, '2019-10-16', 1);

-- --------------------------------------------------------

--
-- Table structure for table `unit_of_measurement`
--

DROP TABLE IF EXISTS `unit_of_measurement`;
CREATE TABLE IF NOT EXISTS `unit_of_measurement` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uom_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `uom_short_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `unit_of_measurement`
--

INSERT INTO `unit_of_measurement` (`id`, `uom_name`, `uom_short_code`, `is_active`) VALUES(1, 'Kilogram', 'kg.', 1);
INSERT INTO `unit_of_measurement` (`id`, `uom_name`, `uom_short_code`, `is_active`) VALUES(2, 'Liter', 'ltr.', 1);
INSERT INTO `unit_of_measurement` (`id`, `uom_name`, `uom_short_code`, `is_active`) VALUES(3, 'Gram', 'grm.', 1);
INSERT INTO `unit_of_measurement` (`id`, `uom_name`, `uom_short_code`, `is_active`) VALUES(4, 'tonne', 'tn.', 1);
INSERT INTO `unit_of_measurement` (`id`, `uom_name`, `uom_short_code`, `is_active`) VALUES(5, 'milligram', 'mg.', 1);
INSERT INTO `unit_of_measurement` (`id`, `uom_name`, `uom_short_code`, `is_active`) VALUES(6, 'carat', 'carat', 1);
INSERT INTO `unit_of_measurement` (`id`, `uom_name`, `uom_short_code`, `is_active`) VALUES(7, 'Per Pieces', 'pcs', 1);
INSERT INTO `unit_of_measurement` (`id`, `uom_name`, `uom_short_code`, `is_active`) VALUES(8, 'Per Cup', 'cup', 1);
INSERT INTO `unit_of_measurement` (`id`, `uom_name`, `uom_short_code`, `is_active`) VALUES(9, 'Pound', 'pnd.', 1);
INSERT INTO `unit_of_measurement` (`id`, `uom_name`, `uom_short_code`, `is_active`) VALUES(10, 'tablespoon', 'tspoon', 1);
INSERT INTO `unit_of_measurement` (`id`, `uom_name`, `uom_short_code`, `is_active`) VALUES(11, 'Milliliter', 'ML', 1);

-- --------------------------------------------------------

--
-- Table structure for table `usedcoupon`
--

DROP TABLE IF EXISTS `usedcoupon`;
CREATE TABLE IF NOT EXISTS `usedcoupon` (
  `cusedid` int NOT NULL AUTO_INCREMENT,
  `orderid` int NOT NULL,
  `couponcode` varchar(100) NOT NULL,
  `couponrate` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`cusedid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------



--
-- Table structure for table `variant`
--

DROP TABLE IF EXISTS `variant`;
CREATE TABLE IF NOT EXISTS `variant` (
  `variantid` int NOT NULL AUTO_INCREMENT,
  `menuid` int NOT NULL,
  `variantName` varchar(120) NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`variantid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `weekly_holiday`
--

DROP TABLE IF EXISTS `weekly_holiday`;
CREATE TABLE IF NOT EXISTS `weekly_holiday` (
  `wk_id` int NOT NULL AUTO_INCREMENT,
  `dayname` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`wk_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `weekly_holiday`
--

INSERT INTO `weekly_holiday` (`wk_id`, `dayname`) VALUES(1, 'Friday,Satarday,Sunday');
