DROP DATABASE IF EXISTS BaiThi;
CREATE DATABASE  		BaiThi;
USE 					BaiThi;

-- Create  Manager Table --

DROP TABLE IF EXISTS         Manager ;
CREATE TABLE IF NOT EXISTS Manager (
    Manager_id TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Phone NVARCHAR(50) NOT NULL UNIQUE KEY,
    Email NVARCHAR(50) NOT NULL UNIQUE KEY ,
    `Password` NVARCHAR(20) NOT NULL ,
    ExpInYear TINYINT NOT NULL
);

DROP TABLE IF EXISTS         Employee ;
CREATE TABLE IF NOT EXISTS Employee  (
    Employee_id  TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY ,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Phone NVARCHAR(50) NOT NULL UNIQUE KEY ,
    Email NVARCHAR(50) NOT NULL UNIQUE KEY ,
    `Password` NVARCHAR(20) NOT NULL ,
    ProjectName ENUM( 'dev', 'test', 'java', 'sql'),
    ProSkill ENUM ( 'Testing System', 'CRM', 'TimeSheet')
   
);









