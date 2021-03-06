﻿--
-- Script was generated by Devart dbForge Studio for MySQL, Version 8.0.40.0
-- Product home page: http://www.devart.com/dbforge/mysql/studio
-- Script date 6/15/2020 6:28:03 PM
-- Server version: 8.0.19
-- Client version: 4.1
--

-- 
-- Disable foreign keys
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- Set SQL mode
-- 
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 
-- Set character set the client will use to send SQL statements to the server
--
SET NAMES 'utf8mb4';

--
-- Set default database
--
USE platform_elearning;

--
-- Drop procedure `Proc_Subject_INSERT`
--
DROP PROCEDURE IF EXISTS Proc_Subject_INSERT;

--
-- Drop procedure `Proc_Subject_Update`
--
DROP PROCEDURE IF EXISTS Proc_Subject_Update;

--
-- Drop procedure `Proc_User_INSERT`
--
DROP PROCEDURE IF EXISTS Proc_User_INSERT;

--
-- Drop procedure `Proc_User_Update`
--
DROP PROCEDURE IF EXISTS Proc_User_Update;

--
-- Drop table `subject`
--
DROP TABLE IF EXISTS subject;

--
-- Drop table `user`
--
DROP TABLE IF EXISTS user;

--
-- Drop table `user_roles`
--
DROP TABLE IF EXISTS user_roles;

--
-- Drop procedure `Proc_Auditing_Log_INSERT`
--
DROP PROCEDURE IF EXISTS Proc_Auditing_Log_INSERT;

--
-- Drop procedure `Proc_Auditing_Log_Update`
--
DROP PROCEDURE IF EXISTS Proc_Auditing_Log_Update;

--
-- Drop table `auditing_log`
--
DROP TABLE IF EXISTS auditing_log;

--
-- Drop procedure `Proc_Class_INSERT`
--
DROP PROCEDURE IF EXISTS Proc_Class_INSERT;

--
-- Drop procedure `Proc_Class_Update`
--
DROP PROCEDURE IF EXISTS Proc_Class_Update;

--
-- Drop table `class`
--
DROP TABLE IF EXISTS class;

--
-- Drop procedure `Proc_Lesson_INSERT`
--
DROP PROCEDURE IF EXISTS Proc_Lesson_INSERT;

--
-- Drop procedure `Proc_Lesson_Update`
--
DROP PROCEDURE IF EXISTS Proc_Lesson_Update;

--
-- Drop table `lesson`
--
DROP TABLE IF EXISTS lesson;

--
-- Drop procedure `Proc_Program_INSERT`
--
DROP PROCEDURE IF EXISTS Proc_Program_INSERT;

--
-- Drop procedure `Proc_Program_Update`
--
DROP PROCEDURE IF EXISTS Proc_Program_Update;

--
-- Drop table `program`
--
DROP TABLE IF EXISTS program;

--
-- Drop procedure `Proc_Topic_INSERT`
--
DROP PROCEDURE IF EXISTS Proc_Topic_INSERT;

--
-- Drop procedure `Proc_Topic_Update`
--
DROP PROCEDURE IF EXISTS Proc_Topic_Update;

--
-- Drop table `topic`
--
DROP TABLE IF EXISTS topic;

--
-- Drop procedure `Proc_User_Class_INSERT`
--
DROP PROCEDURE IF EXISTS Proc_User_Class_INSERT;

--
-- Drop procedure `Proc_User_Class_Update`
--
DROP PROCEDURE IF EXISTS Proc_User_Class_Update;

--
-- Drop table `user_class`
--
DROP TABLE IF EXISTS user_class;

--
-- Drop procedure `Proc_User_Lesson_INSERT`
--
DROP PROCEDURE IF EXISTS Proc_User_Lesson_INSERT;

--
-- Drop procedure `Proc_User_Lesson_Update`
--
DROP PROCEDURE IF EXISTS Proc_User_Lesson_Update;

--
-- Drop table `user_lesson`
--
DROP TABLE IF EXISTS user_lesson;

--
-- Drop procedure `Proc_User_Topic_INSERT`
--
DROP PROCEDURE IF EXISTS Proc_User_Topic_INSERT;

--
-- Drop procedure `Proc_User_Topic_Update`
--
DROP PROCEDURE IF EXISTS Proc_User_Topic_Update;

--
-- Drop table `user_topic`
--
DROP TABLE IF EXISTS user_topic;

--
-- Set default database
--
USE platform_elearning;

--
-- Create table `user_topic`
--
CREATE TABLE user_topic (
  ID int NOT NULL AUTO_INCREMENT COMMENT 'user ID',
  UserID int DEFAULT NULL,
  UserName varchar(255) DEFAULT NULL COMMENT 'tên user',
  TopicID int DEFAULT NULL COMMENT 'bài học id',
  TopicName varchar(255) DEFAULT NULL COMMENT 'tên bài học user đang học',
  TopicStatus int DEFAULT NULL,
  StartDate varchar(255) DEFAULT NULL COMMENT 'ngày bắt đầu học',
  FinishDate varchar(255) DEFAULT NULL COMMENT 'thời gian hoàn thành',
  TennantID int DEFAULT NULL,
  PRIMARY KEY (ID)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_general_ci,
COMMENT = 'user thao tác với các chủ đề học, phục vụ báo cáo và lưu bài học đang học';

DELIMITER $$

--
-- Create procedure `Proc_User_Topic_Update`
--
CREATE PROCEDURE Proc_User_Topic_Update (IN v_ID int,
IN v_UserID int,
IN v_UserName varchar(255),
IN v_TopicID int,
IN v_TopicName varchar(255),
IN v_TopicStatus int,
IN v_StartDate varchar(255),
IN v_FinishDate varchar(255),
IN v_TennantID int)
SQL SECURITY INVOKER
COMMENT 'Proc cập nhật bảng user_topic'
BEGIN
  UPDATE user_topic
  SET `UserID` = v_UserID,
      `UserName` = v_UserName,
      `TopicID` = v_TopicID,
      `TopicName` = v_TopicName,
      `TopicStatus` = v_TopicStatus,
      `StartDate` = v_StartDate,
      `FinishDate` = v_FinishDate,
      `TennantID` = v_TennantID
  WHERE ID = v_ID
  AND TenantID = v_TenantID;
END
$$

--
-- Create procedure `Proc_User_Topic_INSERT`
--
CREATE PROCEDURE Proc_User_Topic_INSERT (IN v_ID int,
IN v_UserID int,
IN v_UserName varchar(255),
IN v_TopicID int,
IN v_TopicName varchar(255),
IN v_TopicStatus int,
IN v_StartDate varchar(255),
IN v_FinishDate varchar(255),
IN v_TennantID int)
SQL SECURITY INVOKER
COMMENT 'Proc thêm mới bảng user_topic'
BEGIN
  INSERT INTO user_topic (`UserID`,
  `UserName`,
  `TopicID`,
  `TopicName`,
  `TopicStatus`,
  `StartDate`,
  `FinishDate`,
  `TennantID`)
    VALUES (v_UserID, v_UserName, v_TopicID, v_TopicName, v_TopicStatus, v_StartDate, v_FinishDate, v_TennantID);
  SELECT
    LAST_INSERT_ID();
END
$$

DELIMITER ;

--
-- Create table `user_lesson`
--
CREATE TABLE user_lesson (
  ID int NOT NULL AUTO_INCREMENT COMMENT 'user ID',
  UserID int DEFAULT NULL,
  UserName varchar(255) DEFAULT NULL COMMENT 'tên user',
  LessonID int DEFAULT NULL COMMENT 'bài học id',
  LessonName varchar(255) DEFAULT NULL COMMENT 'tên bài học user đang học',
  LessonStatus int DEFAULT NULL,
  StartDate varchar(255) DEFAULT NULL COMMENT 'ngày bắt đầu học',
  FinishDate varchar(255) DEFAULT NULL COMMENT 'thời gian hoàn thành',
  TennantID int DEFAULT NULL,
  Status int DEFAULT NULL COMMENT 'trạng thái 1: chưa được học, 2 đang học, 3 hoàn thành',
  PRIMARY KEY (ID)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_general_ci,
COMMENT = 'user thao tác với cái bài học';

DELIMITER $$

--
-- Create procedure `Proc_User_Lesson_Update`
--
CREATE PROCEDURE Proc_User_Lesson_Update (IN v_ID int,
IN v_UserID int,
IN v_UserName varchar(255),
IN v_LessonID int,
IN v_LessonName varchar(255),
IN v_LessonStatus int,
IN v_StartDate varchar(255),
IN v_FinishDate varchar(255),
IN v_TennantID int,
IN v_Status int)
SQL SECURITY INVOKER
COMMENT 'Proc cập nhật bảng user_lesson'
BEGIN
  UPDATE user_lesson
  SET `UserID` = v_UserID,
      `UserName` = v_UserName,
      `LessonID` = v_LessonID,
      `LessonName` = v_LessonName,
      `LessonStatus` = v_LessonStatus,
      `StartDate` = v_StartDate,
      `FinishDate` = v_FinishDate,
      `TennantID` = v_TennantID,
      `Status` = v_Status
  WHERE ID = v_ID
  AND TenantID = v_TenantID;
END
$$

--
-- Create procedure `Proc_User_Lesson_INSERT`
--
CREATE PROCEDURE Proc_User_Lesson_INSERT (IN v_ID int,
IN v_UserID int,
IN v_UserName varchar(255),
IN v_LessonID int,
IN v_LessonName varchar(255),
IN v_LessonStatus int,
IN v_StartDate varchar(255),
IN v_FinishDate varchar(255),
IN v_TennantID int,
IN v_Status int)
SQL SECURITY INVOKER
COMMENT 'Proc thêm mới bảng user_lesson'
BEGIN
  INSERT INTO user_lesson (`UserID`,
  `UserName`,
  `LessonID`,
  `LessonName`,
  `LessonStatus`,
  `StartDate`,
  `FinishDate`,
  `TennantID`,
  `Status`)
    VALUES (v_UserID, v_UserName, v_LessonID, v_LessonName, v_LessonStatus, v_StartDate, v_FinishDate, v_TennantID, v_Status);
  SELECT
    LAST_INSERT_ID();
END
$$

DELIMITER ;

--
-- Create table `user_class`
--
CREATE TABLE user_class (
  ID int NOT NULL AUTO_INCREMENT,
  ProgramID int DEFAULT NULL,
  ProgramName varchar(255) DEFAULT NULL,
  ClassID int DEFAULT NULL,
  ClassName varchar(255) DEFAULT NULL,
  UserID int DEFAULT NULL,
  FullName varchar(255) DEFAULT NULL,
  UserName varchar(255) DEFAULT NULL,
  RoleCode varchar(255) DEFAULT NULL,
  RoleType int DEFAULT NULL COMMENT 'Loại user: 1 là học sinh, 2 là giáo viên',
  PRIMARY KEY (ID)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_general_ci,
COMMENT = 'bảng lưu người trong lớp học, người có thể là giáo viên hoặc học sinh';

DELIMITER $$

--
-- Create procedure `Proc_User_Class_Update`
--
CREATE PROCEDURE Proc_User_Class_Update (IN v_ID int,
IN v_ProgramID int,
IN v_ProgramName varchar(255),
IN v_ClassID int,
IN v_ClassName varchar(255),
IN v_UserID int,
IN v_FullName varchar(255),
IN v_UserName varchar(255),
IN v_RoleCode varchar(255),
IN v_RoleType int)
SQL SECURITY INVOKER
COMMENT 'Proc cập nhật bảng user_class'
BEGIN
  UPDATE user_class
  SET `ProgramID` = v_ProgramID,
      `ProgramName` = v_ProgramName,
      `ClassID` = v_ClassID,
      `ClassName` = v_ClassName,
      `UserID` = v_UserID,
      `FullName` = v_FullName,
      `UserName` = v_UserName,
      `RoleCode` = v_RoleCode,
      `RoleType` = v_RoleType
  WHERE ID = v_ID
  AND TenantID = v_TenantID;
END
$$

--
-- Create procedure `Proc_User_Class_INSERT`
--
CREATE PROCEDURE Proc_User_Class_INSERT (IN v_ID int,
IN v_ProgramID int,
IN v_ProgramName varchar(255),
IN v_ClassID int,
IN v_ClassName varchar(255),
IN v_UserID int,
IN v_FullName varchar(255),
IN v_UserName varchar(255),
IN v_RoleCode varchar(255),
IN v_RoleType int)
SQL SECURITY INVOKER
COMMENT 'Proc thêm mới bảng user_class'
BEGIN
  INSERT INTO user_class (`ProgramID`,
  `ProgramName`,
  `ClassID`,
  `ClassName`,
  `UserID`,
  `FullName`,
  `UserName`,
  `RoleCode`,
  `RoleType`)
    VALUES (v_ProgramID, v_ProgramName, v_ClassID, v_ClassName, v_UserID, v_FullName, v_UserName, v_RoleCode, v_RoleType);
  SELECT
    LAST_INSERT_ID();
END
$$

DELIMITER ;

--
-- Create table `topic`
--
CREATE TABLE topic (
  ID int NOT NULL AUTO_INCREMENT,
  TopicName varchar(255) DEFAULT NULL,
  SubjectID int DEFAULT NULL,
  CreatedDate datetime DEFAULT NULL,
  CreatedBy varchar(255) DEFAULT NULL,
  ModifiedDate datetime DEFAULT NULL,
  ModifiedBy varchar(255) DEFAULT NULL,
  TenantID int DEFAULT NULL,
  PRIMARY KEY (ID)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci,
COMMENT = 'lưu thông chủ đề học: ví dụ lớp toán 1> đọc đếm tới 10';

DELIMITER $$

--
-- Create procedure `Proc_Topic_Update`
--
CREATE PROCEDURE Proc_Topic_Update (IN v_ID int,
IN v_TopicName varchar(255),
IN v_SubjectID int,
IN v_CreatedDate datetime,
IN v_CreatedBy varchar(255),
IN v_ModifiedDate datetime,
IN v_ModifiedBy varchar(255),
IN v_TenantID int)
SQL SECURITY INVOKER
COMMENT 'Proc cập nhật bảng topic'
BEGIN
  UPDATE topic
  SET `TopicName` = v_TopicName,
      `SubjectID` = v_SubjectID,
      `CreatedDate` = v_CreatedDate,
      `CreatedBy` = v_CreatedBy,
      `ModifiedDate` = v_ModifiedDate,
      `ModifiedBy` = v_ModifiedBy,
      `TenantID` = v_TenantID
  WHERE ID = v_ID
  AND TenantID = v_TenantID;
END
$$

--
-- Create procedure `Proc_Topic_INSERT`
--
CREATE PROCEDURE Proc_Topic_INSERT (IN v_ID int,
IN v_TopicName varchar(255),
IN v_SubjectID int,
IN v_CreatedDate datetime,
IN v_CreatedBy varchar(255),
IN v_ModifiedDate datetime,
IN v_ModifiedBy varchar(255),
IN v_TenantID int)
SQL SECURITY INVOKER
COMMENT 'Proc thêm mới bảng topic'
BEGIN
  INSERT INTO topic (`TopicName`,
  `SubjectID`,
  `CreatedDate`,
  `CreatedBy`,
  `ModifiedDate`,
  `ModifiedBy`,
  `TenantID`)
    VALUES (v_TopicName, v_SubjectID, v_CreatedDate, v_CreatedBy, v_ModifiedDate, v_ModifiedBy, v_TenantID);
  SELECT
    LAST_INSERT_ID();
END
$$

DELIMITER ;

--
-- Create table `program`
--
CREATE TABLE program (
  ID int NOT NULL AUTO_INCREMENT,
  ProgramName varchar(1000) DEFAULT NULL COMMENT 'tên chương trình học',
  CreatedDate datetime DEFAULT NULL,
  CreatedBy varchar(255) DEFAULT NULL,
  ModifiedDate datetime DEFAULT NULL,
  ModifiedBy varchar(255) DEFAULT NULL,
  TenantID int DEFAULT NULL,
  PRIMARY KEY (ID)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci,
COMMENT = 'lưu thông tin chương trình học: vd cấp 3';

DELIMITER $$

--
-- Create procedure `Proc_Program_Update`
--
CREATE PROCEDURE Proc_Program_Update (IN v_ID int,
IN v_ProgramName varchar(1000),
IN v_CreatedDate datetime,
IN v_CreatedBy varchar(255),
IN v_ModifiedDate datetime,
IN v_ModifiedBy varchar(255),
IN v_TenantID int)
SQL SECURITY INVOKER
COMMENT 'Proc cập nhật bảng program'
BEGIN
  UPDATE program
  SET `ProgramName` = v_ProgramName,
      `CreatedDate` = v_CreatedDate,
      `CreatedBy` = v_CreatedBy,
      `ModifiedDate` = v_ModifiedDate,
      `ModifiedBy` = v_ModifiedBy,
      `TenantID` = v_TenantID
  WHERE ID = v_ID
  AND TenantID = v_TenantID;
END
$$

--
-- Create procedure `Proc_Program_INSERT`
--
CREATE PROCEDURE Proc_Program_INSERT (IN v_ID int,
IN v_ProgramName varchar(1000),
IN v_CreatedDate datetime,
IN v_CreatedBy varchar(255),
IN v_ModifiedDate datetime,
IN v_ModifiedBy varchar(255),
IN v_TenantID int)
SQL SECURITY INVOKER
COMMENT 'Proc thêm mới bảng program'
BEGIN
  INSERT INTO program (`ProgramName`,
  `CreatedDate`,
  `CreatedBy`,
  `ModifiedDate`,
  `ModifiedBy`,
  `TenantID`)
    VALUES (v_ProgramName, v_CreatedDate, v_CreatedBy, v_ModifiedDate, v_ModifiedBy, v_TenantID);
  SELECT
    LAST_INSERT_ID();
END
$$

DELIMITER ;

--
-- Create table `lesson`
--
CREATE TABLE lesson (
  ID int NOT NULL AUTO_INCREMENT,
  LessonName varchar(255) DEFAULT NULL,
  TopicID int DEFAULT NULL,
  TopicName varchar(255) DEFAULT NULL COMMENT 'lưu dư thừa tên chủ đề',
  ProgramID int DEFAULT NULL COMMENT 'Lưu dư thừa để lấy bài học theo chương trình học',
  CreatedDate datetime DEFAULT NULL,
  CreatedBy varchar(255) DEFAULT NULL,
  ModifiedDate datetime DEFAULT NULL,
  ModifiedBy varchar(255) DEFAULT NULL,
  TenantID int DEFAULT NULL,
  Status int DEFAULT NULL COMMENT 'trạng thái: 1 kích hoạt',
  Description text DEFAULT NULL COMMENT 'mô tả bài học',
  Image text DEFAULT NULL COMMENT 'lưu ảnh tiết học',
  LinkURL text DEFAULT NULL COMMENT 'Link bài học',
  PRIMARY KEY (ID)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci,
COMMENT = 'lưu thông tin bài học: ví dụ lớp toán 1> đọc đếm tới 10> đếm số cừu';

DELIMITER $$

--
-- Create procedure `Proc_Lesson_Update`
--
CREATE PROCEDURE Proc_Lesson_Update (IN v_ID int,
IN v_LessonName varchar(255),
IN v_TopicID int,
IN v_TopicName varchar(255),
IN v_ProgramID int,
IN v_CreatedDate datetime,
IN v_CreatedBy varchar(255),
IN v_ModifiedDate datetime,
IN v_ModifiedBy varchar(255),
IN v_TenantID int,
IN v_Status int,
IN v_Description text,
IN v_Image text,
IN v_LinkURL text)
SQL SECURITY INVOKER
COMMENT 'Proc cập nhật bảng lesson'
BEGIN
  UPDATE lesson
  SET `LessonName` = v_LessonName,
      `TopicID` = v_TopicID,
      `TopicName` = v_TopicName,
      `ProgramID` = v_ProgramID,
      `CreatedDate` = v_CreatedDate,
      `CreatedBy` = v_CreatedBy,
      `ModifiedDate` = v_ModifiedDate,
      `ModifiedBy` = v_ModifiedBy,
      `TenantID` = v_TenantID,
      `Status` = v_Status,
      `Description` = v_Description,
      `Image` = v_Image,
      `LinkURL` = v_LinkURL
  WHERE ID = v_ID
  AND TenantID = v_TenantID;
END
$$

--
-- Create procedure `Proc_Lesson_INSERT`
--
CREATE PROCEDURE Proc_Lesson_INSERT (IN v_ID int,
IN v_LessonName varchar(255),
IN v_TopicID int,
IN v_TopicName varchar(255),
IN v_ProgramID int,
IN v_CreatedDate datetime,
IN v_CreatedBy varchar(255),
IN v_ModifiedDate datetime,
IN v_ModifiedBy varchar(255),
IN v_TenantID int,
IN v_Status int,
IN v_Description text,
IN v_Image text,
IN v_LinkURL text)
SQL SECURITY INVOKER
COMMENT 'Proc thêm mới bảng lesson'
BEGIN
  INSERT INTO lesson (`LessonName`,
  `TopicID`,
  `TopicName`,
  `ProgramID`,
  `CreatedDate`,
  `CreatedBy`,
  `ModifiedDate`,
  `ModifiedBy`,
  `TenantID`,
  `Status`,
  `Description`,
  `Image`,
  `LinkURL`)
    VALUES (v_LessonName, v_TopicID, v_TopicName, v_ProgramID, v_CreatedDate, v_CreatedBy, v_ModifiedDate, v_ModifiedBy, v_TenantID, v_Status, v_Description, v_Image, v_LinkURL);
  SELECT
    LAST_INSERT_ID();
END
$$

DELIMITER ;

--
-- Create table `class`
--
CREATE TABLE class (
  ID int NOT NULL AUTO_INCREMENT,
  ClassName bigint DEFAULT NULL,
  ProgramID int DEFAULT NULL COMMENT 'lớp học thuộc chương trình học',
  CreatedDate datetime DEFAULT NULL,
  CreatedBy varchar(255) DEFAULT NULL,
  ModifiedDate datetime DEFAULT NULL,
  ModifiedBy varchar(255) DEFAULT NULL,
  TenantID int DEFAULT NULL,
  Decription text DEFAULT NULL,
  ClassType int DEFAULT NULL COMMENT 'Loại lớp học: 1 mặc định, 2 tự tạo',
  OwnerID int DEFAULT NULL COMMENT 'Tên user tạo lớp nếu là mặc định thì để rỗng',
  OwnerName varchar(255) DEFAULT NULL,
  PRIMARY KEY (ID)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci,
COMMENT = 'lưu thông tin lớp học';

DELIMITER $$

--
-- Create procedure `Proc_Class_Update`
--
CREATE PROCEDURE Proc_Class_Update (IN v_ID int,
IN v_ClassName bigint,
IN v_ProgramID int,
IN v_CreatedDate datetime,
IN v_CreatedBy varchar(255),
IN v_ModifiedDate datetime,
IN v_ModifiedBy varchar(255),
IN v_TenantID int,
IN v_Decription text,
IN v_ClassType int,
IN v_OwnerID int,
IN v_OwnerName varchar(255))
SQL SECURITY INVOKER
COMMENT 'Proc cập nhật bảng class'
BEGIN
  UPDATE class
  SET `ClassName` = v_ClassName,
      `ProgramID` = v_ProgramID,
      `CreatedDate` = v_CreatedDate,
      `CreatedBy` = v_CreatedBy,
      `ModifiedDate` = v_ModifiedDate,
      `ModifiedBy` = v_ModifiedBy,
      `TenantID` = v_TenantID,
      `Decription` = v_Decription,
      `ClassType` = v_ClassType,
      `OwnerID` = v_OwnerID,
      `OwnerName` = v_OwnerName
  WHERE ID = v_ID
  AND TenantID = v_TenantID;
END
$$

--
-- Create procedure `Proc_Class_INSERT`
--
CREATE PROCEDURE Proc_Class_INSERT (IN v_ID int,
IN v_ClassName bigint,
IN v_ProgramID int,
IN v_CreatedDate datetime,
IN v_CreatedBy varchar(255),
IN v_ModifiedDate datetime,
IN v_ModifiedBy varchar(255),
IN v_TenantID int,
IN v_Decription text,
IN v_ClassType int,
IN v_OwnerID int,
IN v_OwnerName varchar(255))
SQL SECURITY INVOKER
COMMENT 'Proc thêm mới bảng class'
BEGIN
  INSERT INTO class (`ClassName`,
  `ProgramID`,
  `CreatedDate`,
  `CreatedBy`,
  `ModifiedDate`,
  `ModifiedBy`,
  `TenantID`,
  `Decription`,
  `ClassType`,
  `OwnerID`,
  `OwnerName`)
    VALUES (v_ClassName, v_ProgramID, v_CreatedDate, v_CreatedBy, v_ModifiedDate, v_ModifiedBy, v_TenantID, v_Decription, v_ClassType, v_OwnerID, v_OwnerName);
  SELECT
    LAST_INSERT_ID();
END
$$

DELIMITER ;

--
-- Create table `auditing_log`
--
CREATE TABLE auditing_log (
  AuditingLogID int NOT NULL AUTO_INCREMENT COMMENT 'Khóa chính',
  ModelID int DEFAULT NULL,
  UserID char(36) DEFAULT NULL COMMENT 'ID của user',
  ParentEntityID varchar(36) DEFAULT NULL COMMENT 'Id của bản ghi master',
  FullName varchar(255) DEFAULT NULL COMMENT 'Họ và tên user thực hiện thao tác',
  LogTime datetime DEFAULT NULL COMMENT 'Thời gian thực hiện thao tác',
  Action smallint DEFAULT NULL COMMENT '1: Thêm mới,2: Sửa,3: Xóa',
  Description text DEFAULT NULL COMMENT 'Mô tả chi tiết hành động',
  ModelInfo varchar(255) DEFAULT NULL COMMENT 'Tên thực thể thay đổi',
  SubSystemName varchar(255) DEFAULT NULL COMMENT 'Tên phân hệ thao tác',
  TableName varchar(100) DEFAULT NULL COMMENT 'Tên bảng phát sinh việc ghi log',
  DeviceType smallint DEFAULT 0,
  CreatedBy varchar(100) DEFAULT NULL COMMENT 'Người tạo',
  CreatedDate datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Ngày tạo',
  ModifiedBy varchar(100) DEFAULT NULL COMMENT 'Người sửa',
  ModifiedDate datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Ngày tạo',
  IsSytem bit(1) DEFAULT NULL COMMENT 'Log cấm xóa nếu =1 , ngược lại thì cho xóa',
  TenantID char(36) DEFAULT NULL COMMENT 'ID Công ty',
  OldValue text DEFAULT NULL COMMENT 'Giá trị cũ',
  NewValue text DEFAULT NULL COMMENT 'Giá trị mới',
  PRIMARY KEY (AuditingLogID)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 316,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

DELIMITER $$

--
-- Create procedure `Proc_Auditing_Log_Update`
--
CREATE PROCEDURE Proc_Auditing_Log_Update (IN v_AuditingLogID varchar(36),
IN v_EntityID varchar(36),
IN v_UserID int(20),
IN v_ParentEntityID varchar(36),
IN v_FullName varchar(255),
IN v_LogTime datetime,
IN v_Action smallint(255),
IN v_Description text,
IN v_EntityInfo varchar(255),
IN v_SubSystemName varchar(255),
IN v_TableName varchar(100),
IN v_DeviceType smallint(1),
IN v_CreatedBy varchar(100),
IN v_CreatedDate datetime,
IN v_ModifiedBy varchar(100),
IN v_ModifiedDate datetime,
IN v_IsSytem bit(1),
IN v_TenantID char(36))
SQL SECURITY INVOKER
COMMENT 'Proc cập nhật bảng auditing_log'
BEGIN
  UPDATE auditing_log
  SET `EntityID` = v_EntityID,
      `UserID` = v_UserID,
      `ParentEntityID` = v_ParentEntityID,
      `FullName` = v_FullName,
      `LogTime` = v_LogTime,
      `Action` = v_Action,
      `Description` = v_Description,
      `EntityInfo` = v_EntityInfo,
      `SubSystemName` = v_SubSystemName,
      `TableName` = v_TableName,
      `DeviceType` = v_DeviceType,
      `CreatedBy` = v_CreatedBy,
      `CreatedDate` = v_CreatedDate,
      `ModifiedBy` = v_ModifiedBy,
      `ModifiedDate` = v_ModifiedDate,
      `IsSytem` = v_IsSytem,
      `TenantID` = v_TenantID
  WHERE AuditingLogID = v_AuditingLogID
  AND TenantID = v_TenantID;
END
$$

--
-- Create procedure `Proc_Auditing_Log_INSERT`
--
CREATE PROCEDURE Proc_Auditing_Log_INSERT (IN v_ModelID varchar(36),
IN v_UserID int(20),
IN v_ParentEntityID varchar(36),
IN v_FullName varchar(255),
IN v_LogTime datetime,
IN v_Action smallint(255),
IN v_Description text,
IN v_ModelInfo varchar(255),
IN v_SubSystemName varchar(255),
IN v_TableName varchar(100),
IN v_DeviceType smallint(1),
IN v_CreatedBy varchar(100),
IN v_CreatedDate datetime,
IN v_ModifiedBy varchar(100),
IN v_ModifiedDate datetime,
IN v_IsSytem bit(1),
IN v_TenantID char(36))
SQL SECURITY INVOKER
COMMENT 'Proc thêm mới bảng auditing_log'
BEGIN
  INSERT INTO auditing_log (`ModelID`,
  `UserID`,
  `ParentEntityID`,
  `FullName`,
  `LogTime`,
  `Action`,
  `Description`,
  `ModelInfo`,
  `SubSystemName`,
  `TableName`,
  `DeviceType`,
  `CreatedBy`,
  `CreatedDate`,
  `ModifiedBy`,
  `ModifiedDate`,
  `IsSytem`,
  `TenantID`)
    VALUES (v_ModelID, v_UserID, v_ParentEntityID, v_FullName, v_LogTime, v_Action, v_Description, v_ModelInfo, v_SubSystemName, v_TableName, v_DeviceType, v_CreatedBy, v_CreatedDate, v_ModifiedBy, v_ModifiedDate, v_IsSytem, v_TenantID);
  SELECT
    LAST_INSERT_ID();
END
$$

DELIMITER ;

--
-- Create table `user_roles`
--
CREATE TABLE user_roles (
  UserRoleID int NOT NULL AUTO_INCREMENT,
  UserID int DEFAULT NULL COMMENT 'ID của nhân viên',
  TenantID int DEFAULT NULL,
  RoleID int DEFAULT NULL COMMENT 'ID role của ứng dụng được phép ứng dụng',
  CreatedDate datetime DEFAULT NULL,
  CreatedBy varchar(100) DEFAULT NULL,
  ModifiedDate datetime DEFAULT NULL,
  ModifiedBy varchar(100) DEFAULT NULL,
  RoleName varchar(255) DEFAULT NULL,
  PRIMARY KEY (UserRoleID)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 401,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_general_ci;

--
-- Create index `IDX_user_roles_TenantID_UserID` on table `user_roles`
--
ALTER TABLE user_roles
ADD INDEX IDX_user_roles_TenantID_UserID (TenantID, UserID);

--
-- Create table `user`
--
CREATE TABLE user (
  UserID int NOT NULL COMMENT 'ID pk mã nhân viên',
  UserName varchar(255) DEFAULT NULL COMMENT 'Họ và tên nhân viên',
  FullName varchar(100) DEFAULT NULL,
  ProgramID int DEFAULT NULL COMMENT 'user đăng ký ở chương trình nào',
  Mobile varchar(50) DEFAULT NULL COMMENT 'Số điện thoại',
  Email varchar(100) DEFAULT NULL,
  Status int DEFAULT NULL COMMENT 'trạng thái của user  (1: chưa kích hoạt , 2: chờ xác nhận, 3: đang hoạt động, 4:Ngừng kích hoạt , 5: đã xóa )',
  CreatedDate datetime DEFAULT NULL,
  CreatedBy varchar(100) DEFAULT NULL,
  ModifiedDate datetime DEFAULT NULL,
  ModifiedBy varchar(100) DEFAULT NULL,
  Password varchar(255) DEFAULT NULL,
  Token varchar(255) DEFAULT NULL,
  RoleCode varchar(255) DEFAULT NULL COMMENT 'mã vai trò: vd Admin(lưu enum)',
  RoleName varchar(255) DEFAULT NULL,
  PermissionDetail text DEFAULT NULL COMMENT 'ưu vai trò, lưu dạng string: vd: Add; Edit',
  TenantID int NOT NULL COMMENT 'ID reference thông tin công ty',
  PRIMARY KEY (UserID)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 411,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_general_ci,
COMMENT = 'Bảng người dùng';

--
-- Create index `IDX_users_TenantID_UserID` on table `user`
--
ALTER TABLE user
ADD INDEX IDX_users_TenantID_UserID (TenantID, UserID);

--
-- Create table `subject`
--
CREATE TABLE subject (
  ID int NOT NULL AUTO_INCREMENT,
  SubjectName varchar(255) DEFAULT NULL,
  ClassID int DEFAULT NULL,
  CreatedDate datetime DEFAULT NULL,
  CreatedBy varchar(255) DEFAULT NULL,
  ModifiedDate datetime DEFAULT NULL,
  ModifiedBy varchar(255) DEFAULT NULL,
  TenantID int DEFAULT NULL,
  Description text DEFAULT NULL COMMENT 'mô tả môn học',
  Image text DEFAULT NULL COMMENT 'lưu đường dẫn ảnh môn học',
  PRIMARY KEY (ID)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci,
COMMENT = 'lưu thông tin môn học: ví dụ lớp toán 1';

DELIMITER $$

--
-- Create procedure `Proc_User_Update`
--
CREATE PROCEDURE Proc_User_Update (IN v_UserID int,
IN v_UserName varchar(255),
IN v_FullName varchar(100),
IN v_ProgramID int,
IN v_Mobile varchar(50),
IN v_Email varchar(100),
IN v_Status int,
IN v_CreatedDate datetime,
IN v_CreatedBy varchar(100),
IN v_ModifiedDate datetime,
IN v_ModifiedBy varchar(100),
IN v_Password varchar(255),
IN v_Token varchar(255),
IN v_RoleCode varchar(255),
IN v_RoleName varchar(255),
IN v_PermissionDetail text,
IN v_TenantID int)
SQL SECURITY INVOKER
COMMENT 'Proc cập nhật bảng user'
BEGIN
  UPDATE user
  SET `UserName` = v_UserName,
      `FullName` = v_FullName,
      `ProgramID` = v_ProgramID,
      `Mobile` = v_Mobile,
      `Email` = v_Email,
      `Status` = v_Status,
      `CreatedDate` = v_CreatedDate,
      `CreatedBy` = v_CreatedBy,
      `ModifiedDate` = v_ModifiedDate,
      `ModifiedBy` = v_ModifiedBy,
      `Password` = v_Password,
      `Token` = v_Token,
      `RoleCode` = v_RoleCode,
      `RoleName` = v_RoleName,
      `PermissionDetail` = v_PermissionDetail,
      `TenantID` = v_TenantID
  WHERE UserID = v_UserID
  AND TenantID = v_TenantID;
END
$$

--
-- Create procedure `Proc_User_INSERT`
--
CREATE PROCEDURE Proc_User_INSERT (IN v_UserID int,
IN v_UserName varchar(255),
IN v_FullName varchar(100),
IN v_ProgramID int,
IN v_Mobile varchar(50),
IN v_Email varchar(100),
IN v_Status int,
IN v_CreatedDate datetime,
IN v_CreatedBy varchar(100),
IN v_ModifiedDate datetime,
IN v_ModifiedBy varchar(100),
IN v_Password varchar(255),
IN v_Token varchar(255),
IN v_RoleCode varchar(255),
IN v_RoleName varchar(255),
IN v_PermissionDetail text,
IN v_TenantID int)
SQL SECURITY INVOKER
COMMENT 'Proc thêm mới bảng user'
BEGIN
  INSERT INTO user (`UserName`,
  `FullName`,
  `ProgramID`,
  `Mobile`,
  `Email`,
  `Status`,
  `CreatedDate`,
  `CreatedBy`,
  `ModifiedDate`,
  `ModifiedBy`,
  `Password`,
  `Token`,
  `RoleCode`,
  `RoleName`,
  `PermissionDetail`,
  `TenantID`)
    VALUES (v_UserName, v_FullName, v_ProgramID, v_Mobile, v_Email, v_Status, v_CreatedDate, v_CreatedBy, v_ModifiedDate, v_ModifiedBy, v_Password, v_Token, v_RoleCode, v_RoleName, v_PermissionDetail, v_TenantID);
  SELECT
    LAST_INSERT_ID();
END
$$

--
-- Create procedure `Proc_Subject_Update`
--
CREATE PROCEDURE Proc_Subject_Update (IN v_ID int,
IN v_SubjectName varchar(255),
IN v_ClassID int,
IN v_CreatedDate datetime,
IN v_CreatedBy varchar(255),
IN v_ModifiedDate datetime,
IN v_ModifiedBy varchar(255),
IN v_TenantID int,
IN v_Description text,
IN v_Image text)
SQL SECURITY INVOKER
COMMENT 'Proc cập nhật bảng subject'
BEGIN
  UPDATE subject
  SET `SubjectName` = v_SubjectName,
      `ClassID` = v_ClassID,
      `CreatedDate` = v_CreatedDate,
      `CreatedBy` = v_CreatedBy,
      `ModifiedDate` = v_ModifiedDate,
      `ModifiedBy` = v_ModifiedBy,
      `TenantID` = v_TenantID,
      `Description` = v_Description,
      `Image` = v_Image
  WHERE ID = v_ID
  AND TenantID = v_TenantID;
END
$$

--
-- Create procedure `Proc_Subject_INSERT`
--
CREATE PROCEDURE Proc_Subject_INSERT (IN v_ID int,
IN v_SubjectName varchar(255),
IN v_ClassID int,
IN v_CreatedDate datetime,
IN v_CreatedBy varchar(255),
IN v_ModifiedDate datetime,
IN v_ModifiedBy varchar(255),
IN v_TenantID int,
IN v_Description text,
IN v_Image text)
SQL SECURITY INVOKER
COMMENT 'Proc thêm mới bảng subject'
BEGIN
  INSERT INTO subject (`SubjectName`,
  `ClassID`,
  `CreatedDate`,
  `CreatedBy`,
  `ModifiedDate`,
  `ModifiedBy`,
  `TenantID`,
  `Description`,
  `Image`)
    VALUES (v_SubjectName, v_ClassID, v_CreatedDate, v_CreatedBy, v_ModifiedDate, v_ModifiedBy, v_TenantID, v_Description, v_Image);
  SELECT
    LAST_INSERT_ID();
END
$$

DELIMITER ;

-- 
-- Dumping data for table user_topic
--
-- Table platform_elearning.user_topic does not contain any data (it is empty)

-- 
-- Dumping data for table user_roles
--
-- Table platform_elearning.user_roles does not contain any data (it is empty)

-- 
-- Dumping data for table user_lesson
--
-- Table platform_elearning.user_lesson does not contain any data (it is empty)

-- 
-- Dumping data for table user_class
--
-- Table platform_elearning.user_class does not contain any data (it is empty)

-- 
-- Dumping data for table user
--
-- Table platform_elearning.user does not contain any data (it is empty)

-- 
-- Dumping data for table topic
--
-- Table platform_elearning.topic does not contain any data (it is empty)

-- 
-- Dumping data for table subject
--
-- Table platform_elearning.subject does not contain any data (it is empty)

-- 
-- Dumping data for table program
--
-- Table platform_elearning.program does not contain any data (it is empty)

-- 
-- Dumping data for table lesson
--
-- Table platform_elearning.lesson does not contain any data (it is empty)

-- 
-- Dumping data for table class
--
-- Table platform_elearning.class does not contain any data (it is empty)

-- 
-- Dumping data for table auditing_log
--
-- Table platform_elearning.auditing_log does not contain any data (it is empty)

-- 
-- Restore previous SQL mode
-- 
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

-- 
-- Enable foreign keys
-- 
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;