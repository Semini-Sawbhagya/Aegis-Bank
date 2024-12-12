CREATE DATABASE  IF NOT EXISTS `bank_database` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bank_database`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: bank_database
-- ------------------------------------------------------
-- Server version	9.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `account_id` int NOT NULL AUTO_INCREMENT,
  `account_type` enum('savings','checking') DEFAULT NULL,
  `account_number` char(15) DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `balance` decimal(15,2) DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT NULL,
  PRIMARY KEY (`account_id`),
  KEY `customer_id` (`customer_id`),
  KEY `branch_id` (`branch_id`),
  CONSTRAINT `account_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `account_ibfk_2` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'savings','SAV-123456789',1,1,10167.36,'active'),(2,'checking','CHK-987654321',2,2,10000.00,'active'),(3,'savings','SAV-246813579',3,3,1176.36,'active'),(4,'checking','CHK-135792468',4,1,10000.00,'active'),(6,'savings','SAV-741852963',6,3,10184.18,'active'),(7,'savings','SAV-640950686',1,1,5000.00,'active'),(8,'savings','SAV-629886357',1,1,5000.00,'active'),(9,'savings','SAV-562936721',3,1,5000.00,'active'),(10,'checking','CHK-469832388',2,1,2000.00,'active'),(11,'checking','CHK-800254500',2,1,5000.00,'active'),(12,'savings','SAV-861357372',13,1,1000.00,'active'),(13,'checking','CHK-451459477',13,1,10000.00,'active'),(14,'savings','SAV-344068453',13,1,10000.00,'active');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `accounts_summary`
--

DROP TABLE IF EXISTS `accounts_summary`;
/*!50001 DROP VIEW IF EXISTS `accounts_summary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `accounts_summary` AS SELECT 
 1 AS `customer_id`,
 1 AS `checking_account_balance`,
 1 AS `savings_account_balance`,
 1 AS `fd_balance`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `advisor`
--

DROP TABLE IF EXISTS `advisor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `advisor` (
  `s_ID` varchar(5) NOT NULL,
  `i_ID` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`s_ID`),
  KEY `i_ID` (`i_ID`),
  CONSTRAINT `advisor_ibfk_1` FOREIGN KEY (`i_ID`) REFERENCES `instructor` (`ID`) ON DELETE SET NULL,
  CONSTRAINT `advisor_ibfk_2` FOREIGN KEY (`s_ID`) REFERENCES `student` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advisor`
--

LOCK TABLES `advisor` WRITE;
/*!40000 ALTER TABLE `advisor` DISABLE KEYS */;
/*!40000 ALTER TABLE `advisor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch` (
  `branch_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `manager_id` int DEFAULT NULL,
  PRIMARY KEY (`branch_id`),
  KEY `manager_id` (`manager_id`),
  CONSTRAINT `branch_ibfk_1` FOREIGN KEY (`manager_id`) REFERENCES `manager` (`manager_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES (1,'Main Branch','Downtown',1),(2,'North Branch','Uptown',2),(3,'East Branch','Suburb',3);
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `branch_checking_accounts`
--

DROP TABLE IF EXISTS `branch_checking_accounts`;
/*!50001 DROP VIEW IF EXISTS `branch_checking_accounts`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `branch_checking_accounts` AS SELECT 
 1 AS `checking_account_id`,
 1 AS `account_id`,
 1 AS `customer_id`,
 1 AS `user_id`,
 1 AS `customer_type`,
 1 AS `mobile_number`,
 1 AS `landline_number`,
 1 AS `address`,
 1 AS `branch_id`,
 1 AS `name`,
 1 AS `location`,
 1 AS `manager_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `branch_customer_details`
--

DROP TABLE IF EXISTS `branch_customer_details`;
/*!50001 DROP VIEW IF EXISTS `branch_customer_details`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `branch_customer_details` AS SELECT 
 1 AS `customer_id`,
 1 AS `user_id`,
 1 AS `customer_type`,
 1 AS `mobile_number`,
 1 AS `landline_number`,
 1 AS `address`,
 1 AS `branch_id`,
 1 AS `name`,
 1 AS `location`,
 1 AS `manager_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `branch_employee_details`
--

DROP TABLE IF EXISTS `branch_employee_details`;
/*!50001 DROP VIEW IF EXISTS `branch_employee_details`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `branch_employee_details` AS SELECT 
 1 AS `employee_id`,
 1 AS `branch_id`,
 1 AS `branch_name`,
 1 AS `full_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `branch_late_loan_payment_details`
--

DROP TABLE IF EXISTS `branch_late_loan_payment_details`;
/*!50001 DROP VIEW IF EXISTS `branch_late_loan_payment_details`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `branch_late_loan_payment_details` AS SELECT 
 1 AS `customer_id`,
 1 AS `mobile_number`,
 1 AS `account_number`,
 1 AS `loan_id`,
 1 AS `amount`,
 1 AS `due_date`,
 1 AS `branch_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `branch_loan_details`
--

DROP TABLE IF EXISTS `branch_loan_details`;
/*!50001 DROP VIEW IF EXISTS `branch_loan_details`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `branch_loan_details` AS SELECT 
 1 AS `loan_id`,
 1 AS `amount`,
 1 AS `loan_type`,
 1 AS `start_date`,
 1 AS `end_date`,
 1 AS `status`,
 1 AS `loan_account_id`,
 1 AS `customer_id`,
 1 AS `branch_id`,
 1 AS `branch_name`,
 1 AS `location`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `branch_savings_accounts`
--

DROP TABLE IF EXISTS `branch_savings_accounts`;
/*!50001 DROP VIEW IF EXISTS `branch_savings_accounts`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `branch_savings_accounts` AS SELECT 
 1 AS `savings_account_id`,
 1 AS `account_id`,
 1 AS `savings_plan_id`,
 1 AS `customer_id`,
 1 AS `user_id`,
 1 AS `customer_type`,
 1 AS `mobile_number`,
 1 AS `landline_number`,
 1 AS `address`,
 1 AS `branch_id`,
 1 AS `name`,
 1 AS `location`,
 1 AS `manager_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `branch_transaction_details`
--

DROP TABLE IF EXISTS `branch_transaction_details`;
/*!50001 DROP VIEW IF EXISTS `branch_transaction_details`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `branch_transaction_details` AS SELECT 
 1 AS `transaction_id`,
 1 AS `account_id`,
 1 AS `date`,
 1 AS `amount`,
 1 AS `transaction_type`,
 1 AS `account_number`,
 1 AS `branch_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `checking_account`
--

DROP TABLE IF EXISTS `checking_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checking_account` (
  `checking_account_id` int NOT NULL AUTO_INCREMENT,
  `account_id` int DEFAULT NULL,
  PRIMARY KEY (`checking_account_id`),
  KEY `account_id` (`account_id`),
  CONSTRAINT `checking_account_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checking_account`
--

LOCK TABLES `checking_account` WRITE;
/*!40000 ALTER TABLE `checking_account` DISABLE KEYS */;
INSERT INTO `checking_account` VALUES (1,2),(2,4),(3,10),(4,11),(5,13);
/*!40000 ALTER TABLE `checking_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classroom`
--

DROP TABLE IF EXISTS `classroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classroom` (
  `building` varchar(15) NOT NULL,
  `room_number` varchar(7) NOT NULL,
  `capacity` decimal(4,0) DEFAULT NULL,
  PRIMARY KEY (`building`,`room_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classroom`
--

LOCK TABLES `classroom` WRITE;
/*!40000 ALTER TABLE `classroom` DISABLE KEYS */;
/*!40000 ALTER TABLE `classroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `course_id` varchar(8) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `dept_name` varchar(20) DEFAULT NULL,
  `credits` decimal(2,0) DEFAULT NULL,
  PRIMARY KEY (`course_id`),
  KEY `dept_name` (`dept_name`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`dept_name`) REFERENCES `department` (`dept_name`) ON DELETE SET NULL,
  CONSTRAINT `course_chk_1` CHECK ((`credits` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `customer_type` enum('individual','organization') DEFAULT NULL,
  `mobile_number` varchar(10) DEFAULT NULL,
  `landline_number` varchar(10) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,27,'individual','1234567890','0123456789','123 Main St, City'),(2,25,'individual','2345678901','0234567890','456 Elm St, Town'),(3,26,'organization','3456789012','0345678901','789 Oak St, Village'),(4,8,'individual','4567890123','0456789012','321 Pine St, County'),(6,10,'individual','6789012345','0678901234','987 Cedar St, Country'),(7,16,'individual','7890123456','0789012345','101 Fir St, Region'),(8,17,'individual','8901234567','0890123456','202 Birch St, City'),(9,18,'individual','9012345678','0901234567','303 Spruce St, Town'),(13,NULL,'individual','0741224726','4588787121','No. 09/262');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `log_customer_changes` AFTER INSERT ON `customer` FOR EACH ROW BEGIN
    INSERT INTO customer_log (customer_id, mobile_number, landline_number, address, updated_date) 
    VALUES (NEW.customer_id, NEW.mobile_number, NEW.landline_number, NEW.address, CURRENT_TIMESTAMP);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `log_customer_update` AFTER UPDATE ON `customer` FOR EACH ROW BEGIN
    INSERT INTO customer_log (customer_id, mobile_number, landline_number, address, updated_date) 
    VALUES (NEW.customer_id, NEW.mobile_number, NEW.landline_number, NEW.address, CURRENT_TIMESTAMP);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `log_customer_delete` AFTER DELETE ON `customer` FOR EACH ROW BEGIN
    INSERT INTO customer_log (customer_id, mobile_number, landline_number, address, updated_date) 
    VALUES (OLD.customer_id, NULL, NULL, NULL, CURRENT_TIMESTAMP);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `customer_details`
--

DROP TABLE IF EXISTS `customer_details`;
/*!50001 DROP VIEW IF EXISTS `customer_details`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `customer_details` AS SELECT 
 1 AS `customer_id`,
 1 AS `account_type`,
 1 AS `account_number`,
 1 AS `name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `customer_log`
--

DROP TABLE IF EXISTS `customer_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_log` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `mobile_number` varchar(10) DEFAULT NULL,
  `landline_number` varchar(10) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `customer_log_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_log`
--

LOCK TABLES `customer_log` WRITE;
/*!40000 ALTER TABLE `customer_log` DISABLE KEYS */;
INSERT INTO `customer_log` VALUES (1,1,'1234567890','0123456789','123 Main St, City','2024-09-01'),(2,2,'2345678901','0234567890','456 Elm St, Town','2024-09-15'),(3,3,'3456789012','0345678901','789 Oak St, Village','2024-09-30'),(4,1,'1234567890','0123456789','123 Main St, City','2024-10-21'),(5,2,'2345678901','0234567890','456 Elm St, Town','2024-10-22'),(6,3,'3456789012','0345678901','789 Oak St, Village','2024-10-22'),(7,1,'1234567890','0123456789','123 Main St, City','2024-10-27'),(8,13,'0741224726','4588787121','No. 09/262','2024-10-28');
/*!40000 ALTER TABLE `customer_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `dept_name` varchar(20) NOT NULL,
  `building` varchar(15) DEFAULT NULL,
  `budget` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`dept_name`),
  CONSTRAINT `department_chk_1` CHECK ((`budget` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deposit`
--

DROP TABLE IF EXISTS `deposit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deposit` (
  `transaction_id` int NOT NULL,
  `branch_id` int DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `branch_id` (`branch_id`),
  CONSTRAINT `deposit_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transaction` (`transaction_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `deposit_ibfk_2` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deposit`
--

LOCK TABLES `deposit` WRITE;
/*!40000 ALTER TABLE `deposit` DISABLE KEYS */;
INSERT INTO `deposit` VALUES (1,1),(7,1),(3,3);
/*!40000 ALTER TABLE `deposit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `staff_id` int DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `staff_id` (`staff_id`),
  KEY `branch_id` (`branch_id`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,3,1),(2,4,2),(3,12,1),(4,13,1),(5,14,1),(6,15,1);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fd_plan`
--

DROP TABLE IF EXISTS `fd_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fd_plan` (
  `fd_plan_id` int NOT NULL AUTO_INCREMENT,
  `duration` int DEFAULT NULL,
  `Interest_rate` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`fd_plan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fd_plan`
--

LOCK TABLES `fd_plan` WRITE;
/*!40000 ALTER TABLE `fd_plan` DISABLE KEYS */;
INSERT INTO `fd_plan` VALUES (1,6,13.00),(2,12,14.00),(3,36,15.00);
/*!40000 ALTER TABLE `fd_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fixed_deposit`
--

DROP TABLE IF EXISTS `fixed_deposit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fixed_deposit` (
  `fd_id` int NOT NULL AUTO_INCREMENT,
  `savings_account_id` int DEFAULT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `fd_plan_id` int DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`fd_id`),
  KEY `savings_account_id` (`savings_account_id`),
  KEY `fd_plan_id` (`fd_plan_id`),
  CONSTRAINT `fixed_deposit_ibfk_1` FOREIGN KEY (`savings_account_id`) REFERENCES `savings_account` (`savings_account_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fixed_deposit_ibfk_2` FOREIGN KEY (`fd_plan_id`) REFERENCES `fd_plan` (`fd_plan_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fixed_deposit`
--

LOCK TABLES `fixed_deposit` WRITE;
/*!40000 ALTER TABLE `fixed_deposit` DISABLE KEYS */;
INSERT INTO `fixed_deposit` VALUES (1,1,10000.00,2,'2024-10-01','2025-10-01'),(2,2,10000.00,2,'2024-10-05','2025-04-05'),(3,4,5000.00,1,'2024-10-05','2025-04-05'),(4,1,20000.00,2,'2024-10-25','2025-10-25'),(5,2,2099.00,2,'2024-10-25','2025-10-25'),(6,1,20099.00,2,'2024-10-25','2025-10-25'),(7,5,2001.00,2,'2024-10-25','2025-10-25'),(8,5,2001.00,2,'2024-10-25','2025-10-25'),(9,5,2001.00,2,'2024-10-25','2025-10-25'),(10,5,2001.00,2,'2024-10-25','2025-10-25'),(11,5,2001.00,2,'2024-10-25','2025-10-25'),(12,6,45678.00,3,'2024-10-25','2027-10-25'),(13,1,10000.00,2,'2024-10-28','2025-10-28');
/*!40000 ALTER TABLE `fixed_deposit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `individual`
--

DROP TABLE IF EXISTS `individual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `individual` (
  `customer_id` int NOT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `NIC` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `NIC_UNIQUE` (`NIC`),
  CONSTRAINT `individual_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `individual`
--

LOCK TABLES `individual` WRITE;
/*!40000 ALTER TABLE `individual` DISABLE KEYS */;
INSERT INTO `individual` VALUES (1,'Charlie Brown','1995-07-25','950725-1111'),(2,'Diana Ross','1988-11-30','881130-2222'),(4,'Fiona Apple','1992-04-18','920418-3333'),(6,'Helen Mirren','1975-01-05','750105-4444'),(13,'Sansika Suhan Waduge','2024-10-31','22224446666');
/*!40000 ALTER TABLE `individual` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor`
--

DROP TABLE IF EXISTS `instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instructor` (
  `ID` varchar(5) NOT NULL,
  `name` varchar(20) NOT NULL,
  `dept_name` varchar(20) DEFAULT NULL,
  `salary` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `dept_name` (`dept_name`),
  CONSTRAINT `instructor_ibfk_1` FOREIGN KEY (`dept_name`) REFERENCES `department` (`dept_name`) ON DELETE SET NULL,
  CONSTRAINT `instructor_chk_1` CHECK ((`salary` > 29000))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor`
--

LOCK TABLES `instructor` WRITE;
/*!40000 ALTER TABLE `instructor` DISABLE KEYS */;
/*!40000 ALTER TABLE `instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan`
--

DROP TABLE IF EXISTS `loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan` (
  `loan_id` int NOT NULL AUTO_INCREMENT,
  `account_id` int DEFAULT NULL,
  `loan_type` enum('personal','business') DEFAULT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `interest_rate` decimal(4,2) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` enum('approved','pending','rejected') DEFAULT NULL,
  PRIMARY KEY (`loan_id`),
  KEY `account_id` (`account_id`),
  CONSTRAINT `loan_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan`
--

LOCK TABLES `loan` WRITE;
/*!40000 ALTER TABLE `loan` DISABLE KEYS */;
INSERT INTO `loan` VALUES (1,1,'personal',10000.00,5.50,'2024-10-01','2025-10-01','approved'),(2,3,'business',50000.00,6.00,'2024-09-15','2026-09-15','approved'),(4,2,'personal',1001.00,4.00,'2024-10-01','2025-10-01','pending'),(5,3,'personal',4000.00,4.00,'2024-10-24','2025-10-24','pending'),(6,3,'personal',4000.00,4.00,'2024-10-24','2025-10-24','pending'),(7,3,'personal',1000.00,4.00,'2024-10-24','2025-10-24','pending'),(8,3,'personal',4000.00,5.00,'2024-10-29','2025-10-29','pending'),(9,3,'personal',5000.00,5.00,'2024-10-29','2025-10-29','approved'),(10,3,'personal',4433.00,5.00,'2024-10-29','2025-10-29','approved'),(11,3,'business',5499.00,6.00,'2024-10-29','2025-10-29','approved'),(12,3,'personal',2997.00,5.00,'2024-10-29','2025-10-29','approved'),(13,9,'business',4168.00,6.00,'2024-10-29','2025-10-29','approved'),(14,9,'business',4168.00,6.00,'2024-10-29','2025-10-29','pending');
/*!40000 ALTER TABLE `loan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan_installment`
--

DROP TABLE IF EXISTS `loan_installment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan_installment` (
  `installment_id` int NOT NULL AUTO_INCREMENT,
  `loan_id` int DEFAULT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `duration` int DEFAULT '30',
  PRIMARY KEY (`installment_id`),
  KEY `loan_id` (`loan_id`),
  CONSTRAINT `loan_installment_ibfk_1` FOREIGN KEY (`loan_id`) REFERENCES `loan` (`loan_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_installment`
--

LOCK TABLES `loan_installment` WRITE;
/*!40000 ALTER TABLE `loan_installment` DISABLE KEYS */;
INSERT INTO `loan_installment` VALUES (1,1,1000.00,30),(2,2,0.00,0),(4,10,0.00,0),(5,10,4433.00,30),(16,11,5499.00,30),(17,12,2997.00,30),(18,13,4168.00,30);
/*!40000 ALTER TABLE `loan_installment` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `add_loan_payment` AFTER INSERT ON `loan_installment` FOR EACH ROW BEGIN
    DECLARE payment_due_date DATE;

    -- Set due date to 30 days from installment start (or as defined in `duration`)
    SET payment_due_date = DATE_ADD(CURRENT_DATE, INTERVAL NEW.duration DAY);

    -- Insert loan payment record with `pending` status
    INSERT INTO loan_payment (instalment_id, amount, due_date, status)
    VALUES (NEW.installment_id, NEW.amount, payment_due_date, 'pending');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `loan_payment`
--

DROP TABLE IF EXISTS `loan_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan_payment` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `instalment_id` int DEFAULT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `payed_date` date DEFAULT NULL,
  `status` enum('paid','unpaid','pending') NOT NULL DEFAULT 'pending',
  `penalty_id` int DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `instalment_id` (`instalment_id`),
  KEY `penalty_id` (`penalty_id`),
  CONSTRAINT `loan_payment_ibfk_1` FOREIGN KEY (`instalment_id`) REFERENCES `loan_installment` (`installment_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `loan_payment_ibfk_2` FOREIGN KEY (`penalty_id`) REFERENCES `penalty` (`penalty_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_payment`
--

LOCK TABLES `loan_payment` WRITE;
/*!40000 ALTER TABLE `loan_payment` DISABLE KEYS */;
INSERT INTO `loan_payment` VALUES (1,1,1000.00,'2024-11-01','2024-10-28','paid',NULL),(5,2,2525.00,'2024-10-15','2024-10-29','unpaid',1),(7,4,4433.00,'2024-11-28',NULL,'unpaid',1),(32,16,5499.00,'2024-11-28',NULL,'unpaid',1),(33,17,2997.00,'2024-11-28',NULL,'unpaid',1),(34,17,2997.00,'2024-11-29',NULL,'unpaid',1),(35,17,2997.00,'2024-12-29',NULL,'pending',NULL),(36,17,2997.00,'2025-01-29',NULL,'pending',NULL),(37,17,2997.00,'2025-02-28',NULL,'pending',NULL),(38,17,2997.00,'2025-03-28',NULL,'pending',NULL),(39,17,2997.00,'2025-04-28',NULL,'pending',NULL),(40,17,2997.00,'2025-05-28',NULL,'pending',NULL),(41,17,2997.00,'2025-06-28',NULL,'pending',NULL),(42,17,2997.00,'2025-07-28',NULL,'pending',NULL),(43,17,2997.00,'2025-08-28',NULL,'pending',NULL),(44,17,2997.00,'2025-09-28',NULL,'pending',NULL),(45,17,2997.00,'2025-10-28',NULL,'pending',NULL),(46,18,4168.00,'2024-11-28',NULL,'unpaid',1),(47,18,4168.00,'2024-11-29',NULL,'unpaid',1),(48,18,4168.00,'2024-12-29',NULL,'pending',NULL),(49,18,4168.00,'2025-01-29',NULL,'pending',NULL),(50,18,4168.00,'2025-02-28',NULL,'pending',NULL),(51,18,4168.00,'2025-03-28',NULL,'pending',NULL),(52,18,4168.00,'2025-04-28',NULL,'pending',NULL),(53,18,4168.00,'2025-05-28',NULL,'pending',NULL),(54,18,4168.00,'2025-06-28',NULL,'pending',NULL),(55,18,4168.00,'2025-07-28',NULL,'pending',NULL),(56,18,4168.00,'2025-08-28',NULL,'pending',NULL),(57,18,4168.00,'2025-09-28',NULL,'pending',NULL),(58,18,4168.00,'2025-10-28',NULL,'pending',NULL),(60,17,2997.00,'2024-11-28','2024-10-20','paid',NULL),(61,17,2997.00,'2024-11-28','2024-10-10','paid',NULL),(62,17,2997.00,'2024-11-28','2024-10-10','paid',NULL);
/*!40000 ALTER TABLE `loan_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manager` (
  `manager_id` int NOT NULL AUTO_INCREMENT,
  `staff_id` int DEFAULT NULL,
  PRIMARY KEY (`manager_id`),
  KEY `staff_id` (`staff_id`),
  CONSTRAINT `manager_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES (1,1),(2,2),(3,5);
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization`
--

DROP TABLE IF EXISTS `organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organization` (
  `customer_id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `license_number` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `license_number_UNIQUE` (`license_number`),
  CONSTRAINT `organization_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization`
--

LOCK TABLES `organization` WRITE;
/*!40000 ALTER TABLE `organization` DISABLE KEYS */;
INSERT INTO `organization` VALUES (3,'ABC Corporation','ORG-12345');
/*!40000 ALTER TABLE `organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `penalty`
--

DROP TABLE IF EXISTS `penalty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `penalty` (
  `penalty_id` int NOT NULL AUTO_INCREMENT,
  `penalty_type_id` int DEFAULT NULL,
  PRIMARY KEY (`penalty_id`),
  KEY `penalty_type_id` (`penalty_type_id`),
  CONSTRAINT `penalty_ibfk_1` FOREIGN KEY (`penalty_type_id`) REFERENCES `penalty_types` (`penalty_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penalty`
--

LOCK TABLES `penalty` WRITE;
/*!40000 ALTER TABLE `penalty` DISABLE KEYS */;
INSERT INTO `penalty` VALUES (1,1),(4,1),(5,1),(2,2),(3,3);
/*!40000 ALTER TABLE `penalty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `penalty_types`
--

DROP TABLE IF EXISTS `penalty_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `penalty_types` (
  `penalty_type_id` int NOT NULL AUTO_INCREMENT,
  `penalty_amount` decimal(10,2) DEFAULT NULL,
  `penalty_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`penalty_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penalty_types`
--

LOCK TABLES `penalty_types` WRITE;
/*!40000 ALTER TABLE `penalty_types` DISABLE KEYS */;
INSERT INTO `penalty_types` VALUES (1,25.00,'Late Payment'),(2,50.00,'Insufficient Funds'),(3,100.00,'Early Withdrawal');
/*!40000 ALTER TABLE `penalty_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prereq`
--

DROP TABLE IF EXISTS `prereq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prereq` (
  `course_id` varchar(8) NOT NULL,
  `prereq_id` varchar(8) NOT NULL,
  PRIMARY KEY (`course_id`,`prereq_id`),
  KEY `prereq_id` (`prereq_id`),
  CONSTRAINT `prereq_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE,
  CONSTRAINT `prereq_ibfk_2` FOREIGN KEY (`prereq_id`) REFERENCES `course` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prereq`
--

LOCK TABLES `prereq` WRITE;
/*!40000 ALTER TABLE `prereq` DISABLE KEYS */;
/*!40000 ALTER TABLE `prereq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refresh_tokens`
--

DROP TABLE IF EXISTS `refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refresh_tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  `user_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refresh_tokens`
--

LOCK TABLES `refresh_tokens` WRITE;
/*!40000 ALTER TABLE `refresh_tokens` DISABLE KEYS */;
INSERT INTO `refresh_tokens` VALUES (87,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTcyOTY3MzAzNywiZXhwIjoxNzMwMjc3ODM3fQ.EN34kIFAAe5pNvk137tnrkaHdNRpSJ-DCl9lpKg16vI',1,'2024-10-23 08:43:57'),(88,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTcyOTY3MzY2MiwiZXhwIjoxNzMwMjc4NDYyfQ.ZVIH5XnD8zBXv2xdhpwSAw7byJ8OrQfm3tqnd4smBEA',1,'2024-10-23 08:54:22'),(89,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTcyOTY3MzY2NiwiZXhwIjoxNzMwMjc4NDY2fQ.KRv5ceH_5Q4DeWmhToEimoTQbxWY4vRA9Mz-XftY-nQ',1,'2024-10-23 08:54:26'),(91,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTcyOTY3Njc1OCwiZXhwIjoxNzMwMjgxNTU4fQ.LcBHKjPh1INY_wcA3V8aRrzCghgwElpqf-00HdI1sgc',1,'2024-10-23 09:45:58'),(93,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjI1LCJpYXQiOjE3Mjk2NzY5NDksImV4cCI6MTczMDI4MTc0OX0.6UlUJ94jPJVMCIyyR7Sh7s6Gfo7DPPbXinbAyE25Ypg',25,'2024-10-23 09:49:09'),(102,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTcyOTc3NzgwMiwiZXhwIjoxNzMwMzgyNjAyfQ.66zMGYcfLKxOxKIGp_SLZgqwLMTxXIcWHijz0cV2lHY',1,'2024-10-24 13:50:03'),(106,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTcyOTc3ODM4MywiZXhwIjoxNzMwMzgzMTgzfQ.CQcgUyRj5ULnImtUF3vwXUwe79iWaHAWnw8DNhCoSmk',1,'2024-10-24 13:59:43'),(107,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTcyOTc3ODQxMCwiZXhwIjoxNzMwMzgzMjEwfQ.Nwx0-XlNKsJIp6EuMhqZ41P2Z7-gThR-TOUf40R-s78',1,'2024-10-24 14:00:10'),(113,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTcyOTc4MDYyNywiZXhwIjoxNzMwMzg1NDI3fQ.EtX6K0zG8AXW0TGK7C42q-8NJZZn3Awqj0oZ4vJpsco',1,'2024-10-24 14:37:07'),(114,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTcyOTc4MDcwNywiZXhwIjoxNzMwMzg1NTA3fQ.5pUUPRm1vFPM7aO9MGzb1G-BGQyek76UkI00rdZe0UA',1,'2024-10-24 14:38:27'),(115,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTcyOTc4ODgwMiwiZXhwIjoxNzMwMzkzNjAyfQ.Rx_SJ-e28H_VAq2txrFEw9D6ZcA4NA2EqCIIn5IhRMM',1,'2024-10-24 16:53:22'),(117,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTcyOTc5MjcxMCwiZXhwIjoxNzMwMzk3NTEwfQ.2UrPJqxbuDBgAvYhRtiZP9wym3UwvCjAFPXRHcSlalw',1,'2024-10-24 17:58:30'),(118,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjI2LCJpYXQiOjE3Mjk3OTI3MjEsImV4cCI6MTczMDM5NzUyMX0.a4JXOv2SPJQvxeIZUft1PjYq1bgzsDz56UF4THRFIU8',26,'2024-10-24 17:58:41'),(122,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTcyOTgyNzY2NSwiZXhwIjoxNzMwNDMyNDY1fQ.-c4REZeS44p_qfMXJs-A6Y9lE20TpESWBv-2ApBc9OQ',1,'2024-10-25 03:41:05'),(123,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTcyOTgzMDk2MiwiZXhwIjoxNzMwNDM1NzYyfQ.6MB3xhC1YYyFsZZxvWF5Gs5SBZtOQmfti6kE8s7mXl4',1,'2024-10-25 04:36:02'),(124,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTcyOTgzMzMyNSwiZXhwIjoxNzMwNDM4MTI1fQ.tVsh99QVErCczBqVMyKRBBZYvy6Djlm0-4z9DrDgmcQ',1,'2024-10-25 05:15:25'),(125,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTcyOTg0NDc1NCwiZXhwIjoxNzMwNDQ5NTU0fQ.3JppXItltd5IbjBMPD0YzkRoM9yRStCu9Ne6ZVo6bvY',1,'2024-10-25 08:25:54'),(128,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTcyOTg0OTIzNiwiZXhwIjoxNzMwNDU0MDM2fQ.TC47_lQhlJtf32FKaGQaWT70DEtkLcU01Diaig8RAtc',1,'2024-10-25 09:40:36'),(129,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTcyOTg1MjIzNywiZXhwIjoxNzMwNDU3MDM3fQ.ippeobKYmSFfedg2XOpxt7cPA3Jsw7zu3dJBb7aABTA',1,'2024-10-25 10:30:37'),(131,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjI2LCJpYXQiOjE3Mjk4NTI0MTcsImV4cCI6MTczMDQ1NzIxN30.3h__hq5agZb3CHdKLTJmgBtr4AL2M7xzYEb4vzopLeg',26,'2024-10-25 10:33:37'),(133,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTcyOTg3NDM3OCwiZXhwIjoxNzMwNDc5MTc4fQ.HI5L_OqhywjUANGfYqALybEaXwEmgLJUBKYW9xLptUg',1,'2024-10-25 16:39:38'),(135,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTcyOTg3NDQzMCwiZXhwIjoxNzMwNDc5MjMwfQ.N9PKTHabaXCSCmYaYc0MzBrrGmgLqpMGrJiLMIDxZUY',1,'2024-10-25 16:40:30'),(142,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTcyOTg3NTU3MiwiZXhwIjoxNzMwNDgwMzcyfQ.7lyyMjdOvploWcrRwQ7Dv6UVcIaNxPvB-CRycUZXWpQ',1,'2024-10-25 16:59:32'),(143,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTcyOTg3NjM4MSwiZXhwIjoxNzMwNDgxMTgxfQ.rk29qLFiT7BhrqiicNRmGMMQxVW2OFcpzakYQba-2VQ',1,'2024-10-25 17:13:01'),(146,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTcyOTg3NzA0NiwiZXhwIjoxNzMwNDgxODQ2fQ.GzL7EbiAwx0uHvjaXwtI29JzCqwkr_w9Za30P4G9EZ8',1,'2024-10-25 17:24:06'),(147,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjI3LCJpYXQiOjE3MzAwMTcyNDcsImV4cCI6MTczMDYyMjA0N30.e-pq2rZKuLcKMEQW9azjGCap8oDszzp30C5mAktL_xs',27,'2024-10-27 08:20:47'),(150,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTczMDEyNjUwMSwiZXhwIjoxNzMwNzMxMzAxfQ.Np6GIALtPpvzmkcPU8CHeJzVsBaPFpX09u3eYwXmVuY',1,'2024-10-28 14:41:41'),(153,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjI1LCJpYXQiOjE3MzAxMjc4NjgsImV4cCI6MTczMDczMjY2OH0.M-af_-yZMEYOp3-WUAg01PsNrXMQMIpupnxF9JLoCEY',25,'2024-10-28 15:04:28'),(159,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTczMDEzMDIxMiwiZXhwIjoxNzMwNzM1MDEyfQ.uN-vUBHRKxp6BWJjtvsjdOwxVweQ2yR_fg64uob6Y-8',1,'2024-10-28 15:43:32'),(162,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTczMDEzMzAxMiwiZXhwIjoxNzMwNzM3ODEyfQ.5eRZtF33aVqlkwLo0THH5Hbw9yFaV8LGw57oQ4IV1hs',1,'2024-10-28 16:30:12'),(167,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjI2LCJpYXQiOjE3MzAxMzQ1MDIsImV4cCI6MTczMDczOTMwMn0.RWDMgiQuGISREaAHN3CDYHIu8Kh00X3qhN2TgdoPvlU',26,'2024-10-28 16:55:02'),(186,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjI2LCJpYXQiOjE3MzAyMTkxMzEsImV4cCI6MTczMDgyMzkzMX0.V6IJ0bj05rMlv9eRvQ2EmnURag2-jtjfxlIj7JVdwns',26,'2024-10-29 16:25:31'),(188,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjI1LCJpYXQiOjE3MzAyNTU2ODcsImV4cCI6MTczMDg2MDQ4N30.K5Y1uZJ8DaZ3LNUAwPQUkf0LrjIgx-PqgaD9c9JHI4c',25,'2024-10-30 02:34:47'),(189,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjI1LCJpYXQiOjE3MzAyNTU2ODcsImV4cCI6MTczMDg2MDQ4N30.K5Y1uZJ8DaZ3LNUAwPQUkf0LrjIgx-PqgaD9c9JHI4c',25,'2024-10-30 02:34:47'),(190,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjI1LCJpYXQiOjE3MzAyNTU3NTgsImV4cCI6MTczMDg2MDU1OH0.NZtSWDaxVIi0__AhABJsr94XJbf527RytE1BBjb0QPI',25,'2024-10-30 02:35:58'),(193,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjI1LCJpYXQiOjE3MzAyNTg4MzQsImV4cCI6MTczMDg2MzYzNH0.kKxJbpqtfljjFkJD9msBj_a3WgbDrAyuZKNvMzXf7mo',25,'2024-10-30 03:27:14'),(195,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjMxLCJpYXQiOjE3MzAyNjM0NjIsImV4cCI6MTczMDg2ODI2Mn0.PpKGTo-tw9g5D9N7PeNKBCTvh3MAwm9-7Cum6T_JAng',31,'2024-10-30 04:44:22');
/*!40000 ALTER TABLE `refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `savings_account`
--

DROP TABLE IF EXISTS `savings_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `savings_account` (
  `savings_account_id` int NOT NULL AUTO_INCREMENT,
  `account_id` int DEFAULT NULL,
  `savings_plan_id` int DEFAULT NULL,
  PRIMARY KEY (`savings_account_id`),
  KEY `account_id` (`account_id`),
  KEY `savings_plan_id` (`savings_plan_id`),
  CONSTRAINT `savings_account_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `savings_account_ibfk_2` FOREIGN KEY (`savings_plan_id`) REFERENCES `savings_plan` (`savings_plan_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `savings_account`
--

LOCK TABLES `savings_account` WRITE;
/*!40000 ALTER TABLE `savings_account` DISABLE KEYS */;
INSERT INTO `savings_account` VALUES (1,1,3),(2,3,3),(4,6,2),(5,7,3),(6,8,3),(7,9,3),(8,12,3),(9,14,3);
/*!40000 ALTER TABLE `savings_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `savings_plan`
--

DROP TABLE IF EXISTS `savings_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `savings_plan` (
  `savings_plan_id` int NOT NULL AUTO_INCREMENT,
  `type` enum('child','teen','adult','senior') DEFAULT NULL,
  `Interest_rate` decimal(4,2) DEFAULT NULL,
  `minimum_balance` decimal(15,2) DEFAULT NULL,
  `age_limit` int DEFAULT NULL,
  PRIMARY KEY (`savings_plan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `savings_plan`
--

LOCK TABLES `savings_plan` WRITE;
/*!40000 ALTER TABLE `savings_plan` DISABLE KEYS */;
INSERT INTO `savings_plan` VALUES (1,'child',12.00,0.00,12),(2,'teen',11.00,500.00,19),(3,'adult',10.00,1000.00,60),(4,'senior',13.00,1000.00,120);
/*!40000 ALTER TABLE `savings_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS `section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `section` (
  `course_id` varchar(8) NOT NULL,
  `sec_id` varchar(8) NOT NULL,
  `semester` varchar(6) NOT NULL,
  `year` decimal(4,0) NOT NULL,
  `building` varchar(15) DEFAULT NULL,
  `room_number` varchar(7) DEFAULT NULL,
  `time_slot_id` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`course_id`,`sec_id`,`semester`,`year`),
  KEY `building` (`building`,`room_number`),
  CONSTRAINT `section_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE,
  CONSTRAINT `section_ibfk_2` FOREIGN KEY (`building`, `room_number`) REFERENCES `classroom` (`building`, `room_number`) ON DELETE SET NULL,
  CONSTRAINT `section_chk_1` CHECK ((`semester` in (_utf8mb4'Fall',_utf8mb4'Winter',_utf8mb4'Spring',_utf8mb4'Summer'))),
  CONSTRAINT `section_chk_2` CHECK (((`year` > 1701) and (`year` < 2100)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
/*!40000 ALTER TABLE `section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `staff_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `NIC` varchar(12) DEFAULT NULL,
  `role` enum('manager','employee') DEFAULT NULL,
  PRIMARY KEY (`staff_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,1,'John Doe','1980-05-15','800515-1234','manager'),(2,2,'Jane Smith','1985-09-20','850920-5678','manager'),(3,3,'Bob Johnson','1990-03-10','900310-9012','employee'),(4,4,'Alice Williams','1988-12-05','881205-3456','employee'),(5,11,'Tom Smith','1988-11-15','881115-3456','manager'),(6,12,'Robert Downey','1975-04-04','750404-7890','employee'),(7,13,'Scarlett Johansson','1984-11-22','841122-4567','employee'),(8,14,'Chris Evans','1981-06-13','810613-1122','employee'),(9,15,'Test_Name_Update','2024-10-31','671122-3344','employee'),(12,28,'Test admin','2024-10-02','123456786435','employee'),(13,29,'test','2024-01-03','12345654345','employee'),(14,30,'Test admin1','2024-10-25','12345678921','employee'),(15,31,'chamathsara','2024-10-16','20025689247','employee');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `staff_after_delete` AFTER DELETE ON `staff` FOR EACH ROW BEGIN
DELETE FROM user
WHERE user_id = OLD.user_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `staff_info`
--

DROP TABLE IF EXISTS `staff_info`;
/*!50001 DROP VIEW IF EXISTS `staff_info`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `staff_info` AS SELECT 
 1 AS `user_id`,
 1 AS `username`,
 1 AS `email`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `ID` varchar(5) NOT NULL,
  `name` varchar(20) NOT NULL,
  `dept_name` varchar(20) DEFAULT NULL,
  `tot_cred` decimal(3,0) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `dept_name` (`dept_name`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`dept_name`) REFERENCES `department` (`dept_name`) ON DELETE SET NULL,
  CONSTRAINT `student_chk_1` CHECK ((`tot_cred` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `takes`
--

DROP TABLE IF EXISTS `takes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `takes` (
  `ID` varchar(5) NOT NULL,
  `course_id` varchar(8) NOT NULL,
  `sec_id` varchar(8) NOT NULL,
  `semester` varchar(6) NOT NULL,
  `year` decimal(4,0) NOT NULL,
  `grade` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`ID`,`course_id`,`sec_id`,`semester`,`year`),
  KEY `course_id` (`course_id`,`sec_id`,`semester`,`year`),
  CONSTRAINT `takes_ibfk_1` FOREIGN KEY (`course_id`, `sec_id`, `semester`, `year`) REFERENCES `section` (`course_id`, `sec_id`, `semester`, `year`) ON DELETE CASCADE,
  CONSTRAINT `takes_ibfk_2` FOREIGN KEY (`ID`) REFERENCES `student` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `takes`
--

LOCK TABLES `takes` WRITE;
/*!40000 ALTER TABLE `takes` DISABLE KEYS */;
/*!40000 ALTER TABLE `takes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teaches`
--

DROP TABLE IF EXISTS `teaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teaches` (
  `ID` varchar(5) NOT NULL,
  `course_id` varchar(8) NOT NULL,
  `sec_id` varchar(8) NOT NULL,
  `semester` varchar(6) NOT NULL,
  `year` decimal(4,0) NOT NULL,
  PRIMARY KEY (`ID`,`course_id`,`sec_id`,`semester`,`year`),
  KEY `course_id` (`course_id`,`sec_id`,`semester`,`year`),
  CONSTRAINT `teaches_ibfk_1` FOREIGN KEY (`course_id`, `sec_id`, `semester`, `year`) REFERENCES `section` (`course_id`, `sec_id`, `semester`, `year`) ON DELETE CASCADE,
  CONSTRAINT `teaches_ibfk_2` FOREIGN KEY (`ID`) REFERENCES `instructor` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teaches`
--

LOCK TABLES `teaches` WRITE;
/*!40000 ALTER TABLE `teaches` DISABLE KEYS */;
/*!40000 ALTER TABLE `teaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_slot`
--

DROP TABLE IF EXISTS `time_slot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_slot` (
  `time_slot_id` varchar(4) NOT NULL,
  `day` varchar(1) NOT NULL,
  `start_hr` decimal(2,0) NOT NULL,
  `start_min` decimal(2,0) NOT NULL,
  `end_hr` decimal(2,0) DEFAULT NULL,
  `end_min` decimal(2,0) DEFAULT NULL,
  PRIMARY KEY (`time_slot_id`,`day`,`start_hr`,`start_min`),
  CONSTRAINT `time_slot_chk_1` CHECK (((`start_hr` >= 0) and (`start_hr` < 24))),
  CONSTRAINT `time_slot_chk_2` CHECK (((`start_min` >= 0) and (`start_min` < 60))),
  CONSTRAINT `time_slot_chk_3` CHECK (((`end_hr` >= 0) and (`end_hr` < 24))),
  CONSTRAINT `time_slot_chk_4` CHECK (((`end_min` >= 0) and (`end_min` < 60)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_slot`
--

LOCK TABLES `time_slot` WRITE;
/*!40000 ALTER TABLE `time_slot` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_slot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `transaction_id` int NOT NULL AUTO_INCREMENT,
  `account_id` int DEFAULT NULL,
  `transaction_type` enum('deposit','withdrawal','transfer') DEFAULT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `account_id` (`account_id`),
  CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (1,1,'deposit',1000.00,'2024-10-01 10:30:00','Initial deposit'),(2,2,'withdrawal',500.00,'2024-10-01 14:45:00','ATM withdrawal'),(3,3,'deposit',5000.00,'2024-10-02 09:15:00','Salary deposit'),(4,4,'transfer',1000.00,'2024-10-02 16:30:00','Transfer to savings'),(6,6,'withdrawal',300.00,'2024-10-03 13:20:00','Cash withdrawal'),(7,9,'deposit',2000.00,'2024-10-28 22:03:28','test'),(8,9,'withdrawal',2000.00,'2024-10-28 22:04:14','test2');
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `transaction_history`
--

DROP TABLE IF EXISTS `transaction_history`;
/*!50001 DROP VIEW IF EXISTS `transaction_history`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `transaction_history` AS SELECT 
 1 AS `customer_id`,
 1 AS `transaction_id`,
 1 AS `transaction_type`,
 1 AS `amount`,
 1 AS `date`,
 1 AS `description`,
 1 AS `account_number`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `transfer`
--

DROP TABLE IF EXISTS `transfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transfer` (
  `transaction_id` int NOT NULL,
  `beneficiary_account_id` int DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `beneficiary_account_id` (`beneficiary_account_id`),
  CONSTRAINT `transfer_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transaction` (`transaction_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `transfer_ibfk_2` FOREIGN KEY (`beneficiary_account_id`) REFERENCES `account` (`account_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transfer`
--

LOCK TABLES `transfer` WRITE;
/*!40000 ALTER TABLE `transfer` DISABLE KEYS */;
INSERT INTO `transfer` VALUES (4,1);
/*!40000 ALTER TABLE `transfer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `role` enum('staff','customer') DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'john_doe','$2b$10$2ae93NVpvVsVJJroolZdx.WbB4IsSjf5fyGvxp3VGTdjoAiaTo9YW','john.doe@email.com','staff'),(2,'jane_smith','$2b$10$rSR1fu6D/AYdVE9BHw1QGesEBJKJrGdks8nu1H.tl36WOJWUl.yBO','jane.smith@email.com','staff'),(3,'bob_johnson','$2b$10$rSR1fu6D/AYdVE9BHw1QGesEBJKJrGdks8nu1H.tl36WOJWUl.yBO','bob.johnson@email.com','staff'),(4,'alice_williams','$2b$10$rSR1fu6D/AYdVE9BHw1QGesEBJKJrGdks8nu1H.tl36WOJWUl.yBO','alice.williams@email.com','staff'),(5,'charlie_brown','hashed_password5','charlie.brown@email.com','customer'),(6,'diana_ross','hashed_password6','diana.ross@email.com','customer'),(7,'edward_norton','hashed_password7','edward.norton@email.com','customer'),(8,'fiona_apple','hashed_password8','fiona.apple@email.com','customer'),(10,'helen_mirren','hashed_password10','helen.mirren@email.com','customer'),(11,'tom_smith','hashed_password11','tom.smith@email.com','staff'),(12,'robert_downey','hashed_password12','robert.downey@email.com','staff'),(13,'scarlett_johansson','hashed_password13','scarlett.johansson@email.com','staff'),(14,'chris_evans','hashed_password14','chris.evans@email.com','staff'),(15,'test_userName','$2b$10$/qkBF0aHVTDoP6MpC9xbBOTbtOJ8c0UzNP0Zo9XDI7cN..8Fk4Ase','userName@gmail.com','staff'),(16,'julia_roberts','hashed_password16','julia.roberts@email.com','customer'),(17,'brad_pitt','hashed_password17','brad.pitt@email.com','customer'),(18,'angelina_jolie','hashed_password18','angelina.jolie@email.com','customer'),(24,'user1','$2b$10$rSR1fu6D/AYdVE9BHw1QGesEBJKJrGdks8nu1H.tl36WOJWUl.yBO','user1@gmail.com','customer'),(25,'user2','$2b$10$Amhmm88jZStTkrbGMbfyTuSzbX5BDR.4VmMEEXKeNKey3yOQobkHK','user2@gmail.com','customer'),(26,'user3','$2b$10$ENhWhv5HLJe1WfANN43bQeA3aYCKkxYZYe0oDTt01xp.RW7f2mrFO','user3@gmail.com','customer'),(27,'mat','$2b$10$MMbWN.endXrNLZov.zjW8uYIeEKR8PVbTLw2xb1Ydv7cdbkGAySaq','mat@gmail.com','customer'),(28,'Testadmin','$2b$10$vqGekgjE47d07XoNbjK29OxxeQxIap4R1FoT0cEG58jXef022K3U6','test@gmail.com','staff'),(29,'Test employee','1111','test123@gmail.com','staff'),(30,'Testadmin1','$2b$10$cjwaEDzzy9JBXs0UJ/MGIubSnjRhyMa4XlBsmxvuafGemX222eVMS','mat122@gmail.com','staff'),(31,'employee1','$2b$10$UyIv9Y5bfySBw/UuY1lAjue1Eg2SeUcq.58QJzTLn4OSG2syd7w7K','employee1@email.com','staff');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `user_info`
--

DROP TABLE IF EXISTS `user_info`;
/*!50001 DROP VIEW IF EXISTS `user_info`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `user_info` AS SELECT 
 1 AS `user_id`,
 1 AS `username`,
 1 AS `email`,
 1 AS `mobile_number`,
 1 AS `landline_number`,
 1 AS `address`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `withdrawal`
--

DROP TABLE IF EXISTS `withdrawal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `withdrawal` (
  `transaction_id` int NOT NULL,
  `branch_id` int DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `branch_id` (`branch_id`),
  CONSTRAINT `withdrawal_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transaction` (`transaction_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `withdrawal_ibfk_2` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `withdrawal`
--

LOCK TABLES `withdrawal` WRITE;
/*!40000 ALTER TABLE `withdrawal` DISABLE KEYS */;
INSERT INTO `withdrawal` VALUES (8,1),(2,2),(6,3);
/*!40000 ALTER TABLE `withdrawal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'bank_database'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `add_fd_interest_event` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `add_fd_interest_event` ON SCHEDULE EVERY 1 DAY STARTS '2024-10-15 12:01:52' ON COMPLETION NOT PRESERVE ENABLE DO CALL add_fd_interest() */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
/*!50106 DROP EVENT IF EXISTS `add_savings_interest_event` */;;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `add_savings_interest_event` ON SCHEDULE EVERY 30 DAY STARTS '2024-10-15 13:43:30' ON COMPLETION NOT PRESERVE ENABLE DO CALL add_savings_interest() */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
/*!50106 DROP EVENT IF EXISTS `update_loanpayment_status` */;;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `update_loanpayment_status` ON SCHEDULE EVERY 1 DAY STARTS '2024-10-29 15:38:33' ON COMPLETION NOT PRESERVE ENABLE DO UPDATE loan_payment
  SET status = 'unpaid'
  WHERE due_date < CURDATE() AND status = 'pending' */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
/*!50106 DROP EVENT IF EXISTS `update_payment_status` */;;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `update_payment_status` ON SCHEDULE EVERY 1 DAY STARTS '2024-10-29 15:58:37' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
    -- Update payments that are past due and still pending to 'unpaid'
    UPDATE loan_payment
    SET status = 'unpaid'
    WHERE status = 'pending' AND due_date < CURRENT_DATE;

    -- Apply penalty by assigning a generic `penalty_id` for overdue payments without an existing penalty
    UPDATE loan_payment lp
    SET lp.penalty_id = (
        SELECT penalty_id 
        FROM penalty
        WHERE penalty_type_id = 1 -- assuming `penalty_type_id` 1 is a default penalty type
        LIMIT 1
    )
    WHERE lp.status = 'unpaid' AND lp.penalty_id IS NULL;

    -- Update payments to 'paid' if they have been paid (payed_date is set)
    UPDATE loan_payment
    SET status = 'paid'
    WHERE status = 'pending' AND payed_date IS NOT NULL;
END */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'bank_database'
--
/*!50003 DROP FUNCTION IF EXISTS `Calculate_interest` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Calculate_interest`(`fd_plan_id` INT, `amount` DECIMAL(15,2)) RETURNS decimal(10,2)
    READS SQL DATA
BEGIN
    DECLARE `interest_rate` DECIMAL(5,2);
    DECLARE `interest` DECIMAL(10,2);

    -- Retrieve the interest rate based on the fd_plan_id
    SELECT fd.interest_rate INTO `interest_rate`
    FROM fd_plan AS fd
    WHERE fd.fd_plan_id = `fd_plan_id`;

    -- Calculate interest
    SET `interest` = `amount` * (`interest_rate`/1200);

    -- Return the calculated interest
    RETURN `interest`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `generate_account_number` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `generate_account_number`(acc_type ENUM('savings', 'checking')) RETURNS char(15) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE prefix CHAR(3);
    DECLARE last_number INT;
    DECLARE account_number CHAR(15);
    DECLARE account_exists INT DEFAULT 1; -- Track if the account number exists

    -- Determine the prefix based on account type
    IF acc_type = 'savings' THEN
        SET prefix = 'SAV';
    ELSEIF acc_type = 'checking' THEN
        SET prefix = 'CHK';
    END IF;

    -- Loop to generate a new account number until it is unique
    WHILE account_exists = 1 DO
        -- Generate the last number (simulate as a random 9-digit number)
        SET last_number = FLOOR(100000000 + RAND() * 900000000); -- Generates a 9-digit number

        -- Form the full account number
        SET account_number = CONCAT(prefix, '-', last_number);

        -- Check if the generated account number already exists in the account table
        SELECT COUNT(*) INTO account_exists
        FROM account
        WHERE account_number = account_number;
    END WHILE;

    -- Return the unique account number
    RETURN account_number;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GetCreditLimit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetCreditLimit`(userId INT) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10, 2);

    -- Calculate the sum of all fixed deposits owned by the user
    SELECT SUM(fd.amount) INTO total
    FROM fixed_deposit fd
    JOIN savings_account s ON fd.savings_account_id = s.savings_account_id
    JOIN account a ON s.account_id = a.account_id
    JOIN customer c ON a.customer_id = c.customer_id
    JOIN user u ON c.user_id = u.user_id
    WHERE u.user_id = userId;

    -- Return the credit limit
    RETURN total / 2;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `is_manager` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `is_manager`(input_user_id INT) RETURNS tinyint(1)
    READS SQL DATA
BEGIN
    DECLARE user_role VARCHAR(10);
    DECLARE staff_role VARCHAR(10);
    
    SELECT role INTO user_role FROM user WHERE user_id = input_user_id LIMIT 1;

    IF user_role = 'staff' THEN
        SELECT role INTO staff_role FROM Staff WHERE user_id = input_user_id LIMIT 1;
        IF staff_role = 'manager' THEN
            RETURN TRUE;
        END IF;
    END IF;
    
    RETURN FALSE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddEmploye` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddEmploye`(
    IN p_user_name VARCHAR(50),
    IN p_password VARCHAR(255),
    IN p_email VARCHAR(100),
    IN p_full_name VARCHAR(100), 
    IN p_date_of_birth DATE,
    IN p_NIC VARCHAR(12),
    IN p_branch_id INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Rollback the transaction in case of error
        ROLLBACK;
        -- Signal an error
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Transaction failed. Unable to add employee.';
    END;

    -- Start transaction
    START TRANSACTION;

    -- Step 1: Insert into the user table
    INSERT INTO user(user_name, password, email, role)
    VALUES(p_user_name, p_password, p_email, 'staff');

    -- Step 2: Insert into the staff table using the new user_id
    INSERT INTO staff(user_id, full_name, date_of_birth, NIC, role)
    VALUES(LAST_INSERT_ID(), p_full_name, p_date_of_birth, p_NIC, 'employee');

    -- Step 3: Insert into the employee table using the new staff_id
    INSERT INTO employee(staff_id, branch_id)
    VALUES(LAST_INSERT_ID(), p_branch_id);

    -- Commit the transaction if all operations are successful
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddEmployee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddEmployee`(
    IN p_user_name VARCHAR(50),
    IN p_password VARCHAR(255),
    IN p_email VARCHAR(100),
    IN p_full_name VARCHAR(100), 
    IN p_date_of_birth DATE,
    IN p_NIC VARCHAR(12),
    IN p_branch_id INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Rollback the transaction in case of error
        ROLLBACK;
        -- Signal an error
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Transaction failed. Unable to add employee.';
    END;

    -- Start transaction
    START TRANSACTION;

    -- Step 1: Insert into the user table
    INSERT INTO user(user_name, password, email, role)
    VALUES(p_user_name, p_password, p_email, 'staff');

    -- Step 2: Insert into the staff table using the new user_id
    INSERT INTO staff(user_id, full_name, date_of_birth, NIC, role)
    VALUES(LAST_INSERT_ID(), p_full_name, p_date_of_birth, p_NIC, 'employee');

    -- Step 3: Insert into the employee table using the new staff_id
    INSERT INTO employee(staff_id, branch_id)
    VALUES(LAST_INSERT_ID(), p_branch_id);

    -- Commit the transaction if all operations are successful
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddLoan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddLoan`(
    IN p_account_number CHAR(15),
    IN p_loan_type ENUM('personal','business'),
    IN p_amount DECIMAL(15, 2),
    IN p_start_date DATE,
    IN p_end_date DATE,
    IN p_status ENUM('approved','pending','rejected')
)
BEGIN
    DECLARE p_account_id INT;
    DECLARE v_loan_term INT;   
    DECLARE v_fixed_rate DECIMAL(4, 2);   
    DECLARE v_monthly_payment DECIMAL(15, 2);
    DECLARE v_duration INT;
    DECLARE v_loan_id INT;

    -- Fetch account ID from account table
    SELECT account_id INTO p_account_id FROM account WHERE account_number = p_account_number;

    -- Calculate loan term in months
    SET v_loan_term = TIMESTAMPDIFF(MONTH, p_start_date, p_end_date);

    -- Determine interest rate based on loan type and term
    IF p_loan_type = 'personal' THEN
        IF v_loan_term <= 12 THEN
            SET v_fixed_rate = 5.0;
        ELSEIF v_loan_term > 12 AND v_loan_term <= 36 THEN
            SET v_fixed_rate = 4.5;
        ELSE
            SET v_fixed_rate = 4.0;
        END IF;
    ELSEIF p_loan_type = 'business' THEN
        IF v_loan_term <= 12 THEN
            SET v_fixed_rate = 6.0;
        ELSEIF v_loan_term > 12 AND v_loan_term <= 36 THEN
            SET v_fixed_rate = 5.5;
        ELSE
            SET v_fixed_rate = 5.0;
        END IF;
    END IF;

    -- Insert new loan record
    INSERT INTO loan (account_id, loan_type, amount, interest_rate, start_date, end_date, status)
    VALUES (p_account_id, p_loan_type, p_amount, v_fixed_rate, p_start_date, p_end_date, p_status);

    -- Get the last inserted loan ID
    SET v_loan_id = LAST_INSERT_ID();

    -- Calculate the monthly payment and set duration to 30 days
    SET v_monthly_payment = p_amount / v_loan_term;
    SET v_duration = 30;  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddLoanPayment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddLoanPayment`(
    IN p_installment_id INT,
    IN p_payment_amount DECIMAL(15, 2),
    IN p_payment_date DATE
)
BEGIN
    DECLARE v_due_date DATE;
    DECLARE v_status ENUM('paid', 'unpaid', 'pending');
    DECLARE v_penalty_id INT DEFAULT NULL;
    DECLARE v_penalty_amount DECIMAL(15, 2);
    DECLARE v_final_payment_amount DECIMAL(15, 2);
    DECLARE v_is_late BOOLEAN;
    DECLARE v_penalty_type_id INT;
    DECLARE v_account_id INT;
    DECLARE v_balance DECIMAL(15, 2);
    DECLARE v_payment_id INT;

    -- Retrieve penalty information
    SELECT penalty_type_id, penalty_amount INTO v_penalty_type_id, v_penalty_amount
    FROM penalty_types
    WHERE penalty_type = 'Late Payment';

    -- Retrieve the next payment due date and payment_id for the first unpaid payment related to the installment
    SELECT payment_id, due_date INTO v_payment_id, v_due_date
    FROM loan_payment
    WHERE instalment_id = p_installment_id AND status = 'pending'
    ORDER BY due_date ASC
    LIMIT 1;

    -- Determine payment status and calculate final payment amount based on due date
    IF p_payment_date <= v_due_date THEN
        SET v_status = 'paid';
        SET v_is_late = FALSE;
        SET v_final_payment_amount = p_payment_amount;
    ELSE
        SET v_status = 'unpaid'; 
        SET v_is_late = TRUE;
        SET v_final_payment_amount = p_payment_amount + v_penalty_amount;

        -- Insert penalty record and get the ID
        INSERT INTO penalty (penalty_type_id)
        VALUES (v_penalty_type_id);
        SET v_penalty_id = LAST_INSERT_ID();
    END IF;

    -- Retrieve account_id associated with the loan
    SELECT account_id INTO v_account_id
    FROM loan
    WHERE loan_id = (SELECT loan_id FROM loan_installment WHERE installment_id = p_installment_id);

    -- Check account balance
    SELECT balance INTO v_balance FROM account WHERE account_id = v_account_id;
    IF v_balance < v_final_payment_amount THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insufficient balance';
    ELSE
        -- Deduct the payment amount from the account balance
        UPDATE account
        SET balance = balance - v_final_payment_amount
        WHERE account_id = v_account_id;

        -- Update loan payment record with payment details and penalty information if any
        UPDATE loan_payment
        SET amount = v_final_payment_amount,
            payed_date = p_payment_date,
            status = v_status,
            penalty_id = v_penalty_id
        WHERE payment_id = v_payment_id;

    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_fd_interest` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_fd_interest`()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE fd_id INT;
    DECLARE fd_amount DECIMAL(15,2);
    DECLARE plan_id INT;
    DECLARE interest DECIMAL(10,2);
    DECLARE p_account_id INT;
    DECLARE creation_date DATE;

    DECLARE cur CURSOR FOR
        SELECT fd_id, amount, fd_plan_id, creation_date
        FROM fixed_deposit
        WHERE DATEDIFF(CURDATE(), creation_date) >= 30
        AND MOD(DATEDIFF(CURDATE(), creation_date), 30) = 0;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO fd_id, fd_amount, plan_id, creation_date;
        IF done THEN
            LEAVE read_loop;
        END IF;

        SELECT Calculate_interest(plan_id, fd_amount) INTO interest;

        SELECT account_id INTO p_account_id
        FROM account
        WHERE account_id IN (
            SELECT account_id
            FROM savings_account
            JOIN fixed_deposit fd USING(savings_account_id)
            WHERE fd.fd_id = fd_id
        );

        START TRANSACTION;
        UPDATE account
        SET balance = balance + interest
        WHERE account_id = p_account_id;
        COMMIT;
    END LOOP;

    CLOSE cur;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_individual_customer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_individual_customer`(
    IN branch_id INT,
    IN full_name VARCHAR(100),
    IN date_of_birth DATE,
    IN NIC VARCHAR(12),
    IN address VARCHAR(255),
    IN mobile_number VARCHAR(10),
    IN landline_number VARCHAR(10),
    IN account_type ENUM('savings', 'checking'),
    IN savings_plan_id INT,
    OUT account_number CHAR(15)

)
BEGIN
    DECLARE customer_id INT;

    -- Declare a handler for any errors
    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
        -- In case of an error, rollback the transaction
        ROLLBACK;
        SELECT 'Error occurred during adding individual customer';
    END;

    START TRANSACTION;

        -- Insert the customer information into customer table
        INSERT INTO customer (customer_type, mobile_number, landline_number, address)
        VALUES ('individual', mobile_number, landline_number, address);

        -- Get the customer ID of the inserted customer
        SET customer_id = LAST_INSERT_ID();

        INSERT INTO individual (customer_id, full_name , date_of_birth, NIC)
        VALUES (customer_id, full_name, date_of_birth, NIC);

        -- create a account for the customer
        CALL create_account(customer_id, branch_id, account_type, savings_plan_id, @account_number);


        COMMIT;
        -- If the transaction is successful, return the account number
        SET account_number = @account_number; 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_organization_customer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_organization_customer`(
    IN branch_id INT,
    IN name VARCHAR(100),
    IN license_number VARCHAR(100),
    IN address VARCHAR(255),
    IN mobile_number VARCHAR(10),
    IN landline_number VARCHAR(10),
    IN account_type ENUM('savings', 'checking'),
    OUT account_number CHAR(15)
)
BEGIN
    DECLARE customer_id INT;

    -- Declare a handler for any errors
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error occurred during adding organization customer';
    END;

    START TRANSACTION;

        -- Insert the customer information into customer table
        INSERT INTO customer (customer_type, mobile_number, landline_number, address)
        VALUES ('organization', mobile_number, landline_number, address);

        -- Get the customer ID of the inserted customer
        SET customer_id = LAST_INSERT_ID();

        INSERT INTO organization (customer_id, name, license_number)
        VALUES (customer_id, name, license_number);

        -- create a account for the customer
        CALL create_account(customer_id, branch_id, account_type, NULL, @account_number);

        COMMIT;
        -- If the transaction is successful, return the account number
        SET account_number = @account_number; 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_savings_interest` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_savings_interest`()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE p_account_id INT;
    DECLARE balance DECIMAL(15,2);
    DECLARE interest_rate DECIMAL(5,2);
    DECLARE interest DECIMAL(10,2);

    DECLARE cur CURSOR FOR
        SELECT a.account_id, a.balance, sp.interest_rate
        FROM savings_account sa
        JOIN account a ON sa.account_id = a.account_id
        JOIN savings_plan sp ON sa.savings_plan_id = sp.savings_plan_id
        WHERE a.status = 'active' AND a.account_type = 'savings';

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO p_account_id, balance, interest_rate;
        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Calculate interest
        SET interest = balance * (interest_rate / 1200);

        -- Update account balance
        START TRANSACTION;
        UPDATE account
        SET balance = balance + interest
        WHERE account_id = p_account_id;
        COMMIT;
    END LOOP;

    CLOSE cur;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ApplyLoan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ApplyLoan`(
    IN p_account_id INT,
    IN p_loan_type ENUM('personal','business'),
    IN p_amount DECIMAL(15, 2),
    IN p_start_date DATE,
    IN p_end_date DATE
)
BEGIN
    DECLARE v_loan_term INT;   
    DECLARE v_fixed_rate DECIMAL(4, 2);   

    -- Calculate loan term in months
    SET v_loan_term = TIMESTAMPDIFF(MONTH, p_start_date, p_end_date);

    -- Set interest rate based on loan type and duration
    IF p_loan_type = 'personal' THEN
        CASE 
            WHEN v_loan_term <= 12 THEN SET v_fixed_rate = 5.0;
            WHEN v_loan_term <= 36 THEN SET v_fixed_rate = 4.5;
            ELSE SET v_fixed_rate = 4.0;
        END CASE;
    ELSEIF p_loan_type = 'business' THEN
        CASE 
            WHEN v_loan_term <= 12 THEN SET v_fixed_rate = 6.0;
            WHEN v_loan_term <= 36 THEN SET v_fixed_rate = 5.5;
            ELSE SET v_fixed_rate = 5.0;
        END CASE;
    END IF;

    -- Insert loan record with 'pending' status
    START TRANSACTION;
    INSERT INTO loan (account_id, loan_type, amount, interest_rate, start_date, end_date, status)
    VALUES (p_account_id, p_loan_type, p_amount, v_fixed_rate, p_start_date, p_end_date, 'pending');
    COMMIT;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ApproveLoan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ApproveLoan`(
    IN p_loan_id INT,
    IN p_approved_date DATE
)
BEGIN
    DECLARE v_duration INT;
    DECLARE v_end_date DATE;

    -- Retrieve the duration from the loans table
    SELECT duration INTO v_duration
    FROM loans
    WHERE loan_id = p_loan_id;

    -- Calculate the end date based on the approved date and duration
    SET v_end_date = DATE_ADD(p_approved_date, INTERVAL v_duration MONTH);

    -- Update the loan's start date, end date, and status
    UPDATE loans
    SET start_date = p_approved_date,
        end_date = v_end_date,
        status = 'approved'
    WHERE loan_id = p_loan_id;

    -- Check if any rows were affected
    IF ROW_COUNT() = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Loan not found or already approved';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `approve_loan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `approve_loan`(IN input_loan_id INT, IN manager_user_id INT)
BEGIN
    DECLARE loan_status VARCHAR(20);

    -- Check if the user is a manager before proceeding
    IF is_manager(manager_user_id) THEN
        START TRANSACTION;
        
        -- Retrieve the current loan status
        SELECT status INTO loan_status FROM loan WHERE loan_id = input_loan_id FOR UPDATE;

        -- Check loan status before approving
        IF loan_status = 'pending' THEN
            UPDATE loan
            SET status = 'approved'
            WHERE loan_id = input_loan_id;

            COMMIT;
        ELSE
            -- Rollback and signal if loan is not pending
            ROLLBACK;
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Loan is already approved or rejected';
        END IF;
    ELSE 
        -- Signal an error if the user is not a manager
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'User is not authorized to approve loans';
    END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `change_user_password` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `change_user_password`(
    IN p_user_id INT,
    IN new_password VARCHAR(255),
    OUT result VARCHAR(255)
)
BEGIN
    -- Declare a handler for any errors
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        SELECT 'Error occurred during password change';
    END;

    START TRANSACTION;

        -- Update the user password
        UPDATE user
        SET password = new_password
        WHERE user_id = p_user_id;

        COMMIT;
        SET result = 'Password changed successfully';

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_account` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_account`(
    IN customer_id INT,
    IN branch_id INT,
    IN account_type ENUM('savings', 'checking'),
    IN savings_plan_id INT,
    OUT account_number CHAR(15)
)
BEGIN
    DECLARE new_account_number CHAR(15);
    DECLARE accountId INT;

    -- Declare a handler for any errors
    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
        ROLLBACK;
        SELECT 'Error occurred during account creation';
    END;

    START TRANSACTION;

        -- Generate a new account number based on the account type
        SET new_account_number = generate_account_number(account_type);

        -- Insert the new account information into the account table
        INSERT INTO account (account_type, account_number, customer_id, branch_id, balance, status)
        VALUES (account_type, new_account_number, customer_id, branch_id, 1000, 'active');

        -- Get the account ID of the inserted account
        SET accountId = LAST_INSERT_ID();

        IF account_type = 'savings' THEN
            INSERT INTO savings_account (account_id, savings_plan_id)
            VALUES (accountId, savings_plan_id);
        ELSEIF account_type = 'checking' THEN
            INSERT INTO checking_account (account_id)
            VALUES (accountId);
        END IF;

        COMMIT;
        SET account_number = new_account_number;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_checking_account` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_checking_account`(
    IN customer_id INT,
    IN branch_id INT,
    IN initial_deposit INT,
    OUT account_number CHAR(15)
)
BEGIN
    DECLARE new_account_number CHAR(15);
    DECLARE v_account_id INT;

    -- Declare a handler for any errors
    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
        ROLLBACK;
        SELECT 'Error occurred during account creation';
    END;

    START TRANSACTION;

        -- Generate a new account number for checking account
        SET new_account_number = generate_account_number('checking');
        
        -- Debug: Print the generated account number
        SELECT CONCAT('Generated account number: ', new_account_number) AS debug_message;

        -- Insert the new account information into the account table
        INSERT INTO account (account_type, account_number, customer_id, branch_id, balance, status)
        VALUES ('checking', new_account_number, customer_id, branch_id, initial_deposit, 'active');

        -- Debug: Print after inserting into account table
        SELECT 'Inserted into account table' AS debug_message;

        -- Get the last inserted account id
        SET v_account_id = LAST_INSERT_ID();
        
        -- Debug: Print the account ID of the newly inserted account
        SELECT CONCAT('Newly inserted account_id: ', v_account_id) AS debug_message;

        -- Insert into the checking_account table
        INSERT INTO checking_account (account_id)
        VALUES (v_account_id);

        -- Debug: Print after inserting into checking_account table
        SELECT 'Inserted into checking_account table' AS debug_message;

    COMMIT;

    -- Debug: Print after committing the transaction
    SELECT 'Transaction committed successfully' AS debug_message;

    -- Set the output parameter
    SET account_number = new_account_number;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_fixed_deposit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_fixed_deposit`(
    IN p_accountId INT, 
    IN p_amount DECIMAL(15, 2),
    IN p_fdPlanId INT, 
    IN p_startDate DATE, 
    IN p_endDate DATE,
    OUT p_message VARCHAR(255)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SET p_message = 'Error creating fixed deposit';
    END;

    START TRANSACTION;
    INSERT INTO fixed_deposit(savings_account_id, amount, fd_plan_id, start_date, end_date)
        VALUES (p_accountId, p_amount, p_fdPlanId, p_startDate, p_endDate);
    COMMIT;
    SET p_message = 'Fixed deposit created successfully';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_savings_account` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_savings_account`(
    IN customer_id INT,
    IN branch_id INT,
    IN initial_deposit INT,
    IN savings_plan_type_id ENUM('1', '2', '3', '4'),
	OUT account_number CHAR(15)
)
BEGIN
    DECLARE new_account_number CHAR(15);
    DECLARE v_account_id INT;

    -- Declare a handler for any errors
    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
        ROLLBACK;
        SELECT 'Error occurred during account creation';
    END;

    START TRANSACTION;

        -- Generate a new account number based on the account type
        SET new_account_number = generate_account_number('savings');
        
        -- Debug: Print the generated account number
        SELECT CONCAT('Generated account number: ', new_account_number) AS debug_message;

        -- Insert the new account information into the account table
        INSERT INTO account (account_type, account_number, customer_id, branch_id, balance, status)
        VALUES ('savings', new_account_number, customer_id, branch_id, initial_deposit, 'active');

        -- Debug: Print after inserting into account table
        SELECT 'Inserted into account table' AS debug_message;

        -- Get the last inserted account id
        SET v_account_id = LAST_INSERT_ID();
        
        -- Debug: Print the account ID of the newly inserted account
        SELECT CONCAT('Newly inserted account_id: ', v_account_id) AS debug_message;

        -- Insert the new account information into the savings_account table
        INSERT INTO savings_account (account_id, savings_plan_id)
        VALUES (v_account_id, savings_plan_type_id);

        -- Debug: Print after inserting into savings_account table
        SELECT 'Inserted into savings_account table' AS debug_message;

    COMMIT;

    -- Debug: Print after committing the transaction
    SELECT 'Transaction committed successfully' AS debug_message;

    -- Set the output parameter (uncomment if needed)
    SET account_number = new_account_number;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DepositFunds` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DepositFunds`(
    IN acc_number VARCHAR(255),
    IN deposit_amount DECIMAL(15,2),
    IN branch INT,
    IN description VARCHAR(255),
    OUT result VARCHAR(255)
)
BEGIN
    DECLARE current_balance DECIMAL(15,2);
    DECLARE acc_id INT;

    -- Declare a handler for any errors
    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
        ROLLBACK;
        SET result = 'Error occurred during deposit';
    END;

    START TRANSACTION;

    -- Labeled block to handle procedure exit
    proc_exit: BEGIN

        -- Get the account ID based on the account number
        SELECT account_id INTO acc_id FROM account WHERE account_number = acc_number;

        -- Check if the account ID was found
        IF acc_id IS NULL THEN
            SET result = 'Account not found';
            LEAVE proc_exit; -- Exit the procedure if account is not found
        END IF;

        -- Check the current balance of the account
        SELECT balance INTO current_balance FROM account WHERE account_id = acc_id;

        -- Update the account balance
        UPDATE account 
        SET balance = balance + deposit_amount 
        WHERE account_id = acc_id;
        
        -- Insert the transaction into the transaction table
        INSERT INTO transaction (account_id, transaction_type, amount, date, description)
        VALUES (acc_id, 'deposit', deposit_amount, NOW(), description);
        
        -- Get the transaction ID of the inserted transaction
        SET @trans_id = LAST_INSERT_ID();
        
        -- Log the deposit into the deposit table (assuming a correct table name)
        INSERT INTO deposit (transaction_id, branch_id)
        VALUES (@trans_id, branch);

        COMMIT;

        SET result = 'Deposit successful';

    END proc_exit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAccountDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAccountDetails`(IN customerID INT)
BEGIN
    -- Query to fetch savings and checking accounts as separate rows
    SELECT 
        a.account_number AS accountNumber,
        a.balance AS balance,
        a.account_type AS accountType, -- Keep the account type as it is (savings/checking)
        b.name AS branchName,
        b.branch_id AS branchId,
        
        -- Show interest rate and minimum balance only for savings accounts
        CASE 
            WHEN a.account_type = 'savings' THEN sp.interest_rate 
            ELSE NULL 
        END AS interestRate,
        
        CASE 
            WHEN a.account_type = 'savings' THEN sp.minimum_balance 
            ELSE NULL 
        END AS minBalance,
        
        -- No FD details for savings/checking accounts
        NULL AS startDate,
        NULL AS endDate
        
    FROM account a
    LEFT JOIN branch b ON a.branch_id = b.branch_id
    LEFT JOIN savings_account sa ON a.account_id = sa.account_id
    LEFT JOIN savings_plan sp ON sa.savings_plan_id = sp.savings_plan_id
    WHERE a.customer_id = customerID
    AND a.account_type IN ('savings', 'checking')
    
    UNION
    
    -- Fixed deposit details as a separate row linked to savings
    SELECT 
        a.account_number AS accountNumber,
        fd.amount AS balance,           -- Show FD amount as balance for FD accounts
        'fixed deposit' AS accountType, -- Explicitly mark this as a fixed deposit
        b.name AS branchName,
        b.branch_id AS branchId,
        fp.Interest_rate AS interestRate,
        NULL AS minBalance,
        fd.start_date AS startDate,     -- FD-specific fields
        fd.end_date AS endDate
        -- fp.duration AS duration          -- Duration from fd_plan
    
    FROM account a
    LEFT JOIN branch b ON a.branch_id = b.branch_id
    LEFT JOIN savings_account sa ON a.account_id = sa.account_id
    LEFT JOIN fixed_deposit fd ON sa.savings_account_id = fd.savings_account_id
    LEFT JOIN fd_plan fp ON fd.fd_plan_id = fp.fd_plan_id  -- Join with fd_plan
    WHERE a.customer_id = customerID
    AND fd.savings_account_id IS NOT NULL;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetCustomerDetailsByNICOrLicense` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetCustomerDetailsByNICOrLicense`( 
    IN searchIdentifier VARCHAR(100)
)
BEGIN
    -- Declare variables for customer information
    DECLARE customerId INT DEFAULT NULL;

    -- For individuals (search by NIC)
    SELECT i.customer_id INTO customerId
    FROM individual i
    JOIN customer c ON i.customer_id = c.customer_id
    WHERE i.NIC = searchIdentifier
    LIMIT 1;

    -- If no records found for individual, search for organization (by license number)
    IF customerId IS NULL THEN
        SELECT o.customer_id INTO customerId
        FROM organization o
        JOIN customer c ON o.customer_id = c.customer_id
        WHERE o.license_number = searchIdentifier
        LIMIT 1;
    END IF;

    -- If still no records found, raise an error
    IF customerId IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No records found for the given NIC or license number';
    END IF;

    -- Get customer details
    SELECT 
        c.customer_id,
        IFNULL(i.full_name, o.name) AS customer_name,  -- individual's full_name or organization's name
        c.mobile_number,
        c.landline_number,
        c.address
    FROM customer c
    LEFT JOIN individual i ON c.customer_id = i.customer_id  -- join individual table
    LEFT JOIN organization o ON c.customer_id = o.customer_id  -- join organization table
    WHERE c.customer_id = customerId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetLoanDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetLoanDetails`(IN userId INT)
BEGIN
    SELECT 
        l.loan_id, 
        l.loan_type, 
        l.amount, 
        l.interest_rate,
        l.status,
        COALESCE(ply.penalty_amount, 0) AS penalty_amount
    FROM
        loan l
        JOIN account a ON l.account_id = a.account_id
        JOIN customer c ON a.customer_id = c.customer_id
        JOIN user u ON c.user_id = u.user_id
        LEFT JOIN (
            SELECT 
                li.loan_id, 
                lp.instalment_id, 
                pt.penalty_amount
            FROM
                loan_installment li
                LEFT JOIN loan_payment lp ON li.installment_id = lp.instalment_id
                LEFT JOIN penalty p ON lp.penalty_id = p.penalty_id
                LEFT JOIN penalty_types pt ON p.penalty_type_id = pt.penalty_type_id
        ) AS ply ON l.loan_id = ply.loan_id
    WHERE
        u.user_id = userId
    GROUP BY 
        l.loan_id, l.loan_type, l.amount, l.interest_rate,l.status, ply.penalty_amount;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetPendingLoans` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetPendingLoans`()
BEGIN
    SELECT loan_id, account_id, amount, start_date, status
    FROM loan
    WHERE status = 'pending';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManagerApproveLoan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManagerApproveLoan`(
    IN p_loan_id INT,
    IN p_approved_date DATE
)
BEGIN
    DECLARE v_duration INT;
    DECLARE v_end_date DATE;
    DECLARE v_start_date DATE;
    DECLARE v_monthly_payment DECIMAL(15, 2);
    DECLARE instalment_id INT; -- Declare instalment_id here

    -- Retrieve start and end dates from the loan record
    SELECT start_date, end_date, amount INTO v_start_date, v_end_date, v_monthly_payment
    FROM loan
    WHERE loan_id = p_loan_id;

    -- Calculate duration in months
    SET v_duration = TIMESTAMPDIFF(MONTH, v_start_date, v_end_date);

    -- Calculate new end date based on approved date and duration
    SET v_end_date = DATE_ADD(p_approved_date, INTERVAL v_duration MONTH);

    -- Update loan record
    UPDATE loan
    SET start_date = p_approved_date,
        end_date = v_end_date,
        status = 'approved'
    WHERE loan_id = p_loan_id;

    -- Check if the loan was successfully updated
    IF ROW_COUNT() = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Loan not found or already approved';
    ELSE
        INSERT INTO loan_installment (loan_id, amount, duration)
        VALUES (p_loan_id, v_monthly_payment, 30);
        
        -- Store the last inserted ID in instalment_id
        SET instalment_id = LAST_INSERT_ID();
        
        -- Insert loan payments for each month
        WHILE v_duration > 0 DO
            INSERT INTO loan_payment (instalment_id, amount, due_date, status)
            VALUES (instalment_id, v_monthly_payment, DATE_ADD(p_approved_date, INTERVAL 1 MONTH), 'pending');

            -- Decrement loan term and update start date for next installment
            SET v_duration = v_duration - 1;
            SET p_approved_date = DATE_ADD(p_approved_date, INTERVAL 1 MONTH);
        END WHILE;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MoneyTransfer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `MoneyTransfer`(
    IN sender_account_id INT,
    IN receiver_account_id INT,
    IN transfer_amount DECIMAL(10,2)
)
BEGIN
    DECLARE sender_balance DECIMAL(15,2);
    DECLARE receiver_balance DECIMAL(15,2);
    DECLARE sender_status ENUM('active','inactive');
    DECLARE receiver_status ENUM('active','inactive');
    DECLARE transaction_time  datetime;
    -- DECLARE insufficient_funds EXCEPTION;
	
    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
    ROLLBACK; -- Roll back the transaction in case of error
    SELECT 'An error occurred during the transfer. Transaction rolled back.' AS error_message;
    END;


	
    SELECT NOW() INTO transaction_time;
	START TRANSACTION;
    -- Check if both sender and receiver accounts are active and get their balances
    SELECT balance, status INTO sender_balance, sender_status 
    FROM account
    WHERE account_id = sender_account_id;
    

    SELECT balance, status INTO receiver_balance, receiver_status 
    FROM account
    WHERE account_id = receiver_account_id;
    

    -- Check if sender's account is active and has sufficient balance
    IF sender_status = 'inactive' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Sender account is not active.';
    ELSEIF sender_balance < transfer_amount THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insufficient funds in sender account.';
    END IF;

    -- Check if receiver's account is active
    IF receiver_status ='inactive' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Receiver account is not active.';
    END IF;
	
    
    -- Perform the transaction: deduct from sender's account and add to receiver's account
    UPDATE account
    SET balance = balance - transfer_amount
    WHERE account_id = sender_account_id;

    UPDATE account
    SET balance = balance + transfer_amount
    WHERE account_id = receiver_account_id;

    -- Insert transaction records for sender and receiver, including beneficiary account IDs
    INSERT INTO transaction(account_id, transaction_type, amount, date, description)
    VALUES 
    (sender_account_id, 'transfer', transfer_amount, transaction_time, CONCAT('Transfer to account ', receiver_account_id)),
    (receiver_account_id, 'deposit', transfer_amount, transaction_time, CONCAT('Transfer from account ', sender_account_id));

COMMIT;

    -- Confirm the transfer
    SELECT CONCAT('Transfer of ', transfer_amount, ' completed from account ', sender_account_id, ' to account ', receiver_account_id) AS confirmation_message;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `register_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `register_user`(
    IN p_customer_id INT,
    IN p_user_name VARCHAR(100),
    IN p_email VARCHAR(255),
    IN p_hashed_password VARCHAR(255)
)
BEGIN
    DECLARE user_id INT;

    -- Declare a handler for any errors
    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
        -- In case of an error, rollback the transaction
        ROLLBACK;
        SELECT 'Error occurred during adding individual customer';
    END;

    START TRANSACTION;

        -- Insert the customer information into user table
        INSERT INTO user (user_name, password, email, role)
        VALUES (p_user_name, p_hashed_password, p_email, 'customer');

        -- Get the user ID of the inserted user
        SET user_id = LAST_INSERT_ID();

        -- Update the customer table with the new user ID
        UPDATE customer
        SET user_id = user_id
        WHERE customer_id = p_customer_id;

    COMMIT;

    SELECT 'User Registration Successful' AS message;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `removeEmployee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `removeEmployee`(p_staff_id INT)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Rollback the transaction in case of error
        ROLLBACK;
        -- Signal an error
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Transaction failed. Unable to remove employee.';
    END;

    -- Start transaction
    START TRANSACTION;
    
    -- Delete from employee table
    DELETE FROM employee
    WHERE staff_id = p_staff_id;

    -- Delete from staff table
    DELETE FROM staff
    WHERE staff_id = p_staff_id;

    -- If no error, commit the transaction
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateEmployee_branch` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateEmployee_branch`(
    p_staff_id INT,
    p_branch_id INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Rollback the transaction in case of error
        ROLLBACK;
        -- Signal an error
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Transaction failed. Unable to update employee branch.';
    END;
    
    -- Start transaction
    START TRANSACTION;
    
    -- Update statement
    UPDATE employee
    SET branch_id = p_branch_id
    WHERE staff_id = p_staff_id;

    -- If no error, commit the transaction
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateEmployee_staff_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateEmployee_staff_details`(
    IN p_staff_id INT,
    -- IN p_user_name VARCHAR(50),
    -- IN p_password VARCHAR(255),
    -- IN p_email VARCHAR(100),
    IN p_full_name VARCHAR(100),
    IN p_date_of_birth DATE -- IN p_branch_id INT
)
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION BEGIN ROLLBACK;
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Transaction failed. Unable to update staff details.';
END;
START TRANSACTION;
UPDATE staff
SET full_name = p_full_name,
    date_of_birth = p_date_of_birth
WHERE staff_id = p_staff_id;
COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateEmployee_user_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateEmployee_user_details`(
    IN p_staff_id INT,
    IN p_user_name VARCHAR(50),
    IN p_password VARCHAR(255),
    IN p_email VARCHAR(100)
    -- IN p_full_name VARCHAR(100), 
    -- IN p_date_of_birth DATE,
    -- IN p_branch_id INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Rollback the transaction in case of error
        ROLLBACK;
        -- Signal an error
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Transaction failed. Unable to update user details.';
    END;

    -- Start transaction
    START TRANSACTION;
    
    -- Update user details based on staff_id
    UPDATE user
    SET user_name = p_user_name,
        password = p_password,
        email = p_email
    WHERE user_id = (
        SELECT user_id
        FROM staff
        WHERE staff_id = p_staff_id
    );

    -- If no error, commit the transaction
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateLoanInstallment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateLoanInstallment`(
    IN p_installment_id INT,
    IN p_payment_amount DECIMAL(15, 2)
)
BEGIN
    DECLARE v_remaining_amount DECIMAL(15, 2);
    DECLARE v_remaining_duration INT;
    DECLARE v_loan_id INT;
    
    SELECT amount, loan_id INTO v_remaining_amount, v_loan_id
    FROM loan_installment
    WHERE installment_id = p_installment_id;


    SET v_remaining_amount = v_remaining_amount - p_payment_amount;


    SET v_remaining_duration = FLOOR(v_remaining_amount / (p_payment_amount / 30));

    IF v_remaining_amount <= 0 THEN
	
        UPDATE loan_installment
        SET amount = 0, duration = 0
        WHERE installment_id = p_installment_id;
    ELSE
        UPDATE loan_installment
        SET amount = v_remaining_amount, duration = v_remaining_duration
        WHERE installment_id = p_installment_id;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdatePendingLoanDates` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdatePendingLoanDates`(
    IN p_loan_id INT,
    IN p_approved_date DATE,
    IN p_duration INT
)
BEGIN
    DECLARE v_end_date DATE;
    
    SET v_end_date = DATE_ADD(p_approved_date, INTERVAL p_duration MONTH);
    
    UPDATE loan
    SET start_date = p_approved_date,
        end_date = v_end_date,
        status = 'approved'
    WHERE loan_id = p_loan_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_staff_info` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_staff_info`(
    IN userId INT,
    IN new_username VARCHAR(255),
    IN new_email VARCHAR(255)
)
BEGIN
    -- Update the 'user' table
    UPDATE user
    SET user_name = new_username, email = new_email
    WHERE user_id = userId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_user_info` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_user_info`(
    IN userId INT,
    IN new_username VARCHAR(255),
    IN new_email VARCHAR(255),
    IN new_address TEXT,
    IN new_mobile_number VARCHAR(15),
    IN new_landline_number VARCHAR(15)
)
BEGIN
    -- Update the 'user' table
    UPDATE user
    SET user_name = new_username, email = new_email
    WHERE user_id = userId;

    -- Update the 'customer' table
    UPDATE customer
    SET address = new_address, mobile_number = new_mobile_number, landline_number = new_landline_number
    WHERE user_id = userId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `WithdrawFunds` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `WithdrawFunds`(
    IN acc_number VARCHAR(255),
    IN withdraw_amount DECIMAL(15,2),
    IN branch INT,
    IN description VARCHAR(255),
    OUT result VARCHAR(255)
)
BEGIN
    DECLARE current_balance DECIMAL(15,2);
    DECLARE acc_id INT;

    -- Declare a handler for any errors
    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
        -- In case of an error, rollback the transaction
        ROLLBACK;
        SET result = 'Error occurred during withdrawal';
    END;

    -- Start the transaction
    START TRANSACTION;

    -- Labeled block to handle procedure exit
    proc_exit: BEGIN

        -- Get the account ID based on the account number
        SELECT account_id INTO acc_id FROM account WHERE account_number = acc_number;

        -- Check if the account ID was found
        IF acc_id IS NULL THEN
            SET result = 'Account not found';
            LEAVE proc_exit; -- Exit the procedure if account is not found
        END IF;

        -- Check the current balance of the account
        SELECT balance INTO current_balance FROM account WHERE account_id = acc_id;

        -- Check if sufficient balance is available
        IF current_balance >= withdraw_amount THEN
            -- Update the account balance
            UPDATE account 
            SET balance = balance - withdraw_amount 
            WHERE account_id = acc_id;
            
            -- Insert the transaction into the transaction table
            INSERT INTO transaction (account_id, transaction_type, amount, date, description)
            VALUES (acc_id, 'withdrawal', withdraw_amount, NOW(), description);
            
            -- Get the transaction ID of the inserted transaction
            SET @trans_id = LAST_INSERT_ID();
            
            -- Log the withdrawal into the withdrawal table
            INSERT INTO withdrawal (transaction_id, branch_id)
            VALUES (@trans_id, branch);
            
            -- Commit the transaction after all operations succeed
            COMMIT;

            -- Success message
            SET result = 'Withdrawal successful';
        ELSE
            -- Insufficient balance message, rollback the transaction
            ROLLBACK;
            SET result = 'Insufficient balance for withdrawal';
        END IF;

    END proc_exit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `accounts_summary`
--

/*!50001 DROP VIEW IF EXISTS `accounts_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `accounts_summary` AS select `c`.`customer_id` AS `customer_id`,coalesce(sum((case when (`a`.`account_type` = 'checking') then `a`.`balance` else 0 end)),0) AS `checking_account_balance`,coalesce(sum((case when (`a`.`account_type` = 'savings') then `a`.`balance` else 0 end)),0) AS `savings_account_balance`,coalesce(sum(`fd`.`amount`),0) AS `fd_balance` from (((`customer` `c` left join `account` `a` on((`c`.`customer_id` = `a`.`customer_id`))) left join `savings_account` `sa` on((`a`.`account_id` = `sa`.`account_id`))) left join `fixed_deposit` `fd` on((`sa`.`savings_account_id` = `fd`.`savings_account_id`))) group by `c`.`customer_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `branch_checking_accounts`
--

/*!50001 DROP VIEW IF EXISTS `branch_checking_accounts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `branch_checking_accounts` AS select `checking_account`.`checking_account_id` AS `checking_account_id`,`checking_account`.`account_id` AS `account_id`,`customer`.`customer_id` AS `customer_id`,`customer`.`user_id` AS `user_id`,`customer`.`customer_type` AS `customer_type`,`customer`.`mobile_number` AS `mobile_number`,`customer`.`landline_number` AS `landline_number`,`customer`.`address` AS `address`,`branch`.`branch_id` AS `branch_id`,`branch`.`name` AS `name`,`branch`.`location` AS `location`,`branch`.`manager_id` AS `manager_id` from (((`checking_account` join `account` on((`checking_account`.`account_id` = `account`.`account_id`))) join `customer` on((`account`.`customer_id` = `customer`.`customer_id`))) join `branch` on((`account`.`branch_id` = `branch`.`branch_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `branch_customer_details`
--

/*!50001 DROP VIEW IF EXISTS `branch_customer_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `branch_customer_details` AS select `customer`.`customer_id` AS `customer_id`,`customer`.`user_id` AS `user_id`,`customer`.`customer_type` AS `customer_type`,`customer`.`mobile_number` AS `mobile_number`,`customer`.`landline_number` AS `landline_number`,`customer`.`address` AS `address`,`branch`.`branch_id` AS `branch_id`,`branch`.`name` AS `name`,`branch`.`location` AS `location`,`branch`.`manager_id` AS `manager_id` from ((`customer` join `account` on((`customer`.`customer_id` = `account`.`customer_id`))) join `branch` on((`account`.`branch_id` = `branch`.`branch_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `branch_employee_details`
--

/*!50001 DROP VIEW IF EXISTS `branch_employee_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `branch_employee_details` AS select `e`.`employee_id` AS `employee_id`,`e`.`branch_id` AS `branch_id`,`b`.`name` AS `branch_name`,`s`.`full_name` AS `full_name` from ((`employee` `e` join `branch` `b` on((`e`.`branch_id` = `b`.`branch_id`))) join `staff` `s` on((`s`.`staff_id` = `e`.`staff_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `branch_late_loan_payment_details`
--

/*!50001 DROP VIEW IF EXISTS `branch_late_loan_payment_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `branch_late_loan_payment_details` AS select `c`.`customer_id` AS `customer_id`,`c`.`mobile_number` AS `mobile_number`,`a`.`account_number` AS `account_number`,`l`.`loan_id` AS `loan_id`,`lp`.`amount` AS `amount`,`lp`.`due_date` AS `due_date`,`a`.`branch_id` AS `branch_id` from ((((((`loan_payment` `lp` join `penalty` `p` on((`lp`.`penalty_id` = `p`.`penalty_id`))) join `penalty_types` `pt` on((`p`.`penalty_type_id` = `pt`.`penalty_type_id`))) join `loan_installment` `li` on((`lp`.`instalment_id` = `li`.`installment_id`))) join `loan` `l` on((`li`.`loan_id` = `l`.`loan_id`))) join `account` `a` on((`l`.`account_id` = `a`.`account_id`))) join `customer` `c` on((`a`.`customer_id` = `c`.`customer_id`))) where (`pt`.`penalty_type` = 'Late Payment') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `branch_loan_details`
--

/*!50001 DROP VIEW IF EXISTS `branch_loan_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `branch_loan_details` AS select `l`.`loan_id` AS `loan_id`,`l`.`amount` AS `amount`,`l`.`loan_type` AS `loan_type`,`l`.`start_date` AS `start_date`,`l`.`end_date` AS `end_date`,`l`.`status` AS `status`,`a`.`account_id` AS `loan_account_id`,`a`.`customer_id` AS `customer_id`,`a`.`branch_id` AS `branch_id`,`b`.`name` AS `branch_name`,`b`.`location` AS `location` from ((`loan` `l` join `account` `a` on((`l`.`account_id` = `a`.`account_id`))) join `branch` `b` on((`a`.`branch_id` = `b`.`branch_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `branch_savings_accounts`
--

/*!50001 DROP VIEW IF EXISTS `branch_savings_accounts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `branch_savings_accounts` AS select `savings_account`.`savings_account_id` AS `savings_account_id`,`savings_account`.`account_id` AS `account_id`,`savings_account`.`savings_plan_id` AS `savings_plan_id`,`customer`.`customer_id` AS `customer_id`,`customer`.`user_id` AS `user_id`,`customer`.`customer_type` AS `customer_type`,`customer`.`mobile_number` AS `mobile_number`,`customer`.`landline_number` AS `landline_number`,`customer`.`address` AS `address`,`branch`.`branch_id` AS `branch_id`,`branch`.`name` AS `name`,`branch`.`location` AS `location`,`branch`.`manager_id` AS `manager_id` from (((`savings_account` join `account` on((`savings_account`.`account_id` = `account`.`account_id`))) join `customer` on((`account`.`customer_id` = `customer`.`customer_id`))) join `branch` on((`account`.`branch_id` = `branch`.`branch_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `branch_transaction_details`
--

/*!50001 DROP VIEW IF EXISTS `branch_transaction_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `branch_transaction_details` AS select `t`.`transaction_id` AS `transaction_id`,`t`.`account_id` AS `account_id`,`t`.`date` AS `date`,`t`.`amount` AS `amount`,`t`.`transaction_type` AS `transaction_type`,`a`.`account_number` AS `account_number`,coalesce(`w`.`branch_id`,`d`.`branch_id`) AS `branch_id` from (((`transaction` `t` join `account` `a` on((`t`.`account_id` = `a`.`account_id`))) left join `withdrawal` `w` on((`t`.`transaction_id` = `w`.`transaction_id`))) left join `deposit` `d` on((`t`.`transaction_id` = `d`.`transaction_id`))) where ((`w`.`transaction_id` is not null) or (`d`.`transaction_id` is not null)) order by `t`.`date` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `customer_details`
--

/*!50001 DROP VIEW IF EXISTS `customer_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customer_details` AS select `customer`.`customer_id` AS `customer_id`,`account`.`account_type` AS `account_type`,`account`.`account_number` AS `account_number`,coalesce(`individual`.`full_name`,`organization`.`name`) AS `name` from (((`customer` join `account` on((`customer`.`customer_id` = `account`.`customer_id`))) left join `individual` on((`customer`.`customer_id` = `individual`.`customer_id`))) left join `organization` on((`customer`.`customer_id` = `organization`.`customer_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `staff_info`
--

/*!50001 DROP VIEW IF EXISTS `staff_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `staff_info` AS select `u`.`user_id` AS `user_id`,`u`.`user_name` AS `username`,`u`.`email` AS `email` from (`user` `u` join `staff` `s` on((`u`.`user_id` = `s`.`user_id`))) where (`u`.`role` = 'staff') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `transaction_history`
--

/*!50001 DROP VIEW IF EXISTS `transaction_history`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `transaction_history` AS select `a`.`customer_id` AS `customer_id`,`t`.`transaction_id` AS `transaction_id`,`t`.`transaction_type` AS `transaction_type`,`t`.`amount` AS `amount`,`t`.`date` AS `date`,`t`.`description` AS `description`,`a`.`account_number` AS `account_number` from (`transaction` `t` join `account` `a` on((`t`.`account_id` = `a`.`account_id`))) union all select `a`.`customer_id` AS `customer_id`,`t`.`transaction_id` AS `transaction_id`,`t`.`transaction_type` AS `transaction_type`,`t`.`amount` AS `amount`,`t`.`date` AS `date`,`t`.`description` AS `description`,`a`.`account_number` AS `account_number` from ((`transfer` `tr` join `account` `a` on((`a`.`account_id` = `tr`.`beneficiary_account_id`))) join `transaction` `t` on((`t`.`transaction_id` = `tr`.`transaction_id`))) order by `date` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_info`
--

/*!50001 DROP VIEW IF EXISTS `user_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user_info` AS select `u`.`user_id` AS `user_id`,`u`.`user_name` AS `username`,`u`.`email` AS `email`,`c`.`mobile_number` AS `mobile_number`,`c`.`landline_number` AS `landline_number`,`c`.`address` AS `address` from (`user` `u` join `customer` `c` on((`u`.`user_id` = `c`.`user_id`))) where (`u`.`role` = 'customer') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-10 16:39:42
