-- MySQL dump 10.19  Distrib 10.3.32-MariaDB, for Linux (x86_64)
--
-- Host: faure.cs.colostate.edu    Database: 
-- ------------------------------------------------------
-- Server version	10.3.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `dbutcher`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbutcher` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `dbutcher`;

--
-- Table structure for table `audit`
--

DROP TABLE IF EXISTS `audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audit` (
  `audit_id` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(100) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`audit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit`
--

LOCK TABLES `audit` WRITE;
/*!40000 ALTER TABLE `audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `author` (
  `author_id` int(11) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (101,'Bobby','Ewing'),(102,'Red','Skelton'),(201,'Thomas','Magnum'),(202,'Julie','Barnes'),(203,'Roger','Ramjet'),(204,'Mickey','Hart'),(206,'Perry','Mason'),(207,'Dickey','Betts'),(208,'Waco','Kid'),(209,'Roger','Thornhill'),(210,'Scottie','Ferguson'),(301,'Barbara','Wright'),(302,'John','Crichton'),(303,'Aeon','Flux'),(304,'Robert','Crawley'),(305,'Commander','Adams');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author_book`
--

DROP TABLE IF EXISTS `author_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `author_book` (
  `author_id` int(11) NOT NULL,
  `ISBN` varchar(13) NOT NULL,
  PRIMARY KEY (`author_id`,`ISBN`),
  KEY `ISBN` (`ISBN`),
  CONSTRAINT `author_book_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `author` (`author_id`) ON DELETE CASCADE,
  CONSTRAINT `author_book_ibfk_2` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author_book`
--

LOCK TABLES `author_book` WRITE;
/*!40000 ALTER TABLE `author_book` DISABLE KEYS */;
INSERT INTO `author_book` VALUES (101,'964210310001'),(101,'964210310006'),(101,'964210310081'),(101,'964210310401'),(102,'964210310002'),(102,'964210310007'),(102,'964210310093'),(102,'964210310907'),(201,'964210310003'),(201,'964210310054'),(201,'964210310502'),(201,'964210310604'),(201,'964210310709'),(201,'964210311604'),(201,'964210311709'),(202,'964210310033'),(202,'964210310034'),(202,'964210310054'),(202,'964210310502'),(203,'964210310003'),(203,'964210310022'),(203,'964210310040'),(203,'964210310401'),(204,'964210310005'),(204,'964210310081'),(204,'964210311003'),(206,'964210311003'),(207,'964210310011'),(207,'964210310300'),(207,'964210311003'),(208,'964210310001'),(208,'964210310011'),(208,'964210310109'),(208,'964210310300'),(209,'964210310004'),(209,'964210310008'),(210,'964210310008'),(210,'964210310068'),(210,'964210310206'),(301,'964210310008'),(301,'964210310206'),(301,'964210310800'),(301,'964210310907'),(301,'964210311800'),(302,'964210310004'),(302,'964210310007'),(302,'964210310800'),(302,'964210311800'),(303,'964210310709'),(303,'964210311709'),(304,'964210310004'),(304,'964210310009'),(304,'964210310109');
/*!40000 ALTER TABLE `author_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author_phone`
--

DROP TABLE IF EXISTS `author_phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `author_phone` (
  `author_id` int(11) NOT NULL,
  `phone_number` char(10) NOT NULL,
  PRIMARY KEY (`author_id`,`phone_number`),
  KEY `phone_number` (`phone_number`),
  CONSTRAINT `author_phone_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `author` (`author_id`) ON DELETE CASCADE,
  CONSTRAINT `author_phone_ibfk_2` FOREIGN KEY (`phone_number`) REFERENCES `phone` (`phone_number`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author_phone`
--

LOCK TABLES `author_phone` WRITE;
/*!40000 ALTER TABLE `author_phone` DISABLE KEYS */;
INSERT INTO `author_phone` VALUES (101,'9705551000'),(101,'9705551010'),(102,'9705551100'),(201,'3035551200'),(202,'3035551200'),(202,'3035551210'),(203,'9705551400'),(206,'9705551600'),(207,'9705551800'),(208,'9705551900'),(209,'9705552000'),(209,'9705552010'),(210,'9705552001'),(301,'9705552020'),(302,'9705552300'),(303,'9705552400'),(303,'9705552401'),(303,'9705552403'),(304,'9705552400'),(304,'9705552402'),(304,'9705552403'),(305,'9705555555');
/*!40000 ALTER TABLE `author_phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book` (
  `ISBN` varchar(14) NOT NULL,
  `title` varchar(60) NOT NULL,
  `year` varchar(4) NOT NULL,
  `publisher_id` int(11) NOT NULL,
  PRIMARY KEY (`ISBN`),
  KEY `publisher_id` (`publisher_id`),
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`publisher_id`) REFERENCES `publisher` (`publisher_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES ('964201310510','Growing your own Weeds','2012',10000),('964210310001','How to Grow Tomatoes','1963',10006),('964210310002','Mr. Smith Goes to Washington','2010',10007),('964210310003','Studying is Your Friend','1955',10000),('964210310004','To Have and To Cherish','2011',10003),('964210310005','Hal Finds a Home','2001',10003),('964210310006','Last Train to Clarksville','1999',10004),('964210310007','How to Digitally Sign','2003',10004),('964210310008','Sam Needs a Friend','2013',10005),('964210310009','Downton Abbey','2005',10002),('964210310011','Database Theory','2010',10001),('964210310022','Challenging Puzzles','1988',10001),('964210310033','American Football','2011',10006),('964210310034','European Football','2015',10003),('964210310040','Where to Start','2012',10003),('964210310054','Lacey Discovers Herself','2013',10002),('964210310068','Mr. Ed','2009',10001),('964210310081','Escape from Gilligans Island','2009',10000),('964210310093','Fixing Computers','2010',10000),('964210310109','Red Burn','2011',10000),('964210310206','Taks McGrill','2000',10003),('964210310300','Eating Healthy','1999',10004),('964210310401','How to Grow Cucumbers','1945',10006),('964210310502','Gardening Tips','1973',10007),('964210310604','Using the Library','1993',10003),('964210310709','Too Many Cooks','1983',10006),('964210310800','Green is Your Friend','2000',10006),('964210310907','Cubs Win!','2005',10002),('964210311003','Missing Tomorrow','2005',10001),('964210311604','Eating in the Fort','1993',10002),('964210311709','Green Eggs','1983',10003),('964210311800','Blue is Your Friend','2010',10002);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrowed`
--

DROP TABLE IF EXISTS `borrowed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `borrowed` (
  `member_id` int(11) NOT NULL,
  `ISBN` varchar(30) NOT NULL,
  `library_name` varchar(100) NOT NULL,
  `checkout_date` date NOT NULL,
  `checkin_date` date DEFAULT NULL,
  PRIMARY KEY (`member_id`,`ISBN`,`library_name`,`checkout_date`),
  KEY `ISBN` (`ISBN`),
  KEY `library_name` (`library_name`),
  CONSTRAINT `borrowed_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE CASCADE,
  CONSTRAINT `borrowed_ibfk_2` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`) ON DELETE CASCADE,
  CONSTRAINT `borrowed_ibfk_3` FOREIGN KEY (`library_name`) REFERENCES `library` (`library_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrowed`
--

LOCK TABLES `borrowed` WRITE;
/*!40000 ALTER TABLE `borrowed` DISABLE KEYS */;
INSERT INTO `borrowed` VALUES (1100,'964210310001','Main','2016-04-27','2016-04-30'),(1100,'964210310003','Main','2016-03-23','2016-03-24'),(1100,'964210310040','Main','2016-05-16','2016-05-16'),(1100,'964210310081','Main','2016-03-15','2016-03-17'),(1100,'964210310401','Main','2016-05-14','2016-05-16'),(1100,'964210310604','Main','2016-03-09','2016-03-10'),(1100,'964210310604','Main','2016-04-13','2016-04-17'),(1100,'964210310709','Main','2016-05-18','2016-05-21'),(1200,'964210310081','Main','2016-04-10','2016-04-16'),(1200,'964210310093','Main','2016-03-27','2016-03-29'),(1200,'964210310109','Main','2016-04-15','2016-04-18'),(1300,'964210310001','Main','2016-03-28','2016-04-04'),(1300,'964210310007','Main','2016-05-11','2016-05-12'),(1300,'964210310008','Main','2016-04-20','2016-04-26'),(1300,'964210310022','Main','2016-03-09','2016-03-10'),(1300,'964210310206','Main','2016-05-11','2016-05-14'),(1400,'964210310007','Main','2016-05-06','2016-05-11'),(1400,'964210310008','Main','2016-05-24','2016-05-29'),(1400,'964210310022','Main','2016-03-04','2016-03-07'),(1400,'964210310033','Main','2016-03-26','2016-03-29'),(1400,'964210310800','Main','2016-03-04','2016-03-06'),(1400,'964210311003','Main','2016-03-05','2016-03-10'),(1500,'964210310004','Main','2016-05-14','2016-05-16'),(1500,'964210310800','Main','2016-04-02','2016-04-05'),(1600,'964210310002','Main','2016-05-04','2016-05-09'),(1600,'964210310011','Main','2016-03-20','2016-03-20'),(1600,'964210310206','Main','2016-05-21','2016-05-27'),(1600,'964210310300','Main','2016-03-22','2016-03-24'),(1600,'964210310800','Main','2016-05-10','2016-05-13'),(1700,'964210310004','Main','2016-04-05','2016-04-11'),(1700,'964210310040','Main','2016-05-18','2016-05-21'),(1700,'964210310081','Main','2016-03-05','2016-03-08'),(1700,'964210310604','Main','2016-04-17','2016-04-18'),(1700,'964210310800','Main','2016-04-22','2016-04-28'),(1700,'964210311003','Main','2016-04-17','2016-04-20'),(1800,'964210310011','Main','2016-04-25','2016-04-26'),(1900,'964210310008','Main','2016-05-01','2016-05-01'),(2000,'964210310005','Main','2016-05-17','2016-05-21'),(2000,'964210310006','Main','2016-05-08','2016-05-11'),(2000,'964210310093','Main','2016-04-12','2016-04-12'),(2000,'964210310109','Main','2016-05-09','2016-05-11'),(2001,'964210310040','Main','2016-04-22','2016-04-25'),(2002,'964210310006','Main','2016-04-27','2016-05-02'),(2002,'964210310008','Main','2016-04-21','2016-04-25'),(2002,'964210310040','Main','2016-05-22','2016-05-27'),(2002,'964210310081','Main','2016-03-04','2016-03-06'),(2003,'964210310033','Main','2016-03-14','2016-03-15'),(2003,'964210310040','Main','2016-04-09','2016-04-14'),(2003,'964210310068','Main','2016-04-12','2016-04-16'),(2004,'964210310007','Main','2016-04-21','2016-04-23'),(2004,'964210310040','Main','2016-04-27','2016-05-02'),(2004,'964210310800','Main','2016-05-13','2016-05-17'),(2004,'964210310800','Main','2016-05-24','2016-05-28'),(2004,'964210310907','Main','2016-05-09','2016-05-10'),(2005,'964210310011','Main','2016-04-20','2016-04-22'),(2006,'964210310800','Main','2016-04-04','2016-04-04'),(2007,'964210310033','Main','2016-03-19','2016-03-24'),(2007,'964210310068','Main','2016-04-19','2016-04-20'),(2007,'964210310709','Main','2016-03-13','2016-03-17'),(2008,'964210310502','Main','2016-03-12','2016-03-14'),(2008,'964210311003','Main','2016-04-04','2016-04-08'),(2009,'964210310002','Main','2016-04-12','2016-04-13'),(2009,'964210310007','Main','2016-03-07','2016-03-13'),(2009,'964210310009','Main','2016-03-20','2016-03-22'),(2009,'964210310022','Main','2016-03-24','2016-03-30'),(2009,'964210310022','Main','2016-04-10','2016-04-10'),(2009,'964210310033','Main','2016-04-30','2016-05-02'),(2009,'964210310054','Main','2016-04-29','2016-05-02'),(2009,'964210310709','Main','2016-04-12','2016-04-15'),(2009,'964210310709','Main','2016-04-30','2016-05-03'),(2011,'964210310011','Main','2016-03-09','2016-03-11'),(2011,'964210310040','Main','2016-03-10','2016-03-16'),(2011,'964210310081','Main','2016-03-15','2016-03-20'),(2011,'964210310093','Main','2016-04-20','2016-04-20'),(2011,'964210310800','Main','2016-05-29',NULL),(2011,'964210311003','Main','2016-03-06','2016-03-08'),(2012,'964210310002','Main','2016-05-27',NULL),(2012,'964210310006','Main','2016-03-24','2016-03-28'),(2012,'964210310008','Main','2016-04-26','2016-04-28'),(2012,'964210310009','Main','2016-03-28','2016-03-29'),(2012,'964210311003','Main','2016-04-04','2016-04-09'),(2013,'964210310008','Main','2016-04-19','2016-04-23'),(2013,'964210310033','Main','2016-05-17','2016-05-21'),(2013,'964210310054','Main','2016-03-26','2016-03-29'),(2015,'964210310009','Main','2016-03-15','2016-03-19'),(2016,'964210310001','Main','2016-04-07','2016-04-08'),(2016,'964210310033','Main','2016-04-28','2016-04-30'),(2016,'964210310206','Main','2016-05-09','2016-05-14'),(2016,'964210310206','Main','2016-05-15','2016-05-15'),(2016,'964210310907','Main','2016-03-06','2016-03-08'),(2016,'964210310907','Main','2016-03-21','2016-03-22'),(2016,'964210310907','Main','2016-04-22','2016-04-28'),(2017,'964210310004','Main','2016-03-14','2016-03-16'),(2017,'964210310093','Main','2016-03-19','2016-03-23'),(2017,'964210310300','Main','2016-05-01','2016-05-05'),(2017,'964210310300','Main','2016-05-20','2016-05-26'),(2017,'964210310709','Main','2016-04-20','2016-04-25'),(2018,'964210310004','Main','2016-03-25','2016-03-27'),(2018,'964210310008','Main','2016-05-10','2016-05-10'),(2018,'964210310033','Main','2016-03-05','2016-03-07'),(2018,'964210310033','Main','2016-04-01','2016-04-07'),(2018,'964210310206','Main','2016-03-05','2016-03-11'),(2018,'964210310206','Main','2016-05-12','2016-05-17'),(2018,'964210310300','Main','2016-04-05','2016-04-10'),(2018,'964210310709','Main','2016-04-20','2016-04-25'),(2018,'964210310907','Main','2016-03-16','2016-03-20'),(2019,'964210310009','Main','2016-03-11','2016-03-12'),(2020,'964210310022','Main','2016-04-09','2016-04-10'),(2020,'964210310093','Main','2016-04-08','2016-04-12'),(2020,'964210310206','Main','2016-05-13','2016-05-18'),(2020,'964210310401','Main','2016-05-29',NULL),(2021,'964210310001','Main','2016-05-21','2016-05-26'),(2021,'964210310033','Main','2016-03-14','2016-03-16'),(2021,'964210310054','Main','2016-04-29','2016-04-30'),(2022,'964210310003','Main','2016-05-06','2016-05-09'),(2022,'964210310009','Main','2016-03-25','2016-03-29'),(2022,'964210310011','Main','2016-05-03','2016-05-06'),(2022,'964210310081','Main','2016-03-26','2016-03-30'),(2022,'964210310093','Main','2016-03-27','2016-03-29'),(2022,'964210310109','Main','2016-04-16','2016-04-21'),(2022,'964210310502','Main','2016-03-26','2016-04-01'),(2022,'964210311003','Main','2016-06-01',NULL);
/*!40000 ALTER TABLE `borrowed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments` (
  `dept_no` char(4) NOT NULL,
  `dept_name` varchar(40) NOT NULL,
  PRIMARY KEY (`dept_no`),
  UNIQUE KEY `dept_name` (`dept_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES ('d009','Customer Service'),('d005','Development'),('d002','Finance'),('d003','Human Resources'),('d001','Marketing'),('d004','Production'),('d006','Quality Management'),('d008','Research'),('d007','Sales');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dept_emp`
--

DROP TABLE IF EXISTS `dept_emp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dept_emp` (
  `emp_no` int(11) NOT NULL,
  `dept_no` char(4) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  PRIMARY KEY (`emp_no`,`dept_no`),
  KEY `dept_no` (`dept_no`),
  CONSTRAINT `dept_emp_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE,
  CONSTRAINT `dept_emp_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dept_emp`
--

LOCK TABLES `dept_emp` WRITE;
/*!40000 ALTER TABLE `dept_emp` DISABLE KEYS */;
INSERT INTO `dept_emp` VALUES (10001,'d005','1986-06-26','9999-01-01'),(10002,'d007','1996-08-03','9999-01-01'),(10003,'d004','1995-12-03','9999-01-01'),(10004,'d004','1986-12-01','9999-01-01'),(10005,'d003','1989-09-12','9999-01-01'),(10006,'d005','1990-08-05','9999-01-01'),(10007,'d008','1989-02-10','9999-01-01'),(10008,'d005','1998-03-11','2000-07-31'),(10009,'d006','1985-02-18','9999-01-01'),(10010,'d004','1996-11-24','2000-06-26'),(10010,'d006','2000-06-26','9999-01-01'),(10011,'d009','1990-01-22','1996-11-09'),(10012,'d005','1992-12-18','9999-01-01'),(10013,'d003','1985-10-20','9999-01-01'),(10014,'d005','1993-12-29','9999-01-01'),(10015,'d008','1992-09-19','1993-08-22'),(10016,'d007','1998-02-11','9999-01-01'),(10017,'d001','1993-08-03','9999-01-01'),(10018,'d004','1992-07-29','9999-01-01'),(10018,'d005','1987-04-03','1992-07-29'),(10019,'d008','1999-04-30','9999-01-01'),(10020,'d004','1997-12-30','9999-01-01'),(10021,'d005','1988-02-10','2002-07-15'),(10022,'d005','1999-09-03','9999-01-01'),(10023,'d005','1999-09-27','9999-01-01'),(10024,'d004','1998-06-14','9999-01-01'),(10025,'d005','1987-08-17','1997-10-15'),(10026,'d004','1995-03-20','9999-01-01'),(10027,'d005','1995-04-02','9999-01-01'),(10028,'d005','1991-10-22','1998-04-06'),(10029,'d004','1991-09-18','1999-07-08'),(10029,'d006','1999-07-08','9999-01-01'),(10030,'d004','1994-02-17','9999-01-01'),(10031,'d005','1991-09-01','9999-01-01'),(10032,'d004','1990-06-20','9999-01-01'),(10033,'d006','1987-03-18','1993-03-24'),(10034,'d007','1995-04-12','1999-10-31'),(10035,'d004','1988-09-05','9999-01-01'),(10036,'d003','1992-04-28','9999-01-01'),(10037,'d005','1990-12-05','9999-01-01'),(10038,'d009','1989-09-20','9999-01-01'),(10039,'d003','1988-01-19','9999-01-01'),(10040,'d005','1993-02-14','2002-01-22'),(10040,'d008','2002-01-22','9999-01-01'),(10041,'d007','1989-11-12','9999-01-01'),(10042,'d002','1993-03-21','2000-08-10'),(10043,'d005','1990-10-20','9999-01-01'),(10044,'d004','1994-05-21','9999-01-01'),(10045,'d004','1996-11-16','9999-01-01'),(10046,'d008','1992-06-20','9999-01-01'),(10047,'d004','1989-03-31','9999-01-01'),(10048,'d005','1985-02-24','1987-01-27'),(10049,'d009','1992-05-04','9999-01-01'),(10050,'d002','1990-12-25','1992-11-05'),(10050,'d007','1992-11-05','9999-01-01'),(10051,'d004','1992-10-15','9999-01-01'),(10052,'d008','1997-01-31','9999-01-01'),(10053,'d007','1994-11-13','9999-01-01'),(10054,'d003','1995-07-29','9999-01-01'),(10055,'d001','1992-04-27','1995-07-22'),(10056,'d005','1990-02-01','9999-01-01'),(10057,'d005','1992-01-15','9999-01-01'),(10058,'d001','1988-04-25','9999-01-01'),(10059,'d002','1991-06-26','9999-01-01'),(10060,'d007','1989-05-28','1992-11-11'),(10060,'d009','1992-11-11','9999-01-01'),(10061,'d007','1989-12-02','9999-01-01'),(10062,'d005','1991-08-30','9999-01-01'),(10063,'d004','1989-04-08','9999-01-01'),(10064,'d008','1985-11-20','1992-03-02'),(10065,'d005','1998-05-24','9999-01-01'),(10066,'d005','1986-02-26','9999-01-01'),(10067,'d006','1987-03-04','9999-01-01'),(10068,'d007','1987-08-07','9999-01-01'),(10069,'d004','1992-06-14','9999-01-01'),(10070,'d005','1985-10-14','1995-10-18'),(10070,'d008','1995-10-18','9999-01-01'),(10071,'d003','1995-08-05','9999-01-01'),(10072,'d005','1989-05-21','9999-01-01'),(10073,'d006','1998-02-02','1998-02-22'),(10074,'d005','1990-08-13','9999-01-01'),(10075,'d005','1988-05-17','2001-01-15'),(10076,'d005','1996-07-15','9999-01-01'),(10077,'d003','1994-12-23','9999-01-01'),(10078,'d005','1994-09-29','9999-01-01'),(10079,'d005','1995-12-13','9999-01-01'),(10080,'d002','1994-09-28','1997-07-09'),(10080,'d003','1997-07-09','9999-01-01'),(10081,'d004','1986-10-30','9999-01-01'),(10082,'d008','1990-01-03','1990-01-15'),(10083,'d004','1987-03-31','9999-01-01'),(10084,'d004','1995-12-15','9999-01-01'),(10085,'d004','1994-04-09','9999-01-01'),(10086,'d003','1992-02-19','9999-01-01'),(10087,'d007','1997-05-08','2001-01-09'),(10088,'d007','1988-09-02','1992-03-21'),(10088,'d009','1992-03-21','9999-01-01'),(10089,'d007','1989-01-10','9999-01-01'),(10090,'d005','1986-03-14','1999-05-07'),(10091,'d005','1992-11-18','9999-01-01'),(10092,'d005','1996-04-22','9999-01-01'),(10093,'d007','1997-06-08','9999-01-01'),(10094,'d008','1987-04-18','1997-11-08'),(10095,'d007','1994-03-10','9999-01-01'),(10096,'d004','1999-01-23','9999-01-01'),(10097,'d008','1990-09-15','9999-01-01'),(10098,'d004','1985-05-13','1989-06-29'),(10098,'d009','1989-06-29','1992-12-11'),(10099,'d007','1988-10-18','9999-01-01'),(110000,'d005','1989-06-22','9999-01-01'),(110022,'d001','1985-01-01','9999-01-01'),(110039,'d001','1986-04-12','9999-01-01'),(110085,'d002','1985-01-01','9999-01-01'),(110114,'d002','1985-01-14','9999-01-01'),(110183,'d003','1985-01-01','9999-01-01'),(110228,'d003','1985-08-04','9999-01-01'),(110303,'d004','1985-01-01','9999-01-01'),(110344,'d004','1985-11-22','9999-01-01'),(110386,'d004','1988-10-14','9999-01-01'),(110420,'d004','1992-02-05','9999-01-01'),(110511,'d005','1985-01-01','9999-01-01'),(110567,'d005','1986-10-21','9999-01-01'),(110725,'d006','1985-01-01','9999-01-01'),(110765,'d006','1989-01-07','9999-01-01'),(110800,'d006','1986-08-12','9999-01-01'),(110854,'d006','1989-06-09','9999-01-01'),(111035,'d007','1985-01-01','9999-01-01'),(111133,'d007','1986-12-30','9999-01-01'),(111400,'d008','1985-01-01','9999-01-01'),(111534,'d008','1988-01-31','9999-01-01'),(111692,'d009','1985-01-01','9999-01-01'),(111784,'d009','1988-02-12','9999-01-01'),(111877,'d009','1991-08-17','9999-01-01'),(111939,'d009','1989-07-10','9999-01-01');
/*!40000 ALTER TABLE `dept_emp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `dept_emp_latest_date`
--

DROP TABLE IF EXISTS `dept_emp_latest_date`;
/*!50001 DROP VIEW IF EXISTS `dept_emp_latest_date`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `dept_emp_latest_date` (
  `emp_no` tinyint NOT NULL,
  `from_date` tinyint NOT NULL,
  `to_date` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `dept_manager`
--

DROP TABLE IF EXISTS `dept_manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dept_manager` (
  `emp_no` int(11) NOT NULL,
  `dept_no` char(4) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  PRIMARY KEY (`emp_no`,`dept_no`),
  KEY `dept_no` (`dept_no`),
  CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE,
  CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dept_manager`
--

LOCK TABLES `dept_manager` WRITE;
/*!40000 ALTER TABLE `dept_manager` DISABLE KEYS */;
INSERT INTO `dept_manager` VALUES (110022,'d001','1985-01-01','1991-10-01'),(110039,'d001','1991-10-01','9999-01-01'),(110085,'d002','1985-01-01','1989-12-17'),(110114,'d002','1989-12-17','9999-01-01'),(110183,'d003','1985-01-01','1992-03-21'),(110228,'d003','1992-03-21','9999-01-01'),(110303,'d004','1985-01-01','1988-09-09'),(110344,'d004','1988-09-09','1992-08-02'),(110386,'d004','1992-08-02','1996-08-30'),(110420,'d004','1996-08-30','9999-01-01'),(110511,'d005','1985-01-01','1992-04-25'),(110567,'d005','1992-04-25','9999-01-01'),(110725,'d006','1985-01-01','1989-05-06'),(110765,'d006','1989-05-06','1991-09-12'),(110800,'d006','1991-09-12','1994-06-28'),(110854,'d006','1994-06-28','9999-01-01'),(111035,'d007','1985-01-01','1991-03-07'),(111133,'d007','1991-03-07','9999-01-01'),(111400,'d008','1985-01-01','1991-04-08'),(111534,'d008','1991-04-08','9999-01-01'),(111692,'d009','1985-01-01','1988-10-17'),(111784,'d009','1988-10-17','1992-09-08'),(111877,'d009','1992-09-08','1996-01-03'),(111939,'d009','1996-01-03','9999-01-01');
/*!40000 ALTER TABLE `dept_manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employees` (
  `emp_no` int(11) NOT NULL,
  `birth_date` date NOT NULL,
  `first_name` varchar(14) NOT NULL,
  `last_name` varchar(16) NOT NULL,
  `gender` enum('M','F') NOT NULL,
  `hire_date` date NOT NULL,
  PRIMARY KEY (`emp_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (10001,'1953-09-02','Georgi','Facello','M','1986-06-26'),(10002,'1964-06-02','Bezalel','Simmel','F','1985-11-21'),(10003,'1959-12-03','Parto','Bamford','M','1986-08-28'),(10004,'1954-05-01','Chirstian','Koblick','M','1986-12-01'),(10005,'1955-01-21','Kyoichi','Maliniak','M','1989-09-12'),(10006,'1953-04-20','Anneke','Preusig','F','1989-06-02'),(10007,'1957-05-23','Tzvetan','Zielinski','F','1989-02-10'),(10008,'1958-02-19','Saniya','Kalloufi','M','1994-09-15'),(10009,'1952-04-19','Sumant','Peac','F','1985-02-18'),(10010,'1963-06-01','Duangkaew','Piveteau','F','1989-08-24'),(10011,'1953-11-07','Mary','Sluis','F','1990-01-22'),(10012,'1960-10-04','Patricio','Bridgland','M','1992-12-18'),(10013,'1963-06-07','Eberhardt','Terkki','M','1985-10-20'),(10014,'1956-02-12','Berni','Genin','M','1987-03-11'),(10015,'1959-08-19','Guoxiang','Nooteboom','M','1987-07-02'),(10016,'1961-05-02','Kazuhito','Cappelletti','M','1995-01-27'),(10017,'1958-07-06','Cristinel','Bouloucos','F','1993-08-03'),(10018,'1954-06-19','Kazuhide','Peha','F','1987-04-03'),(10019,'1953-01-23','Lillian','Haddadi','M','1999-04-30'),(10020,'1952-12-24','Mayuko','Warwick','M','1991-01-26'),(10021,'1960-02-20','Ramzi','Erde','M','1988-02-10'),(10022,'1952-07-08','Shahaf','Famili','M','1995-08-22'),(10023,'1953-09-29','Bojan','Montemayor','F','1989-12-17'),(10024,'1958-09-05','Suzette','Pettey','F','1997-05-19'),(10025,'1958-10-31','Prasadram','Heyers','M','1987-08-17'),(10026,'1953-04-03','Yongqiao','Berztiss','M','1995-03-20'),(10027,'1962-07-10','Divier','Reistad','F','1989-07-07'),(10028,'1963-11-26','Domenick','Tempesti','M','1991-10-22'),(10029,'1956-12-13','Otmar','Herbst','M','1985-11-20'),(10030,'1958-07-14','Elvis','Demeyer','M','1994-02-17'),(10031,'1959-01-27','Karsten','Joslin','M','1991-09-01'),(10032,'1960-08-09','Jeong','Reistad','F','1990-06-20'),(10033,'1956-11-14','Arif','Merlo','M','1987-03-18'),(10034,'1962-12-29','Bader','Swan','M','1988-09-21'),(10035,'1953-02-08','Alain','Chappelet','M','1988-09-05'),(10036,'1959-08-10','Adamantios','Portugali','M','1992-01-03'),(10037,'1963-07-22','Pradeep','Makrucki','M','1990-12-05'),(10038,'1960-07-20','Huan','Lortz','M','1989-09-20'),(10039,'1959-10-01','Alejandro','Brender','M','1988-01-19'),(10040,'1959-09-13','Weiyi','Meriste','F','1993-02-14'),(10041,'1959-08-27','Uri','Lenart','F','1989-11-12'),(10042,'1956-02-26','Magy','Stamatiou','F','1993-03-21'),(10043,'1960-09-19','Yishay','Tzvieli','M','1990-10-20'),(10044,'1961-09-21','Mingsen','Casley','F','1994-05-21'),(10045,'1957-08-14','Moss','Shanbhogue','M','1989-09-02'),(10046,'1960-07-23','Lucien','Rosenbaum','M','1992-06-20'),(10047,'1952-06-29','Zvonko','Nyanchama','M','1989-03-31'),(10048,'1963-07-11','Florian','Syrotiuk','M','1985-02-24'),(10049,'1961-04-24','Basil','Tramer','F','1992-05-04'),(10050,'1958-05-21','Yinghua','Dredge','M','1990-12-25'),(10051,'1953-07-28','Hidefumi','Caine','M','1992-10-15'),(10052,'1961-02-26','Heping','Nitsch','M','1988-05-21'),(10053,'1954-09-13','Sanjiv','Zschoche','F','1986-02-04'),(10054,'1957-04-04','Mayumi','Schueller','M','1995-03-13'),(10055,'1956-06-06','Georgy','Dredge','M','1992-04-27'),(10056,'1961-09-01','Brendon','Bernini','F','1990-02-01'),(10057,'1954-05-30','Ebbe','Callaway','F','1992-01-15'),(10058,'1954-10-01','Berhard','McFarlin','M','1987-04-13'),(10059,'1953-09-19','Alejandro','McAlpine','F','1991-06-26'),(10060,'1961-10-15','Breannda','Billingsley','M','1987-11-02'),(10061,'1962-10-19','Tse','Herber','M','1985-09-17'),(10062,'1961-11-02','Anoosh','Peyn','M','1991-08-30'),(10063,'1952-08-06','Gino','Leonhardt','F','1989-04-08'),(10064,'1959-04-07','Udi','Jansch','M','1985-11-20'),(10065,'1963-04-14','Satosi','Awdeh','M','1988-05-18'),(10066,'1952-11-13','Kwee','Schusler','M','1986-02-26'),(10067,'1953-01-07','Claudi','Stavenow','M','1987-03-04'),(10068,'1962-11-26','Charlene','Brattka','M','1987-08-07'),(10069,'1960-09-06','Margareta','Bierman','F','1989-11-05'),(10070,'1955-08-20','Reuven','Garigliano','M','1985-10-14'),(10071,'1958-01-21','Hisao','Lipner','M','1987-10-01'),(10072,'1952-05-15','Hironoby','Sidou','F','1988-07-21'),(10073,'1954-02-23','Shir','McClurg','M','1991-12-01'),(10074,'1955-08-28','Mokhtar','Bernatsky','F','1990-08-13'),(10075,'1960-03-09','Gao','Dolinsky','F','1987-03-19'),(10076,'1952-06-13','Erez','Ritzmann','F','1985-07-09'),(10077,'1964-04-18','Mona','Azuma','M','1990-03-02'),(10078,'1959-12-25','Danel','Mondadori','F','1987-05-26'),(10079,'1961-10-05','Kshitij','Gils','F','1986-03-27'),(10080,'1957-12-03','Premal','Baek','M','1985-11-19'),(10081,'1960-12-17','Zhongwei','Rosen','M','1986-10-30'),(10082,'1963-09-09','Parviz','Lortz','M','1990-01-03'),(10083,'1959-07-23','Vishv','Zockler','M','1987-03-31'),(10084,'1960-05-25','Tuval','Kalloufi','M','1995-12-15'),(10085,'1962-11-07','Kenroku','Malabarba','M','1994-04-09'),(10086,'1962-11-19','Somnath','Foote','M','1990-02-16'),(10087,'1959-07-23','Xinglin','Eugenio','F','1986-09-08'),(10088,'1954-02-25','Jungsoon','Syrzycki','F','1988-09-02'),(10089,'1963-03-21','Sudharsan','Flasterstein','F','1986-08-12'),(10090,'1961-05-30','Kendra','Hofting','M','1986-03-14'),(10091,'1955-10-04','Amabile','Gomatam','M','1992-11-18'),(10092,'1964-10-18','Valdiodio','Niizuma','F','1989-09-22'),(10093,'1964-06-11','Sailaja','Desikan','M','1996-11-05'),(10094,'1957-05-25','Arumugam','Ossenbruggen','F','1987-04-18'),(10095,'1965-01-03','Hilari','Morton','M','1986-07-15'),(10096,'1954-09-16','Jayson','Mandell','M','1990-01-14'),(10097,'1952-02-27','Remzi','Waschkowski','M','1990-09-15'),(10098,'1961-09-23','Sreekrishna','Servieres','F','1985-05-13'),(10099,'1956-05-25','Valter','Sullins','F','1988-10-18'),(110000,'1956-07-28','Supot','Herath','M','1987-07-07'),(110022,'1956-09-12','Margareta','Markovitch','M','1985-01-01'),(110039,'1963-06-21','Vishwani','Minakawa','M','1986-04-12'),(110085,'1959-10-28','Ebru','Alpin','M','1985-01-01'),(110114,'1957-03-28','Isamu','Legleitner','F','1985-01-14'),(110183,'1953-06-24','Shirish','Ossenbruggen','F','1985-01-01'),(110228,'1958-12-02','Karsten','Sigstam','F','1985-08-04'),(110303,'1956-06-08','Krassimir','Wegerle','F','1985-01-01'),(110344,'1961-09-07','Rosine','Cools','F','1985-11-22'),(110386,'1953-10-04','Shem','Kieras','M','1988-10-14'),(110420,'1963-07-27','Oscar','Ghazalie','M','1992-02-05'),(110511,'1957-07-08','DeForest','Hagimont','M','1985-01-01'),(110567,'1964-04-25','Leon','DasSarma','F','1986-10-21'),(110725,'1961-03-14','Peternela','Onuegbe','F','1985-01-01'),(110765,'1954-05-22','Rutger','Hofmeyr','F','1989-01-07'),(110800,'1963-02-07','Sanjoy','Quadeer','F','1986-08-12'),(110854,'1960-08-19','Dung','Pesch','M','1989-06-09'),(111035,'1962-02-24','Przemyslawa','Kaelbling','M','1985-01-01'),(111133,'1955-03-16','Hauke','Zhang','M','1986-12-30'),(111400,'1959-11-09','Arie','Staelin','M','1985-01-01'),(111534,'1952-06-27','Hilary','Kambil','F','1988-01-31'),(111692,'1954-10-05','Tonny','Butterworth','F','1985-01-01'),(111784,'1956-06-14','Marjo','Giarratana','F','1988-02-12'),(111877,'1962-10-18','Xiaobin','Spinelli','F','1991-08-17'),(111939,'1960-03-25','Yuchang','Weedman','M','1989-07-10');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `library`
--

DROP TABLE IF EXISTS `library`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `library` (
  `library_name` varchar(100) NOT NULL,
  `street` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` char(2) NOT NULL,
  PRIMARY KEY (`library_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library`
--

LOCK TABLES `library` WRITE;
/*!40000 ALTER TABLE `library` DISABLE KEYS */;
INSERT INTO `library` VALUES ('Main','42 South Main','Fort Collins','CO'),('South Park','4000 South College','Fort Collins','CO');
/*!40000 ALTER TABLE `library` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `library_book`
--

DROP TABLE IF EXISTS `library_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `library_book` (
  `ISBN` varchar(17) NOT NULL,
  `library_name` varchar(100) NOT NULL,
  `floor` int(11) NOT NULL,
  `shelf` int(11) NOT NULL,
  `copies_available` int(11) NOT NULL,
  `copies_total` int(11) NOT NULL,
  PRIMARY KEY (`ISBN`,`library_name`),
  KEY `library_name` (`library_name`),
  CONSTRAINT `library_book_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`),
  CONSTRAINT `library_book_ibfk_2` FOREIGN KEY (`library_name`) REFERENCES `library` (`library_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library_book`
--

LOCK TABLES `library_book` WRITE;
/*!40000 ALTER TABLE `library_book` DISABLE KEYS */;
INSERT INTO `library_book` VALUES ('964201310510','Main',2,8,1,1),('964201310510','South Park',3,8,1,1),('964210310001','Main',1,1,3,3),('964210310001','South Park',3,8,1,1),('964210310002','Main',1,1,0,1),('964210310002','South Park',3,8,1,1),('964210310003','Main',1,1,1,1),('964210310003','South Park',3,8,1,1),('964210310004','Main',1,2,2,2),('964210310004','South Park',3,8,1,1),('964210310005','Main',1,2,1,1),('964210310005','South Park',3,8,1,1),('964210310006','Main',1,2,1,1),('964210310006','South Park',3,8,1,1),('964210310007','Main',1,3,2,2),('964210310007','South Park',3,7,3,3),('964210310008','Main',1,3,2,2),('964210310008','South Park',3,7,3,3),('964210310009','Main',1,3,2,2),('964210310009','South Park',3,7,1,1),('964210310011','Main',1,4,2,2),('964210310011','South Park',3,7,1,1),('964210310022','Main',1,4,3,3),('964210310022','South Park',3,7,2,2),('964210310033','Main',1,4,3,3),('964210310033','South Park',3,7,3,3),('964210310034','Main',2,5,1,1),('964210310040','Main',2,5,2,2),('964210310040','South Park',2,4,1,1),('964210310054','Main',2,5,2,2),('964210310054','South Park',2,4,1,1),('964210310068','Main',2,6,1,1),('964210310068','South Park',2,4,1,1),('964210310081','Main',2,6,1,1),('964210310081','South Park',2,4,1,1),('964210310093','Main',2,6,1,1),('964210310093','South Park',2,4,1,1),('964210310109','Main',2,6,1,1),('964210310109','South Park',2,4,1,1),('964210310206','Main',2,7,1,1),('964210310206','South Park',2,4,1,1),('964210310300','Main',2,7,2,2),('964210310300','South Park',2,4,1,1),('964210310401','Main',2,7,1,2),('964210310401','South Park',2,3,1,1),('964210310502','Main',2,7,1,1),('964210310502','South Park',2,3,1,1),('964210310604','Main',2,8,2,2),('964210310709','Main',2,8,3,3),('964210310800','Main',2,8,1,2),('964210310907','Main',2,8,8,8),('964210310907','South Park',2,3,7,7),('964210311003','South Park',2,3,2,2),('964210311604','South Park',2,3,4,4),('964210311709','South Park',2,3,1,1),('964210311800','South Park',2,3,2,2);
/*!40000 ALTER TABLE `library_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `member_id` int(11) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `DOB` date NOT NULL,
  `gender` char(1) NOT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1000,'Wiley','Coyote','1961-09-10','M'),(1100,'Bugs','Bunny','1990-06-24','M'),(1200,'Olive','Oyl','1989-07-19','F'),(1300,'Alice','Wonderland','1989-07-19','F'),(1400,'Roger','Ramjet','1985-01-13','M'),(1500,'Larry','Lujack','1940-06-06','M'),(1600,'Thomas','Tankengine','1991-04-01','M'),(1700,'Amber','Corwin','1970-12-01','F'),(1800,'Dworkin','Barimen','1950-12-02','M'),(1900,'Bel','Garion','1983-01-01','M'),(2000,'Pol','Gara','1963-01-10','F'),(2001,'Art','Clark','2001-12-06','M'),(2002,'Edith','Crawley','1962-09-04','F'),(2003,'John','Bates','2001-12-12','M'),(2004,'Thomas','Barrow','2005-05-05','M'),(2005,'John','Watson','1975-02-22','M'),(2006,'Jim','Moriarty','1967-03-12','M'),(2007,'Walter','White','1983-05-14','M'),(2008,'Skyler','White','1983-04-12','F'),(2009,'Dexter','Morgan','1994-07-11','M'),(2010,'Rita','Bennett','2001-11-12','F'),(2011,'Sun','Kwon','1988-10-19','F'),(2012,'John','Locke','2000-01-01','M'),(2013,'Clair','Littleton','2001-02-01','F'),(2015,'Claire','Bennet','2001-03-11','F'),(2016,'Mohinder','Suresh','1993-04-15','M'),(2017,'Chloe','Sullivan','2007-05-16','F'),(2018,'Martha','Kent','1954-02-13','F'),(2019,'Paige','Matthews','1977-03-16','F'),(2020,'Leo','Wyatt','2000-10-01','M'),(2021,'Buffy','Summers','2000-05-26','F'),(2022,'Xander','Harris','2001-06-23','M');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phone`
--

DROP TABLE IF EXISTS `phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phone` (
  `phone_number` char(10) NOT NULL,
  `type` char(1) NOT NULL,
  PRIMARY KEY (`phone_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phone`
--

LOCK TABLES `phone` WRITE;
/*!40000 ALTER TABLE `phone` DISABLE KEYS */;
INSERT INTO `phone` VALUES ('3035551200','h'),('3035551210','c'),('9705551000','c'),('9705551010','h'),('9705551100','o'),('9705551400','c'),('9705551600','h'),('9705551800','c'),('9705551900','h'),('9705552000','h'),('9705552001','h'),('9705552010','c'),('9705552020','c'),('9705552300','o'),('9705552400','h'),('9705552401','c'),('9705552402','c'),('9705552403','o'),('9705555000','o'),('9705555010','o'),('9705555020','o'),('9705555030','o'),('9705555040','o'),('9705555050','o'),('9705555060','o'),('9705555070','c'),('9705555080','o'),('9705555555','o');
/*!40000 ALTER TABLE `phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publisher` (
  `publisher_id` int(11) NOT NULL,
  `publisher_name` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`publisher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher`
--

LOCK TABLES `publisher` WRITE;
/*!40000 ALTER TABLE `publisher` DISABLE KEYS */;
INSERT INTO `publisher` VALUES (10000,'Wiley'),(10001,'McGraw-Hill'),(10002,'Coyote Publishing'),(10003,'Amazon'),(10004,'Jerrys Ice Cream'),(10005,'Buy a Boat'),(10006,'Flagstaff Publishing'),(10007,'Ram West');
/*!40000 ALTER TABLE `publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher_phone`
--

DROP TABLE IF EXISTS `publisher_phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publisher_phone` (
  `publisher_id` int(11) NOT NULL,
  `phone_number` char(10) NOT NULL,
  PRIMARY KEY (`publisher_id`,`phone_number`),
  KEY `phone_number` (`phone_number`),
  CONSTRAINT `publisher_phone_ibfk_1` FOREIGN KEY (`publisher_id`) REFERENCES `publisher` (`publisher_id`) ON DELETE CASCADE,
  CONSTRAINT `publisher_phone_ibfk_2` FOREIGN KEY (`phone_number`) REFERENCES `phone` (`phone_number`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher_phone`
--

LOCK TABLES `publisher_phone` WRITE;
/*!40000 ALTER TABLE `publisher_phone` DISABLE KEYS */;
INSERT INTO `publisher_phone` VALUES (10000,'9705555000'),(10001,'9705555010'),(10002,'9705555020'),(10003,'9705555030'),(10004,'9705555040'),(10005,'9705555050'),(10006,'9705555060'),(10006,'9705555070'),(10007,'9705555080');
/*!40000 ALTER TABLE `publisher_phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sailors`
--

DROP TABLE IF EXISTS `sailors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sailors` (
  `sid` int(8) DEFAULT NULL,
  `sname` varchar(8) DEFAULT NULL,
  `rating` int(8) DEFAULT NULL,
  `age` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sailors`
--

LOCK TABLES `sailors` WRITE;
/*!40000 ALTER TABLE `sailors` DISABLE KEYS */;
INSERT INTO `sailors` VALUES (18,'jones',3,30),(41,'jonah',6,56),(22,'ahab',7,44),(63,'moby',NULL,15);
/*!40000 ALTER TABLE `sailors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salaries`
--

DROP TABLE IF EXISTS `salaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salaries` (
  `emp_no` int(11) NOT NULL,
  `salary` int(11) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  PRIMARY KEY (`emp_no`,`from_date`),
  CONSTRAINT `salaries_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salaries`
--

LOCK TABLES `salaries` WRITE;
/*!40000 ALTER TABLE `salaries` DISABLE KEYS */;
INSERT INTO `salaries` VALUES (10001,60117,'1986-06-26','1987-06-26'),(10001,62102,'1987-06-26','1988-06-25'),(10001,66074,'1988-06-25','1989-06-25'),(10001,66596,'1989-06-25','1990-06-25'),(10001,66961,'1990-06-25','1991-06-25'),(10001,71046,'1991-06-25','1992-06-24'),(10001,74333,'1992-06-24','1993-06-24'),(10001,75286,'1993-06-24','1994-06-24'),(10001,75994,'1994-06-24','1995-06-24'),(10001,76884,'1995-06-24','1996-06-23'),(10001,80013,'1996-06-23','1997-06-23'),(10001,81025,'1997-06-23','1998-06-23'),(10001,81097,'1998-06-23','1999-06-23'),(10001,84917,'1999-06-23','2000-06-22'),(10001,85112,'2000-06-22','2001-06-22'),(10001,85097,'2001-06-22','2002-06-22'),(10001,88958,'2002-06-22','9999-01-01'),(10002,65828,'1996-08-03','1997-08-03'),(10002,65909,'1997-08-03','1998-08-03'),(10002,67534,'1998-08-03','1999-08-03'),(10002,69366,'1999-08-03','2000-08-02'),(10002,71963,'2000-08-02','2001-08-02'),(10002,72527,'2001-08-02','9999-01-01'),(10003,40006,'1995-12-03','1996-12-02'),(10003,43616,'1996-12-02','1997-12-02'),(10003,43466,'1997-12-02','1998-12-02'),(10003,43636,'1998-12-02','1999-12-02'),(10003,43478,'1999-12-02','2000-12-01'),(10003,43699,'2000-12-01','2001-12-01'),(10003,43311,'2001-12-01','9999-01-01'),(10004,40054,'1986-12-01','1987-12-01'),(10004,42283,'1987-12-01','1988-11-30'),(10004,42542,'1988-11-30','1989-11-30'),(10004,46065,'1989-11-30','1990-11-30'),(10004,48271,'1990-11-30','1991-11-30'),(10004,50594,'1991-11-30','1992-11-29'),(10004,52119,'1992-11-29','1993-11-29'),(10004,54693,'1993-11-29','1994-11-29'),(10004,58326,'1994-11-29','1995-11-29'),(10004,60770,'1995-11-29','1996-11-28'),(10004,62566,'1996-11-28','1997-11-28'),(10004,64340,'1997-11-28','1998-11-28'),(10004,67096,'1998-11-28','1999-11-28'),(10004,69722,'1999-11-28','2000-11-27'),(10004,70698,'2000-11-27','2001-11-27'),(10004,74057,'2001-11-27','9999-01-01'),(10005,78228,'1989-09-12','1990-09-12'),(10005,82621,'1990-09-12','1991-09-12'),(10005,83735,'1991-09-12','1992-09-11'),(10005,85572,'1992-09-11','1993-09-11'),(10005,85076,'1993-09-11','1994-09-11'),(10005,86050,'1994-09-11','1995-09-11'),(10005,88448,'1995-09-11','1996-09-10'),(10005,88063,'1996-09-10','1997-09-10'),(10005,89724,'1997-09-10','1998-09-10'),(10005,90392,'1998-09-10','1999-09-10'),(10005,90531,'1999-09-10','2000-09-09'),(10005,91453,'2000-09-09','2001-09-09'),(10005,94692,'2001-09-09','9999-01-01'),(10006,40000,'1990-08-05','1991-08-05'),(10006,42085,'1991-08-05','1992-08-04'),(10006,42629,'1992-08-04','1993-08-04'),(10006,45844,'1993-08-04','1994-08-04'),(10006,47518,'1994-08-04','1995-08-04'),(10006,47917,'1995-08-04','1996-08-03'),(10006,52255,'1996-08-03','1997-08-03'),(10006,53747,'1997-08-03','1998-08-03'),(10006,56032,'1998-08-03','1999-08-03'),(10006,58299,'1999-08-03','2000-08-02'),(10006,60098,'2000-08-02','2001-08-02'),(10006,59755,'2001-08-02','9999-01-01'),(10007,56724,'1989-02-10','1990-02-10'),(10007,60740,'1990-02-10','1991-02-10'),(10007,62745,'1991-02-10','1992-02-10'),(10007,63475,'1992-02-10','1993-02-09'),(10007,63208,'1993-02-09','1994-02-09'),(10007,64563,'1994-02-09','1995-02-09'),(10007,68833,'1995-02-09','1996-02-09'),(10007,70220,'1996-02-09','1997-02-08'),(10007,73362,'1997-02-08','1998-02-08'),(10007,75582,'1998-02-08','1999-02-08'),(10007,79513,'1999-02-08','2000-02-08'),(10007,80083,'2000-02-08','2001-02-07'),(10007,84456,'2001-02-07','2002-02-07'),(10007,88070,'2002-02-07','9999-01-01'),(10008,46671,'1998-03-11','1999-03-11'),(10008,48584,'1999-03-11','2000-03-10'),(10008,52668,'2000-03-10','2000-07-31'),(10009,60929,'1985-02-18','1986-02-18'),(10009,64604,'1986-02-18','1987-02-18'),(10009,64780,'1987-02-18','1988-02-18'),(10009,66302,'1988-02-18','1989-02-17'),(10009,69042,'1989-02-17','1990-02-17'),(10009,70889,'1990-02-17','1991-02-17'),(10009,71434,'1991-02-17','1992-02-17'),(10009,74612,'1992-02-17','1993-02-16'),(10009,76518,'1993-02-16','1994-02-16'),(10009,78335,'1994-02-16','1995-02-16'),(10009,80944,'1995-02-16','1996-02-16'),(10009,82507,'1996-02-16','1997-02-15'),(10009,85875,'1997-02-15','1998-02-15'),(10009,89324,'1998-02-15','1999-02-15'),(10009,90668,'1999-02-15','2000-02-15'),(10009,93507,'2000-02-15','2001-02-14'),(10009,94443,'2001-02-14','2002-02-14'),(10009,94409,'2002-02-14','9999-01-01'),(10010,72488,'1996-11-24','1997-11-24'),(10010,74347,'1997-11-24','1998-11-24'),(10010,75405,'1998-11-24','1999-11-24'),(10010,78194,'1999-11-24','2000-11-23'),(10010,79580,'2000-11-23','2001-11-23'),(10010,80324,'2001-11-23','9999-01-01'),(10011,42365,'1990-01-22','1991-01-22'),(10011,44200,'1991-01-22','1992-01-22'),(10011,48214,'1992-01-22','1993-01-21'),(10011,50927,'1993-01-21','1994-01-21'),(10011,51470,'1994-01-21','1995-01-21'),(10011,54545,'1995-01-21','1996-01-21'),(10011,56753,'1996-01-21','1996-11-09'),(10012,40000,'1992-12-18','1993-12-18'),(10012,41867,'1993-12-18','1994-12-18'),(10012,42318,'1994-12-18','1995-12-18'),(10012,44195,'1995-12-18','1996-12-17'),(10012,46460,'1996-12-17','1997-12-17'),(10012,46485,'1997-12-17','1998-12-17'),(10012,47364,'1998-12-17','1999-12-17'),(10012,51122,'1999-12-17','2000-12-16'),(10012,54794,'2000-12-16','2001-12-16'),(10012,54423,'2001-12-16','9999-01-01'),(10013,40000,'1985-10-20','1986-10-20'),(10013,40623,'1986-10-20','1987-10-20'),(10013,40561,'1987-10-20','1988-10-19'),(10013,40306,'1988-10-19','1989-10-19'),(10013,43569,'1989-10-19','1990-10-19'),(10013,46305,'1990-10-19','1991-10-19'),(10013,47118,'1991-10-19','1992-10-18'),(10013,50351,'1992-10-18','1993-10-18'),(10013,49887,'1993-10-18','1994-10-18'),(10013,53957,'1994-10-18','1995-10-18'),(10013,57590,'1995-10-18','1996-10-17'),(10013,59228,'1996-10-17','1997-10-17'),(10013,59571,'1997-10-17','1998-10-17'),(10013,63274,'1998-10-17','1999-10-17'),(10013,63352,'1999-10-17','2000-10-16'),(10013,66744,'2000-10-16','2001-10-16'),(10013,68901,'2001-10-16','9999-01-01'),(10014,46168,'1993-12-29','1994-12-29'),(10014,48242,'1994-12-29','1995-12-29'),(10014,47921,'1995-12-29','1996-12-28'),(10014,50715,'1996-12-28','1997-12-28'),(10014,53228,'1997-12-28','1998-12-28'),(10014,53962,'1998-12-28','1999-12-28'),(10014,56937,'1999-12-28','2000-12-27'),(10014,59142,'2000-12-27','2001-12-27'),(10014,60598,'2001-12-27','9999-01-01'),(10015,40000,'1992-09-19','1993-08-22'),(10016,70889,'1998-02-11','1999-02-11'),(10016,72946,'1999-02-11','2000-02-11'),(10016,76826,'2000-02-11','2001-02-10'),(10016,76381,'2001-02-10','2002-02-10'),(10016,77935,'2002-02-10','9999-01-01'),(10017,71380,'1993-08-03','1994-08-03'),(10017,75538,'1994-08-03','1995-08-03'),(10017,79510,'1995-08-03','1996-08-02'),(10017,82163,'1996-08-02','1997-08-02'),(10017,86157,'1997-08-02','1998-08-02'),(10017,89619,'1998-08-02','1999-08-02'),(10017,91985,'1999-08-02','2000-08-01'),(10017,96122,'2000-08-01','2001-08-01'),(10017,98522,'2001-08-01','2002-08-01'),(10017,99651,'2002-08-01','9999-01-01'),(10018,55881,'1987-04-03','1988-04-02'),(10018,59206,'1988-04-02','1989-04-02'),(10018,61361,'1989-04-02','1990-04-02'),(10018,61648,'1990-04-02','1991-04-02'),(10018,61217,'1991-04-02','1992-04-01'),(10018,61244,'1992-04-01','1993-04-01'),(10018,63286,'1993-04-01','1994-04-01'),(10018,65739,'1994-04-01','1995-04-01'),(10018,67519,'1995-04-01','1996-03-31'),(10018,69276,'1996-03-31','1997-03-31'),(10018,72585,'1997-03-31','1998-03-31'),(10018,72804,'1998-03-31','1999-03-31'),(10018,76957,'1999-03-31','2000-03-30'),(10018,80305,'2000-03-30','2001-03-30'),(10018,84541,'2001-03-30','2002-03-30'),(10018,84672,'2002-03-30','9999-01-01'),(10019,44276,'1999-04-30','2000-04-29'),(10019,46946,'2000-04-29','2001-04-29'),(10019,46775,'2001-04-29','2002-04-29'),(10019,50032,'2002-04-29','9999-01-01'),(10020,40000,'1997-12-30','1998-12-30'),(10020,40647,'1998-12-30','1999-12-30'),(10020,43800,'1999-12-30','2000-12-29'),(10020,44927,'2000-12-29','2001-12-29'),(10020,47017,'2001-12-29','9999-01-01'),(10021,55025,'1988-02-10','1989-02-09'),(10021,56399,'1989-02-09','1990-02-09'),(10021,59700,'1990-02-09','1991-02-09'),(10021,60851,'1991-02-09','1992-02-09'),(10021,61117,'1992-02-09','1993-02-08'),(10021,60708,'1993-02-08','1994-02-08'),(10021,63514,'1994-02-08','1995-02-08'),(10021,66249,'1995-02-08','1996-02-08'),(10021,70570,'1996-02-08','1997-02-07'),(10021,74759,'1997-02-07','1998-02-07'),(10021,77519,'1998-02-07','1999-02-07'),(10021,77237,'1999-02-07','2000-02-07'),(10021,79631,'2000-02-07','2001-02-06'),(10021,82295,'2001-02-06','2002-02-06'),(10021,84169,'2002-02-06','2002-07-15'),(10022,40000,'1999-09-03','2000-09-02'),(10022,39935,'2000-09-02','2001-09-02'),(10022,41348,'2001-09-02','9999-01-01'),(10023,47883,'1999-09-27','2000-09-26'),(10023,50319,'2000-09-26','2001-09-26'),(10023,50113,'2001-09-26','9999-01-01'),(10024,83733,'1998-06-14','1999-06-14'),(10024,86715,'1999-06-14','2000-06-13'),(10024,91067,'2000-06-13','2001-06-13'),(10024,94701,'2001-06-13','2002-06-13'),(10024,96646,'2002-06-13','9999-01-01'),(10025,40000,'1987-08-17','1988-08-16'),(10025,44416,'1988-08-16','1989-08-16'),(10025,48680,'1989-08-16','1990-08-16'),(10025,50120,'1990-08-16','1991-08-16'),(10025,50980,'1991-08-16','1992-08-15'),(10025,54459,'1992-08-15','1993-08-15'),(10025,54395,'1993-08-15','1994-08-15'),(10025,56643,'1994-08-15','1995-08-15'),(10025,57585,'1995-08-15','1996-08-14'),(10025,57110,'1996-08-14','1997-08-14'),(10025,57157,'1997-08-14','1997-10-15'),(10026,47585,'1995-03-20','1996-03-19'),(10026,51730,'1996-03-19','1997-03-19'),(10026,53682,'1997-03-19','1998-03-19'),(10026,56769,'1998-03-19','1999-03-19'),(10026,60397,'1999-03-19','2000-03-18'),(10026,64132,'2000-03-18','2001-03-18'),(10026,65415,'2001-03-18','2002-03-18'),(10026,66313,'2002-03-18','9999-01-01'),(10027,40000,'1995-04-02','1996-04-01'),(10027,39520,'1996-04-01','1997-04-01'),(10027,42382,'1997-04-01','1998-04-01'),(10027,43654,'1998-04-01','1999-04-01'),(10027,43925,'1999-04-01','2000-03-31'),(10027,45157,'2000-03-31','2001-03-31'),(10027,45771,'2001-03-31','2002-03-31'),(10027,46145,'2002-03-31','9999-01-01'),(10028,48859,'1991-10-22','1992-10-21'),(10028,50805,'1992-10-21','1993-10-21'),(10028,52082,'1993-10-21','1994-10-21'),(10028,54949,'1994-10-21','1995-10-21'),(10028,55963,'1995-10-21','1996-10-20'),(10028,57831,'1996-10-20','1997-10-20'),(10028,58502,'1997-10-20','1998-04-06'),(10029,63163,'1991-09-18','1992-09-17'),(10029,66877,'1992-09-17','1993-09-17'),(10029,69211,'1993-09-17','1994-09-17'),(10029,70624,'1994-09-17','1995-09-17'),(10029,70294,'1995-09-17','1996-09-16'),(10029,70671,'1996-09-16','1997-09-16'),(10029,73510,'1997-09-16','1998-09-16'),(10029,75773,'1998-09-16','1999-09-16'),(10029,76067,'1999-09-16','2000-09-15'),(10029,76608,'2000-09-15','2001-09-15'),(10029,77777,'2001-09-15','9999-01-01'),(10030,66956,'1994-02-17','1995-02-17'),(10030,68393,'1995-02-17','1996-02-17'),(10030,72795,'1996-02-17','1997-02-16'),(10030,76453,'1997-02-16','1998-02-16'),(10030,79290,'1998-02-16','1999-02-16'),(10030,83327,'1999-02-16','2000-02-16'),(10030,86634,'2000-02-16','2001-02-15'),(10030,87027,'2001-02-15','2002-02-15'),(10030,88806,'2002-02-15','9999-01-01'),(10031,40000,'1991-09-01','1992-08-31'),(10031,40859,'1992-08-31','1993-08-31'),(10031,41881,'1993-08-31','1994-08-31'),(10031,44191,'1994-08-31','1995-08-31'),(10031,47202,'1995-08-31','1996-08-30'),(10031,47606,'1996-08-30','1997-08-30'),(10031,50810,'1997-08-30','1998-08-30'),(10031,52675,'1998-08-30','1999-08-30'),(10031,54177,'1999-08-30','2000-08-29'),(10031,53873,'2000-08-29','2001-08-29'),(10031,56689,'2001-08-29','9999-01-01'),(10032,48426,'1990-06-20','1991-06-20'),(10032,49389,'1991-06-20','1992-06-19'),(10032,52000,'1992-06-19','1993-06-19'),(10032,53038,'1993-06-19','1994-06-19'),(10032,54336,'1994-06-19','1995-06-19'),(10032,53978,'1995-06-19','1996-06-18'),(10032,55090,'1996-06-18','1997-06-18'),(10032,57110,'1997-06-18','1998-06-18'),(10032,57926,'1998-06-18','1999-06-18'),(10032,57876,'1999-06-18','2000-06-17'),(10032,61709,'2000-06-17','2001-06-17'),(10032,65820,'2001-06-17','2002-06-17'),(10032,69539,'2002-06-17','9999-01-01'),(10033,51258,'1987-03-18','1988-03-17'),(10033,54972,'1988-03-17','1989-03-17'),(10033,55410,'1989-03-17','1990-03-17'),(10033,56095,'1990-03-17','1991-03-17'),(10033,56038,'1991-03-17','1992-03-16'),(10033,57712,'1992-03-16','1993-03-16'),(10033,60433,'1993-03-16','1993-03-24'),(10034,47561,'1995-04-12','1996-04-11'),(10034,51192,'1996-04-11','1997-04-11'),(10034,52687,'1997-04-11','1998-04-11'),(10034,53112,'1998-04-11','1999-04-11'),(10034,53164,'1999-04-11','1999-10-31'),(10035,41538,'1988-09-05','1989-09-05'),(10035,45131,'1989-09-05','1990-09-05'),(10035,45629,'1990-09-05','1991-09-05'),(10035,48360,'1991-09-05','1992-09-04'),(10035,50664,'1992-09-04','1993-09-04'),(10035,53060,'1993-09-04','1994-09-04'),(10035,56640,'1994-09-04','1995-09-04'),(10035,57621,'1995-09-04','1996-09-03'),(10035,59291,'1996-09-03','1997-09-03'),(10035,61793,'1997-09-03','1998-09-03'),(10035,62285,'1998-09-03','1999-09-03'),(10035,65332,'1999-09-03','2000-09-02'),(10035,66584,'2000-09-02','2001-09-02'),(10035,68755,'2001-09-02','9999-01-01'),(10036,42819,'1992-04-28','1993-04-28'),(10036,46756,'1993-04-28','1994-04-28'),(10036,51084,'1994-04-28','1995-04-28'),(10036,52308,'1995-04-28','1996-04-27'),(10036,53828,'1996-04-27','1997-04-27'),(10036,54408,'1997-04-27','1998-04-27'),(10036,53929,'1998-04-27','1999-04-27'),(10036,56579,'1999-04-27','2000-04-26'),(10036,60478,'2000-04-26','2001-04-26'),(10036,60520,'2001-04-26','2002-04-26'),(10036,63053,'2002-04-26','9999-01-01'),(10037,40000,'1990-12-05','1991-12-05'),(10037,39765,'1991-12-05','1992-12-04'),(10037,43565,'1992-12-04','1993-12-04'),(10037,43104,'1993-12-04','1994-12-04'),(10037,46100,'1994-12-04','1995-12-04'),(10037,49735,'1995-12-04','1996-12-03'),(10037,51775,'1996-12-03','1997-12-03'),(10037,53198,'1997-12-03','1998-12-03'),(10037,56270,'1998-12-03','1999-12-03'),(10037,59882,'1999-12-03','2000-12-02'),(10037,60992,'2000-12-02','2001-12-02'),(10037,60574,'2001-12-02','9999-01-01'),(10038,40000,'1989-09-20','1990-09-20'),(10038,43527,'1990-09-20','1991-09-20'),(10038,46509,'1991-09-20','1992-09-19'),(10038,49874,'1992-09-19','1993-09-19'),(10038,52969,'1993-09-19','1994-09-19'),(10038,56629,'1994-09-19','1995-09-19'),(10038,58079,'1995-09-19','1996-09-18'),(10038,60322,'1996-09-18','1997-09-18'),(10038,62274,'1997-09-18','1998-09-18'),(10038,62517,'1998-09-18','1999-09-18'),(10038,62458,'1999-09-18','2000-09-17'),(10038,64238,'2000-09-17','2001-09-17'),(10038,64254,'2001-09-17','9999-01-01'),(10039,40000,'1988-01-19','1989-01-18'),(10039,41525,'1989-01-18','1990-01-18'),(10039,43801,'1990-01-18','1991-01-18'),(10039,46278,'1991-01-18','1992-01-18'),(10039,45838,'1992-01-18','1993-01-17'),(10039,49155,'1993-01-17','1994-01-17'),(10039,52999,'1994-01-17','1995-01-17'),(10039,55037,'1995-01-17','1996-01-17'),(10039,54937,'1996-01-17','1997-01-16'),(10039,55204,'1997-01-16','1998-01-16'),(10039,59593,'1998-01-16','1999-01-16'),(10039,62131,'1999-01-16','2000-01-16'),(10039,61774,'2000-01-16','2001-01-15'),(10039,63592,'2001-01-15','2002-01-15'),(10039,63918,'2002-01-15','9999-01-01'),(10040,52153,'1993-02-14','1994-02-14'),(10040,53533,'1994-02-14','1995-02-14'),(10040,56565,'1995-02-14','1996-02-14'),(10040,60260,'1996-02-14','1997-02-13'),(10040,62101,'1997-02-13','1998-02-13'),(10040,63870,'1998-02-13','1999-02-13'),(10040,64570,'1999-02-13','2000-02-13'),(10040,67016,'2000-02-13','2001-02-12'),(10040,68185,'2001-02-12','2002-02-12'),(10040,72668,'2002-02-12','9999-01-01'),(10041,56893,'1989-11-12','1990-11-12'),(10041,60824,'1990-11-12','1991-11-12'),(10041,63116,'1991-11-12','1992-11-11'),(10041,64128,'1992-11-11','1993-11-11'),(10041,65615,'1993-11-11','1994-11-11'),(10041,69768,'1994-11-11','1995-11-11'),(10041,70216,'1995-11-11','1996-11-10'),(10041,71322,'1996-11-10','1997-11-10'),(10041,74575,'1997-11-10','1998-11-10'),(10041,75544,'1998-11-10','1999-11-10'),(10041,79746,'1999-11-10','2000-11-09'),(10041,81012,'2000-11-09','2001-11-09'),(10041,81705,'2001-11-09','9999-01-01'),(10042,81662,'1993-03-21','1994-03-21'),(10042,84183,'1994-03-21','1995-03-21'),(10042,84389,'1995-03-21','1996-03-20'),(10042,85501,'1996-03-20','1997-03-20'),(10042,89833,'1997-03-20','1998-03-20'),(10042,91161,'1998-03-20','1999-03-20'),(10042,95035,'1999-03-20','2000-03-19'),(10042,94868,'2000-03-19','2000-08-10'),(10043,49324,'1990-10-20','1991-10-20'),(10043,51948,'1991-10-20','1992-10-19'),(10043,54011,'1992-10-19','1993-10-19'),(10043,58302,'1993-10-19','1994-10-19'),(10043,62291,'1994-10-19','1995-10-19'),(10043,65669,'1995-10-19','1996-10-18'),(10043,65562,'1996-10-18','1997-10-18'),(10043,68328,'1997-10-18','1998-10-18'),(10043,70689,'1998-10-18','1999-10-18'),(10043,72543,'1999-10-18','2000-10-17'),(10043,76677,'2000-10-17','2001-10-17'),(10043,77659,'2001-10-17','9999-01-01'),(10044,40919,'1994-05-21','1995-05-21'),(10044,45217,'1995-05-21','1996-05-20'),(10044,46674,'1996-05-20','1997-05-20'),(10044,48623,'1997-05-20','1998-05-20'),(10044,51377,'1998-05-20','1999-05-20'),(10044,53186,'1999-05-20','2000-05-19'),(10044,56058,'2000-05-19','2001-05-19'),(10044,56810,'2001-05-19','2002-05-19'),(10044,58345,'2002-05-19','9999-01-01'),(10045,41971,'1996-11-16','1997-11-16'),(10045,42914,'1997-11-16','1998-11-16'),(10045,43046,'1998-11-16','1999-11-16'),(10045,43838,'1999-11-16','2000-11-15'),(10045,47984,'2000-11-15','2001-11-15'),(10045,47581,'2001-11-15','9999-01-01'),(10046,40000,'1992-06-20','1993-06-20'),(10046,42385,'1993-06-20','1994-06-20'),(10046,43485,'1994-06-20','1995-06-20'),(10046,43203,'1995-06-20','1996-06-19'),(10046,45150,'1996-06-19','1997-06-19'),(10046,48222,'1997-06-19','1998-06-19'),(10046,50853,'1998-06-19','1999-06-19'),(10046,52271,'1999-06-19','2000-06-18'),(10046,56481,'2000-06-18','2001-06-18'),(10046,60249,'2001-06-18','2002-06-18'),(10046,62218,'2002-06-18','9999-01-01'),(10047,54982,'1989-03-31','1990-03-31'),(10047,57350,'1990-03-31','1991-03-31'),(10047,59571,'1991-03-31','1992-03-30'),(10047,62851,'1992-03-30','1993-03-30'),(10047,65225,'1993-03-30','1994-03-30'),(10047,66330,'1994-03-30','1995-03-30'),(10047,69992,'1995-03-30','1996-03-29'),(10047,73376,'1996-03-29','1997-03-29'),(10047,74735,'1997-03-29','1998-03-29'),(10047,75748,'1998-03-29','1999-03-29'),(10047,77149,'1999-03-29','2000-03-28'),(10047,78399,'2000-03-28','2001-03-28'),(10047,78569,'2001-03-28','2002-03-28'),(10047,81037,'2002-03-28','9999-01-01'),(10048,40000,'1985-02-24','1986-02-24'),(10048,39507,'1986-02-24','1987-01-27'),(10049,40000,'1992-05-04','1993-05-04'),(10049,39735,'1993-05-04','1994-05-04'),(10049,40484,'1994-05-04','1995-05-04'),(10049,41291,'1995-05-04','1996-05-03'),(10049,41301,'1996-05-03','1997-05-03'),(10049,41957,'1997-05-03','1998-05-03'),(10049,41788,'1998-05-03','1999-05-03'),(10049,44620,'1999-05-03','2000-05-02'),(10049,45933,'2000-05-02','2001-05-02'),(10049,48575,'2001-05-02','2002-05-02'),(10049,51326,'2002-05-02','9999-01-01'),(10050,74366,'1990-12-25','1991-12-25'),(10050,78675,'1991-12-25','1992-12-24'),(10050,82220,'1992-12-24','1993-12-24'),(10050,86604,'1993-12-24','1994-12-24'),(10050,88087,'1994-12-24','1995-12-24'),(10050,88836,'1995-12-24','1996-12-23'),(10050,90623,'1996-12-23','1997-12-23'),(10050,91530,'1997-12-23','1998-12-23'),(10050,93689,'1998-12-23','1999-12-23'),(10050,97571,'1999-12-23','2000-12-22'),(10050,97817,'2000-12-22','2001-12-22'),(10050,97830,'2001-12-22','9999-01-01'),(10051,48817,'1992-10-15','1993-10-15'),(10051,50874,'1993-10-15','1994-10-15'),(10051,52247,'1994-10-15','1995-10-15'),(10051,56217,'1995-10-15','1996-10-14'),(10051,59402,'1996-10-14','1997-10-14'),(10051,59012,'1997-10-14','1998-10-14'),(10051,61719,'1998-10-14','1999-10-14'),(10051,61345,'1999-10-14','2000-10-13'),(10051,61400,'2000-10-13','2001-10-13'),(10051,64905,'2001-10-13','9999-01-01'),(10052,57212,'1997-01-31','1998-01-31'),(10052,56908,'1998-01-31','1999-01-31'),(10052,60084,'1999-01-31','2000-01-31'),(10052,63081,'2000-01-31','2001-01-30'),(10052,66450,'2001-01-30','2002-01-30'),(10052,67156,'2002-01-30','9999-01-01'),(10053,67854,'1994-11-13','1995-11-13'),(10053,67912,'1995-11-13','1996-11-12'),(10053,71459,'1996-11-12','1997-11-12'),(10053,71283,'1997-11-12','1998-11-12'),(10053,74822,'1998-11-12','1999-11-12'),(10053,77425,'1999-11-12','2000-11-11'),(10053,77531,'2000-11-11','2001-11-11'),(10053,78478,'2001-11-11','9999-01-01'),(10054,40000,'1995-07-29','1996-07-28'),(10054,42889,'1996-07-28','1997-07-28'),(10054,42846,'1997-07-28','1998-07-28'),(10054,44680,'1998-07-28','1999-07-28'),(10054,44958,'1999-07-28','2000-07-27'),(10054,49391,'2000-07-27','2001-07-27'),(10054,52184,'2001-07-27','2002-07-27'),(10054,53906,'2002-07-27','9999-01-01'),(10055,80024,'1992-04-27','1993-04-27'),(10055,83592,'1993-04-27','1994-04-27'),(10055,87473,'1994-04-27','1995-04-27'),(10055,90843,'1995-04-27','1995-07-22'),(10056,48857,'1990-02-01','1991-02-01'),(10056,51457,'1991-02-01','1992-02-01'),(10056,53869,'1992-02-01','1993-01-31'),(10056,54677,'1993-01-31','1994-01-31'),(10056,56047,'1994-01-31','1995-01-31'),(10056,59252,'1995-01-31','1996-01-31'),(10056,61963,'1996-01-31','1997-01-30'),(10056,65622,'1997-01-30','1998-01-30'),(10056,67648,'1998-01-30','1999-01-30'),(10056,70163,'1999-01-30','2000-01-30'),(10056,69905,'2000-01-30','2001-01-29'),(10056,74004,'2001-01-29','2002-01-29'),(10056,74722,'2002-01-29','9999-01-01'),(10057,49616,'1992-01-15','1993-01-14'),(10057,53897,'1993-01-14','1994-01-14'),(10057,58099,'1994-01-14','1995-01-14'),(10057,58881,'1995-01-14','1996-01-14'),(10057,61013,'1996-01-14','1997-01-13'),(10057,61055,'1997-01-13','1998-01-13'),(10057,61255,'1998-01-13','1999-01-13'),(10057,60966,'1999-01-13','2000-01-13'),(10057,63507,'2000-01-13','2001-01-12'),(10057,66430,'2001-01-12','2002-01-12'),(10057,68061,'2002-01-12','9999-01-01'),(10058,52787,'1988-04-25','1989-04-25'),(10058,53377,'1989-04-25','1990-04-25'),(10058,53869,'1990-04-25','1991-04-25'),(10058,55134,'1991-04-25','1992-04-24'),(10058,57882,'1992-04-24','1993-04-24'),(10058,58807,'1993-04-24','1994-04-24'),(10058,63284,'1994-04-24','1995-04-24'),(10058,63666,'1995-04-24','1996-04-23'),(10058,65706,'1996-04-23','1997-04-23'),(10058,67913,'1997-04-23','1998-04-23'),(10058,68623,'1998-04-23','1999-04-23'),(10058,71438,'1999-04-23','2000-04-22'),(10058,72151,'2000-04-22','2001-04-22'),(10058,72363,'2001-04-22','2002-04-22'),(10058,72542,'2002-04-22','9999-01-01'),(10059,71218,'1991-06-26','1992-06-25'),(10059,73299,'1992-06-25','1993-06-25'),(10059,76448,'1993-06-25','1994-06-25'),(10059,80739,'1994-06-25','1995-06-25'),(10059,82318,'1995-06-25','1996-06-24'),(10059,84522,'1996-06-24','1997-06-24'),(10059,86290,'1997-06-24','1998-06-24'),(10059,89824,'1998-06-24','1999-06-24'),(10059,90380,'1999-06-24','2000-06-23'),(10059,90689,'2000-06-23','2001-06-23'),(10059,93280,'2001-06-23','2002-06-23'),(10059,94161,'2002-06-23','9999-01-01'),(10060,74686,'1989-05-28','1990-05-28'),(10060,75594,'1990-05-28','1991-05-28'),(10060,77772,'1991-05-28','1992-05-27'),(10060,78393,'1992-05-27','1993-05-27'),(10060,77964,'1993-05-27','1994-05-27'),(10060,78057,'1994-05-27','1995-05-27'),(10060,78983,'1995-05-27','1996-05-26'),(10060,79900,'1996-05-26','1997-05-26'),(10060,79684,'1997-05-26','1998-05-26'),(10060,84052,'1998-05-26','1999-05-26'),(10060,85960,'1999-05-26','2000-05-25'),(10060,87773,'2000-05-25','2001-05-25'),(10060,89769,'2001-05-25','2002-05-25'),(10060,93188,'2002-05-25','9999-01-01'),(10061,68577,'1989-12-02','1990-12-02'),(10061,71135,'1990-12-02','1991-12-02'),(10061,72464,'1991-12-02','1992-12-01'),(10061,74796,'1992-12-01','1993-12-01'),(10061,74944,'1993-12-01','1994-12-01'),(10061,79041,'1994-12-01','1995-12-01'),(10061,80248,'1995-12-01','1996-11-30'),(10061,84445,'1996-11-30','1997-11-30'),(10061,88012,'1997-11-30','1998-11-30'),(10061,90972,'1998-11-30','1999-11-30'),(10061,91371,'1999-11-30','2000-11-29'),(10061,95866,'2000-11-29','2001-11-29'),(10061,97338,'2001-11-29','9999-01-01'),(10062,55685,'1991-08-30','1992-08-29'),(10062,59029,'1992-08-29','1993-08-29'),(10062,60089,'1993-08-29','1994-08-29'),(10062,62194,'1994-08-29','1995-08-29'),(10062,61761,'1995-08-29','1996-08-28'),(10062,65275,'1996-08-28','1997-08-28'),(10062,65544,'1997-08-28','1998-08-28'),(10062,66167,'1998-08-28','1999-08-28'),(10062,66447,'1999-08-28','2000-08-27'),(10062,68784,'2000-08-27','2001-08-27'),(10062,68559,'2001-08-27','9999-01-01'),(10063,40000,'1989-04-08','1990-04-08'),(10063,41990,'1990-04-08','1991-04-08'),(10063,44342,'1991-04-08','1992-04-07'),(10063,48429,'1992-04-07','1993-04-07'),(10063,52466,'1993-04-07','1994-04-07'),(10063,54823,'1994-04-07','1995-04-07'),(10063,56442,'1995-04-07','1996-04-05'),(10063,60165,'1996-04-05','1997-04-05'),(10063,63852,'1997-04-05','1998-04-06'),(10063,65262,'1998-04-06','1999-04-06'),(10063,69354,'1999-04-06','2000-04-05'),(10063,71028,'2000-04-05','2001-04-05'),(10063,73393,'2001-04-05','2002-04-04'),(10063,74841,'2002-04-04','9999-01-01'),(10064,40000,'1985-11-20','1986-11-20'),(10064,39551,'1986-11-20','1987-11-20'),(10064,41264,'1987-11-20','1988-11-19'),(10064,40795,'1988-11-19','1989-11-19'),(10064,43466,'1989-11-19','1990-11-19'),(10064,45895,'1990-11-19','1991-11-19'),(10064,48454,'1991-11-19','1992-03-02'),(10065,40000,'1998-05-24','1999-05-24'),(10065,40503,'1999-05-24','2000-05-23'),(10065,42031,'2000-05-23','2001-05-23'),(10065,43655,'2001-05-23','2002-05-23'),(10065,47437,'2002-05-23','9999-01-01'),(10066,69736,'1986-02-26','1987-02-26'),(10066,72147,'1987-02-26','1988-02-26'),(10066,76616,'1988-02-26','1989-02-25'),(10066,78885,'1989-02-25','1990-02-25'),(10066,82819,'1990-02-25','1991-02-25'),(10066,84064,'1991-02-25','1992-02-25'),(10066,84161,'1992-02-25','1993-02-24'),(10066,84368,'1993-02-24','1994-02-24'),(10066,88392,'1994-02-24','1995-02-24'),(10066,88808,'1995-02-24','1996-02-24'),(10066,92405,'1996-02-24','1997-02-23'),(10066,96451,'1997-02-23','1998-02-23'),(10066,98656,'1998-02-23','1999-02-23'),(10066,99199,'1999-02-23','2000-02-23'),(10066,102425,'2000-02-23','2001-02-22'),(10066,102674,'2001-02-22','2002-02-22'),(10066,103672,'2002-02-22','9999-01-01'),(10067,44642,'1987-03-04','1988-03-03'),(10067,47879,'1988-03-03','1989-03-03'),(10067,47733,'1989-03-03','1990-03-03'),(10067,51396,'1990-03-03','1991-03-03'),(10067,52808,'1991-03-03','1992-03-02'),(10067,56581,'1992-03-02','1993-03-02'),(10067,58363,'1993-03-02','1994-03-02'),(10067,62607,'1994-03-02','1995-03-02'),(10067,66769,'1995-03-02','1996-03-01'),(10067,70158,'1996-03-01','1997-03-01'),(10067,73730,'1997-03-01','1998-03-01'),(10067,74242,'1998-03-01','1999-03-01'),(10067,75732,'1999-03-01','2000-02-29'),(10067,77620,'2000-02-29','2001-02-28'),(10067,81784,'2001-02-28','2002-02-28'),(10067,83254,'2002-02-28','9999-01-01'),(10068,87964,'1987-08-07','1988-08-06'),(10068,92176,'1988-08-06','1989-08-06'),(10068,92089,'1989-08-06','1990-08-06'),(10068,93474,'1990-08-06','1991-08-06'),(10068,94724,'1991-08-06','1992-08-05'),(10068,97058,'1992-08-05','1993-08-05'),(10068,100005,'1993-08-05','1994-08-05'),(10068,101829,'1994-08-05','1995-08-05'),(10068,101630,'1995-08-05','1996-08-04'),(10068,105533,'1996-08-04','1997-08-04'),(10068,106204,'1997-08-04','1998-08-04'),(10068,108345,'1998-08-04','1999-08-04'),(10068,111623,'1999-08-04','2000-08-03'),(10068,112470,'2000-08-03','2001-08-03'),(10068,113229,'2001-08-03','9999-01-01'),(10069,67932,'1992-06-14','1993-06-14'),(10069,68046,'1993-06-14','1994-06-14'),(10069,67675,'1994-06-14','1995-06-14'),(10069,69876,'1995-06-14','1996-06-13'),(10069,70464,'1996-06-13','1997-06-13'),(10069,71574,'1997-06-13','1998-06-13'),(10069,74638,'1998-06-13','1999-06-13'),(10069,79102,'1999-06-13','2000-06-12'),(10069,82731,'2000-06-12','2001-06-12'),(10069,85931,'2001-06-12','2002-06-12'),(10069,86641,'2002-06-12','9999-01-01'),(10070,55999,'1985-10-14','1986-10-14'),(10070,56848,'1986-10-14','1987-10-14'),(10070,61306,'1987-10-14','1988-10-13'),(10070,63174,'1988-10-13','1989-10-13'),(10070,63950,'1989-10-13','1990-10-13'),(10070,64776,'1990-10-13','1991-10-13'),(10070,67223,'1991-10-13','1992-10-12'),(10070,70301,'1992-10-12','1993-10-12'),(10070,74286,'1993-10-12','1994-10-12'),(10070,77938,'1994-10-12','1995-10-12'),(10070,82124,'1995-10-12','1996-10-11'),(10070,83639,'1996-10-11','1997-10-11'),(10070,87499,'1997-10-11','1998-10-11'),(10070,87086,'1998-10-11','1999-10-11'),(10070,90690,'1999-10-11','2000-10-10'),(10070,94654,'2000-10-10','2001-10-10'),(10070,96322,'2001-10-10','9999-01-01'),(10071,40000,'1995-08-05','1996-08-04'),(10071,40087,'1996-08-04','1997-08-04'),(10071,41656,'1997-08-04','1998-08-04'),(10071,42768,'1998-08-04','1999-08-04'),(10071,46295,'1999-08-04','2000-08-03'),(10071,49837,'2000-08-03','2001-08-03'),(10071,53315,'2001-08-03','9999-01-01'),(10072,40000,'1989-05-21','1990-05-21'),(10072,39567,'1990-05-21','1991-05-21'),(10072,39724,'1991-05-21','1992-05-20'),(10072,40803,'1992-05-20','1993-05-20'),(10072,44781,'1993-05-20','1994-05-20'),(10072,49265,'1994-05-20','1995-05-20'),(10072,53559,'1995-05-20','1996-05-19'),(10072,56103,'1996-05-19','1997-05-19'),(10072,58578,'1997-05-19','1998-05-19'),(10072,60600,'1998-05-19','1999-05-19'),(10072,62174,'1999-05-19','2000-05-18'),(10072,63157,'2000-05-18','2001-05-18'),(10072,64726,'2001-05-18','2002-05-18'),(10072,64512,'2002-05-18','9999-01-01'),(10073,56473,'1998-02-02','1998-02-22'),(10074,61714,'1990-08-13','1991-08-13'),(10074,64739,'1991-08-13','1992-08-12'),(10074,64655,'1992-08-12','1993-08-12'),(10074,67516,'1993-08-12','1994-08-12'),(10074,70019,'1994-08-12','1995-08-12'),(10074,70984,'1995-08-12','1996-08-11'),(10074,72145,'1996-08-11','1997-08-11'),(10074,73009,'1997-08-11','1998-08-11'),(10074,77489,'1998-08-11','1999-08-11'),(10074,77625,'1999-08-11','2000-08-10'),(10074,79934,'2000-08-10','2001-08-10'),(10074,80820,'2001-08-10','9999-01-01'),(10075,43815,'1988-05-17','1989-05-17'),(10075,43590,'1989-05-17','1990-05-17'),(10075,46087,'1990-05-17','1991-05-17'),(10075,47765,'1991-05-17','1992-05-16'),(10075,48606,'1992-05-16','1993-05-16'),(10075,49208,'1993-05-16','1994-05-16'),(10075,51099,'1994-05-16','1995-05-16'),(10075,51323,'1995-05-16','1996-05-15'),(10075,51238,'1996-05-15','1997-05-15'),(10075,55463,'1997-05-15','1998-05-15'),(10075,59623,'1998-05-15','1999-05-15'),(10075,63624,'1999-05-15','2000-05-14'),(10075,67492,'2000-05-14','2001-01-15'),(10076,47319,'1996-07-15','1997-07-15'),(10076,50802,'1997-07-15','1998-07-15'),(10076,54783,'1998-07-15','1999-07-15'),(10076,57418,'1999-07-15','2000-07-14'),(10076,59999,'2000-07-14','2001-07-14'),(10076,61118,'2001-07-14','2002-07-14'),(10076,62921,'2002-07-14','9999-01-01'),(10077,40000,'1994-12-23','1995-12-23'),(10077,43745,'1995-12-23','1996-12-22'),(10077,43864,'1996-12-22','1997-12-22'),(10077,47173,'1997-12-22','1998-12-22'),(10077,49955,'1998-12-22','1999-12-22'),(10077,50403,'1999-12-22','2000-12-21'),(10077,51581,'2000-12-21','2001-12-21'),(10077,54699,'2001-12-21','9999-01-01'),(10078,47280,'1994-09-29','1995-09-29'),(10078,46833,'1995-09-29','1996-09-28'),(10078,50652,'1996-09-28','1997-09-28'),(10078,50977,'1997-09-28','1998-09-28'),(10078,51132,'1998-09-28','1999-09-28'),(10078,53130,'1999-09-28','2000-09-27'),(10078,52860,'2000-09-27','2001-09-27'),(10078,54652,'2001-09-27','9999-01-01'),(10079,53492,'1995-12-13','1996-12-12'),(10079,56811,'1996-12-12','1997-12-12'),(10079,56717,'1997-12-12','1998-12-12'),(10079,56256,'1998-12-12','1999-12-12'),(10079,59225,'1999-12-12','2000-12-11'),(10079,63641,'2000-12-11','2001-12-11'),(10079,67231,'2001-12-11','9999-01-01'),(10080,54916,'1994-09-28','1995-09-28'),(10080,56838,'1995-09-28','1996-09-27'),(10080,60742,'1996-09-27','1997-09-27'),(10080,62087,'1997-09-27','1998-09-27'),(10080,65129,'1998-09-27','1999-09-27'),(10080,68691,'1999-09-27','2000-09-26'),(10080,71986,'2000-09-26','2001-09-26'),(10080,72729,'2001-09-26','9999-01-01'),(10081,55786,'1986-10-30','1987-10-30'),(10081,58975,'1987-10-30','1988-10-29'),(10081,58475,'1988-10-29','1989-10-29'),(10081,61935,'1989-10-29','1990-10-29'),(10081,63172,'1990-10-29','1991-10-29'),(10081,64355,'1991-10-29','1992-10-28'),(10081,64054,'1992-10-28','1993-10-28'),(10081,66796,'1993-10-28','1994-10-28'),(10081,66704,'1994-10-28','1995-10-28'),(10081,68102,'1995-10-28','1996-10-27'),(10081,69882,'1996-10-27','1997-10-27'),(10081,73516,'1997-10-27','1998-10-27'),(10081,74714,'1998-10-27','1999-10-27'),(10081,74734,'1999-10-27','2000-10-26'),(10081,75683,'2000-10-26','2001-10-26'),(10081,79351,'2001-10-26','9999-01-01'),(10082,48935,'1990-01-03','1990-01-15'),(10083,40000,'1987-03-31','1988-03-30'),(10083,44226,'1988-03-30','1989-03-30'),(10083,47900,'1989-03-30','1990-03-30'),(10083,49732,'1990-03-30','1991-03-30'),(10083,53520,'1991-03-30','1992-03-29'),(10083,54944,'1992-03-29','1993-03-29'),(10083,55469,'1993-03-29','1994-03-29'),(10083,58814,'1994-03-29','1995-03-29'),(10083,59286,'1995-03-29','1996-03-28'),(10083,62727,'1996-03-28','1997-03-28'),(10083,65435,'1997-03-28','1998-03-28'),(10083,67142,'1998-03-28','1999-03-28'),(10083,70495,'1999-03-28','2000-03-27'),(10083,73060,'2000-03-27','2001-03-27'),(10083,73756,'2001-03-27','2002-03-27'),(10083,77186,'2002-03-27','9999-01-01'),(10084,69811,'1995-12-15','1996-12-14'),(10084,74293,'1996-12-14','1997-12-14'),(10084,78493,'1997-12-14','1998-12-14'),(10084,81977,'1998-12-14','1999-12-14'),(10084,86412,'1999-12-14','2000-12-13'),(10084,90039,'2000-12-13','2001-12-13'),(10084,93621,'2001-12-13','9999-01-01'),(10085,40000,'1994-04-09','1995-04-09'),(10085,43030,'1995-04-09','1996-04-08'),(10085,46477,'1996-04-08','1997-04-08'),(10085,47707,'1997-04-08','1998-04-08'),(10085,50245,'1998-04-08','1999-04-08'),(10085,52683,'1999-04-08','2000-04-07'),(10085,55176,'2000-04-07','2001-04-07'),(10085,56905,'2001-04-07','2002-04-06'),(10085,60910,'2002-04-06','9999-01-01'),(10086,81613,'1992-02-19','1993-02-18'),(10086,81404,'1993-02-18','1994-02-18'),(10086,80991,'1994-02-18','1995-02-18'),(10086,80941,'1995-02-18','1996-02-18'),(10086,80934,'1996-02-18','1997-02-17'),(10086,84324,'1997-02-17','1998-02-17'),(10086,88049,'1998-02-17','1999-02-17'),(10086,90241,'1999-02-17','2000-02-17'),(10086,92125,'2000-02-17','2001-02-16'),(10086,96471,'2001-02-16','2002-02-16'),(10086,96333,'2002-02-16','9999-01-01'),(10087,96750,'1997-05-08','1998-05-08'),(10087,98200,'1998-05-08','1999-05-08'),(10087,98460,'1999-05-08','2000-05-07'),(10087,102651,'2000-05-07','2001-01-09'),(10088,65957,'1988-09-02','1989-09-02'),(10088,67837,'1989-09-02','1990-09-02'),(10088,70774,'1990-09-02','1991-09-02'),(10088,70709,'1991-09-02','1992-09-01'),(10088,73858,'1992-09-01','1993-09-01'),(10088,78302,'1993-09-01','1994-09-01'),(10088,79993,'1994-09-01','1995-09-01'),(10088,79519,'1995-09-01','1996-08-31'),(10088,83755,'1996-08-31','1997-08-31'),(10088,84024,'1997-08-31','1998-08-31'),(10088,87639,'1998-08-31','1999-08-31'),(10088,91296,'1999-08-31','2000-08-30'),(10088,95451,'2000-08-30','2001-08-30'),(10088,98003,'2001-08-30','9999-01-01'),(10089,56469,'1989-01-10','1990-01-10'),(10089,56165,'1990-01-10','1991-01-10'),(10089,56040,'1991-01-10','1992-01-10'),(10089,60332,'1992-01-10','1993-01-09'),(10089,63549,'1993-01-09','1994-01-09'),(10089,64105,'1994-01-09','1995-01-09'),(10089,65543,'1995-01-09','1996-01-09'),(10089,69267,'1996-01-09','1997-01-08'),(10089,70480,'1997-01-08','1998-01-08'),(10089,70147,'1998-01-08','1999-01-08'),(10089,71560,'1999-01-08','2000-01-08'),(10089,72862,'2000-01-08','2001-01-07'),(10089,74138,'2001-01-07','2002-01-07'),(10089,77955,'2002-01-07','9999-01-01'),(10090,44978,'1986-03-14','1987-03-14'),(10090,47905,'1987-03-14','1988-03-13'),(10090,48211,'1988-03-13','1989-03-13'),(10090,50694,'1989-03-13','1990-03-13'),(10090,54084,'1990-03-13','1991-03-13'),(10090,54095,'1991-03-13','1992-03-12'),(10090,56190,'1992-03-12','1993-03-12'),(10090,58604,'1993-03-12','1994-03-12'),(10090,61661,'1994-03-12','1995-03-12'),(10090,64839,'1995-03-12','1996-03-11'),(10090,69311,'1996-03-11','1997-03-11'),(10090,71274,'1997-03-11','1998-03-11'),(10090,71605,'1998-03-11','1999-03-11'),(10090,75401,'1999-03-11','1999-05-07'),(10091,40000,'1992-11-18','1993-11-18'),(10091,41181,'1993-11-18','1994-11-18'),(10091,43812,'1994-11-18','1995-11-18'),(10091,44046,'1995-11-18','1996-11-17'),(10091,45385,'1996-11-17','1997-11-17'),(10091,46467,'1997-11-17','1998-11-17'),(10091,49155,'1998-11-17','1999-11-17'),(10091,53157,'1999-11-17','2000-11-16'),(10091,55958,'2000-11-16','2001-11-16'),(10091,60014,'2001-11-16','9999-01-01'),(10092,53977,'1996-04-22','1997-04-22'),(10092,54672,'1997-04-22','1998-04-22'),(10092,58042,'1998-04-22','1999-04-22'),(10092,61969,'1999-04-22','2000-04-21'),(10092,62607,'2000-04-21','2001-04-21'),(10092,62323,'2001-04-21','2002-04-21'),(10092,66803,'2002-04-21','9999-01-01'),(10093,67856,'1997-06-08','1998-06-08'),(10093,70269,'1998-06-08','1999-06-08'),(10093,73951,'1999-06-08','2000-06-07'),(10093,76944,'2000-06-07','2001-06-07'),(10093,78796,'2001-06-07','2002-06-07'),(10093,82715,'2002-06-07','9999-01-01'),(10094,58001,'1987-04-18','1988-04-17'),(10094,61131,'1988-04-17','1989-04-17'),(10094,63147,'1989-04-17','1990-04-17'),(10094,66339,'1990-04-17','1991-04-17'),(10094,68848,'1991-04-17','1992-04-16'),(10094,72932,'1992-04-16','1993-04-16'),(10094,73585,'1993-04-16','1994-04-16'),(10094,73617,'1994-04-16','1995-04-16'),(10094,76830,'1995-04-16','1996-04-15'),(10094,80759,'1996-04-15','1997-04-15'),(10094,85225,'1997-04-15','1997-11-08'),(10095,63668,'1994-03-10','1995-03-10'),(10095,65982,'1995-03-10','1996-03-09'),(10095,66404,'1996-03-09','1997-03-09'),(10095,67641,'1997-03-09','1998-03-09'),(10095,70079,'1998-03-09','1999-03-09'),(10095,72169,'1999-03-09','2000-03-08'),(10095,74387,'2000-03-08','2001-03-08'),(10095,76900,'2001-03-08','2002-03-08'),(10095,80955,'2002-03-08','9999-01-01'),(10096,61395,'1999-01-23','2000-01-23'),(10096,63811,'2000-01-23','2001-01-22'),(10096,65962,'2001-01-22','2002-01-22'),(10096,68612,'2002-01-22','9999-01-01'),(10097,44886,'1990-09-15','1991-09-15'),(10097,47987,'1991-09-15','1992-09-14'),(10097,50406,'1992-09-14','1993-09-14'),(10097,51981,'1993-09-14','1994-09-14'),(10097,53075,'1994-09-14','1995-09-14'),(10097,53699,'1995-09-14','1996-09-13'),(10097,56903,'1996-09-13','1997-09-13'),(10097,59339,'1997-09-13','1998-09-13'),(10097,62690,'1998-09-13','1999-09-13'),(10097,65841,'1999-09-13','2000-09-12'),(10097,67846,'2000-09-12','2001-09-12'),(10097,70161,'2001-09-12','9999-01-01'),(10098,40000,'1985-05-13','1986-05-13'),(10098,41426,'1986-05-13','1987-05-13'),(10098,45147,'1987-05-13','1988-05-12'),(10098,48625,'1988-05-12','1989-05-12'),(10098,49228,'1989-05-12','1990-05-12'),(10098,51404,'1990-05-12','1991-05-12'),(10098,53646,'1991-05-12','1992-05-11'),(10098,56202,'1992-05-11','1992-12-11'),(10099,68781,'1988-10-18','1989-10-18'),(10099,70711,'1989-10-18','1990-10-18'),(10099,75094,'1990-10-18','1991-10-18'),(10099,78490,'1991-10-18','1992-10-17'),(10099,81154,'1992-10-17','1993-10-17'),(10099,81480,'1993-10-17','1994-10-17'),(10099,85032,'1994-10-17','1995-10-17'),(10099,84698,'1995-10-17','1996-10-16'),(10099,86038,'1996-10-16','1997-10-16'),(10099,86212,'1997-10-16','1998-10-16'),(10099,89257,'1998-10-16','1999-10-16'),(10099,93297,'1999-10-16','2000-10-15'),(10099,95842,'2000-10-15','2001-10-15'),(10099,98538,'2001-10-15','9999-01-01'),(110000,40000,'1989-06-22','1990-06-22'),(110000,39955,'1990-06-22','1991-06-22'),(110000,41355,'1991-06-22','1992-06-21'),(110000,42618,'1992-06-21','1993-06-21'),(110000,42482,'1993-06-21','1994-06-21'),(110000,42089,'1994-06-21','1995-06-21'),(110000,41722,'1995-06-21','1996-06-20'),(110000,44767,'1996-06-20','1997-06-20'),(110000,46341,'1997-06-20','1998-06-20'),(110000,47988,'1998-06-20','1999-06-20'),(110000,52056,'1999-06-20','2000-06-19'),(110000,51921,'2000-06-19','2001-06-19'),(110000,51726,'2001-06-19','2002-06-19'),(110000,53589,'2002-06-19','9999-01-01'),(110022,71166,'1985-01-01','1986-01-01'),(110022,71820,'1986-01-01','1987-01-01'),(110022,72970,'1987-01-01','1988-01-01'),(110022,76211,'1988-01-01','1988-12-31'),(110022,78443,'1988-12-31','1989-12-31'),(110022,81784,'1989-12-31','1990-12-31'),(110022,82871,'1990-12-31','1991-12-31'),(110022,86797,'1991-12-31','1992-12-30'),(110022,89204,'1992-12-30','1993-12-30'),(110022,92165,'1993-12-30','1994-12-30'),(110022,94286,'1994-12-30','1995-12-30'),(110022,96647,'1995-12-30','1996-12-29'),(110022,97604,'1996-12-29','1997-12-29'),(110022,98843,'1997-12-29','1998-12-29'),(110022,100014,'1998-12-29','1999-12-29'),(110022,100592,'1999-12-29','2000-12-28'),(110022,104485,'2000-12-28','2001-12-28'),(110022,108407,'2001-12-28','9999-01-01'),(110039,69941,'1986-04-12','1987-04-12'),(110039,71574,'1987-04-12','1988-04-11'),(110039,73553,'1988-04-11','1989-04-11'),(110039,75124,'1989-04-11','1990-04-11'),(110039,78405,'1990-04-11','1991-04-11'),(110039,81872,'1991-04-11','1992-04-10'),(110039,83722,'1992-04-10','1993-04-10'),(110039,85016,'1993-04-10','1994-04-10'),(110039,85421,'1994-04-10','1995-04-10'),(110039,88503,'1995-04-10','1996-04-09'),(110039,92469,'1996-04-09','1997-04-09'),(110039,94250,'1997-04-09','1998-04-09'),(110039,95993,'1998-04-09','1999-04-09'),(110039,100350,'1999-04-09','2000-04-08'),(110039,101901,'2000-04-08','2001-04-08'),(110039,104115,'2001-04-08','2002-04-08'),(110039,106491,'2002-04-08','9999-01-01'),(110085,60026,'1985-01-01','1986-01-01'),(110085,61808,'1986-01-01','1987-01-01'),(110085,62003,'1987-01-01','1988-01-01'),(110085,64775,'1988-01-01','1988-12-31'),(110085,65105,'1988-12-31','1989-12-31'),(110085,66790,'1989-12-31','1990-12-31'),(110085,67827,'1990-12-31','1991-12-31'),(110085,68195,'1991-12-31','1992-12-30'),(110085,70253,'1992-12-30','1993-12-30'),(110085,72727,'1993-12-30','1994-12-30'),(110085,72335,'1994-12-30','1995-12-30'),(110085,75173,'1995-12-30','1996-12-29'),(110085,79066,'1996-12-29','1997-12-29'),(110085,79152,'1997-12-29','1998-12-29'),(110085,83440,'1998-12-29','1999-12-29'),(110085,85394,'1999-12-29','2000-12-28'),(110085,88298,'2000-12-28','2001-12-28'),(110085,88443,'2001-12-28','9999-01-01'),(110114,52070,'1985-01-14','1986-01-14'),(110114,55297,'1986-01-14','1987-01-14'),(110114,55767,'1987-01-14','1988-01-14'),(110114,58800,'1988-01-14','1989-01-13'),(110114,62669,'1989-01-13','1990-01-13'),(110114,62593,'1990-01-13','1991-01-13'),(110114,63447,'1991-01-13','1992-01-13'),(110114,67322,'1992-01-13','1993-01-12'),(110114,67761,'1993-01-12','1994-01-12'),(110114,68166,'1994-01-12','1995-01-12'),(110114,71652,'1995-01-12','1996-01-12'),(110114,71375,'1996-01-12','1997-01-11'),(110114,75708,'1997-01-11','1998-01-11'),(110114,79782,'1998-01-11','1999-01-11'),(110114,79679,'1999-01-11','2000-01-11'),(110114,80423,'2000-01-11','2001-01-10'),(110114,82594,'2001-01-10','2002-01-10'),(110114,83457,'2002-01-10','9999-01-01'),(110183,48291,'1985-01-01','1986-01-01'),(110183,50319,'1986-01-01','1987-01-01'),(110183,51622,'1987-01-01','1988-01-01'),(110183,51298,'1988-01-01','1988-12-31'),(110183,55582,'1988-12-31','1989-12-31'),(110183,57197,'1989-12-31','1990-12-31'),(110183,59629,'1990-12-31','1991-12-31'),(110183,60356,'1991-12-31','1992-12-30'),(110183,63677,'1992-12-30','1993-12-30'),(110183,63190,'1993-12-30','1994-12-30'),(110183,64652,'1994-12-30','1995-12-30'),(110183,66530,'1995-12-30','1996-12-29'),(110183,67423,'1996-12-29','1997-12-29'),(110183,70638,'1997-12-29','1998-12-29'),(110183,72240,'1998-12-29','1999-12-29'),(110183,74584,'1999-12-29','2000-12-28'),(110183,77367,'2000-12-28','2001-12-28'),(110183,79229,'2001-12-28','9999-01-01'),(110228,40000,'1985-08-04','1986-08-04'),(110228,43069,'1986-08-04','1987-08-04'),(110228,44284,'1987-08-04','1988-08-03'),(110228,47816,'1988-08-03','1989-08-03'),(110228,49541,'1989-08-03','1990-08-03'),(110228,49547,'1990-08-03','1991-08-03'),(110228,50122,'1991-08-03','1992-08-02'),(110228,49867,'1992-08-02','1993-08-02'),(110228,51472,'1993-08-02','1994-08-02'),(110228,55445,'1994-08-02','1995-08-02'),(110228,55733,'1995-08-02','1996-08-01'),(110228,57431,'1996-08-01','1997-08-01'),(110228,58932,'1997-08-01','1998-08-01'),(110228,59259,'1998-08-01','1999-08-01'),(110228,61684,'1999-08-01','2000-07-31'),(110228,62596,'2000-07-31','2001-07-31'),(110228,62276,'2001-07-31','2002-07-31'),(110228,65400,'2002-07-31','9999-01-01'),(110303,42093,'1985-01-01','1986-01-01'),(110303,42808,'1986-01-01','1987-01-01'),(110303,42368,'1987-01-01','1988-01-01'),(110303,44954,'1988-01-01','1988-12-31'),(110303,47446,'1988-12-31','1989-12-31'),(110303,50390,'1989-12-31','1990-12-31'),(110303,52603,'1990-12-31','1991-12-31'),(110303,56607,'1991-12-31','1992-12-30'),(110303,57246,'1992-12-30','1993-12-30'),(110303,59135,'1993-12-30','1994-12-30'),(110303,60568,'1994-12-30','1995-12-30'),(110303,60162,'1995-12-30','1996-12-29'),(110303,63859,'1996-12-29','1997-12-29'),(110303,67166,'1997-12-29','1998-12-29'),(110303,68314,'1998-12-29','1999-12-29'),(110303,68483,'1999-12-29','2000-12-28'),(110303,70157,'2000-12-28','2001-12-28'),(110303,72583,'2001-12-28','9999-01-01'),(110344,50365,'1985-11-22','1986-11-22'),(110344,50953,'1986-11-22','1987-11-22'),(110344,53052,'1987-11-22','1988-11-21'),(110344,55704,'1988-11-21','1989-11-21'),(110344,59323,'1989-11-21','1990-11-21'),(110344,61115,'1990-11-21','1991-11-21'),(110344,61937,'1991-11-21','1992-11-20'),(110344,62145,'1992-11-20','1993-11-20'),(110344,63370,'1993-11-20','1994-11-20'),(110344,63705,'1994-11-20','1995-11-20'),(110344,67427,'1995-11-20','1996-11-19'),(110344,67180,'1996-11-19','1997-11-19'),(110344,70176,'1997-11-19','1998-11-19'),(110344,72174,'1998-11-19','1999-11-19'),(110344,73754,'1999-11-19','2000-11-18'),(110344,73864,'2000-11-18','2001-11-18'),(110344,75121,'2001-11-18','9999-01-01'),(110386,40000,'1988-10-14','1989-10-14'),(110386,42536,'1989-10-14','1990-10-14'),(110386,45922,'1990-10-14','1991-10-14'),(110386,47117,'1991-10-14','1992-10-13'),(110386,47794,'1992-10-13','1993-10-13'),(110386,51381,'1993-10-13','1994-10-13'),(110386,53926,'1994-10-13','1995-10-13'),(110386,56028,'1995-10-13','1996-10-12'),(110386,56528,'1996-10-12','1997-10-12'),(110386,56530,'1997-10-12','1998-10-12'),(110386,59960,'1998-10-12','1999-10-12'),(110386,61207,'1999-10-12','2000-10-11'),(110386,64392,'2000-10-11','2001-10-11'),(110386,66995,'2001-10-11','9999-01-01'),(110420,40000,'1992-02-05','1993-02-04'),(110420,40762,'1993-02-04','1994-02-04'),(110420,42236,'1994-02-04','1995-02-04'),(110420,42891,'1995-02-04','1996-02-04'),(110420,43304,'1996-02-04','1997-02-03'),(110420,43862,'1997-02-03','1998-02-03'),(110420,47053,'1998-02-03','1999-02-03'),(110420,50868,'1999-02-03','2000-02-03'),(110420,53773,'2000-02-03','2001-02-02'),(110420,53978,'2001-02-02','2002-02-02'),(110420,56654,'2002-02-02','9999-01-01'),(110511,48626,'1985-01-01','1986-01-01'),(110511,49148,'1986-01-01','1987-01-01'),(110511,49877,'1987-01-01','1988-01-01'),(110511,51690,'1988-01-01','1988-12-31'),(110511,52342,'1988-12-31','1989-12-31'),(110511,54300,'1989-12-31','1990-12-31'),(110511,56962,'1990-12-31','1991-12-31'),(110511,59070,'1991-12-31','1992-12-30'),(110511,62206,'1992-12-30','1993-12-30'),(110511,64431,'1993-12-30','1994-12-30'),(110511,66656,'1994-12-30','1995-12-30'),(110511,70698,'1995-12-30','1996-12-29'),(110511,73013,'1996-12-29','1997-12-29'),(110511,74056,'1997-12-29','1998-12-29'),(110511,73614,'1998-12-29','1999-12-29'),(110511,73350,'1999-12-29','2000-12-28'),(110511,73285,'2000-12-28','2001-12-28'),(110511,72903,'2001-12-28','9999-01-01'),(110567,40000,'1986-10-21','1987-10-21'),(110567,42616,'1987-10-21','1988-10-20'),(110567,44173,'1988-10-20','1989-10-20'),(110567,48434,'1989-10-20','1990-10-20'),(110567,48535,'1990-10-20','1991-10-20'),(110567,50276,'1991-10-20','1992-10-19'),(110567,53205,'1992-10-19','1993-10-19'),(110567,57384,'1993-10-19','1994-10-19'),(110567,56966,'1994-10-19','1995-10-19'),(110567,59878,'1995-10-19','1996-10-18'),(110567,62829,'1996-10-18','1997-10-18'),(110567,63249,'1997-10-18','1998-10-18'),(110567,63487,'1998-10-18','1999-10-18'),(110567,66307,'1999-10-18','2000-10-17'),(110567,70300,'2000-10-17','2001-10-17'),(110567,74510,'2001-10-17','9999-01-01'),(110725,61357,'1985-01-01','1986-01-01'),(110725,64407,'1986-01-01','1987-01-01'),(110725,67358,'1987-01-01','1988-01-01'),(110725,71627,'1988-01-01','1988-12-31'),(110725,74493,'1988-12-31','1989-12-31'),(110725,78015,'1989-12-31','1990-12-31'),(110725,78503,'1990-12-31','1991-12-31'),(110725,81267,'1991-12-31','1992-12-30'),(110725,81256,'1992-12-30','1993-12-30'),(110725,85203,'1993-12-30','1994-12-30'),(110725,85990,'1994-12-30','1995-12-30'),(110725,87997,'1995-12-30','1996-12-29'),(110725,87949,'1996-12-29','1997-12-29'),(110725,91012,'1997-12-29','1998-12-29'),(110725,90529,'1998-12-29','1999-12-29'),(110725,90487,'1999-12-29','2000-12-28'),(110725,92779,'2000-12-28','2001-12-28'),(110725,93193,'2001-12-28','9999-01-01'),(110765,40055,'1989-01-07','1990-01-07'),(110765,42398,'1990-01-07','1991-01-07'),(110765,43017,'1991-01-07','1992-01-07'),(110765,44539,'1992-01-07','1993-01-06'),(110765,48835,'1993-01-06','1994-01-06'),(110765,50072,'1994-01-06','1995-01-06'),(110765,54169,'1995-01-06','1996-01-06'),(110765,55726,'1996-01-06','1997-01-05'),(110765,59701,'1997-01-05','1998-01-05'),(110765,63715,'1998-01-05','1999-01-05'),(110765,64237,'1999-01-05','2000-01-05'),(110765,65921,'2000-01-05','2001-01-04'),(110765,69671,'2001-01-04','2002-01-04'),(110765,72432,'2002-01-04','9999-01-01'),(110800,50457,'1986-08-12','1987-08-12'),(110800,54079,'1987-08-12','1988-08-11'),(110800,56597,'1988-08-11','1989-08-11'),(110800,60127,'1989-08-11','1990-08-11'),(110800,62279,'1990-08-11','1991-08-11'),(110800,66053,'1991-08-11','1992-08-10'),(110800,66942,'1992-08-10','1993-08-10'),(110800,69751,'1993-08-10','1994-08-10'),(110800,70257,'1994-08-10','1995-08-10'),(110800,72277,'1995-08-10','1996-08-09'),(110800,74254,'1996-08-09','1997-08-09'),(110800,76583,'1997-08-09','1998-08-09'),(110800,76174,'1998-08-09','1999-08-09'),(110800,77088,'1999-08-09','2000-08-08'),(110800,77384,'2000-08-08','2001-08-08'),(110800,77626,'2001-08-08','9999-01-01'),(110854,45169,'1989-06-09','1990-06-09'),(110854,49012,'1990-06-09','1991-06-09'),(110854,49045,'1991-06-09','1992-06-08'),(110854,52367,'1992-06-08','1993-06-08'),(110854,54681,'1993-06-08','1994-06-08'),(110854,55346,'1994-06-08','1995-06-08'),(110854,58984,'1995-06-08','1996-06-07'),(110854,61647,'1996-06-07','1997-06-07'),(110854,65172,'1997-06-07','1998-06-07'),(110854,66061,'1998-06-07','1999-06-07'),(110854,66367,'1999-06-07','2000-06-06'),(110854,69035,'2000-06-06','2001-06-06'),(110854,70518,'2001-06-06','2002-06-06'),(110854,72876,'2002-06-06','9999-01-01'),(111035,71612,'1985-01-01','1986-01-01'),(111035,75905,'1986-01-01','1987-01-01'),(111035,76176,'1987-01-01','1988-01-01'),(111035,76383,'1988-01-01','1988-12-31'),(111035,76143,'1988-12-31','1989-12-31'),(111035,77170,'1989-12-31','1990-12-31'),(111035,79900,'1990-12-31','1991-12-31'),(111035,81051,'1991-12-31','1992-12-30'),(111035,81606,'1992-12-30','1993-12-30'),(111035,85997,'1993-12-30','1994-12-30'),(111035,87575,'1994-12-30','1995-12-30'),(111035,89441,'1995-12-30','1996-12-29'),(111035,89286,'1996-12-29','1997-12-29'),(111035,90704,'1997-12-29','1998-12-29'),(111035,92487,'1998-12-29','1999-12-29'),(111035,93765,'1999-12-29','2000-12-28'),(111035,95290,'2000-12-28','2001-12-28'),(111035,95873,'2001-12-28','9999-01-01'),(111133,71148,'1986-12-30','1987-12-30'),(111133,70787,'1987-12-30','1988-12-29'),(111133,75190,'1988-12-29','1989-12-29'),(111133,79069,'1989-12-29','1990-12-29'),(111133,82205,'1990-12-29','1991-12-29'),(111133,83536,'1991-12-29','1992-12-28'),(111133,86775,'1992-12-28','1993-12-28'),(111133,86880,'1993-12-28','1994-12-28'),(111133,89709,'1994-12-28','1995-12-28'),(111133,91207,'1995-12-28','1996-12-27'),(111133,90907,'1996-12-27','1997-12-27'),(111133,93790,'1997-12-27','1998-12-27'),(111133,96726,'1998-12-27','1999-12-27'),(111133,99072,'1999-12-27','2000-12-26'),(111133,99766,'2000-12-26','2001-12-26'),(111133,101987,'2001-12-26','9999-01-01'),(111400,72446,'1985-01-01','1986-01-01'),(111400,73142,'1986-01-01','1987-01-01'),(111400,77187,'1987-01-01','1988-01-01'),(111400,77104,'1988-01-01','1988-12-31'),(111400,79369,'1988-12-31','1989-12-31'),(111400,82534,'1989-12-31','1990-12-31'),(111400,83722,'1990-12-31','1991-12-31'),(111400,84159,'1991-12-31','1992-12-30'),(111400,84862,'1992-12-30','1993-12-30'),(111400,84867,'1993-12-30','1994-12-30'),(111400,87959,'1994-12-30','1995-12-30'),(111400,89902,'1995-12-30','1996-12-29'),(111400,93538,'1996-12-29','1997-12-29'),(111400,96457,'1997-12-29','1998-12-29'),(111400,99032,'1998-12-29','1999-12-29'),(111400,100416,'1999-12-29','2000-12-28'),(111400,99971,'2000-12-28','2001-12-28'),(111400,103244,'2001-12-28','9999-01-01'),(111534,48077,'1988-01-31','1989-01-30'),(111534,51718,'1989-01-30','1990-01-30'),(111534,52484,'1990-01-30','1991-01-30'),(111534,55619,'1991-01-30','1992-01-30'),(111534,59574,'1992-01-30','1993-01-29'),(111534,62784,'1993-01-29','1994-01-29'),(111534,63875,'1994-01-29','1995-01-29'),(111534,66978,'1995-01-29','1996-01-29'),(111534,70649,'1996-01-29','1997-01-28'),(111534,71234,'1997-01-28','1998-01-28'),(111534,73020,'1998-01-28','1999-01-28'),(111534,76352,'1999-01-28','2000-01-28'),(111534,78032,'2000-01-28','2001-01-27'),(111534,78961,'2001-01-27','2002-01-27'),(111534,79393,'2002-01-27','9999-01-01'),(111692,40000,'1985-01-01','1986-01-01'),(111692,42706,'1986-01-01','1987-01-01'),(111692,46154,'1987-01-01','1988-01-01'),(111692,46488,'1988-01-01','1988-12-31'),(111692,49839,'1988-12-31','1989-12-31'),(111692,51810,'1989-12-31','1990-12-31'),(111692,54618,'1990-12-31','1991-12-31'),(111692,55108,'1991-12-31','1992-12-30'),(111692,58465,'1992-12-30','1993-12-30'),(111692,58423,'1993-12-30','1994-12-30'),(111692,62441,'1994-12-30','1995-12-30'),(111692,62541,'1995-12-30','1996-12-29'),(111692,64553,'1996-12-29','1997-12-29'),(111692,66715,'1997-12-29','1998-12-29'),(111692,69217,'1998-12-29','1999-12-29'),(111692,72573,'1999-12-29','2000-12-28'),(111692,72421,'2000-12-28','2001-12-28'),(111692,73953,'2001-12-28','9999-01-01'),(111784,40000,'1988-02-12','1989-02-11'),(111784,41189,'1989-02-11','1990-02-11'),(111784,44026,'1990-02-11','1991-02-11'),(111784,48315,'1991-02-11','1992-02-11'),(111784,48079,'1992-02-11','1993-02-10'),(111784,48181,'1993-02-10','1994-02-10'),(111784,48273,'1994-02-10','1995-02-10'),(111784,49770,'1995-02-10','1996-02-10'),(111784,51900,'1996-02-10','1997-02-09'),(111784,52121,'1997-02-09','1998-02-09'),(111784,54187,'1998-02-09','1999-02-09'),(111784,54138,'1999-02-09','2000-02-09'),(111784,54183,'2000-02-09','2001-02-08'),(111784,57946,'2001-02-08','2002-02-08'),(111784,58189,'2002-02-08','9999-01-01'),(111877,53846,'1991-08-17','1992-08-16'),(111877,54158,'1992-08-16','1993-08-16'),(111877,57342,'1993-08-16','1994-08-16'),(111877,59020,'1994-08-16','1995-08-16'),(111877,61093,'1995-08-16','1996-08-15'),(111877,64189,'1996-08-15','1997-08-15'),(111877,66104,'1997-08-15','1998-08-15'),(111877,66678,'1998-08-15','1999-08-15'),(111877,67470,'1999-08-15','2000-08-14'),(111877,70158,'2000-08-14','2001-08-14'),(111877,71406,'2001-08-14','9999-01-01'),(111939,40000,'1989-07-10','1990-07-10'),(111939,40285,'1990-07-10','1991-07-10'),(111939,40514,'1991-07-10','1992-07-09'),(111939,44046,'1992-07-09','1993-07-09'),(111939,48317,'1993-07-09','1994-07-09'),(111939,48325,'1994-07-09','1995-07-09'),(111939,48905,'1995-07-09','1996-07-08'),(111939,50555,'1996-07-08','1997-07-08'),(111939,51812,'1997-07-08','1998-07-08'),(111939,52051,'1998-07-08','1999-07-08'),(111939,56454,'1999-07-08','2000-07-07'),(111939,58698,'2000-07-07','2001-07-07'),(111939,58968,'2001-07-07','2002-07-07'),(111939,58745,'2002-07-07','9999-01-01');
/*!40000 ALTER TABLE `salaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `titles`
--

DROP TABLE IF EXISTS `titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `titles` (
  `emp_no` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date DEFAULT NULL,
  PRIMARY KEY (`emp_no`,`title`,`from_date`),
  CONSTRAINT `titles_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `titles`
--

LOCK TABLES `titles` WRITE;
/*!40000 ALTER TABLE `titles` DISABLE KEYS */;
INSERT INTO `titles` VALUES (10001,'Senior Engineer','1986-06-26','9999-01-01'),(10002,'Staff','1996-08-03','9999-01-01'),(10003,'Senior Engineer','1995-12-03','9999-01-01'),(10004,'Engineer','1986-12-01','1995-12-01'),(10004,'Senior Engineer','1995-12-01','9999-01-01'),(10005,'Senior Staff','1996-09-12','9999-01-01'),(10005,'Staff','1989-09-12','1996-09-12'),(10006,'Senior Engineer','1990-08-05','9999-01-01'),(10007,'Senior Staff','1996-02-11','9999-01-01'),(10007,'Staff','1989-02-10','1996-02-11'),(10008,'Assistant Engineer','1998-03-11','2000-07-31'),(10009,'Assistant Engineer','1985-02-18','1990-02-18'),(10009,'Engineer','1990-02-18','1995-02-18'),(10009,'Senior Engineer','1995-02-18','9999-01-01'),(10010,'Engineer','1996-11-24','9999-01-01'),(10011,'Staff','1990-01-22','1996-11-09'),(10012,'Engineer','1992-12-18','2000-12-18'),(10012,'Senior Engineer','2000-12-18','9999-01-01'),(10013,'Senior Staff','1985-10-20','9999-01-01'),(10014,'Engineer','1993-12-29','9999-01-01'),(10015,'Senior Staff','1992-09-19','1993-08-22'),(10016,'Staff','1998-02-11','9999-01-01'),(10017,'Senior Staff','2000-08-03','9999-01-01'),(10017,'Staff','1993-08-03','2000-08-03'),(10018,'Engineer','1987-04-03','1995-04-03'),(10018,'Senior Engineer','1995-04-03','9999-01-01'),(10019,'Staff','1999-04-30','9999-01-01'),(10020,'Engineer','1997-12-30','9999-01-01'),(10021,'Technique Leader','1988-02-10','2002-07-15'),(10022,'Engineer','1999-09-03','9999-01-01'),(10023,'Engineer','1999-09-27','9999-01-01'),(10024,'Assistant Engineer','1998-06-14','9999-01-01'),(10025,'Technique Leader','1987-08-17','1997-10-15'),(10026,'Engineer','1995-03-20','2001-03-19'),(10026,'Senior Engineer','2001-03-19','9999-01-01'),(10027,'Engineer','1995-04-02','2001-04-01'),(10027,'Senior Engineer','2001-04-01','9999-01-01'),(10028,'Engineer','1991-10-22','1998-04-06'),(10029,'Engineer','1991-09-18','2000-09-17'),(10029,'Senior Engineer','2000-09-17','9999-01-01'),(10030,'Engineer','1994-02-17','2001-02-17'),(10030,'Senior Engineer','2001-02-17','9999-01-01'),(10031,'Engineer','1991-09-01','1998-09-01'),(10031,'Senior Engineer','1998-09-01','9999-01-01'),(10032,'Engineer','1990-06-20','1995-06-20'),(10032,'Senior Engineer','1995-06-20','9999-01-01'),(10033,'Technique Leader','1987-03-18','1993-03-24'),(10034,'Staff','1995-04-12','1999-10-31'),(10035,'Engineer','1988-09-05','1996-09-05'),(10035,'Senior Engineer','1996-09-05','9999-01-01'),(10036,'Senior Staff','1992-04-28','9999-01-01'),(10037,'Engineer','1990-12-05','1995-12-05'),(10037,'Senior Engineer','1995-12-05','9999-01-01'),(10038,'Senior Staff','1996-09-20','9999-01-01'),(10038,'Staff','1989-09-20','1996-09-20'),(10039,'Senior Staff','1997-01-18','9999-01-01'),(10039,'Staff','1988-01-19','1997-01-18'),(10040,'Engineer','1993-02-14','1999-02-14'),(10040,'Senior Engineer','1999-02-14','9999-01-01'),(10041,'Senior Staff','1998-11-12','9999-01-01'),(10041,'Staff','1989-11-12','1998-11-12'),(10042,'Senior Staff','2000-03-21','2000-08-10'),(10042,'Staff','1993-03-21','2000-03-21'),(10043,'Engineer','1990-10-20','1997-10-20'),(10043,'Senior Engineer','1997-10-20','9999-01-01'),(10044,'Technique Leader','1994-05-21','9999-01-01'),(10045,'Engineer','1996-11-16','9999-01-01'),(10046,'Senior Staff','2000-06-20','9999-01-01'),(10046,'Staff','1992-06-20','2000-06-20'),(10047,'Engineer','1989-03-31','1998-03-31'),(10047,'Senior Engineer','1998-03-31','9999-01-01'),(10048,'Engineer','1985-02-24','1987-01-27'),(10049,'Senior Staff','2000-05-04','9999-01-01'),(10049,'Staff','1992-05-04','2000-05-04'),(10050,'Senior Staff','1999-12-25','9999-01-01'),(10050,'Staff','1990-12-25','1999-12-25'),(10051,'Engineer','1992-10-15','1998-10-15'),(10051,'Senior Engineer','1998-10-15','9999-01-01'),(10052,'Senior Staff','2002-01-31','9999-01-01'),(10052,'Staff','1997-01-31','2002-01-31'),(10053,'Senior Staff','1994-11-13','9999-01-01'),(10054,'Senior Staff','2000-07-28','9999-01-01'),(10054,'Staff','1995-07-29','2000-07-28'),(10055,'Staff','1992-04-27','1995-07-22'),(10056,'Engineer','1990-02-01','1999-02-01'),(10056,'Senior Engineer','1999-02-01','9999-01-01'),(10057,'Engineer','1992-01-15','2000-01-15'),(10057,'Senior Engineer','2000-01-15','9999-01-01'),(10058,'Senior Staff','1988-04-25','9999-01-01'),(10059,'Senior Staff','1991-06-26','9999-01-01'),(10060,'Senior Staff','1996-05-28','9999-01-01'),(10060,'Staff','1989-05-28','1996-05-28'),(10061,'Senior Staff','1989-12-02','9999-01-01'),(10062,'Engineer','1991-08-30','1999-08-30'),(10062,'Senior Engineer','1999-08-30','9999-01-01'),(10063,'Senior Engineer','1989-04-08','9999-01-01'),(10064,'Staff','1985-11-20','1992-03-02'),(10065,'Engineer','1998-05-24','9999-01-01'),(10066,'Assistant Engineer','1986-02-26','1992-02-26'),(10066,'Engineer','1992-02-26','1998-02-25'),(10066,'Senior Engineer','1998-02-25','9999-01-01'),(10067,'Engineer','1987-03-04','1996-03-03'),(10067,'Senior Engineer','1996-03-03','9999-01-01'),(10068,'Senior Staff','1996-08-06','9999-01-01'),(10068,'Staff','1987-08-07','1996-08-06'),(10069,'Technique Leader','1992-06-14','9999-01-01'),(10070,'Technique Leader','1985-10-14','9999-01-01'),(10071,'Staff','1995-08-05','9999-01-01'),(10072,'Engineer','1989-05-21','1995-05-21'),(10072,'Senior Engineer','1995-05-21','9999-01-01'),(10073,'Engineer','1998-02-02','1998-02-22'),(10074,'Technique Leader','1990-08-13','9999-01-01'),(10075,'Senior Engineer','1988-05-17','2001-01-15'),(10076,'Senior Engineer','1996-07-15','9999-01-01'),(10077,'Staff','1994-12-23','9999-01-01'),(10078,'Engineer','1994-09-29','9999-01-01'),(10079,'Technique Leader','1995-12-13','9999-01-01'),(10080,'Senior Staff','2001-09-28','9999-01-01'),(10080,'Staff','1994-09-28','2001-09-28'),(10081,'Engineer','1986-10-30','1991-10-30'),(10081,'Senior Engineer','1991-10-30','9999-01-01'),(10082,'Staff','1990-01-03','1990-01-15'),(10083,'Engineer','1987-03-31','1994-03-31'),(10083,'Senior Engineer','1994-03-31','9999-01-01'),(10084,'Engineer','1995-12-15','2001-12-14'),(10084,'Senior Engineer','2001-12-14','9999-01-01'),(10085,'Senior Engineer','1994-04-09','9999-01-01'),(10086,'Senior Staff','1999-02-19','9999-01-01'),(10086,'Staff','1992-02-19','1999-02-19'),(10087,'Staff','1997-05-08','2001-01-09'),(10088,'Senior Staff','1993-09-02','9999-01-01'),(10088,'Staff','1988-09-02','1993-09-02'),(10089,'Senior Staff','1996-01-11','9999-01-01'),(10089,'Staff','1989-01-10','1996-01-11'),(10090,'Senior Engineer','1986-03-14','1999-05-07'),(10091,'Engineer','1992-11-18','2001-11-18'),(10091,'Senior Engineer','2001-11-18','9999-01-01'),(10092,'Engineer','1996-04-22','9999-01-01'),(10093,'Staff','1997-06-08','9999-01-01'),(10094,'Senior Staff','1987-04-18','1997-11-08'),(10095,'Senior Staff','2000-03-09','9999-01-01'),(10095,'Staff','1994-03-10','2000-03-09'),(10096,'Engineer','1999-01-23','9999-01-01'),(10097,'Senior Staff','1996-09-14','9999-01-01'),(10097,'Staff','1990-09-15','1996-09-14'),(10098,'Engineer','1985-05-13','1992-05-13'),(10098,'Senior Engineer','1992-05-13','1992-12-11'),(10099,'Senior Staff','1995-10-19','9999-01-01'),(10099,'Staff','1988-10-18','1995-10-19'),(110000,'Assistant Engineer','1989-06-22','1998-06-22'),(110000,'Engineer','1998-06-22','9999-01-01'),(110022,'Manager','1985-01-01','1991-10-01'),(110022,'Senior Staff','1991-10-01','9999-01-01'),(110039,'Manager','1991-10-01','9999-01-01'),(110039,'Senior Staff','1986-04-12','1991-10-01'),(110085,'Manager','1985-01-01','1989-12-17'),(110085,'Senior Staff','1989-12-17','9999-01-01'),(110114,'Manager','1989-12-17','9999-01-01'),(110114,'Senior Staff','1985-01-14','1989-12-17'),(110183,'Manager','1985-01-01','1992-03-21'),(110183,'Staff','1992-03-21','9999-01-01'),(110228,'Manager','1992-03-21','9999-01-01'),(110228,'Senior Staff','1985-08-04','1992-03-21'),(110303,'Manager','1985-01-01','1988-09-09'),(110303,'Technique Leader','1988-09-09','9999-01-01'),(110344,'Manager','1988-09-09','1992-08-02'),(110344,'Senior Engineer','1985-11-22','1988-09-09'),(110344,'Technique Leader','1992-08-02','9999-01-01'),(110386,'Manager','1992-08-02','1996-08-30'),(110386,'Technique Leader','1988-10-14','1992-08-02'),(110386,'Technique Leader','1996-08-30','9999-01-01'),(110420,'Manager','1996-08-30','9999-01-01'),(110420,'Senior Engineer','1992-02-05','1996-08-30'),(110511,'Manager','1985-01-01','1992-04-25'),(110511,'Technique Leader','1992-04-25','9999-01-01'),(110567,'Manager','1992-04-25','9999-01-01'),(110567,'Technique Leader','1986-10-21','1992-04-25'),(110725,'Manager','1985-01-01','1989-05-06'),(110725,'Technique Leader','1989-05-06','9999-01-01'),(110765,'Manager','1989-05-06','1991-09-12'),(110765,'Technique Leader','1989-01-07','1989-05-06'),(110765,'Technique Leader','1991-09-12','9999-01-01'),(110800,'Manager','1991-09-12','1994-06-28'),(110800,'Senior Engineer','1986-08-12','1991-09-12'),(110800,'Technique Leader','1994-06-28','9999-01-01'),(110854,'Manager','1994-06-28','9999-01-01'),(110854,'Technique Leader','1989-06-09','1994-06-28'),(111035,'Manager','1985-01-01','1991-03-07'),(111035,'Staff','1991-03-07','9999-01-01'),(111133,'Manager','1991-03-07','9999-01-01'),(111133,'Staff','1986-12-30','1991-03-07'),(111400,'Manager','1985-01-01','1991-04-08'),(111400,'Staff','1991-04-08','9999-01-01'),(111534,'Manager','1991-04-08','9999-01-01'),(111534,'Senior Staff','1988-01-31','1991-04-08'),(111692,'Manager','1985-01-01','1988-10-17'),(111692,'Staff','1988-10-17','9999-01-01'),(111784,'Manager','1988-10-17','1992-09-08'),(111784,'Senior Staff','1988-02-12','1988-10-17'),(111784,'Staff','1992-09-08','9999-01-01'),(111877,'Manager','1992-09-08','1996-01-03'),(111877,'Senior Staff','1991-08-17','1992-09-08'),(111877,'Staff','1996-01-03','9999-01-01'),(111939,'Manager','1996-01-03','9999-01-01'),(111939,'Senior Staff','1989-07-10','1996-01-03');
/*!40000 ALTER TABLE `titles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `dbutcher`
--

USE `dbutcher`;

--
-- Final view structure for view `dept_emp_latest_date`
--

/*!50001 DROP TABLE IF EXISTS `dept_emp_latest_date`*/;
/*!50001 DROP VIEW IF EXISTS `dept_emp_latest_date`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`dbutcher`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `dept_emp_latest_date` AS select `dept_emp`.`emp_no` AS `emp_no`,max(`dept_emp`.`from_date`) AS `from_date`,max(`dept_emp`.`to_date`) AS `to_date` from `dept_emp` group by `dept_emp`.`emp_no` */;
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

-- Dump completed on 2022-07-19  8:26:35
