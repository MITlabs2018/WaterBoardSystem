-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: waterboarddb
-- ------------------------------------------------------
-- Server version	8.0.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `attendence`
--

DROP TABLE IF EXISTS `attendence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendence` (
  `idattendence` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `effective_date` date DEFAULT NULL,
  `status` int(11) NOT NULL,
  `memId` int(11) NOT NULL,
  `remarks` mediumtext COMMENT 'any commencts regard the attendance of the perticular person',
  PRIMARY KEY (`idattendence`),
  KEY `fk_attedance_member_idx` (`memId`),
  CONSTRAINT `fk_attedance_member` FOREIGN KEY (`memId`) REFERENCES `member` (`idmember`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendence`
--

LOCK TABLES `attendence` WRITE;
/*!40000 ALTER TABLE `attendence` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `criteria`
--

DROP TABLE IF EXISTS `criteria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `criteria` (
  `idcriteria` int(11) NOT NULL AUTO_INCREMENT,
  `rate` double NOT NULL COMMENT 'the rate per unit of water used ',
  `lower_limit` double NOT NULL,
  `upper_limit` double NOT NULL,
  PRIMARY KEY (`idcriteria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `criteria`
--

LOCK TABLES `criteria` WRITE;
/*!40000 ALTER TABLE `criteria` DISABLE KEYS */;
/*!40000 ALTER TABLE `criteria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `idMember` int(11) NOT NULL AUTO_INCREMENT,
  `account_number` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `contact number` varchar(10) DEFAULT NULL,
  `adress` mediumtext,
  `joined_date` date DEFAULT NULL,
  PRIMARY KEY (`idMember`),
  UNIQUE KEY `account_number_UNIQUE` (`account_number`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (3,'44556','dinth',NULL,'140/3 , yakkala',NULL);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payament_balance`
--

DROP TABLE IF EXISTS `payament_balance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payament_balance` (
  `idPyament` int(11) NOT NULL,
  `balance_type` varchar(45) NOT NULL COMMENT 'two types :-\nbalace paid - the balace paid at the cashier \nbalce carried over - the balace taken to the nelace ca/oxt period \n\nbalance c/o = amount paid - amount to pay - balace paid',
  `amount` double NOT NULL,
  PRIMARY KEY (`idPyament`,`balance_type`),
  CONSTRAINT `fk_balance_payment` FOREIGN KEY (`idPyament`) REFERENCES `payment` (`idpayment`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payament_balance`
--

LOCK TABLES `payament_balance` WRITE;
/*!40000 ALTER TABLE `payament_balance` DISABLE KEYS */;
/*!40000 ALTER TABLE `payament_balance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `idPayment` int(11) NOT NULL AUTO_INCREMENT,
  `refrence` varchar(45) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `amount_topay` double NOT NULL,
  `amount_paid` double DEFAULT NULL COMMENT 'the total amount paid by the cutomer to the cashier',
  `billId` int(11) NOT NULL,
  PRIMARY KEY (`idPayment`),
  KEY `fk_payement_bill_idx` (`billId`),
  CONSTRAINT `fk_payement_bill` FOREIGN KEY (`billId`) REFERENCES `waterbill` (`idwaterbill`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_alterations`
--

DROP TABLE IF EXISTS `payment_alterations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_alterations` (
  `paymentId` int(11) NOT NULL,
  `alteration_type` varchar(45) NOT NULL COMMENT '2 types of alterations : \n\nalterations due to attendence penalties \n\naltertions due to disagreeemnt between system calculated amount and manual calculated amount',
  `amount` double NOT NULL,
  PRIMARY KEY (`paymentId`,`alteration_type`),
  CONSTRAINT `fk_alteration_payment` FOREIGN KEY (`paymentId`) REFERENCES `payment` (`idpayment`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_alterations`
--

LOCK TABLES `payment_alterations` WRITE;
/*!40000 ALTER TABLE `payment_alterations` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_alterations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waterbill`
--

DROP TABLE IF EXISTS `waterbill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waterbill` (
  `idwaterBill` int(11) NOT NULL AUTO_INCREMENT,
  `issued_date` date NOT NULL,
  `effective_period` varchar(45) DEFAULT NULL,
  `meter_reading` double NOT NULL,
  `memberId` int(11) DEFAULT NULL,
  PRIMARY KEY (`idwaterBill`),
  UNIQUE KEY `memberId_UNIQUE` (`memberId`),
  CONSTRAINT `fk_waterBill_member` FOREIGN KEY (`memberId`) REFERENCES `member` (`idmember`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waterbill`
--

LOCK TABLES `waterbill` WRITE;
/*!40000 ALTER TABLE `waterbill` DISABLE KEYS */;
/*!40000 ALTER TABLE `waterbill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'waterboarddb'
--

--
-- Dumping routines for database 'waterboarddb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-30  0:58:17
