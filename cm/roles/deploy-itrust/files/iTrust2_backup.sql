-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: localhost    Database: iTrust2
-- ------------------------------------------------------
-- Server version	5.7.29-0ubuntu0.18.04.1

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
-- Table structure for table `AppointmentRequests`
--

DROP TABLE IF EXISTS `AppointmentRequests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AppointmentRequests` (
  `id` bigint(20) NOT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `hcp_id` varchar(100) DEFAULT NULL,
  `patient_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKlpa5tri2ufo8t7bt7nusa1pss` (`hcp_id`),
  KEY `FKo65c0ooyqou8d1x56y37u1nau` (`patient_id`),
  CONSTRAINT `FKlpa5tri2ufo8t7bt7nusa1pss` FOREIGN KEY (`hcp_id`) REFERENCES `Users` (`username`),
  CONSTRAINT `FKo65c0ooyqou8d1x56y37u1nau` FOREIGN KEY (`patient_id`) REFERENCES `Users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AppointmentRequests`
--

LOCK TABLES `AppointmentRequests` WRITE;
/*!40000 ALTER TABLE `AppointmentRequests` DISABLE KEYS */;
INSERT INTO `AppointmentRequests` VALUES (1009,'Test appointment please ignore','2030-11-19 04:50:00','APPROVED','GENERAL_CHECKUP','hcp','patient');
/*!40000 ALTER TABLE `AppointmentRequests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BasicHealthMetrics`
--

DROP TABLE IF EXISTS `BasicHealthMetrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BasicHealthMetrics` (
  `id` bigint(20) NOT NULL,
  `diastolic` int(11) DEFAULT NULL,
  `hdl` int(11) DEFAULT NULL,
  `headCircumference` float DEFAULT NULL,
  `height` float DEFAULT NULL,
  `houseSmokingStatus` int(11) DEFAULT NULL,
  `ldl` int(11) DEFAULT NULL,
  `patientSmokingStatus` int(11) DEFAULT NULL,
  `systolic` int(11) DEFAULT NULL,
  `tri` int(11) DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `hcp_id` varchar(100) DEFAULT NULL,
  `patient_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKd9uamofafbqloq2v2j2o4f0pg` (`hcp_id`),
  KEY `FKj6od5nqw6nvjgmpuilsfj3ad` (`patient_id`),
  CONSTRAINT `FKd9uamofafbqloq2v2j2o4f0pg` FOREIGN KEY (`hcp_id`) REFERENCES `Users` (`username`),
  CONSTRAINT `FKj6od5nqw6nvjgmpuilsfj3ad` FOREIGN KEY (`patient_id`) REFERENCES `Users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BasicHealthMetrics`
--

LOCK TABLES `BasicHealthMetrics` WRITE;
/*!40000 ALTER TABLE `BasicHealthMetrics` DISABLE KEYS */;
INSERT INTO `BasicHealthMetrics` VALUES (20,1,1,NULL,1,1,1,1,1,100,1,'hcp','onionman'),(32,1,1,NULL,1,1,1,1,1,100,1,'hcp','onionman'),(45,1,1,NULL,1,1,1,1,1,100,1,'hcp','onionman'),(58,1,1,NULL,1,1,1,1,1,100,1,'hcp','onionman'),(79,1,1,NULL,1,1,1,2,1,100,1,'hcp','patient'),(87,1,1,NULL,1,1,1,2,1,100,1,'hcp','patient'),(91,1,1,NULL,1,1,1,2,1,100,1,'hcp','patient'),(113,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'hcp','patient'),(119,83,70,20,69.1,3,30,2,102,150,175.2,'hcp','antti'),(130,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'hcp','patient'),(135,83,70,20,69.1,3,30,2,102,150,175.2,'hcp','antti'),(153,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'hcp','patient'),(158,83,70,20,69.1,3,30,2,102,150,175.2,'hcp','antti'),(168,100,75,NULL,75,1,NULL,NULL,NULL,NULL,NULL,'hcp','AliceThirteen'),(185,100,75,NULL,75,1,NULL,NULL,NULL,NULL,NULL,'hcp','AliceThirteen'),(200,100,75,NULL,75,1,NULL,NULL,NULL,NULL,NULL,'hcp','AliceThirteen'),(804,150,NULL,NULL,75,1,NULL,NULL,NULL,NULL,130,'bobbyOD','AliceThirteen'),(806,150,75,NULL,75,1,75,1,150,300,130,'bobbyOD','AliceThirteen'),(808,150,75,NULL,75,1,75,1,150,300,130,'hcp','AliceThirteen'),(825,150,75,NULL,75,1,75,1,150,300,130,'bobbyOD','AliceThirteen'),(830,100,75,NULL,75,1,NULL,NULL,NULL,NULL,NULL,'hcp','AliceThirteen'),(839,150,75,NULL,75,1,75,1,150,300,130,'hcp','patient'),(846,150,75,NULL,75,1,75,1,150,300,130,'hcp','patient'),(851,100,75,NULL,75,1,NULL,NULL,NULL,NULL,NULL,'hcp','AliceThirteen'),(881,1,1,NULL,1,1,1,1,1,100,1,'hcp','onionman'),(893,1,1,NULL,1,1,1,1,1,100,1,'hcp','onionman'),(906,1,1,NULL,1,1,1,1,1,100,1,'hcp','onionman'),(919,1,1,NULL,1,1,1,1,1,100,1,'hcp','onionman'),(940,1,1,NULL,1,1,1,2,1,100,1,'hcp','patient'),(948,1,1,NULL,1,1,1,2,1,100,1,'hcp','patient'),(952,1,1,NULL,1,1,1,2,1,100,1,'hcp','patient'),(974,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'hcp','patient'),(979,83,70,20,69.1,3,30,2,102,150,175.2,'hcp','antti'),(990,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'hcp','patient'),(995,83,70,20,69.1,3,30,2,102,150,175.2,'hcp','antti'),(1013,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'hcp','patient'),(1018,83,70,20,69.1,3,30,2,102,150,175.2,'hcp','antti'),(1028,100,75,NULL,75,1,NULL,NULL,NULL,NULL,NULL,'hcp','AliceThirteen'),(1045,100,75,NULL,75,1,NULL,NULL,NULL,NULL,NULL,'hcp','AliceThirteen'),(1060,100,75,NULL,75,1,NULL,NULL,NULL,NULL,NULL,'hcp','AliceThirteen'),(1658,150,NULL,NULL,75,1,NULL,NULL,NULL,NULL,130,'bobbyOD','AliceThirteen'),(1660,150,75,NULL,75,1,75,1,150,300,130,'bobbyOD','AliceThirteen'),(1662,150,75,NULL,75,1,75,1,150,300,130,'hcp','AliceThirteen'),(1679,150,75,NULL,75,1,75,1,150,300,130,'bobbyOD','AliceThirteen'),(1684,100,75,NULL,75,1,NULL,NULL,NULL,NULL,NULL,'hcp','AliceThirteen'),(1693,150,75,NULL,75,1,75,1,150,300,130,'hcp','patient'),(1700,150,75,NULL,75,1,75,1,150,300,130,'hcp','patient'),(1705,100,75,NULL,75,1,NULL,NULL,NULL,NULL,NULL,'hcp','AliceThirteen');
/*!40000 ALTER TABLE `BasicHealthMetrics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BloodSugarDiaryEntries`
--

DROP TABLE IF EXISTS `BloodSugarDiaryEntries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BloodSugarDiaryEntries` (
  `id` bigint(20) NOT NULL,
  `date` datetime DEFAULT NULL,
  `fastingLevel` int(11) DEFAULT NULL,
  `firstLevel` int(11) DEFAULT NULL,
  `secondLevel` int(11) DEFAULT NULL,
  `thirdLevel` int(11) DEFAULT NULL,
  `patient_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKg2lof8kd38p2vv48wdm9capi6` (`patient_id`),
  CONSTRAINT `FKg2lof8kd38p2vv48wdm9capi6` FOREIGN KEY (`patient_id`) REFERENCES `Patients` (`self_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BloodSugarDiaryEntries`
--

LOCK TABLES `BloodSugarDiaryEntries` WRITE;
/*!40000 ALTER TABLE `BloodSugarDiaryEntries` DISABLE KEYS */;
INSERT INTO `BloodSugarDiaryEntries` VALUES (1681,'2018-09-02 23:00:00',20,30,10,70,'patient'),(1682,'2018-07-31 23:00:00',10,NULL,NULL,NULL,'patient');
/*!40000 ALTER TABLE `BloodSugarDiaryEntries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BloodSugarLimits`
--

DROP TABLE IF EXISTS `BloodSugarLimits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BloodSugarLimits` (
  `id` bigint(20) NOT NULL,
  `fastingLimit` int(11) NOT NULL,
  `mealLimit` int(11) NOT NULL,
  `patient_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKrg3yjyrsjd5ceohxphsskxb2o` (`patient_id`),
  CONSTRAINT `FKrg3yjyrsjd5ceohxphsskxb2o` FOREIGN KEY (`patient_id`) REFERENCES `Patients` (`self_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BloodSugarLimits`
--

LOCK TABLES `BloodSugarLimits` WRITE;
/*!40000 ALTER TABLE `BloodSugarLimits` DISABLE KEYS */;
INSERT INTO `BloodSugarLimits` VALUES (1111,100,140,'bobbo'),(1113,100,140,'terry'),(1115,100,140,'antti'),(1141,100,140,'patient');
/*!40000 ALTER TABLE `BloodSugarLimits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Diagnoses`
--

DROP TABLE IF EXISTS `Diagnoses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Diagnoses` (
  `id` bigint(20) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `code_id` bigint(20) DEFAULT NULL,
  `visit_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKthsk14tdxoeeadlpvkot8fdhb` (`code_id`),
  KEY `FKjm5cnpdmv6x9iajrypt72lguy` (`visit_id`),
  CONSTRAINT `FKjm5cnpdmv6x9iajrypt72lguy` FOREIGN KEY (`visit_id`) REFERENCES `GeneralCheckups` (`id`),
  CONSTRAINT `FKthsk14tdxoeeadlpvkot8fdhb` FOREIGN KEY (`code_id`) REFERENCES `ICDCodes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Diagnoses`
--

LOCK TABLES `Diagnoses` WRITE;
/*!40000 ALTER TABLE `Diagnoses` DISABLE KEYS */;
INSERT INTO `Diagnoses` VALUES (1691,'This is bad',1685,1689),(1712,'This is bad',1706,1710);
/*!40000 ALTER TABLE `Diagnoses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Drugs`
--

DROP TABLE IF EXISTS `Drugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Drugs` (
  `id` bigint(20) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Drugs`
--

LOCK TABLES `Drugs` WRITE;
/*!40000 ALTER TABLE `Drugs` DISABLE KEYS */;
INSERT INTO `Drugs` VALUES (5,'1000-0001-10','atypical antipsychotic and antidepressant','Quetiane Fumarate'),(14,'1111-2222-33','Estus to heal up those wounds!','Sunny D'),(16,'3333-2222-11','Medicinal purple moss clump.\nReduces poison build-up. Cures poison.','Purple Moss'),(26,'1111-2222-33','Estus to heal up those wounds!','Sunny D'),(28,'3333-2222-11','Medicinal purple moss clump.\nReduces poison build-up. Cures poison.','Purple Moss'),(39,'1111-2222-33','Estus to heal up those wounds!','Sunny D'),(41,'3333-2222-11','Medicinal purple moss clump.\nReduces poison build-up. Cures poison.','Purple Moss'),(52,'1111-2222-33','Estus to heal up those wounds!','Sunny D'),(54,'3333-2222-11','Medicinal purple moss clump.\nReduces poison build-up. Cures poison.','Purple Moss'),(170,'1234-4321-89','Lithium Compounds','Li2O8'),(187,'1234-4321-89','Lithium Compounds','Li2O8'),(202,'1234-4321-89','Lithium Compounds','Li2O8'),(212,'0000-0000-20','DESC','TEST'),(816,'1234-4321-89','Lithium Compounds','Li2O8'),(832,'1234-4321-89','Lithium Compounds','Li2O8'),(853,'1234-4321-89','Lithium Compounds','Li2O8'),(875,'1111-2222-33','Estus to heal up those wounds!','Sunny D'),(877,'3333-2222-11','Medicinal purple moss clump.\nReduces poison build-up. Cures poison.','Purple Moss'),(887,'1111-2222-33','Estus to heal up those wounds!','Sunny D'),(889,'3333-2222-11','Medicinal purple moss clump.\nReduces poison build-up. Cures poison.','Purple Moss'),(900,'1111-2222-33','Estus to heal up those wounds!','Sunny D'),(902,'3333-2222-11','Medicinal purple moss clump.\nReduces poison build-up. Cures poison.','Purple Moss'),(913,'1111-2222-33','Estus to heal up those wounds!','Sunny D'),(915,'3333-2222-11','Medicinal purple moss clump.\nReduces poison build-up. Cures poison.','Purple Moss'),(1030,'1234-4321-89','Lithium Compounds','Li2O8'),(1047,'1234-4321-89','Lithium Compounds','Li2O8'),(1062,'1234-4321-89','Lithium Compounds','Li2O8'),(1670,'1234-4321-89','Lithium Compounds','Li2O8'),(1686,'1234-4321-89','Lithium Compounds','Li2O8'),(1707,'1234-4321-89','Lithium Compounds','Li2O8');
/*!40000 ALTER TABLE `Drugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FoodDiaryEntry`
--

DROP TABLE IF EXISTS `FoodDiaryEntry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FoodDiaryEntry` (
  `id` bigint(20) NOT NULL,
  `calories` int(11) DEFAULT NULL,
  `carbs` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `fat` int(11) DEFAULT NULL,
  `fiber` int(11) DEFAULT NULL,
  `food` varchar(255) DEFAULT NULL,
  `mealType` varchar(255) DEFAULT NULL,
  `patient` varchar(255) DEFAULT NULL,
  `protein` int(11) DEFAULT NULL,
  `servings` int(11) DEFAULT NULL,
  `sodium` int(11) DEFAULT NULL,
  `sugars` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FoodDiaryEntry`
--

LOCK TABLES `FoodDiaryEntry` WRITE;
/*!40000 ALTER TABLE `FoodDiaryEntry` DISABLE KEYS */;
INSERT INTO `FoodDiaryEntry` VALUES (1677,900,100,'2018-09-02 23:00:00',30,40,'Peanut Butter and Jelly Sandwich','Lunch','patient',10,1,60,50),(1678,100,10,'2018-09-02 23:00:00',10,10,'Peanut Butter','Lunch','patient',30,1,20,10);
/*!40000 ALTER TABLE `FoodDiaryEntry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GeneralCheckups`
--

DROP TABLE IF EXISTS `GeneralCheckups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GeneralCheckups` (
  `id` bigint(20) NOT NULL,
  `date` datetime DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `appointment_id` bigint(20) DEFAULT NULL,
  `basichealthmetrics_id` bigint(20) DEFAULT NULL,
  `hcp_id` varchar(100) DEFAULT NULL,
  `hospital_id` varchar(100) DEFAULT NULL,
  `patient_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKtgti6uflcm2q9uvfx4obmpwv4` (`appointment_id`),
  KEY `FKqtpf2nfiuf47019rc8gnaeb6v` (`basichealthmetrics_id`),
  KEY `FKplofss0lwup9mbnu0abrtalxx` (`hcp_id`),
  KEY `FK9tghbxo0xq6bba8p1rp7rbecg` (`hospital_id`),
  KEY `FK5fa5nrrfo22p8q5xiptgh83x5` (`patient_id`),
  CONSTRAINT `FK5fa5nrrfo22p8q5xiptgh83x5` FOREIGN KEY (`patient_id`) REFERENCES `Users` (`username`),
  CONSTRAINT `FK9tghbxo0xq6bba8p1rp7rbecg` FOREIGN KEY (`hospital_id`) REFERENCES `Hospitals` (`name`),
  CONSTRAINT `FKplofss0lwup9mbnu0abrtalxx` FOREIGN KEY (`hcp_id`) REFERENCES `Users` (`username`),
  CONSTRAINT `FKqtpf2nfiuf47019rc8gnaeb6v` FOREIGN KEY (`basichealthmetrics_id`) REFERENCES `BasicHealthMetrics` (`id`),
  CONSTRAINT `FKtgti6uflcm2q9uvfx4obmpwv4` FOREIGN KEY (`appointment_id`) REFERENCES `AppointmentRequests` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GeneralCheckups`
--

LOCK TABLES `GeneralCheckups` WRITE;
/*!40000 ALTER TABLE `GeneralCheckups` DISABLE KEYS */;
INSERT INTO `GeneralCheckups` VALUES (1689,'2020-04-29 10:58:18',NULL,'GENERAL_CHECKUP',NULL,1684,'AliceThirteen','Dr. Jenkins\' Insane Asylum','AliceThirteen'),(1694,'2048-04-16 08:50:00','Test office visit','GENERAL_CHECKUP',NULL,1693,'hcp','Dr. Jenkins\' Insane Asylum','patient'),(1701,'2048-04-16 08:50:00','Test office visit','GENERAL_CHECKUP',NULL,1700,'hcp','Dr. Jenkins\' Insane Asylum','patient'),(1710,'2020-04-29 10:58:19',NULL,'GENERAL_CHECKUP',NULL,1705,'AliceThirteen','Dr. Jenkins\' Insane Asylum','AliceThirteen');
/*!40000 ALTER TABLE `GeneralCheckups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GeneralOphthalmology`
--

DROP TABLE IF EXISTS `GeneralOphthalmology`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GeneralOphthalmology` (
  `id` bigint(20) NOT NULL,
  `date` datetime DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `axisOD` int(11) DEFAULT NULL,
  `axisOS` int(11) DEFAULT NULL,
  `cylinderOD` double DEFAULT NULL,
  `cylinderOS` double DEFAULT NULL,
  `sphereOD` double DEFAULT NULL,
  `sphereOS` double DEFAULT NULL,
  `visualAcuityOD` int(11) DEFAULT NULL,
  `visualAcuityOS` int(11) DEFAULT NULL,
  `diagnosis` varchar(255) DEFAULT NULL,
  `appointment_id` bigint(20) DEFAULT NULL,
  `basichealthmetrics_id` bigint(20) DEFAULT NULL,
  `hcp_id` varchar(100) DEFAULT NULL,
  `hospital_id` varchar(100) DEFAULT NULL,
  `patient_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKtcx79uvv1o4wrp9xqdk3hcap2` (`appointment_id`),
  KEY `FK6svu0my7r662s5sn2d7cgf1jq` (`basichealthmetrics_id`),
  KEY `FKfeh4gtxe0s4kr52i7u5i8tkum` (`hcp_id`),
  KEY `FKc5kn71vr8tbt5ty5cc7pfrbgf` (`hospital_id`),
  KEY `FKr2whnupl6f7k12gx78f5lhdx9` (`patient_id`),
  CONSTRAINT `FK6svu0my7r662s5sn2d7cgf1jq` FOREIGN KEY (`basichealthmetrics_id`) REFERENCES `BasicHealthMetrics` (`id`),
  CONSTRAINT `FKc5kn71vr8tbt5ty5cc7pfrbgf` FOREIGN KEY (`hospital_id`) REFERENCES `Hospitals` (`name`),
  CONSTRAINT `FKfeh4gtxe0s4kr52i7u5i8tkum` FOREIGN KEY (`hcp_id`) REFERENCES `Users` (`username`),
  CONSTRAINT `FKr2whnupl6f7k12gx78f5lhdx9` FOREIGN KEY (`patient_id`) REFERENCES `Users` (`username`),
  CONSTRAINT `FKtcx79uvv1o4wrp9xqdk3hcap2` FOREIGN KEY (`appointment_id`) REFERENCES `AppointmentRequests` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GeneralOphthalmology`
--

LOCK TABLES `GeneralOphthalmology` WRITE;
/*!40000 ALTER TABLE `GeneralOphthalmology` DISABLE KEYS */;
/*!40000 ALTER TABLE `GeneralOphthalmology` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Hospitals`
--

DROP TABLE IF EXISTS `Hospitals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Hospitals` (
  `name` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Hospitals`
--

LOCK TABLES `Hospitals` WRITE;
/*!40000 ALTER TABLE `Hospitals` DISABLE KEYS */;
INSERT INTO `Hospitals` VALUES ('Dr. Jenkins\' Insane Asylum','123 Main St','NC','12345'),('General Hospital','123 Main St','NC','12345'),('iTrust Test Hospital','2770 Wolf Village Drive, Raleigh','NC','27607'),('iTrust Test Hospital 2','2 iTrust Test Street','NC','27607');
/*!40000 ALTER TABLE `Hospitals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ICDCodes`
--

DROP TABLE IF EXISTS `ICDCodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ICDCodes` (
  `id` bigint(20) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ICDCodes`
--

LOCK TABLES `ICDCodes` WRITE;
/*!40000 ALTER TABLE `ICDCodes` DISABLE KEYS */;
INSERT INTO `ICDCodes` VALUES (6,'E11.9','Type 2 Diabetes'),(7,'R73.03','Prediabetes'),(18,'T49','Poisoned by topical agents.  Probably in Blighttown'),(19,'S34','Injury of lumbar and sacral spinal cord.  Probably carrying teammates.'),(30,'T49','Poisoned by topical agents.  Probably in Blighttown'),(31,'S34','Injury of lumbar and sacral spinal cord.  Probably carrying teammates.'),(43,'T49','Poisoned by topical agents.  Probably in Blighttown'),(44,'S34','Injury of lumbar and sacral spinal cord.  Probably carrying teammates.'),(56,'T49','Poisoned by topical agents.  Probably in Blighttown'),(57,'S34','Injury of lumbar and sacral spinal cord.  Probably carrying teammates.'),(74,'T10','Test 10'),(76,'T10','Test 10'),(169,'A21','Top Quality'),(186,'A21','Top Quality'),(201,'A21','Top Quality'),(810,'A21','Top Quality'),(831,'A21','Top Quality'),(852,'A21','Top Quality'),(879,'T49','Poisoned by topical agents.  Probably in Blighttown'),(880,'S34','Injury of lumbar and sacral spinal cord.  Probably carrying teammates.'),(891,'T49','Poisoned by topical agents.  Probably in Blighttown'),(892,'S34','Injury of lumbar and sacral spinal cord.  Probably carrying teammates.'),(904,'T49','Poisoned by topical agents.  Probably in Blighttown'),(905,'S34','Injury of lumbar and sacral spinal cord.  Probably carrying teammates.'),(917,'T49','Poisoned by topical agents.  Probably in Blighttown'),(918,'S34','Injury of lumbar and sacral spinal cord.  Probably carrying teammates.'),(935,'T10','Test 10'),(937,'T10','Test 10'),(1029,'A21','Top Quality'),(1046,'A21','Top Quality'),(1061,'A21','Top Quality'),(1664,'A21','Top Quality'),(1685,'A21','Top Quality'),(1706,'A21','Top Quality');
/*!40000 ALTER TABLE `ICDCodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LOINCCodes`
--

DROP TABLE IF EXISTS `LOINCCodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LOINCCodes` (
  `id` bigint(20) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `commonName` varchar(255) DEFAULT NULL,
  `component` varchar(255) DEFAULT NULL,
  `property` varchar(255) DEFAULT NULL,
  `scale` varchar(255) DEFAULT NULL,
  `result_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKg096u65wbjmwxny136tptntlr` (`result_id`),
  CONSTRAINT `FKg096u65wbjmwxny136tptntlr` FOREIGN KEY (`result_id`) REFERENCES `LOINCResult` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LOINCCodes`
--

LOCK TABLES `LOINCCodes` WRITE;
/*!40000 ALTER TABLE `LOINCCodes` DISABLE KEYS */;
INSERT INTO `LOINCCodes` VALUES (1704,'20436-2','Glucose 2 Hr After Glucose, Blood','Glucose^2H post dose glucose','MCnc','QUANTITATIVE',1703);
/*!40000 ALTER TABLE `LOINCCodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LOINCResult`
--

DROP TABLE IF EXISTS `LOINCResult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LOINCResult` (
  `DTYPE` varchar(31) NOT NULL,
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LOINCResult`
--

LOCK TABLES `LOINCResult` WRITE;
/*!40000 ALTER TABLE `LOINCResult` DISABLE KEYS */;
INSERT INTO `LOINCResult` VALUES ('QuantitativeLOINCResult',1703);
/*!40000 ALTER TABLE `LOINCResult` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LabProcedures`
--

DROP TABLE IF EXISTS `LabProcedures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LabProcedures` (
  `id` bigint(20) NOT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `priority` varchar(255) DEFAULT NULL,
  `result` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `labtech` varchar(100) DEFAULT NULL,
  `LOINC_code` bigint(20) DEFAULT NULL,
  `patient` varchar(100) DEFAULT NULL,
  `suggestedDiagnosis` bigint(20) DEFAULT NULL,
  `visit` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKn8ctd2oj7knwaxxfakrmwybj6` (`labtech`),
  KEY `FKq97sa9kb1vkse9jbn0s38drei` (`LOINC_code`),
  KEY `FKd9netwr78cspphyqtctsdy9cl` (`patient`),
  KEY `FKev74nk6ig1t5h0i4h4tg5ar9q` (`suggestedDiagnosis`),
  KEY `FKf1qdex4yna7yac0e29xylgqt7` (`visit`),
  CONSTRAINT `FKd9netwr78cspphyqtctsdy9cl` FOREIGN KEY (`patient`) REFERENCES `Users` (`username`),
  CONSTRAINT `FKev74nk6ig1t5h0i4h4tg5ar9q` FOREIGN KEY (`suggestedDiagnosis`) REFERENCES `ICDCodes` (`id`),
  CONSTRAINT `FKf1qdex4yna7yac0e29xylgqt7` FOREIGN KEY (`visit`) REFERENCES `GeneralCheckups` (`id`),
  CONSTRAINT `FKn8ctd2oj7knwaxxfakrmwybj6` FOREIGN KEY (`labtech`) REFERENCES `Users` (`username`),
  CONSTRAINT `FKq97sa9kb1vkse9jbn0s38drei` FOREIGN KEY (`LOINC_code`) REFERENCES `LOINCCodes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LabProcedures`
--

LOCK TABLES `LabProcedures` WRITE;
/*!40000 ALTER TABLE `LabProcedures` DISABLE KEYS */;
INSERT INTO `LabProcedures` VALUES (1713,NULL,'CRITICAL','150','COMPLETED','labtech',1704,'patient',7,1710);
/*!40000 ALTER TABLE `LabProcedures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LogEntries`
--

DROP TABLE IF EXISTS `LogEntries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LogEntries` (
  `id` bigint(20) NOT NULL,
  `logCode` int(11) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `primaryUser` varchar(255) DEFAULT NULL,
  `secondaryUser` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LogEntries`
--

LOCK TABLES `LogEntries` WRITE;
/*!40000 ALTER TABLE `LogEntries` DISABLE KEYS */;
INSERT INTO `LogEntries` VALUES (22,41,'edu.ncsu.csc.itrust2.models.persistent.User@46ed09f7 created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@a6e627c2','hcp','onionman','2020-04-29 10:50:42'),(24,41,'edu.ncsu.csc.itrust2.models.persistent.User@46ed09f7 created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@a6e627c2','hcp','onionman','2020-04-29 10:50:42'),(34,41,'edu.ncsu.csc.itrust2.models.persistent.User@46ed09f7 created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@a6e627c2','hcp','onionman','2020-04-29 10:50:43'),(36,41,'edu.ncsu.csc.itrust2.models.persistent.User@46ed09f7 created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@a6e627c2','hcp','onionman','2020-04-29 10:50:43'),(38,63,'Fetched Emergency Record for user onionman','hcp','onionman','2020-04-29 10:50:43'),(47,41,'edu.ncsu.csc.itrust2.models.persistent.User@46ed09f7 created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@a6e627c2','hcp','onionman','2020-04-29 10:50:44'),(49,41,'edu.ncsu.csc.itrust2.models.persistent.User@46ed09f7 created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@a6e627c2','hcp','onionman','2020-04-29 10:50:44'),(51,64,'Fetched Emergency Record for user onionman','er','onionman','2020-04-29 10:50:44'),(60,41,'edu.ncsu.csc.itrust2.models.persistent.User@46ed09f7 created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@a6e627c2','hcp','onionman','2020-04-29 10:50:44'),(62,41,'edu.ncsu.csc.itrust2.models.persistent.User@46ed09f7 created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@a6e627c2','hcp','onionman','2020-04-29 10:50:44'),(64,14,NULL,'hcp',NULL,'2020-04-29 10:50:45'),(66,82,NULL,'hcp','patient','2020-04-29 10:50:45'),(67,14,NULL,'patent',NULL,'2020-04-29 10:50:46'),(69,14,NULL,'patient',NULL,'2020-04-29 10:50:46'),(72,80,NULL,'patient',NULL,'2020-04-29 10:50:46'),(73,81,NULL,'patient',NULL,'2020-04-29 10:50:46'),(75,33,'admin created an ICD Code','admin',NULL,'2020-04-29 10:50:47'),(77,33,'admin created an ICD Code','admin',NULL,'2020-04-29 10:50:47'),(78,30,NULL,'admin',NULL,'2020-04-29 10:50:47'),(81,41,'edu.ncsu.csc.itrust2.models.persistent.User@46ed09f7 created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@f8ad77d6','hcp','patient','2020-04-29 10:50:47'),(83,41,'edu.ncsu.csc.itrust2.models.persistent.User@46ed09f7 created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@f8ad77d6','hcp','patient','2020-04-29 10:50:47'),(85,26,'patient','admin',NULL,'2020-04-29 10:50:47'),(86,39,'Retrieved diagnoses for office visit with id 80','admin','patient','2020-04-29 10:50:47'),(88,42,'edu.ncsu.csc.itrust2.models.persistent.User@46ed09f7 edit a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@f8ad77d6','hcp','patient','2020-04-29 10:50:47'),(89,28,NULL,'admin',NULL,'2020-04-29 10:50:47'),(90,39,'Retrieved diagnoses for office visit with id 80','admin','patient','2020-04-29 10:50:47'),(92,43,'hcp deleted a diagnosis for patient','hcp','patient','2020-04-29 10:50:48'),(93,28,NULL,'admin',NULL,'2020-04-29 10:50:48'),(94,39,'Retrieved diagnoses for office visit with id 80','admin','patient','2020-04-29 10:50:48'),(95,7,NULL,'SPRING_API_TEST_USER','sven_forkbeard','2020-04-29 10:50:48'),(96,9,NULL,'SPRING_API_TEST_USER',NULL,'2020-04-29 10:50:48'),(97,8,NULL,'sven_forkbeard',NULL,'2020-04-29 10:50:48'),(98,11,NULL,'SPRING_API_TEST_USER',NULL,'2020-04-29 10:50:48'),(99,8,NULL,'-1',NULL,'2020-04-29 10:50:48'),(101,20,NULL,'patient','hcp','2020-04-29 10:50:49'),(102,21,NULL,'patient','hcp','2020-04-29 10:50:49'),(103,25,NULL,'patient','hcp','2020-04-29 10:50:49'),(104,24,NULL,'patient','hcp','2020-04-29 10:50:49'),(105,22,NULL,'patient','hcp','2020-04-29 10:50:49'),(107,33,'admin created an ICD Code','admin',NULL,'2020-04-29 10:50:49'),(108,36,'Fetched icd code with id 106','admin',NULL,'2020-04-29 10:50:49'),(109,35,'admin edited an ICD Code','admin',NULL,'2020-04-29 10:50:49'),(110,36,'Fetched icd code with id 106','admin',NULL,'2020-04-29 10:50:49'),(111,34,'admin deleted an ICD Code','admin',NULL,'2020-04-29 10:50:49'),(112,30,NULL,'patient',NULL,'2020-04-29 10:50:50'),(115,99,'patient','patient',NULL,'2020-04-29 10:50:50'),(116,7,NULL,'patient','antti','2020-04-29 10:50:50'),(117,102,NULL,'patient',NULL,'2020-04-29 10:50:51'),(118,101,'hcp updated basic health metrics for antti from 2048-04-16T09:45:00.000-04:00','hcp','antti','2020-04-29 10:50:51'),(120,101,NULL,'patient',NULL,'2020-04-29 10:50:51'),(121,103,NULL,'patient',NULL,'2020-04-29 10:50:51'),(122,30,NULL,'patient',NULL,'2020-04-29 10:50:51'),(124,20,NULL,'patient','hcp','2020-04-29 10:50:51'),(125,30,NULL,'robortOPH',NULL,'2020-04-29 10:50:51'),(127,20,NULL,'patient','hcp','2020-04-29 10:50:51'),(128,30,NULL,'bobbyOD',NULL,'2020-04-29 10:50:51'),(129,30,NULL,'patient',NULL,'2020-04-29 10:50:52'),(132,94,'patient','patient',NULL,'2020-04-29 10:50:52'),(133,97,NULL,'patient',NULL,'2020-04-29 10:50:53'),(134,96,'hcp updated basic health metrics for antti from 2048-04-16T09:45:00.000-04:00','hcp','antti','2020-04-29 10:50:53'),(136,96,NULL,'patient',NULL,'2020-04-29 10:50:53'),(137,98,NULL,'patient',NULL,'2020-04-29 10:50:53'),(138,30,NULL,'patient',NULL,'2020-04-29 10:50:53'),(140,44,'Drug 0000-0000-00 created','admin',NULL,'2020-04-29 10:50:53'),(141,44,'Conflict: drug with code 0000-0000-00 already exists','admin',NULL,'2020-04-29 10:50:53'),(143,44,'Drug 0000-0000-01 created','admin',NULL,'2020-04-29 10:50:53'),(144,47,'Fetched list of drugs','admin',NULL,'2020-04-29 10:50:53'),(145,45,'Drug with id 139 edited','admin',NULL,'2020-04-29 10:50:53'),(146,45,'Drug with id 142 edited','admin',NULL,'2020-04-29 10:50:53'),(147,46,'Deleted drug with id 139','admin',NULL,'2020-04-29 10:50:53'),(148,46,'Deleted drug with id 142','admin',NULL,'2020-04-29 10:50:53'),(150,20,NULL,'patient','hcp','2020-04-29 10:50:54'),(151,30,NULL,'hcp',NULL,'2020-04-29 10:50:54'),(152,30,NULL,'patient',NULL,'2020-04-29 10:50:54'),(155,26,'patient','patient',NULL,'2020-04-29 10:50:54'),(156,29,NULL,'patient',NULL,'2020-04-29 10:50:54'),(157,28,'hcp updated basic health metrics for antti from 2048-04-16T09:45:00.000-04:00','hcp','antti','2020-04-29 10:50:54'),(159,28,NULL,'patient',NULL,'2020-04-29 10:50:54'),(160,32,NULL,'patient',NULL,'2020-04-29 10:50:55'),(161,30,NULL,'patient',NULL,'2020-04-29 10:50:55'),(163,69,'admin created a LOINC Code','admin',NULL,'2020-04-29 10:50:55'),(164,71,'admin edited a LOINC Code','admin',NULL,'2020-04-29 10:50:55'),(165,70,'admin deleted a LOINC Code','admin',NULL,'2020-04-29 10:50:55'),(166,72,'LabTech labtech Views Their Lab Procedures','labtech',NULL,'2020-04-29 10:50:55'),(172,48,'Creating prescription with id 171','labtech','AliceThirteen','2020-04-29 10:50:55'),(174,41,'edu.ncsu.csc.itrust2.models.persistent.User@46ed09f7 created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@4c583248','hcp','AliceThirteen','2020-04-29 10:50:55'),(177,72,'LabTech labtech Views Lab Procedure 176','labtech',NULL,'2020-04-29 10:50:55'),(178,73,NULL,'labtech',NULL,'2020-04-29 10:50:55'),(179,74,'LabTech labtech Reassigns Procedure To assignedTech2','labtech','assignedTech2','2020-04-29 10:50:55'),(180,73,NULL,'labtech',NULL,'2020-04-29 10:50:56'),(181,74,'LabTech labtech Reassigns Procedure To assignedTech2','labtech','assignedTech2','2020-04-29 10:50:56'),(182,78,'HCP hcp Views Lab Procedures','hcp',NULL,'2020-04-29 10:50:56'),(183,77,NULL,'hcp',NULL,'2020-04-29 10:50:56'),(189,48,'Creating prescription with id 188','hcp','patient','2020-04-29 10:50:56'),(191,41,'edu.ncsu.csc.itrust2.models.persistent.User@f8ad77d6 created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@f8ad77d6','patient',NULL,'2020-04-29 10:50:56'),(194,75,NULL,'hcp',NULL,'2020-04-29 10:50:56'),(195,78,'HCP hcp Views Lab Procedures','hcp',NULL,'2020-04-29 10:50:57'),(196,78,'HCP hcp Views labtech\'s Lab Procedures','hcp','labtech','2020-04-29 10:50:57'),(197,78,'HCP hcp Views OfficeVisit 190 Lab Procedures','hcp',NULL,'2020-04-29 10:50:57'),(198,78,'HCP hcp Views Lab Procedure 193','hcp',NULL,'2020-04-29 10:50:57'),(199,77,NULL,'hcp',NULL,'2020-04-29 10:50:57'),(204,48,'Creating prescription with id 203','labtech','AliceThirteen','2020-04-29 10:50:57'),(206,41,'edu.ncsu.csc.itrust2.models.persistent.User@46ed09f7 created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@4c583248','hcp','AliceThirteen','2020-04-29 10:50:57'),(209,73,NULL,'labtech',NULL,'2020-04-29 10:50:57'),(210,74,'LabTech labtech Reassigns Procedure To assignedTech','labtech','assignedTech','2020-04-29 10:50:57'),(211,7,NULL,'hcp','api_test_patient','2020-04-29 10:51:00'),(213,44,'Drug 0000-0000-20 created','hcp',NULL,'2020-04-29 10:51:00'),(215,48,'Created prescription with id 214','hcp','api_test_patient','2020-04-29 10:51:00'),(217,48,'Created prescription with id 216','hcp','api_test_patient','2020-04-29 10:51:00'),(218,51,'HCP viewed a list of all prescriptions','hcp',NULL,'2020-04-29 10:51:00'),(219,49,'Edited prescription with id 214','hcp','api_test_patient','2020-04-29 10:51:00'),(220,49,'Edited prescription with id 214','hcp','api_test_patient','2020-04-29 10:51:00'),(221,49,'Failed to edit prescription','hcp',NULL,'2020-04-29 10:51:00'),(222,50,'Deleted prescription with id 214','hcp','api_test_patient','2020-04-29 10:51:00'),(223,50,'Deleted prescription with id 216','hcp','api_test_patient','2020-04-29 10:51:00'),(225,14,NULL,'patientPW',NULL,'2020-04-29 10:51:01'),(226,54,'Successfully changed password for user patientPW','patientPW',NULL,'2020-04-29 10:51:03'),(228,14,NULL,'patientPW',NULL,'2020-04-29 10:51:03'),(229,54,'Successfully changed password for user patientPW','patientPW',NULL,'2020-04-29 10:51:03'),(230,62,NULL,'patientPW',NULL,'2020-04-29 10:51:03'),(231,12,NULL,'hcp',NULL,'2020-04-29 10:51:04'),(232,13,NULL,'hcp',NULL,'2020-04-29 10:51:04'),(233,16,NULL,'admin',NULL,'2020-04-29 10:51:04'),(234,17,NULL,'admin',NULL,'2020-04-29 10:51:04'),(235,16,NULL,'admin',NULL,'2020-04-29 10:51:04'),(236,14,NULL,'hcp',NULL,'2020-04-29 10:51:04'),(238,56,'HCP retrieved demographics for patient with username antti','hcp','antti','2020-04-29 10:51:04'),(239,13,'User with username anttiupdated their demographics','hcp',NULL,'2020-04-29 10:51:04'),(240,57,'HCP edited demographics for patient with username antti','antti',NULL,'2020-04-29 10:51:04'),(241,7,NULL,'hcp','bobbo','2020-04-29 10:51:04'),(242,14,NULL,'hcp',NULL,'2020-04-29 10:51:04'),(244,7,NULL,'hcp','terry','2020-04-29 10:51:04'),(245,14,NULL,'hcp',NULL,'2020-04-29 10:51:04'),(247,7,NULL,'hcp','jerry','2020-04-29 10:51:05'),(248,14,NULL,'hcp',NULL,'2020-04-29 10:51:05'),(250,7,NULL,'hcp','candy','2020-04-29 10:51:05'),(251,65,'HCP hcp has declared terry as a representative for bobbo','hcp','terry','2020-04-29 10:51:05'),(252,65,'HCP hcp has declared jerry as a representative for bobbo','hcp','jerry','2020-04-29 10:51:05'),(253,65,'HCP hcp has declared bobbo as a representative for terry','hcp','bobbo','2020-04-29 10:51:05'),(254,65,'HCP hcp has declared bobbo as a representative for jerry','hcp','bobbo','2020-04-29 10:51:05'),(255,68,'User terry has undeclared self as representative for bobbo','bobbo','terry','2020-04-29 10:51:05'),(256,14,NULL,'antti',NULL,'2020-04-29 10:51:05'),(258,14,NULL,'antti',NULL,'2020-04-29 10:51:06'),(260,14,NULL,'antti',NULL,'2020-04-29 10:51:06'),(262,66,'User bobbo has been added as a representative for user antti','antti','bobbo','2020-04-29 10:51:06'),(263,67,'User antti has undeclared representative bobbo','antti','bobbo','2020-04-29 10:51:06'),(264,14,NULL,'patent',NULL,'2020-04-29 10:51:06'),(267,14,NULL,'patient',NULL,'2020-04-29 10:51:07'),(270,104,NULL,'patient',NULL,'2020-04-29 10:51:07'),(271,107,NULL,'patient',NULL,'2020-04-29 10:51:07'),(272,105,NULL,'patient',NULL,'2020-04-29 10:51:07'),(274,104,NULL,'patient',NULL,'2020-04-29 10:51:07'),(275,105,NULL,'patient',NULL,'2020-04-29 10:51:07'),(276,14,NULL,'hcp',NULL,'2020-04-29 10:51:07'),(278,106,NULL,'hcp','patient','2020-04-29 10:51:07'),(279,14,NULL,'hcp',NULL,'2020-04-29 10:51:07'),(281,109,NULL,'hcp',NULL,'2020-04-29 10:51:07'),(282,110,NULL,'hcp',NULL,'2020-04-29 10:51:07'),(283,14,NULL,'patient',NULL,'2020-04-29 10:51:07'),(285,108,NULL,'patient',NULL,'2020-04-29 10:51:08'),(286,14,NULL,'patient',NULL,'2020-04-29 10:51:08'),(289,104,NULL,'patient',NULL,'2020-04-29 10:51:08'),(291,104,NULL,'patient',NULL,'2020-04-29 10:51:08'),(293,104,NULL,'patient',NULL,'2020-04-29 10:51:08'),(295,104,NULL,'patient',NULL,'2020-04-29 10:51:08'),(297,104,NULL,'patient',NULL,'2020-04-29 10:51:08'),(298,107,NULL,'patient',NULL,'2020-04-29 10:51:08'),(299,107,NULL,'patient',NULL,'2020-04-29 10:51:08'),(300,5,NULL,'logapitest',NULL,'2020-04-29 10:51:08'),(301,5,NULL,'logapitest',NULL,'2020-04-29 10:51:08'),(302,5,NULL,'logapitest',NULL,'2020-04-29 10:51:08'),(303,5,NULL,'logapitest',NULL,'2020-04-29 10:51:08'),(304,5,NULL,'logapitest',NULL,'2020-04-29 10:51:08'),(305,5,NULL,'logapitest',NULL,'2020-04-29 10:51:08'),(306,5,NULL,'logapitest',NULL,'2020-04-29 10:51:08'),(307,5,NULL,'logapitest',NULL,'2020-04-29 10:51:08'),(308,5,NULL,'logapitest',NULL,'2020-04-29 10:51:08'),(309,5,NULL,'logapitest',NULL,'2020-04-29 10:51:08'),(310,5,NULL,'logapitest',NULL,'2020-04-29 10:51:08'),(311,5,NULL,'logapitest',NULL,'2020-04-29 10:51:08'),(312,5,NULL,'logapitest',NULL,'2020-04-29 10:51:08'),(313,5,NULL,'logapitest',NULL,'2020-04-29 10:51:08'),(314,5,NULL,'logapitest',NULL,'2020-04-29 10:51:08'),(315,5,NULL,'logapitest',NULL,'2020-04-29 10:51:08'),(316,5,NULL,'logapitest',NULL,'2020-04-29 10:51:08'),(317,5,NULL,'logapitest',NULL,'2020-04-29 10:51:08'),(318,5,NULL,'logapitest',NULL,'2020-04-29 10:51:08'),(319,5,NULL,'logapitest',NULL,'2020-04-29 10:51:08'),(320,5,NULL,'logapitest',NULL,'2020-04-29 10:51:08'),(321,5,NULL,'logapitest',NULL,'2020-04-29 10:51:08'),(322,5,NULL,'logapitest',NULL,'2020-04-29 10:51:09'),(323,5,NULL,'logapitest',NULL,'2020-04-29 10:51:09'),(324,5,NULL,'logapitest',NULL,'2020-04-29 10:51:09'),(325,5,NULL,'logapitest',NULL,'2020-04-29 10:51:09'),(326,5,NULL,'logapitest',NULL,'2020-04-29 10:51:09'),(327,5,NULL,'logapitest',NULL,'2020-04-29 10:51:09'),(328,5,NULL,'logapitest',NULL,'2020-04-29 10:51:09'),(329,5,NULL,'logapitest',NULL,'2020-04-29 10:51:09'),(330,5,NULL,'logapitest',NULL,'2020-04-29 10:51:09'),(331,5,NULL,'logapitest',NULL,'2020-04-29 10:51:09'),(332,5,NULL,'logapitest',NULL,'2020-04-29 10:51:09'),(333,5,NULL,'logapitest',NULL,'2020-04-29 10:51:09'),(334,5,NULL,'logapitest',NULL,'2020-04-29 10:51:09'),(335,5,NULL,'logapitest',NULL,'2020-04-29 10:51:09'),(336,5,NULL,'logapitest',NULL,'2020-04-29 10:51:09'),(337,5,NULL,'logapitest',NULL,'2020-04-29 10:51:09'),(338,5,NULL,'logapitest',NULL,'2020-04-29 10:51:09'),(339,5,NULL,'logapitest',NULL,'2020-04-29 10:51:09'),(340,5,NULL,'logapitest',NULL,'2020-04-29 10:51:09'),(341,5,NULL,'logapitest',NULL,'2020-04-29 10:51:09'),(342,5,NULL,'logapitest',NULL,'2020-04-29 10:51:09'),(343,5,NULL,'logapitest',NULL,'2020-04-29 10:51:09'),(344,5,NULL,'logapitest',NULL,'2020-04-29 10:51:09'),(345,5,NULL,'logapitest',NULL,'2020-04-29 10:51:09'),(346,5,NULL,'logapitest',NULL,'2020-04-29 10:51:09'),(347,5,NULL,'logapitest',NULL,'2020-04-29 10:51:09'),(348,5,NULL,'logapitest',NULL,'2020-04-29 10:51:09'),(349,5,NULL,'logapitest',NULL,'2020-04-29 10:51:09'),(350,5,NULL,'logapitest',NULL,'2020-04-29 10:51:09'),(351,5,NULL,'logapitest',NULL,'2020-04-29 10:51:09'),(352,5,NULL,'logapitest',NULL,'2020-04-29 10:51:09'),(353,5,NULL,'logapitest',NULL,'2020-04-29 10:51:09'),(354,5,NULL,'logapitest',NULL,'2020-04-29 10:51:09'),(355,5,NULL,'logapitest',NULL,'2020-04-29 10:51:09'),(356,5,NULL,'logapitest',NULL,'2020-04-29 10:51:09'),(357,5,NULL,'logapitest',NULL,'2020-04-29 10:51:09'),(358,5,NULL,'logapitest',NULL,'2020-04-29 10:51:09'),(359,5,NULL,'logapitest',NULL,'2020-04-29 10:51:09'),(360,5,NULL,'logapitest',NULL,'2020-04-29 10:51:09'),(361,5,NULL,'logapitest',NULL,'2020-04-29 10:51:09'),(362,5,NULL,'logapitest',NULL,'2020-04-29 10:51:09'),(363,5,NULL,'logapitest',NULL,'2020-04-29 10:51:09'),(364,5,NULL,'logapitest',NULL,'2020-04-29 10:51:09'),(365,5,NULL,'logapitest',NULL,'2020-04-29 10:51:09'),(366,5,NULL,'logapitest',NULL,'2020-04-29 10:51:09'),(367,5,NULL,'logapitest',NULL,'2020-04-29 10:51:09'),(368,5,NULL,'logapitest',NULL,'2020-04-29 10:51:09'),(369,5,NULL,'logapitest',NULL,'2020-04-29 10:51:09'),(370,5,NULL,'logapitest',NULL,'2020-04-29 10:51:09'),(371,5,NULL,'logapitest',NULL,'2020-04-29 10:51:09'),(372,5,NULL,'logapitest',NULL,'2020-04-29 10:51:09'),(373,5,NULL,'logapitest',NULL,'2020-04-29 10:51:09'),(374,5,NULL,'logapitest',NULL,'2020-04-29 10:51:09'),(375,5,NULL,'logapitest',NULL,'2020-04-29 10:51:09'),(376,5,NULL,'logapitest',NULL,'2020-04-29 10:51:09'),(377,5,NULL,'logapitest',NULL,'2020-04-29 10:51:09'),(378,5,NULL,'logapitest',NULL,'2020-04-29 10:51:10'),(379,5,NULL,'logapitest',NULL,'2020-04-29 10:51:10'),(380,5,NULL,'logapitest',NULL,'2020-04-29 10:51:10'),(381,5,NULL,'logapitest',NULL,'2020-04-29 10:51:10'),(382,5,NULL,'logapitest',NULL,'2020-04-29 10:51:10'),(383,5,NULL,'logapitest',NULL,'2020-04-29 10:51:10'),(384,5,NULL,'logapitest',NULL,'2020-04-29 10:51:10'),(385,5,NULL,'logapitest',NULL,'2020-04-29 10:51:10'),(386,5,NULL,'logapitest',NULL,'2020-04-29 10:51:10'),(387,5,NULL,'logapitest',NULL,'2020-04-29 10:51:10'),(388,5,NULL,'logapitest',NULL,'2020-04-29 10:51:10'),(389,5,NULL,'logapitest',NULL,'2020-04-29 10:51:10'),(390,5,NULL,'logapitest',NULL,'2020-04-29 10:51:10'),(391,5,NULL,'logapitest',NULL,'2020-04-29 10:51:10'),(392,5,NULL,'logapitest',NULL,'2020-04-29 10:51:10'),(393,5,NULL,'logapitest',NULL,'2020-04-29 10:51:10'),(394,5,NULL,'logapitest',NULL,'2020-04-29 10:51:10'),(395,5,NULL,'logapitest',NULL,'2020-04-29 10:51:10'),(396,5,NULL,'logapitest',NULL,'2020-04-29 10:51:10'),(397,5,NULL,'logapitest',NULL,'2020-04-29 10:51:10'),(398,5,NULL,'logapitest',NULL,'2020-04-29 10:51:10'),(399,5,NULL,'logapitest',NULL,'2020-04-29 10:51:10'),(400,5,NULL,'logapitest',NULL,'2020-04-29 10:51:10'),(401,5,NULL,'logapitest',NULL,'2020-04-29 10:51:10'),(402,5,NULL,'logapitest',NULL,'2020-04-29 10:51:10'),(403,5,NULL,'logapitest',NULL,'2020-04-29 10:51:10'),(404,5,NULL,'logapitest',NULL,'2020-04-29 10:51:10'),(405,5,NULL,'logapitest',NULL,'2020-04-29 10:51:10'),(406,5,NULL,'logapitest',NULL,'2020-04-29 10:51:10'),(407,5,NULL,'logapitest',NULL,'2020-04-29 10:51:10'),(408,5,NULL,'logapitest',NULL,'2020-04-29 10:51:10'),(409,5,NULL,'logapitest',NULL,'2020-04-29 10:51:10'),(410,5,NULL,'logapitest',NULL,'2020-04-29 10:51:10'),(411,5,NULL,'logapitest',NULL,'2020-04-29 10:51:10'),(412,5,NULL,'logapitest',NULL,'2020-04-29 10:51:10'),(413,5,NULL,'logapitest',NULL,'2020-04-29 10:51:10'),(414,5,NULL,'logapitest',NULL,'2020-04-29 10:51:10'),(415,5,NULL,'logapitest',NULL,'2020-04-29 10:51:10'),(416,5,NULL,'logapitest',NULL,'2020-04-29 10:51:10'),(417,5,NULL,'logapitest',NULL,'2020-04-29 10:51:10'),(418,5,NULL,'logapitest',NULL,'2020-04-29 10:51:10'),(419,5,NULL,'logapitest',NULL,'2020-04-29 10:51:10'),(420,5,NULL,'logapitest',NULL,'2020-04-29 10:51:10'),(421,5,NULL,'logapitest',NULL,'2020-04-29 10:51:10'),(422,5,NULL,'logapitest',NULL,'2020-04-29 10:51:10'),(423,5,NULL,'logapitest',NULL,'2020-04-29 10:51:10'),(424,5,NULL,'logapitest',NULL,'2020-04-29 10:51:10'),(425,5,NULL,'logapitest',NULL,'2020-04-29 10:51:10'),(426,5,NULL,'logapitest',NULL,'2020-04-29 10:51:10'),(427,5,NULL,'logapitest',NULL,'2020-04-29 10:51:10'),(428,5,NULL,'logapitest',NULL,'2020-04-29 10:51:10'),(429,5,NULL,'logapitest',NULL,'2020-04-29 10:51:10'),(430,5,NULL,'logapitest',NULL,'2020-04-29 10:51:10'),(431,5,NULL,'logapitest',NULL,'2020-04-29 10:51:10'),(432,5,NULL,'logapitest',NULL,'2020-04-29 10:51:10'),(433,5,NULL,'logapitest',NULL,'2020-04-29 10:51:10'),(434,5,NULL,'logapitest',NULL,'2020-04-29 10:51:10'),(435,5,NULL,'logapitest',NULL,'2020-04-29 10:51:10'),(436,5,NULL,'logapitest',NULL,'2020-04-29 10:51:11'),(437,5,NULL,'logapitest',NULL,'2020-04-29 10:51:11'),(438,5,NULL,'logapitest',NULL,'2020-04-29 10:51:11'),(439,5,NULL,'logapitest',NULL,'2020-04-29 10:51:11'),(440,5,NULL,'logapitest',NULL,'2020-04-29 10:51:11'),(441,5,NULL,'logapitest',NULL,'2020-04-29 10:51:11'),(442,5,NULL,'logapitest',NULL,'2020-04-29 10:51:11'),(443,5,NULL,'logapitest',NULL,'2020-04-29 10:51:11'),(444,5,NULL,'logapitest',NULL,'2020-04-29 10:51:11'),(445,5,NULL,'logapitest',NULL,'2020-04-29 10:51:11'),(446,5,NULL,'logapitest',NULL,'2020-04-29 10:51:11'),(447,5,NULL,'logapitest',NULL,'2020-04-29 10:51:11'),(448,5,NULL,'logapitest',NULL,'2020-04-29 10:51:11'),(449,5,NULL,'logapitest',NULL,'2020-04-29 10:51:11'),(450,5,NULL,'logapitest',NULL,'2020-04-29 10:51:11'),(451,5,NULL,'logapitest',NULL,'2020-04-29 10:51:11'),(452,5,NULL,'logapitest',NULL,'2020-04-29 10:51:11'),(453,5,NULL,'logapitest',NULL,'2020-04-29 10:51:11'),(454,5,NULL,'logapitest',NULL,'2020-04-29 10:51:11'),(455,5,NULL,'logapitest',NULL,'2020-04-29 10:51:11'),(456,5,NULL,'logapitest',NULL,'2020-04-29 10:51:11'),(457,5,NULL,'logapitest',NULL,'2020-04-29 10:51:11'),(458,5,NULL,'logapitest',NULL,'2020-04-29 10:51:11'),(459,5,NULL,'logapitest',NULL,'2020-04-29 10:51:11'),(460,5,NULL,'logapitest',NULL,'2020-04-29 10:51:11'),(461,5,NULL,'logapitest',NULL,'2020-04-29 10:51:11'),(462,5,NULL,'logapitest',NULL,'2020-04-29 10:51:11'),(463,5,NULL,'logapitest',NULL,'2020-04-29 10:51:11'),(464,5,NULL,'logapitest',NULL,'2020-04-29 10:51:11'),(465,5,NULL,'logapitest',NULL,'2020-04-29 10:51:11'),(466,5,NULL,'logapitest',NULL,'2020-04-29 10:51:11'),(467,5,NULL,'logapitest',NULL,'2020-04-29 10:51:11'),(468,5,NULL,'logapitest',NULL,'2020-04-29 10:51:11'),(469,5,NULL,'logapitest',NULL,'2020-04-29 10:51:11'),(470,5,NULL,'logapitest',NULL,'2020-04-29 10:51:11'),(471,5,NULL,'logapitest',NULL,'2020-04-29 10:51:11'),(472,5,NULL,'logapitest',NULL,'2020-04-29 10:51:11'),(473,5,NULL,'logapitest',NULL,'2020-04-29 10:51:11'),(474,5,NULL,'logapitest',NULL,'2020-04-29 10:51:11'),(475,5,NULL,'logapitest',NULL,'2020-04-29 10:51:11'),(476,5,NULL,'logapitest',NULL,'2020-04-29 10:51:11'),(477,5,NULL,'logapitest',NULL,'2020-04-29 10:51:11'),(478,5,NULL,'logapitest',NULL,'2020-04-29 10:51:11'),(479,5,NULL,'logapitest',NULL,'2020-04-29 10:51:11'),(480,5,NULL,'logapitest',NULL,'2020-04-29 10:51:11'),(481,5,NULL,'logapitest',NULL,'2020-04-29 10:51:11'),(482,5,NULL,'logapitest',NULL,'2020-04-29 10:51:11'),(483,5,NULL,'logapitest',NULL,'2020-04-29 10:51:11'),(484,5,NULL,'logapitest',NULL,'2020-04-29 10:51:11'),(485,5,NULL,'logapitest',NULL,'2020-04-29 10:51:11'),(486,5,NULL,'logapitest',NULL,'2020-04-29 10:51:11'),(487,5,NULL,'logapitest',NULL,'2020-04-29 10:51:11'),(488,5,NULL,'logapitest',NULL,'2020-04-29 10:51:11'),(489,5,NULL,'logapitest',NULL,'2020-04-29 10:51:11'),(490,5,NULL,'logapitest',NULL,'2020-04-29 10:51:11'),(491,5,NULL,'logapitest',NULL,'2020-04-29 10:51:11'),(492,5,NULL,'logapitest',NULL,'2020-04-29 10:51:11'),(493,5,NULL,'logapitest',NULL,'2020-04-29 10:51:12'),(494,5,NULL,'logapitest',NULL,'2020-04-29 10:51:12'),(495,5,NULL,'logapitest',NULL,'2020-04-29 10:51:12'),(496,5,NULL,'logapitest',NULL,'2020-04-29 10:51:12'),(497,5,NULL,'logapitest',NULL,'2020-04-29 10:51:12'),(498,5,NULL,'logapitest',NULL,'2020-04-29 10:51:12'),(499,5,NULL,'logapitest',NULL,'2020-04-29 10:51:12'),(500,5,NULL,'logapitest',NULL,'2020-04-29 10:51:12'),(501,5,NULL,'logapitest',NULL,'2020-04-29 10:51:12'),(502,5,NULL,'logapitest',NULL,'2020-04-29 10:51:12'),(503,5,NULL,'logapitest',NULL,'2020-04-29 10:51:12'),(504,5,NULL,'logapitest',NULL,'2020-04-29 10:51:12'),(505,5,NULL,'logapitest',NULL,'2020-04-29 10:51:12'),(506,5,NULL,'logapitest',NULL,'2020-04-29 10:51:12'),(507,5,NULL,'logapitest',NULL,'2020-04-29 10:51:12'),(508,5,NULL,'logapitest',NULL,'2020-04-29 10:51:12'),(509,5,NULL,'logapitest',NULL,'2020-04-29 10:51:12'),(510,5,NULL,'logapitest',NULL,'2020-04-29 10:51:12'),(511,5,NULL,'logapitest',NULL,'2020-04-29 10:51:12'),(512,5,NULL,'logapitest',NULL,'2020-04-29 10:51:12'),(513,5,NULL,'logapitest',NULL,'2020-04-29 10:51:12'),(514,5,NULL,'logapitest',NULL,'2020-04-29 10:51:12'),(515,5,NULL,'logapitest',NULL,'2020-04-29 10:51:12'),(516,5,NULL,'logapitest',NULL,'2020-04-29 10:51:12'),(517,5,NULL,'logapitest',NULL,'2020-04-29 10:51:12'),(518,5,NULL,'logapitest',NULL,'2020-04-29 10:51:12'),(519,5,NULL,'logapitest',NULL,'2020-04-29 10:51:12'),(520,5,NULL,'logapitest',NULL,'2020-04-29 10:51:12'),(521,5,NULL,'logapitest',NULL,'2020-04-29 10:51:12'),(522,5,NULL,'logapitest',NULL,'2020-04-29 10:51:12'),(523,5,NULL,'logapitest',NULL,'2020-04-29 10:51:12'),(524,5,NULL,'logapitest',NULL,'2020-04-29 10:51:12'),(525,5,NULL,'logapitest',NULL,'2020-04-29 10:51:12'),(526,5,NULL,'logapitest',NULL,'2020-04-29 10:51:12'),(527,5,NULL,'logapitest',NULL,'2020-04-29 10:51:12'),(528,5,NULL,'logapitest',NULL,'2020-04-29 10:51:12'),(529,5,NULL,'logapitest',NULL,'2020-04-29 10:51:12'),(530,5,NULL,'logapitest',NULL,'2020-04-29 10:51:12'),(531,5,NULL,'logapitest',NULL,'2020-04-29 10:51:12'),(532,5,NULL,'logapitest',NULL,'2020-04-29 10:51:12'),(533,5,NULL,'logapitest',NULL,'2020-04-29 10:51:12'),(534,5,NULL,'logapitest',NULL,'2020-04-29 10:51:12'),(535,5,NULL,'logapitest',NULL,'2020-04-29 10:51:12'),(536,5,NULL,'logapitest',NULL,'2020-04-29 10:51:12'),(537,5,NULL,'logapitest',NULL,'2020-04-29 10:51:12'),(538,5,NULL,'logapitest',NULL,'2020-04-29 10:51:12'),(539,5,NULL,'logapitest',NULL,'2020-04-29 10:51:12'),(540,5,NULL,'logapitest',NULL,'2020-04-29 10:51:12'),(541,5,NULL,'logapitest',NULL,'2020-04-29 10:51:12'),(542,5,NULL,'logapitest',NULL,'2020-04-29 10:51:12'),(543,5,NULL,'logapitest',NULL,'2020-04-29 10:51:12'),(544,5,NULL,'logapitest',NULL,'2020-04-29 10:51:12'),(545,5,NULL,'logapitest',NULL,'2020-04-29 10:51:12'),(546,5,NULL,'logapitest',NULL,'2020-04-29 10:51:12'),(547,5,NULL,'logapitest',NULL,'2020-04-29 10:51:12'),(548,5,NULL,'logapitest',NULL,'2020-04-29 10:51:12'),(549,5,NULL,'logapitest',NULL,'2020-04-29 10:51:12'),(550,5,NULL,'logapitest',NULL,'2020-04-29 10:51:13'),(551,5,NULL,'logapitest',NULL,'2020-04-29 10:51:13'),(552,5,NULL,'logapitest',NULL,'2020-04-29 10:51:13'),(553,5,NULL,'logapitest',NULL,'2020-04-29 10:51:13'),(554,5,NULL,'logapitest',NULL,'2020-04-29 10:51:13'),(555,5,NULL,'logapitest',NULL,'2020-04-29 10:51:13'),(556,5,NULL,'logapitest',NULL,'2020-04-29 10:51:13'),(557,5,NULL,'logapitest',NULL,'2020-04-29 10:51:13'),(558,5,NULL,'logapitest',NULL,'2020-04-29 10:51:13'),(559,5,NULL,'logapitest',NULL,'2020-04-29 10:51:13'),(560,5,NULL,'logapitest',NULL,'2020-04-29 10:51:13'),(561,5,NULL,'logapitest',NULL,'2020-04-29 10:51:13'),(562,5,NULL,'logapitest',NULL,'2020-04-29 10:51:13'),(563,5,NULL,'logapitest',NULL,'2020-04-29 10:51:13'),(564,5,NULL,'logapitest',NULL,'2020-04-29 10:51:13'),(565,5,NULL,'logapitest',NULL,'2020-04-29 10:51:13'),(566,5,NULL,'logapitest',NULL,'2020-04-29 10:51:13'),(567,5,NULL,'logapitest',NULL,'2020-04-29 10:51:13'),(568,5,NULL,'logapitest',NULL,'2020-04-29 10:51:13'),(569,5,NULL,'logapitest',NULL,'2020-04-29 10:51:13'),(570,5,NULL,'logapitest',NULL,'2020-04-29 10:51:13'),(571,5,NULL,'logapitest',NULL,'2020-04-29 10:51:13'),(572,5,NULL,'logapitest',NULL,'2020-04-29 10:51:13'),(573,5,NULL,'logapitest',NULL,'2020-04-29 10:51:13'),(574,5,NULL,'logapitest',NULL,'2020-04-29 10:51:13'),(575,5,NULL,'logapitest',NULL,'2020-04-29 10:51:13'),(576,5,NULL,'logapitest',NULL,'2020-04-29 10:51:13'),(577,5,NULL,'logapitest',NULL,'2020-04-29 10:51:13'),(578,5,NULL,'logapitest',NULL,'2020-04-29 10:51:13'),(579,5,NULL,'logapitest',NULL,'2020-04-29 10:51:13'),(580,5,NULL,'logapitest',NULL,'2020-04-29 10:51:13'),(581,5,NULL,'logapitest',NULL,'2020-04-29 10:51:13'),(582,5,NULL,'logapitest',NULL,'2020-04-29 10:51:13'),(583,5,NULL,'logapitest',NULL,'2020-04-29 10:51:13'),(584,5,NULL,'logapitest',NULL,'2020-04-29 10:51:13'),(585,5,NULL,'logapitest',NULL,'2020-04-29 10:51:13'),(586,5,NULL,'logapitest',NULL,'2020-04-29 10:51:13'),(587,5,NULL,'logapitest',NULL,'2020-04-29 10:51:13'),(588,5,NULL,'logapitest',NULL,'2020-04-29 10:51:13'),(589,5,NULL,'logapitest',NULL,'2020-04-29 10:51:13'),(590,5,NULL,'logapitest',NULL,'2020-04-29 10:51:13'),(591,5,NULL,'logapitest',NULL,'2020-04-29 10:51:13'),(592,5,NULL,'logapitest',NULL,'2020-04-29 10:51:13'),(593,5,NULL,'logapitest',NULL,'2020-04-29 10:51:13'),(594,5,NULL,'logapitest',NULL,'2020-04-29 10:51:13'),(595,5,NULL,'logapitest',NULL,'2020-04-29 10:51:13'),(596,5,NULL,'logapitest',NULL,'2020-04-29 10:51:13'),(597,5,NULL,'logapitest',NULL,'2020-04-29 10:51:13'),(598,5,NULL,'logapitest',NULL,'2020-04-29 10:51:13'),(599,5,NULL,'logapitest',NULL,'2020-04-29 10:51:13'),(600,5,NULL,'logapitest',NULL,'2020-04-29 10:51:13'),(601,5,NULL,'logapitest',NULL,'2020-04-29 10:51:13'),(602,5,NULL,'logapitest',NULL,'2020-04-29 10:51:13'),(603,5,NULL,'logapitest',NULL,'2020-04-29 10:51:13'),(604,5,NULL,'logapitest',NULL,'2020-04-29 10:51:13'),(605,5,NULL,'logapitest',NULL,'2020-04-29 10:51:13'),(606,5,NULL,'logapitest',NULL,'2020-04-29 10:51:14'),(607,5,NULL,'logapitest',NULL,'2020-04-29 10:51:14'),(608,5,NULL,'logapitest',NULL,'2020-04-29 10:51:14'),(609,5,NULL,'logapitest',NULL,'2020-04-29 10:51:14'),(610,5,NULL,'logapitest',NULL,'2020-04-29 10:51:14'),(611,5,NULL,'logapitest',NULL,'2020-04-29 10:51:14'),(612,5,NULL,'logapitest',NULL,'2020-04-29 10:51:14'),(613,5,NULL,'logapitest',NULL,'2020-04-29 10:51:14'),(614,5,NULL,'logapitest',NULL,'2020-04-29 10:51:14'),(615,5,NULL,'logapitest',NULL,'2020-04-29 10:51:14'),(616,5,NULL,'logapitest',NULL,'2020-04-29 10:51:14'),(617,5,NULL,'logapitest',NULL,'2020-04-29 10:51:14'),(618,5,NULL,'logapitest',NULL,'2020-04-29 10:51:14'),(619,5,NULL,'logapitest',NULL,'2020-04-29 10:51:14'),(620,5,NULL,'logapitest',NULL,'2020-04-29 10:51:14'),(621,5,NULL,'logapitest',NULL,'2020-04-29 10:51:14'),(622,5,NULL,'logapitest',NULL,'2020-04-29 10:51:14'),(623,5,NULL,'logapitest',NULL,'2020-04-29 10:51:14'),(624,5,NULL,'logapitest',NULL,'2020-04-29 10:51:14'),(625,5,NULL,'logapitest',NULL,'2020-04-29 10:51:14'),(626,5,NULL,'logapitest',NULL,'2020-04-29 10:51:14'),(627,5,NULL,'logapitest',NULL,'2020-04-29 10:51:14'),(628,5,NULL,'logapitest',NULL,'2020-04-29 10:51:14'),(629,5,NULL,'logapitest',NULL,'2020-04-29 10:51:14'),(630,5,NULL,'logapitest',NULL,'2020-04-29 10:51:14'),(631,5,NULL,'logapitest',NULL,'2020-04-29 10:51:14'),(632,5,NULL,'logapitest',NULL,'2020-04-29 10:51:14'),(633,5,NULL,'logapitest',NULL,'2020-04-29 10:51:14'),(634,5,NULL,'logapitest',NULL,'2020-04-29 10:51:14'),(635,5,NULL,'logapitest',NULL,'2020-04-29 10:51:14'),(636,5,NULL,'logapitest',NULL,'2020-04-29 10:51:14'),(637,5,NULL,'logapitest',NULL,'2020-04-29 10:51:14'),(638,5,NULL,'logapitest',NULL,'2020-04-29 10:51:14'),(639,5,NULL,'logapitest',NULL,'2020-04-29 10:51:14'),(640,5,NULL,'logapitest',NULL,'2020-04-29 10:51:14'),(641,5,NULL,'logapitest',NULL,'2020-04-29 10:51:14'),(642,5,NULL,'logapitest',NULL,'2020-04-29 10:51:14'),(643,5,NULL,'logapitest',NULL,'2020-04-29 10:51:14'),(644,5,NULL,'logapitest',NULL,'2020-04-29 10:51:14'),(645,5,NULL,'logapitest',NULL,'2020-04-29 10:51:14'),(646,5,NULL,'logapitest',NULL,'2020-04-29 10:51:14'),(647,5,NULL,'logapitest',NULL,'2020-04-29 10:51:14'),(648,5,NULL,'logapitest',NULL,'2020-04-29 10:51:14'),(649,5,NULL,'logapitest',NULL,'2020-04-29 10:51:14'),(650,5,NULL,'logapitest',NULL,'2020-04-29 10:51:14'),(651,5,NULL,'logapitest',NULL,'2020-04-29 10:51:14'),(652,5,NULL,'logapitest',NULL,'2020-04-29 10:51:14'),(653,5,NULL,'logapitest',NULL,'2020-04-29 10:51:14'),(654,5,NULL,'logapitest',NULL,'2020-04-29 10:51:14'),(655,5,NULL,'logapitest',NULL,'2020-04-29 10:51:14'),(656,5,NULL,'logapitest',NULL,'2020-04-29 10:51:14'),(657,5,NULL,'logapitest',NULL,'2020-04-29 10:51:14'),(658,5,NULL,'logapitest',NULL,'2020-04-29 10:51:14'),(659,5,NULL,'logapitest',NULL,'2020-04-29 10:51:14'),(660,5,NULL,'logapitest',NULL,'2020-04-29 10:51:14'),(661,5,NULL,'logapitest',NULL,'2020-04-29 10:51:14'),(662,5,NULL,'logapitest',NULL,'2020-04-29 10:51:14'),(663,5,NULL,'logapitest',NULL,'2020-04-29 10:51:14'),(664,5,NULL,'logapitest',NULL,'2020-04-29 10:51:15'),(665,5,NULL,'logapitest',NULL,'2020-04-29 10:51:15'),(666,5,NULL,'logapitest',NULL,'2020-04-29 10:51:15'),(667,5,NULL,'logapitest',NULL,'2020-04-29 10:51:15'),(668,5,NULL,'logapitest',NULL,'2020-04-29 10:51:15'),(669,5,NULL,'logapitest',NULL,'2020-04-29 10:51:15'),(670,5,NULL,'logapitest',NULL,'2020-04-29 10:51:15'),(671,5,NULL,'logapitest',NULL,'2020-04-29 10:51:15'),(672,5,NULL,'logapitest',NULL,'2020-04-29 10:51:15'),(673,5,NULL,'logapitest',NULL,'2020-04-29 10:51:15'),(674,5,NULL,'logapitest',NULL,'2020-04-29 10:51:15'),(675,5,NULL,'logapitest',NULL,'2020-04-29 10:51:15'),(676,5,NULL,'logapitest',NULL,'2020-04-29 10:51:15'),(677,5,NULL,'logapitest',NULL,'2020-04-29 10:51:15'),(678,5,NULL,'logapitest',NULL,'2020-04-29 10:51:15'),(679,5,NULL,'logapitest',NULL,'2020-04-29 10:51:15'),(680,5,NULL,'logapitest',NULL,'2020-04-29 10:51:15'),(681,5,NULL,'logapitest',NULL,'2020-04-29 10:51:15'),(682,5,NULL,'logapitest',NULL,'2020-04-29 10:51:15'),(683,5,NULL,'logapitest',NULL,'2020-04-29 10:51:15'),(684,5,NULL,'logapitest',NULL,'2020-04-29 10:51:15'),(685,5,NULL,'logapitest',NULL,'2020-04-29 10:51:15'),(686,5,NULL,'logapitest',NULL,'2020-04-29 10:51:15'),(687,5,NULL,'logapitest',NULL,'2020-04-29 10:51:15'),(688,5,NULL,'logapitest',NULL,'2020-04-29 10:51:15'),(689,5,NULL,'logapitest',NULL,'2020-04-29 10:51:15'),(690,5,NULL,'logapitest',NULL,'2020-04-29 10:51:15'),(691,5,NULL,'logapitest',NULL,'2020-04-29 10:51:15'),(692,5,NULL,'logapitest',NULL,'2020-04-29 10:51:15'),(693,5,NULL,'logapitest',NULL,'2020-04-29 10:51:15'),(694,5,NULL,'logapitest',NULL,'2020-04-29 10:51:15'),(695,5,NULL,'logapitest',NULL,'2020-04-29 10:51:15'),(696,5,NULL,'logapitest',NULL,'2020-04-29 10:51:15'),(697,5,NULL,'logapitest',NULL,'2020-04-29 10:51:15'),(698,5,NULL,'logapitest',NULL,'2020-04-29 10:51:15'),(699,5,NULL,'logapitest',NULL,'2020-04-29 10:51:15'),(700,5,NULL,'logapitest',NULL,'2020-04-29 10:51:15'),(701,5,NULL,'logapitest',NULL,'2020-04-29 10:51:15'),(702,5,NULL,'logapitest',NULL,'2020-04-29 10:51:15'),(703,5,NULL,'logapitest',NULL,'2020-04-29 10:51:15'),(704,5,NULL,'logapitest',NULL,'2020-04-29 10:51:15'),(705,5,NULL,'logapitest',NULL,'2020-04-29 10:51:15'),(706,5,NULL,'logapitest',NULL,'2020-04-29 10:51:15'),(707,5,NULL,'logapitest',NULL,'2020-04-29 10:51:15'),(708,5,NULL,'logapitest',NULL,'2020-04-29 10:51:15'),(709,5,NULL,'logapitest',NULL,'2020-04-29 10:51:15'),(710,5,NULL,'logapitest',NULL,'2020-04-29 10:51:15'),(711,5,NULL,'logapitest',NULL,'2020-04-29 10:51:15'),(712,5,NULL,'logapitest',NULL,'2020-04-29 10:51:15'),(713,5,NULL,'logapitest',NULL,'2020-04-29 10:51:15'),(714,5,NULL,'logapitest',NULL,'2020-04-29 10:51:15'),(715,5,NULL,'logapitest',NULL,'2020-04-29 10:51:15'),(716,5,NULL,'logapitest',NULL,'2020-04-29 10:51:15'),(717,5,NULL,'logapitest',NULL,'2020-04-29 10:51:15'),(718,5,NULL,'logapitest',NULL,'2020-04-29 10:51:15'),(719,5,NULL,'logapitest',NULL,'2020-04-29 10:51:15'),(720,5,NULL,'logapitest',NULL,'2020-04-29 10:51:16'),(721,5,NULL,'logapitest',NULL,'2020-04-29 10:51:16'),(722,5,NULL,'logapitest',NULL,'2020-04-29 10:51:16'),(723,5,NULL,'logapitest',NULL,'2020-04-29 10:51:16'),(724,5,NULL,'logapitest',NULL,'2020-04-29 10:51:16'),(725,5,NULL,'logapitest',NULL,'2020-04-29 10:51:16'),(726,5,NULL,'logapitest',NULL,'2020-04-29 10:51:16'),(727,5,NULL,'logapitest',NULL,'2020-04-29 10:51:16'),(728,5,NULL,'logapitest',NULL,'2020-04-29 10:51:16'),(729,5,NULL,'logapitest',NULL,'2020-04-29 10:51:16'),(730,5,NULL,'logapitest',NULL,'2020-04-29 10:51:16'),(731,5,NULL,'logapitest',NULL,'2020-04-29 10:51:16'),(732,5,NULL,'logapitest',NULL,'2020-04-29 10:51:16'),(733,5,NULL,'logapitest',NULL,'2020-04-29 10:51:16'),(734,5,NULL,'logapitest',NULL,'2020-04-29 10:51:16'),(735,5,NULL,'logapitest',NULL,'2020-04-29 10:51:16'),(736,5,NULL,'logapitest',NULL,'2020-04-29 10:51:16'),(737,5,NULL,'logapitest',NULL,'2020-04-29 10:51:16'),(738,5,NULL,'logapitest',NULL,'2020-04-29 10:51:16'),(739,5,NULL,'logapitest',NULL,'2020-04-29 10:51:16'),(740,5,NULL,'logapitest',NULL,'2020-04-29 10:51:16'),(741,5,NULL,'logapitest',NULL,'2020-04-29 10:51:16'),(742,5,NULL,'logapitest',NULL,'2020-04-29 10:51:16'),(743,5,NULL,'logapitest',NULL,'2020-04-29 10:51:16'),(744,5,NULL,'logapitest',NULL,'2020-04-29 10:51:16'),(745,5,NULL,'logapitest',NULL,'2020-04-29 10:51:16'),(746,5,NULL,'logapitest',NULL,'2020-04-29 10:51:16'),(747,5,NULL,'logapitest',NULL,'2020-04-29 10:51:16'),(748,5,NULL,'logapitest',NULL,'2020-04-29 10:51:16'),(749,5,NULL,'logapitest',NULL,'2020-04-29 10:51:16'),(750,5,NULL,'logapitest',NULL,'2020-04-29 10:51:16'),(751,5,NULL,'logapitest',NULL,'2020-04-29 10:51:16'),(752,5,NULL,'logapitest',NULL,'2020-04-29 10:51:16'),(753,5,NULL,'logapitest',NULL,'2020-04-29 10:51:16'),(754,5,NULL,'logapitest',NULL,'2020-04-29 10:51:16'),(755,5,NULL,'logapitest',NULL,'2020-04-29 10:51:16'),(756,5,NULL,'logapitest',NULL,'2020-04-29 10:51:16'),(757,5,NULL,'logapitest',NULL,'2020-04-29 10:51:16'),(758,5,NULL,'logapitest',NULL,'2020-04-29 10:51:16'),(759,5,NULL,'logapitest',NULL,'2020-04-29 10:51:16'),(760,5,NULL,'logapitest',NULL,'2020-04-29 10:51:16'),(761,5,NULL,'logapitest',NULL,'2020-04-29 10:51:16'),(762,5,NULL,'logapitest',NULL,'2020-04-29 10:51:16'),(763,5,NULL,'logapitest',NULL,'2020-04-29 10:51:16'),(764,5,NULL,'logapitest',NULL,'2020-04-29 10:51:16'),(765,5,NULL,'logapitest',NULL,'2020-04-29 10:51:16'),(766,5,NULL,'logapitest',NULL,'2020-04-29 10:51:16'),(767,5,NULL,'logapitest',NULL,'2020-04-29 10:51:16'),(768,5,NULL,'logapitest',NULL,'2020-04-29 10:51:16'),(769,5,NULL,'logapitest',NULL,'2020-04-29 10:51:16'),(770,5,NULL,'logapitest',NULL,'2020-04-29 10:51:16'),(771,5,NULL,'logapitest',NULL,'2020-04-29 10:51:16'),(772,5,NULL,'logapitest',NULL,'2020-04-29 10:51:16'),(773,5,NULL,'logapitest',NULL,'2020-04-29 10:51:16'),(774,5,NULL,'logapitest',NULL,'2020-04-29 10:51:16'),(775,5,NULL,'logapitest',NULL,'2020-04-29 10:51:16'),(776,5,NULL,'logapitest',NULL,'2020-04-29 10:51:16'),(777,5,NULL,'logapitest',NULL,'2020-04-29 10:51:16'),(778,5,NULL,'logapitest',NULL,'2020-04-29 10:51:16'),(779,5,NULL,'logapitest',NULL,'2020-04-29 10:51:16'),(780,5,NULL,'logapitest',NULL,'2020-04-29 10:51:17'),(781,5,NULL,'logapitest',NULL,'2020-04-29 10:51:17'),(782,5,NULL,'logapitest',NULL,'2020-04-29 10:51:17'),(783,5,NULL,'logapitest',NULL,'2020-04-29 10:51:17'),(784,5,NULL,'logapitest',NULL,'2020-04-29 10:51:17'),(785,5,NULL,'logapitest',NULL,'2020-04-29 10:51:17'),(786,5,NULL,'logapitest',NULL,'2020-04-29 10:51:17'),(787,5,NULL,'logapitest',NULL,'2020-04-29 10:51:17'),(788,5,NULL,'logapitest',NULL,'2020-04-29 10:51:17'),(789,5,NULL,'logapitest',NULL,'2020-04-29 10:51:17'),(790,5,NULL,'logapitest',NULL,'2020-04-29 10:51:17'),(791,5,NULL,'logapitest',NULL,'2020-04-29 10:51:17'),(792,5,NULL,'logapitest',NULL,'2020-04-29 10:51:17'),(793,5,NULL,'logapitest',NULL,'2020-04-29 10:51:17'),(794,5,NULL,'logapitest',NULL,'2020-04-29 10:51:17'),(795,5,NULL,'logapitest',NULL,'2020-04-29 10:51:17'),(796,5,NULL,'logapitest',NULL,'2020-04-29 10:51:17'),(797,5,NULL,'logapitest',NULL,'2020-04-29 10:51:17'),(798,5,NULL,'logapitest',NULL,'2020-04-29 10:51:17'),(799,5,NULL,'logapitest',NULL,'2020-04-29 10:51:17'),(800,58,NULL,'admin',NULL,'2020-04-29 10:51:17'),(811,41,'edu.ncsu.csc.itrust2.models.persistent.User@46ed09f7 created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@4c583248','hcp','AliceThirteen','2020-04-29 10:51:18'),(814,75,'edu.ncsu.csc.itrust2.models.persistent.User@46ed09f7 created a Lab Procedure for edu.ncsu.csc.itrust2.models.persistent.User@4c583248','hcp','AliceThirteen','2020-04-29 10:51:18'),(818,48,'Creating prescription with id 817','SPRING_API_TEST_USER','AliceThirteen','2020-04-29 10:51:18'),(819,43,'edu.ncsu.csc.itrust2.models.persistent.User@46ed09f7 deleted a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@4c583248','hcp','AliceThirteen','2020-04-29 10:51:18'),(820,77,'hcp deleted a Lab Procedure for AliceThirteen','hcp','AliceThirteen','2020-04-29 10:51:18'),(834,48,'Creating prescription with id 833','SPRING_API_TEST_USER','AliceThirteen','2020-04-29 10:51:22'),(836,41,'edu.ncsu.csc.itrust2.models.persistent.User@4c583248 created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@4c583248','AliceThirteen',NULL,'2020-04-29 10:51:22'),(855,48,'Creating prescription with id 854','SPRING_API_TEST_USER','AliceThirteen','2020-04-29 10:51:23'),(857,41,'edu.ncsu.csc.itrust2.models.persistent.User@4c583248 created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@4c583248','AliceThirteen',NULL,'2020-04-29 10:51:23'),(860,19,'test log entry with patient and hcp','logPatient','logHcp','2020-04-29 10:51:23'),(861,15,NULL,'logAdmin',NULL,'2020-04-29 10:51:23'),(862,1,'login succeeded for logPatient.','logPatient',NULL,'2020-04-29 10:51:23'),(863,1,'login succeeded for dupUser.','dupUser',NULL,'2020-04-29 10:51:23'),(864,1,'User has logged in','test',NULL,'2020-04-29 10:51:23'),(883,41,'edu.ncsu.csc.itrust2.models.persistent.User@413f0d75 created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@859a2b04','hcp','onionman','2020-04-29 10:57:42'),(885,41,'edu.ncsu.csc.itrust2.models.persistent.User@413f0d75 created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@859a2b04','hcp','onionman','2020-04-29 10:57:42'),(895,41,'edu.ncsu.csc.itrust2.models.persistent.User@413f0d75 created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@859a2b04','hcp','onionman','2020-04-29 10:57:43'),(897,41,'edu.ncsu.csc.itrust2.models.persistent.User@413f0d75 created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@859a2b04','hcp','onionman','2020-04-29 10:57:43'),(899,63,'Fetched Emergency Record for user onionman','hcp','onionman','2020-04-29 10:57:43'),(908,41,'edu.ncsu.csc.itrust2.models.persistent.User@413f0d75 created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@859a2b04','hcp','onionman','2020-04-29 10:57:43'),(910,41,'edu.ncsu.csc.itrust2.models.persistent.User@413f0d75 created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@859a2b04','hcp','onionman','2020-04-29 10:57:43'),(912,64,'Fetched Emergency Record for user onionman','er','onionman','2020-04-29 10:57:43'),(921,41,'edu.ncsu.csc.itrust2.models.persistent.User@413f0d75 created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@859a2b04','hcp','onionman','2020-04-29 10:57:44'),(923,41,'edu.ncsu.csc.itrust2.models.persistent.User@413f0d75 created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@859a2b04','hcp','onionman','2020-04-29 10:57:44'),(925,14,NULL,'hcp',NULL,'2020-04-29 10:57:44'),(927,82,NULL,'hcp','patient','2020-04-29 10:57:45'),(928,14,NULL,'patent',NULL,'2020-04-29 10:57:45'),(930,14,NULL,'patient',NULL,'2020-04-29 10:57:45'),(933,80,NULL,'patient',NULL,'2020-04-29 10:57:45'),(934,81,NULL,'patient',NULL,'2020-04-29 10:57:45'),(936,33,'admin created an ICD Code','admin',NULL,'2020-04-29 10:57:46'),(938,33,'admin created an ICD Code','admin',NULL,'2020-04-29 10:57:46'),(939,30,NULL,'admin',NULL,'2020-04-29 10:57:46'),(942,41,'edu.ncsu.csc.itrust2.models.persistent.User@413f0d75 created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@d7617b18','hcp','patient','2020-04-29 10:57:46'),(944,41,'edu.ncsu.csc.itrust2.models.persistent.User@413f0d75 created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@d7617b18','hcp','patient','2020-04-29 10:57:46'),(946,26,'patient','admin',NULL,'2020-04-29 10:57:46'),(947,39,'Retrieved diagnoses for office visit with id 941','admin','patient','2020-04-29 10:57:46'),(949,42,'edu.ncsu.csc.itrust2.models.persistent.User@413f0d75 edit a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@d7617b18','hcp','patient','2020-04-29 10:57:46'),(950,28,NULL,'admin',NULL,'2020-04-29 10:57:46'),(951,39,'Retrieved diagnoses for office visit with id 941','admin','patient','2020-04-29 10:57:46'),(953,43,'hcp deleted a diagnosis for patient','hcp','patient','2020-04-29 10:57:46'),(954,28,NULL,'admin',NULL,'2020-04-29 10:57:46'),(955,39,'Retrieved diagnoses for office visit with id 941','admin','patient','2020-04-29 10:57:46'),(956,7,NULL,'SPRING_API_TEST_USER','sven_forkbeard','2020-04-29 10:57:47'),(957,9,NULL,'SPRING_API_TEST_USER',NULL,'2020-04-29 10:57:47'),(958,8,NULL,'sven_forkbeard',NULL,'2020-04-29 10:57:47'),(959,11,NULL,'SPRING_API_TEST_USER',NULL,'2020-04-29 10:57:47'),(960,8,NULL,'-1',NULL,'2020-04-29 10:57:47'),(962,20,NULL,'patient','hcp','2020-04-29 10:57:48'),(963,21,NULL,'patient','hcp','2020-04-29 10:57:48'),(964,25,NULL,'patient','hcp','2020-04-29 10:57:48'),(965,24,NULL,'patient','hcp','2020-04-29 10:57:48'),(966,22,NULL,'patient','hcp','2020-04-29 10:57:48'),(968,33,'admin created an ICD Code','admin',NULL,'2020-04-29 10:57:48'),(969,36,'Fetched icd code with id 967','admin',NULL,'2020-04-29 10:57:48'),(970,35,'admin edited an ICD Code','admin',NULL,'2020-04-29 10:57:48'),(971,36,'Fetched icd code with id 967','admin',NULL,'2020-04-29 10:57:48'),(972,34,'admin deleted an ICD Code','admin',NULL,'2020-04-29 10:57:48'),(973,30,NULL,'patient',NULL,'2020-04-29 10:57:49'),(976,99,'patient','patient',NULL,'2020-04-29 10:57:49'),(977,102,NULL,'patient',NULL,'2020-04-29 10:57:49'),(978,101,'hcp updated basic health metrics for antti from 2048-04-16T09:45:00.000-04:00','hcp','antti','2020-04-29 10:57:49'),(980,101,NULL,'patient',NULL,'2020-04-29 10:57:49'),(981,103,NULL,'patient',NULL,'2020-04-29 10:57:49'),(982,30,NULL,'patient',NULL,'2020-04-29 10:57:49'),(984,20,NULL,'patient','hcp','2020-04-29 10:57:50'),(985,30,NULL,'robortOPH',NULL,'2020-04-29 10:57:50'),(987,20,NULL,'patient','hcp','2020-04-29 10:57:50'),(988,30,NULL,'bobbyOD',NULL,'2020-04-29 10:57:50'),(989,30,NULL,'patient',NULL,'2020-04-29 10:57:50'),(992,94,'patient','patient',NULL,'2020-04-29 10:57:51'),(993,97,NULL,'patient',NULL,'2020-04-29 10:57:51'),(994,96,'hcp updated basic health metrics for antti from 2048-04-16T09:45:00.000-04:00','hcp','antti','2020-04-29 10:57:51'),(996,96,NULL,'patient',NULL,'2020-04-29 10:57:51'),(997,98,NULL,'patient',NULL,'2020-04-29 10:57:51'),(998,30,NULL,'patient',NULL,'2020-04-29 10:57:51'),(1000,44,'Drug 0000-0000-00 created','admin',NULL,'2020-04-29 10:57:51'),(1001,44,'Conflict: drug with code 0000-0000-00 already exists','admin',NULL,'2020-04-29 10:57:51'),(1003,44,'Drug 0000-0000-01 created','admin',NULL,'2020-04-29 10:57:51'),(1004,47,'Fetched list of drugs','admin',NULL,'2020-04-29 10:57:51'),(1005,45,'Drug with id 999 edited','admin',NULL,'2020-04-29 10:57:51'),(1006,45,'Drug with id 1002 edited','admin',NULL,'2020-04-29 10:57:51'),(1007,46,'Deleted drug with id 999','admin',NULL,'2020-04-29 10:57:51'),(1008,46,'Deleted drug with id 1002','admin',NULL,'2020-04-29 10:57:51'),(1010,20,NULL,'patient','hcp','2020-04-29 10:57:52'),(1011,30,NULL,'hcp',NULL,'2020-04-29 10:57:52'),(1012,30,NULL,'patient',NULL,'2020-04-29 10:57:52'),(1015,26,'patient','patient',NULL,'2020-04-29 10:57:52'),(1016,29,NULL,'patient',NULL,'2020-04-29 10:57:52'),(1017,28,'hcp updated basic health metrics for antti from 2048-04-16T09:45:00.000-04:00','hcp','antti','2020-04-29 10:57:52'),(1019,28,NULL,'patient',NULL,'2020-04-29 10:57:53'),(1020,32,NULL,'patient',NULL,'2020-04-29 10:57:53'),(1021,30,NULL,'patient',NULL,'2020-04-29 10:57:53'),(1023,69,'admin created a LOINC Code','admin',NULL,'2020-04-29 10:57:53'),(1024,71,'admin edited a LOINC Code','admin',NULL,'2020-04-29 10:57:53'),(1025,70,'admin deleted a LOINC Code','admin',NULL,'2020-04-29 10:57:53'),(1026,72,'LabTech labtech Views Their Lab Procedures','labtech',NULL,'2020-04-29 10:57:53'),(1032,48,'Creating prescription with id 1031','labtech','AliceThirteen','2020-04-29 10:57:53'),(1034,41,'edu.ncsu.csc.itrust2.models.persistent.User@413f0d75 created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@2b0c358a','hcp','AliceThirteen','2020-04-29 10:57:53'),(1037,72,'LabTech labtech Views Lab Procedure 1036','labtech',NULL,'2020-04-29 10:57:53'),(1038,73,NULL,'labtech',NULL,'2020-04-29 10:57:53'),(1039,74,'LabTech labtech Reassigns Procedure To assignedTech2','labtech','assignedTech2','2020-04-29 10:57:53'),(1040,73,NULL,'labtech',NULL,'2020-04-29 10:57:53'),(1041,74,'LabTech labtech Reassigns Procedure To assignedTech2','labtech','assignedTech2','2020-04-29 10:57:53'),(1042,78,'HCP hcp Views Lab Procedures','hcp',NULL,'2020-04-29 10:57:53'),(1043,77,NULL,'hcp',NULL,'2020-04-29 10:57:53'),(1049,48,'Creating prescription with id 1048','hcp','patient','2020-04-29 10:57:54'),(1051,41,'edu.ncsu.csc.itrust2.models.persistent.User@d7617b18 created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@d7617b18','patient',NULL,'2020-04-29 10:57:54'),(1054,75,NULL,'hcp',NULL,'2020-04-29 10:57:54'),(1055,78,'HCP hcp Views Lab Procedures','hcp',NULL,'2020-04-29 10:57:54'),(1056,78,'HCP hcp Views labtech\'s Lab Procedures','hcp','labtech','2020-04-29 10:57:54'),(1057,78,'HCP hcp Views OfficeVisit 1050 Lab Procedures','hcp',NULL,'2020-04-29 10:57:54'),(1058,78,'HCP hcp Views Lab Procedure 1053','hcp',NULL,'2020-04-29 10:57:54'),(1059,77,NULL,'hcp',NULL,'2020-04-29 10:57:54'),(1064,48,'Creating prescription with id 1063','labtech','AliceThirteen','2020-04-29 10:57:54'),(1066,41,'edu.ncsu.csc.itrust2.models.persistent.User@413f0d75 created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@2b0c358a','hcp','AliceThirteen','2020-04-29 10:57:54'),(1069,73,NULL,'labtech',NULL,'2020-04-29 10:57:55'),(1070,74,'LabTech labtech Reassigns Procedure To assignedTech','labtech','assignedTech','2020-04-29 10:57:55'),(1071,44,'Conflict: drug with code 0000-0000-20 already exists','hcp',NULL,'2020-04-29 10:57:57'),(1073,48,'Created prescription with id 1072','hcp','api_test_patient','2020-04-29 10:57:57'),(1075,48,'Created prescription with id 1074','hcp','api_test_patient','2020-04-29 10:57:57'),(1076,51,'HCP viewed a list of all prescriptions','hcp',NULL,'2020-04-29 10:57:57'),(1077,49,'Edited prescription with id 1072','hcp','api_test_patient','2020-04-29 10:57:57'),(1078,49,'Edited prescription with id 1072','hcp','api_test_patient','2020-04-29 10:57:58'),(1079,49,'Failed to edit prescription','hcp',NULL,'2020-04-29 10:57:58'),(1080,50,'Deleted prescription with id 1072','hcp','api_test_patient','2020-04-29 10:57:58'),(1081,50,'Deleted prescription with id 1074','hcp','api_test_patient','2020-04-29 10:57:58'),(1083,14,NULL,'patientPW',NULL,'2020-04-29 10:57:58'),(1084,54,'Successfully changed password for user patientPW','patientPW',NULL,'2020-04-29 10:57:59'),(1086,14,NULL,'patientPW',NULL,'2020-04-29 10:58:00'),(1087,54,'Successfully changed password for user patientPW','patientPW',NULL,'2020-04-29 10:58:00'),(1088,62,NULL,'patientPW',NULL,'2020-04-29 10:58:00'),(1089,12,NULL,'hcp',NULL,'2020-04-29 10:58:00'),(1090,13,NULL,'hcp',NULL,'2020-04-29 10:58:00'),(1091,16,NULL,'admin',NULL,'2020-04-29 10:58:01'),(1092,17,NULL,'admin',NULL,'2020-04-29 10:58:01'),(1093,16,NULL,'admin',NULL,'2020-04-29 10:58:01'),(1094,14,NULL,'hcp',NULL,'2020-04-29 10:58:01'),(1096,56,'HCP retrieved demographics for patient with username antti','hcp','antti','2020-04-29 10:58:01'),(1097,13,'User with username anttiupdated their demographics','hcp',NULL,'2020-04-29 10:58:01'),(1098,57,'HCP edited demographics for patient with username antti','antti',NULL,'2020-04-29 10:58:01'),(1099,14,NULL,'hcp',NULL,'2020-04-29 10:58:01'),(1101,14,NULL,'hcp',NULL,'2020-04-29 10:58:01'),(1103,14,NULL,'hcp',NULL,'2020-04-29 10:58:01'),(1105,65,'HCP hcp has declared terry as a representative for bobbo','hcp','terry','2020-04-29 10:58:02'),(1106,65,'HCP hcp has declared jerry as a representative for bobbo','hcp','jerry','2020-04-29 10:58:02'),(1107,65,'HCP hcp has declared bobbo as a representative for terry','hcp','bobbo','2020-04-29 10:58:02'),(1108,65,'HCP hcp has declared bobbo as a representative for jerry','hcp','bobbo','2020-04-29 10:58:02'),(1109,68,'User terry has undeclared self as representative for bobbo','bobbo','terry','2020-04-29 10:58:02'),(1110,14,NULL,'antti',NULL,'2020-04-29 10:58:02'),(1112,14,NULL,'antti',NULL,'2020-04-29 10:58:03'),(1114,14,NULL,'antti',NULL,'2020-04-29 10:58:03'),(1116,66,'User bobbo has been added as a representative for user antti','antti','bobbo','2020-04-29 10:58:03'),(1117,67,'User antti has undeclared representative bobbo','antti','bobbo','2020-04-29 10:58:03'),(1118,14,NULL,'patent',NULL,'2020-04-29 10:58:03'),(1121,14,NULL,'patient',NULL,'2020-04-29 10:58:03'),(1124,104,NULL,'patient',NULL,'2020-04-29 10:58:03'),(1125,107,NULL,'patient',NULL,'2020-04-29 10:58:03'),(1126,105,NULL,'patient',NULL,'2020-04-29 10:58:03'),(1128,104,NULL,'patient',NULL,'2020-04-29 10:58:03'),(1129,105,NULL,'patient',NULL,'2020-04-29 10:58:03'),(1130,14,NULL,'hcp',NULL,'2020-04-29 10:58:04'),(1132,106,NULL,'hcp','patient','2020-04-29 10:58:04'),(1133,14,NULL,'hcp',NULL,'2020-04-29 10:58:04'),(1135,109,NULL,'hcp',NULL,'2020-04-29 10:58:04'),(1136,110,NULL,'hcp',NULL,'2020-04-29 10:58:04'),(1137,14,NULL,'patient',NULL,'2020-04-29 10:58:04'),(1139,108,NULL,'patient',NULL,'2020-04-29 10:58:04'),(1140,14,NULL,'patient',NULL,'2020-04-29 10:58:04'),(1143,104,NULL,'patient',NULL,'2020-04-29 10:58:04'),(1145,104,NULL,'patient',NULL,'2020-04-29 10:58:04'),(1147,104,NULL,'patient',NULL,'2020-04-29 10:58:04'),(1149,104,NULL,'patient',NULL,'2020-04-29 10:58:04'),(1151,104,NULL,'patient',NULL,'2020-04-29 10:58:05'),(1152,107,NULL,'patient',NULL,'2020-04-29 10:58:05'),(1153,107,NULL,'patient',NULL,'2020-04-29 10:58:05'),(1154,5,NULL,'logapitest',NULL,'2020-04-29 10:58:05'),(1155,5,NULL,'logapitest',NULL,'2020-04-29 10:58:05'),(1156,5,NULL,'logapitest',NULL,'2020-04-29 10:58:05'),(1157,5,NULL,'logapitest',NULL,'2020-04-29 10:58:05'),(1158,5,NULL,'logapitest',NULL,'2020-04-29 10:58:05'),(1159,5,NULL,'logapitest',NULL,'2020-04-29 10:58:05'),(1160,5,NULL,'logapitest',NULL,'2020-04-29 10:58:05'),(1161,5,NULL,'logapitest',NULL,'2020-04-29 10:58:05'),(1162,5,NULL,'logapitest',NULL,'2020-04-29 10:58:05'),(1163,5,NULL,'logapitest',NULL,'2020-04-29 10:58:05'),(1164,5,NULL,'logapitest',NULL,'2020-04-29 10:58:05'),(1165,5,NULL,'logapitest',NULL,'2020-04-29 10:58:05'),(1166,5,NULL,'logapitest',NULL,'2020-04-29 10:58:05'),(1167,5,NULL,'logapitest',NULL,'2020-04-29 10:58:05'),(1168,5,NULL,'logapitest',NULL,'2020-04-29 10:58:05'),(1169,5,NULL,'logapitest',NULL,'2020-04-29 10:58:05'),(1170,5,NULL,'logapitest',NULL,'2020-04-29 10:58:05'),(1171,5,NULL,'logapitest',NULL,'2020-04-29 10:58:05'),(1172,5,NULL,'logapitest',NULL,'2020-04-29 10:58:05'),(1173,5,NULL,'logapitest',NULL,'2020-04-29 10:58:05'),(1174,5,NULL,'logapitest',NULL,'2020-04-29 10:58:05'),(1175,5,NULL,'logapitest',NULL,'2020-04-29 10:58:05'),(1176,5,NULL,'logapitest',NULL,'2020-04-29 10:58:05'),(1177,5,NULL,'logapitest',NULL,'2020-04-29 10:58:05'),(1178,5,NULL,'logapitest',NULL,'2020-04-29 10:58:05'),(1179,5,NULL,'logapitest',NULL,'2020-04-29 10:58:05'),(1180,5,NULL,'logapitest',NULL,'2020-04-29 10:58:05'),(1181,5,NULL,'logapitest',NULL,'2020-04-29 10:58:05'),(1182,5,NULL,'logapitest',NULL,'2020-04-29 10:58:05'),(1183,5,NULL,'logapitest',NULL,'2020-04-29 10:58:05'),(1184,5,NULL,'logapitest',NULL,'2020-04-29 10:58:05'),(1185,5,NULL,'logapitest',NULL,'2020-04-29 10:58:05'),(1186,5,NULL,'logapitest',NULL,'2020-04-29 10:58:05'),(1187,5,NULL,'logapitest',NULL,'2020-04-29 10:58:05'),(1188,5,NULL,'logapitest',NULL,'2020-04-29 10:58:05'),(1189,5,NULL,'logapitest',NULL,'2020-04-29 10:58:05'),(1190,5,NULL,'logapitest',NULL,'2020-04-29 10:58:05'),(1191,5,NULL,'logapitest',NULL,'2020-04-29 10:58:05'),(1192,5,NULL,'logapitest',NULL,'2020-04-29 10:58:05'),(1193,5,NULL,'logapitest',NULL,'2020-04-29 10:58:05'),(1194,5,NULL,'logapitest',NULL,'2020-04-29 10:58:05'),(1195,5,NULL,'logapitest',NULL,'2020-04-29 10:58:05'),(1196,5,NULL,'logapitest',NULL,'2020-04-29 10:58:05'),(1197,5,NULL,'logapitest',NULL,'2020-04-29 10:58:05'),(1198,5,NULL,'logapitest',NULL,'2020-04-29 10:58:05'),(1199,5,NULL,'logapitest',NULL,'2020-04-29 10:58:05'),(1200,5,NULL,'logapitest',NULL,'2020-04-29 10:58:05'),(1201,5,NULL,'logapitest',NULL,'2020-04-29 10:58:05'),(1202,5,NULL,'logapitest',NULL,'2020-04-29 10:58:05'),(1203,5,NULL,'logapitest',NULL,'2020-04-29 10:58:06'),(1204,5,NULL,'logapitest',NULL,'2020-04-29 10:58:06'),(1205,5,NULL,'logapitest',NULL,'2020-04-29 10:58:06'),(1206,5,NULL,'logapitest',NULL,'2020-04-29 10:58:06'),(1207,5,NULL,'logapitest',NULL,'2020-04-29 10:58:06'),(1208,5,NULL,'logapitest',NULL,'2020-04-29 10:58:06'),(1209,5,NULL,'logapitest',NULL,'2020-04-29 10:58:06'),(1210,5,NULL,'logapitest',NULL,'2020-04-29 10:58:06'),(1211,5,NULL,'logapitest',NULL,'2020-04-29 10:58:06'),(1212,5,NULL,'logapitest',NULL,'2020-04-29 10:58:06'),(1213,5,NULL,'logapitest',NULL,'2020-04-29 10:58:06'),(1214,5,NULL,'logapitest',NULL,'2020-04-29 10:58:06'),(1215,5,NULL,'logapitest',NULL,'2020-04-29 10:58:06'),(1216,5,NULL,'logapitest',NULL,'2020-04-29 10:58:06'),(1217,5,NULL,'logapitest',NULL,'2020-04-29 10:58:06'),(1218,5,NULL,'logapitest',NULL,'2020-04-29 10:58:06'),(1219,5,NULL,'logapitest',NULL,'2020-04-29 10:58:06'),(1220,5,NULL,'logapitest',NULL,'2020-04-29 10:58:06'),(1221,5,NULL,'logapitest',NULL,'2020-04-29 10:58:06'),(1222,5,NULL,'logapitest',NULL,'2020-04-29 10:58:06'),(1223,5,NULL,'logapitest',NULL,'2020-04-29 10:58:06'),(1224,5,NULL,'logapitest',NULL,'2020-04-29 10:58:06'),(1225,5,NULL,'logapitest',NULL,'2020-04-29 10:58:06'),(1226,5,NULL,'logapitest',NULL,'2020-04-29 10:58:06'),(1227,5,NULL,'logapitest',NULL,'2020-04-29 10:58:06'),(1228,5,NULL,'logapitest',NULL,'2020-04-29 10:58:06'),(1229,5,NULL,'logapitest',NULL,'2020-04-29 10:58:06'),(1230,5,NULL,'logapitest',NULL,'2020-04-29 10:58:06'),(1231,5,NULL,'logapitest',NULL,'2020-04-29 10:58:06'),(1232,5,NULL,'logapitest',NULL,'2020-04-29 10:58:06'),(1233,5,NULL,'logapitest',NULL,'2020-04-29 10:58:06'),(1234,5,NULL,'logapitest',NULL,'2020-04-29 10:58:06'),(1235,5,NULL,'logapitest',NULL,'2020-04-29 10:58:06'),(1236,5,NULL,'logapitest',NULL,'2020-04-29 10:58:06'),(1237,5,NULL,'logapitest',NULL,'2020-04-29 10:58:06'),(1238,5,NULL,'logapitest',NULL,'2020-04-29 10:58:06'),(1239,5,NULL,'logapitest',NULL,'2020-04-29 10:58:06'),(1240,5,NULL,'logapitest',NULL,'2020-04-29 10:58:06'),(1241,5,NULL,'logapitest',NULL,'2020-04-29 10:58:06'),(1242,5,NULL,'logapitest',NULL,'2020-04-29 10:58:06'),(1243,5,NULL,'logapitest',NULL,'2020-04-29 10:58:06'),(1244,5,NULL,'logapitest',NULL,'2020-04-29 10:58:06'),(1245,5,NULL,'logapitest',NULL,'2020-04-29 10:58:06'),(1246,5,NULL,'logapitest',NULL,'2020-04-29 10:58:06'),(1247,5,NULL,'logapitest',NULL,'2020-04-29 10:58:06'),(1248,5,NULL,'logapitest',NULL,'2020-04-29 10:58:06'),(1249,5,NULL,'logapitest',NULL,'2020-04-29 10:58:06'),(1250,5,NULL,'logapitest',NULL,'2020-04-29 10:58:06'),(1251,5,NULL,'logapitest',NULL,'2020-04-29 10:58:06'),(1252,5,NULL,'logapitest',NULL,'2020-04-29 10:58:06'),(1253,5,NULL,'logapitest',NULL,'2020-04-29 10:58:06'),(1254,5,NULL,'logapitest',NULL,'2020-04-29 10:58:06'),(1255,5,NULL,'logapitest',NULL,'2020-04-29 10:58:06'),(1256,5,NULL,'logapitest',NULL,'2020-04-29 10:58:06'),(1257,5,NULL,'logapitest',NULL,'2020-04-29 10:58:06'),(1258,5,NULL,'logapitest',NULL,'2020-04-29 10:58:06'),(1259,5,NULL,'logapitest',NULL,'2020-04-29 10:58:06'),(1260,5,NULL,'logapitest',NULL,'2020-04-29 10:58:07'),(1261,5,NULL,'logapitest',NULL,'2020-04-29 10:58:07'),(1262,5,NULL,'logapitest',NULL,'2020-04-29 10:58:07'),(1263,5,NULL,'logapitest',NULL,'2020-04-29 10:58:07'),(1264,5,NULL,'logapitest',NULL,'2020-04-29 10:58:07'),(1265,5,NULL,'logapitest',NULL,'2020-04-29 10:58:07'),(1266,5,NULL,'logapitest',NULL,'2020-04-29 10:58:07'),(1267,5,NULL,'logapitest',NULL,'2020-04-29 10:58:07'),(1268,5,NULL,'logapitest',NULL,'2020-04-29 10:58:07'),(1269,5,NULL,'logapitest',NULL,'2020-04-29 10:58:07'),(1270,5,NULL,'logapitest',NULL,'2020-04-29 10:58:07'),(1271,5,NULL,'logapitest',NULL,'2020-04-29 10:58:07'),(1272,5,NULL,'logapitest',NULL,'2020-04-29 10:58:07'),(1273,5,NULL,'logapitest',NULL,'2020-04-29 10:58:07'),(1274,5,NULL,'logapitest',NULL,'2020-04-29 10:58:07'),(1275,5,NULL,'logapitest',NULL,'2020-04-29 10:58:07'),(1276,5,NULL,'logapitest',NULL,'2020-04-29 10:58:07'),(1277,5,NULL,'logapitest',NULL,'2020-04-29 10:58:07'),(1278,5,NULL,'logapitest',NULL,'2020-04-29 10:58:07'),(1279,5,NULL,'logapitest',NULL,'2020-04-29 10:58:07'),(1280,5,NULL,'logapitest',NULL,'2020-04-29 10:58:07'),(1281,5,NULL,'logapitest',NULL,'2020-04-29 10:58:07'),(1282,5,NULL,'logapitest',NULL,'2020-04-29 10:58:07'),(1283,5,NULL,'logapitest',NULL,'2020-04-29 10:58:07'),(1284,5,NULL,'logapitest',NULL,'2020-04-29 10:58:07'),(1285,5,NULL,'logapitest',NULL,'2020-04-29 10:58:07'),(1286,5,NULL,'logapitest',NULL,'2020-04-29 10:58:07'),(1287,5,NULL,'logapitest',NULL,'2020-04-29 10:58:07'),(1288,5,NULL,'logapitest',NULL,'2020-04-29 10:58:07'),(1289,5,NULL,'logapitest',NULL,'2020-04-29 10:58:07'),(1290,5,NULL,'logapitest',NULL,'2020-04-29 10:58:07'),(1291,5,NULL,'logapitest',NULL,'2020-04-29 10:58:07'),(1292,5,NULL,'logapitest',NULL,'2020-04-29 10:58:07'),(1293,5,NULL,'logapitest',NULL,'2020-04-29 10:58:07'),(1294,5,NULL,'logapitest',NULL,'2020-04-29 10:58:07'),(1295,5,NULL,'logapitest',NULL,'2020-04-29 10:58:07'),(1296,5,NULL,'logapitest',NULL,'2020-04-29 10:58:07'),(1297,5,NULL,'logapitest',NULL,'2020-04-29 10:58:07'),(1298,5,NULL,'logapitest',NULL,'2020-04-29 10:58:07'),(1299,5,NULL,'logapitest',NULL,'2020-04-29 10:58:07'),(1300,5,NULL,'logapitest',NULL,'2020-04-29 10:58:07'),(1301,5,NULL,'logapitest',NULL,'2020-04-29 10:58:07'),(1302,5,NULL,'logapitest',NULL,'2020-04-29 10:58:07'),(1303,5,NULL,'logapitest',NULL,'2020-04-29 10:58:07'),(1304,5,NULL,'logapitest',NULL,'2020-04-29 10:58:07'),(1305,5,NULL,'logapitest',NULL,'2020-04-29 10:58:07'),(1306,5,NULL,'logapitest',NULL,'2020-04-29 10:58:07'),(1307,5,NULL,'logapitest',NULL,'2020-04-29 10:58:07'),(1308,5,NULL,'logapitest',NULL,'2020-04-29 10:58:07'),(1309,5,NULL,'logapitest',NULL,'2020-04-29 10:58:07'),(1310,5,NULL,'logapitest',NULL,'2020-04-29 10:58:07'),(1311,5,NULL,'logapitest',NULL,'2020-04-29 10:58:07'),(1312,5,NULL,'logapitest',NULL,'2020-04-29 10:58:07'),(1313,5,NULL,'logapitest',NULL,'2020-04-29 10:58:07'),(1314,5,NULL,'logapitest',NULL,'2020-04-29 10:58:07'),(1315,5,NULL,'logapitest',NULL,'2020-04-29 10:58:07'),(1316,5,NULL,'logapitest',NULL,'2020-04-29 10:58:07'),(1317,5,NULL,'logapitest',NULL,'2020-04-29 10:58:08'),(1318,5,NULL,'logapitest',NULL,'2020-04-29 10:58:08'),(1319,5,NULL,'logapitest',NULL,'2020-04-29 10:58:08'),(1320,5,NULL,'logapitest',NULL,'2020-04-29 10:58:08'),(1321,5,NULL,'logapitest',NULL,'2020-04-29 10:58:08'),(1322,5,NULL,'logapitest',NULL,'2020-04-29 10:58:08'),(1323,5,NULL,'logapitest',NULL,'2020-04-29 10:58:08'),(1324,5,NULL,'logapitest',NULL,'2020-04-29 10:58:08'),(1325,5,NULL,'logapitest',NULL,'2020-04-29 10:58:08'),(1326,5,NULL,'logapitest',NULL,'2020-04-29 10:58:08'),(1327,5,NULL,'logapitest',NULL,'2020-04-29 10:58:08'),(1328,5,NULL,'logapitest',NULL,'2020-04-29 10:58:08'),(1329,5,NULL,'logapitest',NULL,'2020-04-29 10:58:08'),(1330,5,NULL,'logapitest',NULL,'2020-04-29 10:58:08'),(1331,5,NULL,'logapitest',NULL,'2020-04-29 10:58:08'),(1332,5,NULL,'logapitest',NULL,'2020-04-29 10:58:08'),(1333,5,NULL,'logapitest',NULL,'2020-04-29 10:58:08'),(1334,5,NULL,'logapitest',NULL,'2020-04-29 10:58:08'),(1335,5,NULL,'logapitest',NULL,'2020-04-29 10:58:08'),(1336,5,NULL,'logapitest',NULL,'2020-04-29 10:58:08'),(1337,5,NULL,'logapitest',NULL,'2020-04-29 10:58:08'),(1338,5,NULL,'logapitest',NULL,'2020-04-29 10:58:08'),(1339,5,NULL,'logapitest',NULL,'2020-04-29 10:58:08'),(1340,5,NULL,'logapitest',NULL,'2020-04-29 10:58:08'),(1341,5,NULL,'logapitest',NULL,'2020-04-29 10:58:08'),(1342,5,NULL,'logapitest',NULL,'2020-04-29 10:58:08'),(1343,5,NULL,'logapitest',NULL,'2020-04-29 10:58:08'),(1344,5,NULL,'logapitest',NULL,'2020-04-29 10:58:08'),(1345,5,NULL,'logapitest',NULL,'2020-04-29 10:58:08'),(1346,5,NULL,'logapitest',NULL,'2020-04-29 10:58:08'),(1347,5,NULL,'logapitest',NULL,'2020-04-29 10:58:08'),(1348,5,NULL,'logapitest',NULL,'2020-04-29 10:58:08'),(1349,5,NULL,'logapitest',NULL,'2020-04-29 10:58:08'),(1350,5,NULL,'logapitest',NULL,'2020-04-29 10:58:08'),(1351,5,NULL,'logapitest',NULL,'2020-04-29 10:58:08'),(1352,5,NULL,'logapitest',NULL,'2020-04-29 10:58:08'),(1353,5,NULL,'logapitest',NULL,'2020-04-29 10:58:08'),(1354,5,NULL,'logapitest',NULL,'2020-04-29 10:58:08'),(1355,5,NULL,'logapitest',NULL,'2020-04-29 10:58:08'),(1356,5,NULL,'logapitest',NULL,'2020-04-29 10:58:08'),(1357,5,NULL,'logapitest',NULL,'2020-04-29 10:58:08'),(1358,5,NULL,'logapitest',NULL,'2020-04-29 10:58:08'),(1359,5,NULL,'logapitest',NULL,'2020-04-29 10:58:08'),(1360,5,NULL,'logapitest',NULL,'2020-04-29 10:58:08'),(1361,5,NULL,'logapitest',NULL,'2020-04-29 10:58:08'),(1362,5,NULL,'logapitest',NULL,'2020-04-29 10:58:08'),(1363,5,NULL,'logapitest',NULL,'2020-04-29 10:58:08'),(1364,5,NULL,'logapitest',NULL,'2020-04-29 10:58:08'),(1365,5,NULL,'logapitest',NULL,'2020-04-29 10:58:08'),(1366,5,NULL,'logapitest',NULL,'2020-04-29 10:58:08'),(1367,5,NULL,'logapitest',NULL,'2020-04-29 10:58:08'),(1368,5,NULL,'logapitest',NULL,'2020-04-29 10:58:08'),(1369,5,NULL,'logapitest',NULL,'2020-04-29 10:58:08'),(1370,5,NULL,'logapitest',NULL,'2020-04-29 10:58:08'),(1371,5,NULL,'logapitest',NULL,'2020-04-29 10:58:08'),(1372,5,NULL,'logapitest',NULL,'2020-04-29 10:58:08'),(1373,5,NULL,'logapitest',NULL,'2020-04-29 10:58:09'),(1374,5,NULL,'logapitest',NULL,'2020-04-29 10:58:09'),(1375,5,NULL,'logapitest',NULL,'2020-04-29 10:58:09'),(1376,5,NULL,'logapitest',NULL,'2020-04-29 10:58:09'),(1377,5,NULL,'logapitest',NULL,'2020-04-29 10:58:09'),(1378,5,NULL,'logapitest',NULL,'2020-04-29 10:58:09'),(1379,5,NULL,'logapitest',NULL,'2020-04-29 10:58:09'),(1380,5,NULL,'logapitest',NULL,'2020-04-29 10:58:09'),(1381,5,NULL,'logapitest',NULL,'2020-04-29 10:58:09'),(1382,5,NULL,'logapitest',NULL,'2020-04-29 10:58:09'),(1383,5,NULL,'logapitest',NULL,'2020-04-29 10:58:09'),(1384,5,NULL,'logapitest',NULL,'2020-04-29 10:58:09'),(1385,5,NULL,'logapitest',NULL,'2020-04-29 10:58:09'),(1386,5,NULL,'logapitest',NULL,'2020-04-29 10:58:09'),(1387,5,NULL,'logapitest',NULL,'2020-04-29 10:58:09'),(1388,5,NULL,'logapitest',NULL,'2020-04-29 10:58:09'),(1389,5,NULL,'logapitest',NULL,'2020-04-29 10:58:09'),(1390,5,NULL,'logapitest',NULL,'2020-04-29 10:58:09'),(1391,5,NULL,'logapitest',NULL,'2020-04-29 10:58:09'),(1392,5,NULL,'logapitest',NULL,'2020-04-29 10:58:09'),(1393,5,NULL,'logapitest',NULL,'2020-04-29 10:58:09'),(1394,5,NULL,'logapitest',NULL,'2020-04-29 10:58:09'),(1395,5,NULL,'logapitest',NULL,'2020-04-29 10:58:09'),(1396,5,NULL,'logapitest',NULL,'2020-04-29 10:58:09'),(1397,5,NULL,'logapitest',NULL,'2020-04-29 10:58:09'),(1398,5,NULL,'logapitest',NULL,'2020-04-29 10:58:09'),(1399,5,NULL,'logapitest',NULL,'2020-04-29 10:58:09'),(1400,5,NULL,'logapitest',NULL,'2020-04-29 10:58:09'),(1401,5,NULL,'logapitest',NULL,'2020-04-29 10:58:09'),(1402,5,NULL,'logapitest',NULL,'2020-04-29 10:58:09'),(1403,5,NULL,'logapitest',NULL,'2020-04-29 10:58:09'),(1404,5,NULL,'logapitest',NULL,'2020-04-29 10:58:09'),(1405,5,NULL,'logapitest',NULL,'2020-04-29 10:58:09'),(1406,5,NULL,'logapitest',NULL,'2020-04-29 10:58:09'),(1407,5,NULL,'logapitest',NULL,'2020-04-29 10:58:09'),(1408,5,NULL,'logapitest',NULL,'2020-04-29 10:58:09'),(1409,5,NULL,'logapitest',NULL,'2020-04-29 10:58:09'),(1410,5,NULL,'logapitest',NULL,'2020-04-29 10:58:09'),(1411,5,NULL,'logapitest',NULL,'2020-04-29 10:58:09'),(1412,5,NULL,'logapitest',NULL,'2020-04-29 10:58:09'),(1413,5,NULL,'logapitest',NULL,'2020-04-29 10:58:09'),(1414,5,NULL,'logapitest',NULL,'2020-04-29 10:58:09'),(1415,5,NULL,'logapitest',NULL,'2020-04-29 10:58:09'),(1416,5,NULL,'logapitest',NULL,'2020-04-29 10:58:09'),(1417,5,NULL,'logapitest',NULL,'2020-04-29 10:58:09'),(1418,5,NULL,'logapitest',NULL,'2020-04-29 10:58:09'),(1419,5,NULL,'logapitest',NULL,'2020-04-29 10:58:09'),(1420,5,NULL,'logapitest',NULL,'2020-04-29 10:58:09'),(1421,5,NULL,'logapitest',NULL,'2020-04-29 10:58:09'),(1422,5,NULL,'logapitest',NULL,'2020-04-29 10:58:09'),(1423,5,NULL,'logapitest',NULL,'2020-04-29 10:58:09'),(1424,5,NULL,'logapitest',NULL,'2020-04-29 10:58:09'),(1425,5,NULL,'logapitest',NULL,'2020-04-29 10:58:09'),(1426,5,NULL,'logapitest',NULL,'2020-04-29 10:58:09'),(1427,5,NULL,'logapitest',NULL,'2020-04-29 10:58:09'),(1428,5,NULL,'logapitest',NULL,'2020-04-29 10:58:09'),(1429,5,NULL,'logapitest',NULL,'2020-04-29 10:58:10'),(1430,5,NULL,'logapitest',NULL,'2020-04-29 10:58:10'),(1431,5,NULL,'logapitest',NULL,'2020-04-29 10:58:10'),(1432,5,NULL,'logapitest',NULL,'2020-04-29 10:58:10'),(1433,5,NULL,'logapitest',NULL,'2020-04-29 10:58:10'),(1434,5,NULL,'logapitest',NULL,'2020-04-29 10:58:10'),(1435,5,NULL,'logapitest',NULL,'2020-04-29 10:58:10'),(1436,5,NULL,'logapitest',NULL,'2020-04-29 10:58:10'),(1437,5,NULL,'logapitest',NULL,'2020-04-29 10:58:10'),(1438,5,NULL,'logapitest',NULL,'2020-04-29 10:58:10'),(1439,5,NULL,'logapitest',NULL,'2020-04-29 10:58:10'),(1440,5,NULL,'logapitest',NULL,'2020-04-29 10:58:10'),(1441,5,NULL,'logapitest',NULL,'2020-04-29 10:58:10'),(1442,5,NULL,'logapitest',NULL,'2020-04-29 10:58:10'),(1443,5,NULL,'logapitest',NULL,'2020-04-29 10:58:10'),(1444,5,NULL,'logapitest',NULL,'2020-04-29 10:58:10'),(1445,5,NULL,'logapitest',NULL,'2020-04-29 10:58:10'),(1446,5,NULL,'logapitest',NULL,'2020-04-29 10:58:10'),(1447,5,NULL,'logapitest',NULL,'2020-04-29 10:58:10'),(1448,5,NULL,'logapitest',NULL,'2020-04-29 10:58:10'),(1449,5,NULL,'logapitest',NULL,'2020-04-29 10:58:10'),(1450,5,NULL,'logapitest',NULL,'2020-04-29 10:58:10'),(1451,5,NULL,'logapitest',NULL,'2020-04-29 10:58:10'),(1452,5,NULL,'logapitest',NULL,'2020-04-29 10:58:10'),(1453,5,NULL,'logapitest',NULL,'2020-04-29 10:58:10'),(1454,5,NULL,'logapitest',NULL,'2020-04-29 10:58:10'),(1455,5,NULL,'logapitest',NULL,'2020-04-29 10:58:10'),(1456,5,NULL,'logapitest',NULL,'2020-04-29 10:58:10'),(1457,5,NULL,'logapitest',NULL,'2020-04-29 10:58:10'),(1458,5,NULL,'logapitest',NULL,'2020-04-29 10:58:10'),(1459,5,NULL,'logapitest',NULL,'2020-04-29 10:58:10'),(1460,5,NULL,'logapitest',NULL,'2020-04-29 10:58:10'),(1461,5,NULL,'logapitest',NULL,'2020-04-29 10:58:10'),(1462,5,NULL,'logapitest',NULL,'2020-04-29 10:58:10'),(1463,5,NULL,'logapitest',NULL,'2020-04-29 10:58:10'),(1464,5,NULL,'logapitest',NULL,'2020-04-29 10:58:10'),(1465,5,NULL,'logapitest',NULL,'2020-04-29 10:58:10'),(1466,5,NULL,'logapitest',NULL,'2020-04-29 10:58:10'),(1467,5,NULL,'logapitest',NULL,'2020-04-29 10:58:10'),(1468,5,NULL,'logapitest',NULL,'2020-04-29 10:58:10'),(1469,5,NULL,'logapitest',NULL,'2020-04-29 10:58:10'),(1470,5,NULL,'logapitest',NULL,'2020-04-29 10:58:10'),(1471,5,NULL,'logapitest',NULL,'2020-04-29 10:58:10'),(1472,5,NULL,'logapitest',NULL,'2020-04-29 10:58:10'),(1473,5,NULL,'logapitest',NULL,'2020-04-29 10:58:10'),(1474,5,NULL,'logapitest',NULL,'2020-04-29 10:58:10'),(1475,5,NULL,'logapitest',NULL,'2020-04-29 10:58:10'),(1476,5,NULL,'logapitest',NULL,'2020-04-29 10:58:10'),(1477,5,NULL,'logapitest',NULL,'2020-04-29 10:58:10'),(1478,5,NULL,'logapitest',NULL,'2020-04-29 10:58:10'),(1479,5,NULL,'logapitest',NULL,'2020-04-29 10:58:10'),(1480,5,NULL,'logapitest',NULL,'2020-04-29 10:58:10'),(1481,5,NULL,'logapitest',NULL,'2020-04-29 10:58:10'),(1482,5,NULL,'logapitest',NULL,'2020-04-29 10:58:10'),(1483,5,NULL,'logapitest',NULL,'2020-04-29 10:58:10'),(1484,5,NULL,'logapitest',NULL,'2020-04-29 10:58:10'),(1485,5,NULL,'logapitest',NULL,'2020-04-29 10:58:11'),(1486,5,NULL,'logapitest',NULL,'2020-04-29 10:58:11'),(1487,5,NULL,'logapitest',NULL,'2020-04-29 10:58:11'),(1488,5,NULL,'logapitest',NULL,'2020-04-29 10:58:11'),(1489,5,NULL,'logapitest',NULL,'2020-04-29 10:58:11'),(1490,5,NULL,'logapitest',NULL,'2020-04-29 10:58:11'),(1491,5,NULL,'logapitest',NULL,'2020-04-29 10:58:11'),(1492,5,NULL,'logapitest',NULL,'2020-04-29 10:58:11'),(1493,5,NULL,'logapitest',NULL,'2020-04-29 10:58:11'),(1494,5,NULL,'logapitest',NULL,'2020-04-29 10:58:11'),(1495,5,NULL,'logapitest',NULL,'2020-04-29 10:58:11'),(1496,5,NULL,'logapitest',NULL,'2020-04-29 10:58:11'),(1497,5,NULL,'logapitest',NULL,'2020-04-29 10:58:11'),(1498,5,NULL,'logapitest',NULL,'2020-04-29 10:58:11'),(1499,5,NULL,'logapitest',NULL,'2020-04-29 10:58:11'),(1500,5,NULL,'logapitest',NULL,'2020-04-29 10:58:11'),(1501,5,NULL,'logapitest',NULL,'2020-04-29 10:58:11'),(1502,5,NULL,'logapitest',NULL,'2020-04-29 10:58:11'),(1503,5,NULL,'logapitest',NULL,'2020-04-29 10:58:11'),(1504,5,NULL,'logapitest',NULL,'2020-04-29 10:58:11'),(1505,5,NULL,'logapitest',NULL,'2020-04-29 10:58:11'),(1506,5,NULL,'logapitest',NULL,'2020-04-29 10:58:11'),(1507,5,NULL,'logapitest',NULL,'2020-04-29 10:58:11'),(1508,5,NULL,'logapitest',NULL,'2020-04-29 10:58:11'),(1509,5,NULL,'logapitest',NULL,'2020-04-29 10:58:11'),(1510,5,NULL,'logapitest',NULL,'2020-04-29 10:58:11'),(1511,5,NULL,'logapitest',NULL,'2020-04-29 10:58:11'),(1512,5,NULL,'logapitest',NULL,'2020-04-29 10:58:11'),(1513,5,NULL,'logapitest',NULL,'2020-04-29 10:58:11'),(1514,5,NULL,'logapitest',NULL,'2020-04-29 10:58:11'),(1515,5,NULL,'logapitest',NULL,'2020-04-29 10:58:11'),(1516,5,NULL,'logapitest',NULL,'2020-04-29 10:58:11'),(1517,5,NULL,'logapitest',NULL,'2020-04-29 10:58:11'),(1518,5,NULL,'logapitest',NULL,'2020-04-29 10:58:11'),(1519,5,NULL,'logapitest',NULL,'2020-04-29 10:58:11'),(1520,5,NULL,'logapitest',NULL,'2020-04-29 10:58:11'),(1521,5,NULL,'logapitest',NULL,'2020-04-29 10:58:11'),(1522,5,NULL,'logapitest',NULL,'2020-04-29 10:58:11'),(1523,5,NULL,'logapitest',NULL,'2020-04-29 10:58:11'),(1524,5,NULL,'logapitest',NULL,'2020-04-29 10:58:11'),(1525,5,NULL,'logapitest',NULL,'2020-04-29 10:58:11'),(1526,5,NULL,'logapitest',NULL,'2020-04-29 10:58:11'),(1527,5,NULL,'logapitest',NULL,'2020-04-29 10:58:11'),(1528,5,NULL,'logapitest',NULL,'2020-04-29 10:58:11'),(1529,5,NULL,'logapitest',NULL,'2020-04-29 10:58:11'),(1530,5,NULL,'logapitest',NULL,'2020-04-29 10:58:11'),(1531,5,NULL,'logapitest',NULL,'2020-04-29 10:58:11'),(1532,5,NULL,'logapitest',NULL,'2020-04-29 10:58:11'),(1533,5,NULL,'logapitest',NULL,'2020-04-29 10:58:11'),(1534,5,NULL,'logapitest',NULL,'2020-04-29 10:58:11'),(1535,5,NULL,'logapitest',NULL,'2020-04-29 10:58:11'),(1536,5,NULL,'logapitest',NULL,'2020-04-29 10:58:11'),(1537,5,NULL,'logapitest',NULL,'2020-04-29 10:58:11'),(1538,5,NULL,'logapitest',NULL,'2020-04-29 10:58:11'),(1539,5,NULL,'logapitest',NULL,'2020-04-29 10:58:11'),(1540,5,NULL,'logapitest',NULL,'2020-04-29 10:58:11'),(1541,5,NULL,'logapitest',NULL,'2020-04-29 10:58:11'),(1542,5,NULL,'logapitest',NULL,'2020-04-29 10:58:12'),(1543,5,NULL,'logapitest',NULL,'2020-04-29 10:58:12'),(1544,5,NULL,'logapitest',NULL,'2020-04-29 10:58:12'),(1545,5,NULL,'logapitest',NULL,'2020-04-29 10:58:12'),(1546,5,NULL,'logapitest',NULL,'2020-04-29 10:58:12'),(1547,5,NULL,'logapitest',NULL,'2020-04-29 10:58:12'),(1548,5,NULL,'logapitest',NULL,'2020-04-29 10:58:12'),(1549,5,NULL,'logapitest',NULL,'2020-04-29 10:58:12'),(1550,5,NULL,'logapitest',NULL,'2020-04-29 10:58:12'),(1551,5,NULL,'logapitest',NULL,'2020-04-29 10:58:12'),(1552,5,NULL,'logapitest',NULL,'2020-04-29 10:58:12'),(1553,5,NULL,'logapitest',NULL,'2020-04-29 10:58:12'),(1554,5,NULL,'logapitest',NULL,'2020-04-29 10:58:12'),(1555,5,NULL,'logapitest',NULL,'2020-04-29 10:58:12'),(1556,5,NULL,'logapitest',NULL,'2020-04-29 10:58:12'),(1557,5,NULL,'logapitest',NULL,'2020-04-29 10:58:12'),(1558,5,NULL,'logapitest',NULL,'2020-04-29 10:58:12'),(1559,5,NULL,'logapitest',NULL,'2020-04-29 10:58:12'),(1560,5,NULL,'logapitest',NULL,'2020-04-29 10:58:12'),(1561,5,NULL,'logapitest',NULL,'2020-04-29 10:58:12'),(1562,5,NULL,'logapitest',NULL,'2020-04-29 10:58:12'),(1563,5,NULL,'logapitest',NULL,'2020-04-29 10:58:12'),(1564,5,NULL,'logapitest',NULL,'2020-04-29 10:58:12'),(1565,5,NULL,'logapitest',NULL,'2020-04-29 10:58:12'),(1566,5,NULL,'logapitest',NULL,'2020-04-29 10:58:12'),(1567,5,NULL,'logapitest',NULL,'2020-04-29 10:58:12'),(1568,5,NULL,'logapitest',NULL,'2020-04-29 10:58:12'),(1569,5,NULL,'logapitest',NULL,'2020-04-29 10:58:12'),(1570,5,NULL,'logapitest',NULL,'2020-04-29 10:58:12'),(1571,5,NULL,'logapitest',NULL,'2020-04-29 10:58:12'),(1572,5,NULL,'logapitest',NULL,'2020-04-29 10:58:12'),(1573,5,NULL,'logapitest',NULL,'2020-04-29 10:58:12'),(1574,5,NULL,'logapitest',NULL,'2020-04-29 10:58:12'),(1575,5,NULL,'logapitest',NULL,'2020-04-29 10:58:12'),(1576,5,NULL,'logapitest',NULL,'2020-04-29 10:58:12'),(1577,5,NULL,'logapitest',NULL,'2020-04-29 10:58:12'),(1578,5,NULL,'logapitest',NULL,'2020-04-29 10:58:12'),(1579,5,NULL,'logapitest',NULL,'2020-04-29 10:58:12'),(1580,5,NULL,'logapitest',NULL,'2020-04-29 10:58:12'),(1581,5,NULL,'logapitest',NULL,'2020-04-29 10:58:12'),(1582,5,NULL,'logapitest',NULL,'2020-04-29 10:58:12'),(1583,5,NULL,'logapitest',NULL,'2020-04-29 10:58:12'),(1584,5,NULL,'logapitest',NULL,'2020-04-29 10:58:12'),(1585,5,NULL,'logapitest',NULL,'2020-04-29 10:58:12'),(1586,5,NULL,'logapitest',NULL,'2020-04-29 10:58:12'),(1587,5,NULL,'logapitest',NULL,'2020-04-29 10:58:12'),(1588,5,NULL,'logapitest',NULL,'2020-04-29 10:58:12'),(1589,5,NULL,'logapitest',NULL,'2020-04-29 10:58:12'),(1590,5,NULL,'logapitest',NULL,'2020-04-29 10:58:12'),(1591,5,NULL,'logapitest',NULL,'2020-04-29 10:58:12'),(1592,5,NULL,'logapitest',NULL,'2020-04-29 10:58:12'),(1593,5,NULL,'logapitest',NULL,'2020-04-29 10:58:12'),(1594,5,NULL,'logapitest',NULL,'2020-04-29 10:58:12'),(1595,5,NULL,'logapitest',NULL,'2020-04-29 10:58:12'),(1596,5,NULL,'logapitest',NULL,'2020-04-29 10:58:12'),(1597,5,NULL,'logapitest',NULL,'2020-04-29 10:58:12'),(1598,5,NULL,'logapitest',NULL,'2020-04-29 10:58:13'),(1599,5,NULL,'logapitest',NULL,'2020-04-29 10:58:13'),(1600,5,NULL,'logapitest',NULL,'2020-04-29 10:58:13'),(1601,5,NULL,'logapitest',NULL,'2020-04-29 10:58:13'),(1602,5,NULL,'logapitest',NULL,'2020-04-29 10:58:13'),(1603,5,NULL,'logapitest',NULL,'2020-04-29 10:58:13'),(1604,5,NULL,'logapitest',NULL,'2020-04-29 10:58:13'),(1605,5,NULL,'logapitest',NULL,'2020-04-29 10:58:13'),(1606,5,NULL,'logapitest',NULL,'2020-04-29 10:58:13'),(1607,5,NULL,'logapitest',NULL,'2020-04-29 10:58:13'),(1608,5,NULL,'logapitest',NULL,'2020-04-29 10:58:13'),(1609,5,NULL,'logapitest',NULL,'2020-04-29 10:58:13'),(1610,5,NULL,'logapitest',NULL,'2020-04-29 10:58:13'),(1611,5,NULL,'logapitest',NULL,'2020-04-29 10:58:13'),(1612,5,NULL,'logapitest',NULL,'2020-04-29 10:58:13'),(1613,5,NULL,'logapitest',NULL,'2020-04-29 10:58:13'),(1614,5,NULL,'logapitest',NULL,'2020-04-29 10:58:13'),(1615,5,NULL,'logapitest',NULL,'2020-04-29 10:58:13'),(1616,5,NULL,'logapitest',NULL,'2020-04-29 10:58:13'),(1617,5,NULL,'logapitest',NULL,'2020-04-29 10:58:13'),(1618,5,NULL,'logapitest',NULL,'2020-04-29 10:58:13'),(1619,5,NULL,'logapitest',NULL,'2020-04-29 10:58:13'),(1620,5,NULL,'logapitest',NULL,'2020-04-29 10:58:13'),(1621,5,NULL,'logapitest',NULL,'2020-04-29 10:58:13'),(1622,5,NULL,'logapitest',NULL,'2020-04-29 10:58:13'),(1623,5,NULL,'logapitest',NULL,'2020-04-29 10:58:13'),(1624,5,NULL,'logapitest',NULL,'2020-04-29 10:58:13'),(1625,5,NULL,'logapitest',NULL,'2020-04-29 10:58:13'),(1626,5,NULL,'logapitest',NULL,'2020-04-29 10:58:13'),(1627,5,NULL,'logapitest',NULL,'2020-04-29 10:58:13'),(1628,5,NULL,'logapitest',NULL,'2020-04-29 10:58:13'),(1629,5,NULL,'logapitest',NULL,'2020-04-29 10:58:13'),(1630,5,NULL,'logapitest',NULL,'2020-04-29 10:58:13'),(1631,5,NULL,'logapitest',NULL,'2020-04-29 10:58:13'),(1632,5,NULL,'logapitest',NULL,'2020-04-29 10:58:13'),(1633,5,NULL,'logapitest',NULL,'2020-04-29 10:58:13'),(1634,5,NULL,'logapitest',NULL,'2020-04-29 10:58:13'),(1635,5,NULL,'logapitest',NULL,'2020-04-29 10:58:13'),(1636,5,NULL,'logapitest',NULL,'2020-04-29 10:58:13'),(1637,5,NULL,'logapitest',NULL,'2020-04-29 10:58:13'),(1638,5,NULL,'logapitest',NULL,'2020-04-29 10:58:13'),(1639,5,NULL,'logapitest',NULL,'2020-04-29 10:58:13'),(1640,5,NULL,'logapitest',NULL,'2020-04-29 10:58:13'),(1641,5,NULL,'logapitest',NULL,'2020-04-29 10:58:13'),(1642,5,NULL,'logapitest',NULL,'2020-04-29 10:58:13'),(1643,5,NULL,'logapitest',NULL,'2020-04-29 10:58:13'),(1644,5,NULL,'logapitest',NULL,'2020-04-29 10:58:13'),(1645,5,NULL,'logapitest',NULL,'2020-04-29 10:58:13'),(1646,5,NULL,'logapitest',NULL,'2020-04-29 10:58:13'),(1647,5,NULL,'logapitest',NULL,'2020-04-29 10:58:13'),(1648,5,NULL,'logapitest',NULL,'2020-04-29 10:58:13'),(1649,5,NULL,'logapitest',NULL,'2020-04-29 10:58:13'),(1650,5,NULL,'logapitest',NULL,'2020-04-29 10:58:13'),(1651,5,NULL,'logapitest',NULL,'2020-04-29 10:58:13'),(1652,5,NULL,'logapitest',NULL,'2020-04-29 10:58:13'),(1653,5,NULL,'logapitest',NULL,'2020-04-29 10:58:13'),(1654,58,NULL,'admin',NULL,'2020-04-29 10:58:14'),(1665,41,'edu.ncsu.csc.itrust2.models.persistent.User@413f0d75 created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@2b0c358a','hcp','AliceThirteen','2020-04-29 10:58:14'),(1668,75,'edu.ncsu.csc.itrust2.models.persistent.User@413f0d75 created a Lab Procedure for edu.ncsu.csc.itrust2.models.persistent.User@2b0c358a','hcp','AliceThirteen','2020-04-29 10:58:14'),(1672,48,'Creating prescription with id 1671','SPRING_API_TEST_USER','AliceThirteen','2020-04-29 10:58:14'),(1673,43,'edu.ncsu.csc.itrust2.models.persistent.User@413f0d75 deleted a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@2b0c358a','hcp','AliceThirteen','2020-04-29 10:58:15'),(1674,77,'hcp deleted a Lab Procedure for AliceThirteen','hcp','AliceThirteen','2020-04-29 10:58:15'),(1688,48,'Creating prescription with id 1687','SPRING_API_TEST_USER','AliceThirteen','2020-04-29 10:58:18'),(1690,41,'edu.ncsu.csc.itrust2.models.persistent.User@2b0c358a created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@2b0c358a','AliceThirteen',NULL,'2020-04-29 10:58:18'),(1709,48,'Creating prescription with id 1708','SPRING_API_TEST_USER','AliceThirteen','2020-04-29 10:58:19'),(1711,41,'edu.ncsu.csc.itrust2.models.persistent.User@2b0c358a created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@2b0c358a','AliceThirteen',NULL,'2020-04-29 10:58:19'),(1714,19,'test log entry with patient and hcp','logPatient','logHcp','2020-04-29 10:58:19'),(1715,15,NULL,'logAdmin',NULL,'2020-04-29 10:58:19'),(1716,1,'login succeeded for logPatient.','logPatient',NULL,'2020-04-29 10:58:19'),(1717,1,'login succeeded for dupUser.','dupUser',NULL,'2020-04-29 10:58:19'),(1718,1,'User has logged in','test',NULL,'2020-04-29 10:58:19');
/*!40000 ALTER TABLE `LogEntries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LoginAttempts`
--

DROP TABLE IF EXISTS `LoginAttempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LoginAttempts` (
  `id` bigint(20) NOT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `user_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6me6sh9op6gntvqnqqqiev95q` (`user_id`),
  CONSTRAINT `FK6me6sh9op6gntvqnqqqiev95q` FOREIGN KEY (`user_id`) REFERENCES `Users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LoginAttempts`
--

LOCK TABLES `LoginAttempts` WRITE;
/*!40000 ALTER TABLE `LoginAttempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `LoginAttempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LoginBans`
--

DROP TABLE IF EXISTS `LoginBans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LoginBans` (
  `id` bigint(20) NOT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `user_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKpmi5daj2jt8w5gq9maxjpro1f` (`user_id`),
  CONSTRAINT `FKpmi5daj2jt8w5gq9maxjpro1f` FOREIGN KEY (`user_id`) REFERENCES `Users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LoginBans`
--

LOCK TABLES `LoginBans` WRITE;
/*!40000 ALTER TABLE `LoginBans` DISABLE KEYS */;
/*!40000 ALTER TABLE `LoginBans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LoginLockouts`
--

DROP TABLE IF EXISTS `LoginLockouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LoginLockouts` (
  `id` bigint(20) NOT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `user_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKhndsii960xs59bv7a7x5669ii` (`user_id`),
  CONSTRAINT `FKhndsii960xs59bv7a7x5669ii` FOREIGN KEY (`user_id`) REFERENCES `Users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LoginLockouts`
--

LOCK TABLES `LoginLockouts` WRITE;
/*!40000 ALTER TABLE `LoginLockouts` DISABLE KEYS */;
/*!40000 ALTER TABLE `LoginLockouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OphthalmologySurgery`
--

DROP TABLE IF EXISTS `OphthalmologySurgery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OphthalmologySurgery` (
  `id` bigint(20) NOT NULL,
  `date` datetime DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `axisOD` int(11) DEFAULT NULL,
  `axisOS` int(11) DEFAULT NULL,
  `cylinderOD` double DEFAULT NULL,
  `cylinderOS` double DEFAULT NULL,
  `sphereOD` double DEFAULT NULL,
  `sphereOS` double DEFAULT NULL,
  `visualAcuityOD` int(11) DEFAULT NULL,
  `visualAcuityOS` int(11) DEFAULT NULL,
  `surgeryType` int(11) DEFAULT NULL,
  `appointment_id` bigint(20) DEFAULT NULL,
  `basichealthmetrics_id` bigint(20) DEFAULT NULL,
  `hcp_id` varchar(100) DEFAULT NULL,
  `hospital_id` varchar(100) DEFAULT NULL,
  `patient_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2ab5y8krlqw4407jo9je2rodh` (`appointment_id`),
  KEY `FK64ijwgpf2cbt4t6vcwyj0vy77` (`basichealthmetrics_id`),
  KEY `FK43k7w4nn8hxf36s3xonve9l5v` (`hcp_id`),
  KEY `FKg3nwmi2eh9lxpys9gom75nsvx` (`hospital_id`),
  KEY `FK526jd5m6bguykj27g8jbl2idt` (`patient_id`),
  CONSTRAINT `FK2ab5y8krlqw4407jo9je2rodh` FOREIGN KEY (`appointment_id`) REFERENCES `AppointmentRequests` (`id`),
  CONSTRAINT `FK43k7w4nn8hxf36s3xonve9l5v` FOREIGN KEY (`hcp_id`) REFERENCES `Users` (`username`),
  CONSTRAINT `FK526jd5m6bguykj27g8jbl2idt` FOREIGN KEY (`patient_id`) REFERENCES `Users` (`username`),
  CONSTRAINT `FK64ijwgpf2cbt4t6vcwyj0vy77` FOREIGN KEY (`basichealthmetrics_id`) REFERENCES `BasicHealthMetrics` (`id`),
  CONSTRAINT `FKg3nwmi2eh9lxpys9gom75nsvx` FOREIGN KEY (`hospital_id`) REFERENCES `Hospitals` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OphthalmologySurgery`
--

LOCK TABLES `OphthalmologySurgery` WRITE;
/*!40000 ALTER TABLE `OphthalmologySurgery` DISABLE KEYS */;
/*!40000 ALTER TABLE `OphthalmologySurgery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PERSONAL_REPRESENTATIVES`
--

DROP TABLE IF EXISTS `PERSONAL_REPRESENTATIVES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PERSONAL_REPRESENTATIVES` (
  `patient_id` varchar(100) NOT NULL,
  `representative_id` varchar(100) NOT NULL,
  PRIMARY KEY (`patient_id`,`representative_id`),
  KEY `FK4xcw5y8obck13wkbeja8cxy6d` (`representative_id`),
  CONSTRAINT `FK4xcw5y8obck13wkbeja8cxy6d` FOREIGN KEY (`representative_id`) REFERENCES `Patients` (`self_id`),
  CONSTRAINT `FKthu0xxghbfmojk34tnmg17qxd` FOREIGN KEY (`patient_id`) REFERENCES `Patients` (`self_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PERSONAL_REPRESENTATIVES`
--

LOCK TABLES `PERSONAL_REPRESENTATIVES` WRITE;
/*!40000 ALTER TABLE `PERSONAL_REPRESENTATIVES` DISABLE KEYS */;
/*!40000 ALTER TABLE `PERSONAL_REPRESENTATIVES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PasswordResetTokens`
--

DROP TABLE IF EXISTS `PasswordResetTokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PasswordResetTokens` (
  `id` bigint(20) NOT NULL,
  `creationTime` bigint(20) NOT NULL,
  `tempPassword` varchar(255) DEFAULT NULL,
  `user_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKdtqvlc6is6k5ibp1xc1nshrc8` (`user_id`),
  CONSTRAINT `FKdtqvlc6is6k5ibp1xc1nshrc8` FOREIGN KEY (`user_id`) REFERENCES `Users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PasswordResetTokens`
--

LOCK TABLES `PasswordResetTokens` WRITE;
/*!40000 ALTER TABLE `PasswordResetTokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `PasswordResetTokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Patients`
--

DROP TABLE IF EXISTS `Patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Patients` (
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `bloodType` varchar(255) DEFAULT NULL,
  `causeOfDeath` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `dateOfBirth` datetime DEFAULT NULL,
  `dateOfDeath` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `ethnicity` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `id` bigint(20) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `preferredName` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `self_id` varchar(100) NOT NULL,
  `father_id` varchar(100) DEFAULT NULL,
  `mother_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`self_id`),
  KEY `FK8s22h2pw102ce5ytcmqmhegp3` (`father_id`),
  KEY `FK3aemk5yjohgj9y6j4lq57g4o5` (`mother_id`),
  CONSTRAINT `FK3aemk5yjohgj9y6j4lq57g4o5` FOREIGN KEY (`mother_id`) REFERENCES `Users` (`username`),
  CONSTRAINT `FK8s22h2pw102ce5ytcmqmhegp3` FOREIGN KEY (`father_id`) REFERENCES `Users` (`username`),
  CONSTRAINT `FKe0d1x2xac4nte49udxrwdiew5` FOREIGN KEY (`self_id`) REFERENCES `Users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Patients`
--

LOCK TABLES `Patients` WRITE;
/*!40000 ALTER TABLE `Patients` DISABLE KEYS */;
INSERT INTO `Patients` VALUES ('1 Test Street','Some Location','APos',NULL,'Viipuri','1977-06-14 23:00:00',NULL,'antti@itrust.fi','Caucasian','Antti','Male',NULL,'Walhelm','123-456-7890',NULL,'NC','27514','antti',NULL,NULL),('1 Test Street','Some Location','APos',NULL,'Viipuri','1977-06-14 23:00:00',NULL,'bobbo@itrust.fi','Caucasian','Bobbo','Male',NULL,'Walhelm','123-456-7890',NULL,'NC','27514','bobbo',NULL,NULL),(NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'patient',NULL,NULL),('Some town',NULL,'NotSpecified',NULL,'placecity','1901-01-01 00:00:00',NULL,NULL,'NotSpecified','patient','NotSpecified',NULL,'mcpatientface','111-111-1111','patient','AL','27606','patientTestPatient',NULL,NULL),('Some town',NULL,'NotSpecified',NULL,'placecity','1901-01-01 00:00:00',NULL,NULL,'NotSpecified','rep','NotSpecified',NULL,'mcrepface','111-222-1111','rep','AL','27606','patientTestRep',NULL,NULL),('1 Test Street','Some Location','APos',NULL,'Viipuri','1977-06-14 23:00:00',NULL,'terry@itrust.fi','Caucasian','Terry','Male',NULL,'Walhelm','123-456-7890',NULL,'NC','27514','terry',NULL,NULL);
/*!40000 ALTER TABLE `Patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Personnel`
--

DROP TABLE IF EXISTS `Personnel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Personnel` (
  `id` bigint(20) NOT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `enabled` bit(1) NOT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `specialty` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `self_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKa9l63705rm5c4tf50y9h9x8rp` (`self_id`),
  CONSTRAINT `FKa9l63705rm5c4tf50y9h9x8rp` FOREIGN KEY (`self_id`) REFERENCES `Users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Personnel`
--

LOCK TABLES `Personnel` WRITE;
/*!40000 ALTER TABLE `Personnel` DISABLE KEYS */;
INSERT INTO `Personnel` VALUES (1,'1 Test Street','Address Part 2','Prag','hcp@itrust.cz',_binary '\0','Test','HCP','123-456-7890','Doctor Stuff','NC','27514','hcp'),(2,NULL,NULL,NULL,NULL,_binary '\0','Knight','Solaire',NULL,NULL,NULL,NULL,'knightSolaire'),(3,NULL,NULL,NULL,NULL,_binary '\0','Lab','Technician',NULL,NULL,NULL,NULL,'labtech'),(4,NULL,NULL,NULL,NULL,_binary '\0','Larry','Teacher',NULL,NULL,NULL,NULL,'larrytech');
/*!40000 ALTER TABLE `Personnel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Prescriptions`
--

DROP TABLE IF EXISTS `Prescriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Prescriptions` (
  `id` bigint(20) NOT NULL,
  `dosage` int(11) NOT NULL,
  `endDate` datetime DEFAULT NULL,
  `renewals` int(11) NOT NULL,
  `startDate` datetime DEFAULT NULL,
  `drug_id` bigint(20) DEFAULT NULL,
  `patient_id` varchar(100) DEFAULT NULL,
  `prescriptions_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKrr7q2rw34mv2h8p24dwo2sw39` (`drug_id`),
  KEY `FK11c0dywqeqm53244c088xriq0` (`patient_id`),
  KEY `FKkhctha3d1ti34dbaplmn8tsyk` (`prescriptions_id`),
  CONSTRAINT `FK11c0dywqeqm53244c088xriq0` FOREIGN KEY (`patient_id`) REFERENCES `Users` (`username`),
  CONSTRAINT `FKkhctha3d1ti34dbaplmn8tsyk` FOREIGN KEY (`prescriptions_id`) REFERENCES `GeneralCheckups` (`id`),
  CONSTRAINT `FKrr7q2rw34mv2h8p24dwo2sw39` FOREIGN KEY (`drug_id`) REFERENCES `Drugs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Prescriptions`
--

LOCK TABLES `Prescriptions` WRITE;
/*!40000 ALTER TABLE `Prescriptions` DISABLE KEYS */;
INSERT INTO `Prescriptions` VALUES (15,1,'2020-06-27 23:00:00',20,'2020-03-29 23:00:00',14,'onionman',NULL),(17,1,'2020-05-28 23:00:00',99,'2020-02-29 00:00:00',16,'onionman',NULL),(27,1,'2020-06-27 23:00:00',20,'2020-03-29 23:00:00',26,'onionman',NULL),(29,1,'2020-05-28 23:00:00',99,'2020-02-29 00:00:00',28,'onionman',NULL),(40,1,'2020-06-27 23:00:00',20,'2020-03-29 23:00:00',39,'onionman',NULL),(42,1,'2020-05-28 23:00:00',99,'2020-02-29 00:00:00',41,'onionman',NULL),(53,1,'2020-06-27 23:00:00',20,'2020-03-29 23:00:00',52,'onionman',NULL),(55,1,'2020-05-28 23:00:00',99,'2020-02-29 00:00:00',54,'onionman',NULL),(171,3,'2020-05-08 23:00:00',5,'2020-04-28 23:00:00',170,'AliceThirteen',NULL),(188,3,'2020-05-08 23:00:00',5,'2020-04-28 23:00:00',187,'patient',NULL),(203,3,'2020-05-08 23:00:00',5,'2020-04-28 23:00:00',202,'AliceThirteen',NULL),(817,3,'2020-05-08 23:00:00',5,'2020-04-28 23:00:00',816,'AliceThirteen',NULL),(833,3,'2020-05-08 23:00:00',5,'2020-04-28 23:00:00',832,'AliceThirteen',NULL),(854,3,'2020-05-08 23:00:00',5,'2020-04-28 23:00:00',853,'AliceThirteen',NULL),(876,1,'2020-06-27 23:00:00',20,'2020-03-29 23:00:00',875,'onionman',NULL),(878,1,'2020-05-28 23:00:00',99,'2020-02-29 00:00:00',877,'onionman',NULL),(888,1,'2020-06-27 23:00:00',20,'2020-03-29 23:00:00',887,'onionman',NULL),(890,1,'2020-05-28 23:00:00',99,'2020-02-29 00:00:00',889,'onionman',NULL),(901,1,'2020-06-27 23:00:00',20,'2020-03-29 23:00:00',900,'onionman',NULL),(903,1,'2020-05-28 23:00:00',99,'2020-02-29 00:00:00',902,'onionman',NULL),(914,1,'2020-06-27 23:00:00',20,'2020-03-29 23:00:00',913,'onionman',NULL),(916,1,'2020-05-28 23:00:00',99,'2020-02-29 00:00:00',915,'onionman',NULL),(1031,3,'2020-05-08 23:00:00',5,'2020-04-28 23:00:00',1030,'AliceThirteen',NULL),(1048,3,'2020-05-08 23:00:00',5,'2020-04-28 23:00:00',1047,'patient',NULL),(1063,3,'2020-05-08 23:00:00',5,'2020-04-28 23:00:00',1062,'AliceThirteen',NULL),(1671,3,'2020-05-08 23:00:00',5,'2020-04-28 23:00:00',1670,'AliceThirteen',NULL),(1687,3,'2020-05-08 23:00:00',5,'2020-04-28 23:00:00',1686,'AliceThirteen',1689),(1708,3,'2020-05-08 23:00:00',5,'2020-04-28 23:00:00',1707,'AliceThirteen',1710);
/*!40000 ALTER TABLE `Prescriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QualitativeLOINCResult_resultEntries`
--

DROP TABLE IF EXISTS `QualitativeLOINCResult_resultEntries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QualitativeLOINCResult_resultEntries` (
  `QualitativeLOINCResult_id` bigint(20) NOT NULL,
  `icd_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  KEY `FKj5v90k5cus9qwi7s21n9q77ct` (`icd_id`),
  KEY `FKt20aq6o1nrhhtoimh35a912hj` (`QualitativeLOINCResult_id`),
  CONSTRAINT `FKj5v90k5cus9qwi7s21n9q77ct` FOREIGN KEY (`icd_id`) REFERENCES `ICDCodes` (`id`),
  CONSTRAINT `FKt20aq6o1nrhhtoimh35a912hj` FOREIGN KEY (`QualitativeLOINCResult_id`) REFERENCES `LOINCResult` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QualitativeLOINCResult_resultEntries`
--

LOCK TABLES `QualitativeLOINCResult_resultEntries` WRITE;
/*!40000 ALTER TABLE `QualitativeLOINCResult_resultEntries` DISABLE KEYS */;
/*!40000 ALTER TABLE `QualitativeLOINCResult_resultEntries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QuantitativeLOINCResult_resultRanges`
--

DROP TABLE IF EXISTS `QuantitativeLOINCResult_resultRanges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QuantitativeLOINCResult_resultRanges` (
  `QuantitativeLOINCResult_id` bigint(20) NOT NULL,
  `icd_id` bigint(20) DEFAULT NULL,
  `max` float DEFAULT NULL,
  `min` float DEFAULT NULL,
  KEY `FKegy2iicpobqfn9fkwqbwhtvok` (`icd_id`),
  KEY `FK8bxt649q99k8cxq5jjxigo3ip` (`QuantitativeLOINCResult_id`),
  CONSTRAINT `FK8bxt649q99k8cxq5jjxigo3ip` FOREIGN KEY (`QuantitativeLOINCResult_id`) REFERENCES `LOINCResult` (`id`),
  CONSTRAINT `FKegy2iicpobqfn9fkwqbwhtvok` FOREIGN KEY (`icd_id`) REFERENCES `ICDCodes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QuantitativeLOINCResult_resultRanges`
--

LOCK TABLES `QuantitativeLOINCResult_resultRanges` WRITE;
/*!40000 ALTER TABLE `QuantitativeLOINCResult_resultRanges` DISABLE KEYS */;
INSERT INTO `QuantitativeLOINCResult_resultRanges` VALUES (1703,NULL,139,0),(1703,7,199,140),(1703,6,5000,200);
/*!40000 ALTER TABLE `QuantitativeLOINCResult_resultRanges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users` (
  `username` varchar(255) NOT NULL,
  `enabled` int(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES ('admin',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_ADMIN'),('AliceThirteen',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_PATIENT'),('alminister',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_ADMIN'),('antti',1,'$2a$10$jSJTpFlnZ82Y8szGU7QIy.hStRjqjaBjgPBWvXCaL4nhgwBH.EwbG','ROLE_PATIENT'),('api_test_patient',1,'$2a$10$QUDzuJQYsS.UiKca17nYauSlzVGnwveAdSJ6gipNsVxjcx87cTLEu','ROLE_PATIENT'),('assignedTech',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_LABTECH'),('assignedTech2',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_LABTECH'),('BillyBob',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_PATIENT'),('bobbo',1,'$2a$10$cl8udO9SsBdWDZlh.eOSy.VRCosFTCphJDr.qgoKxSouzbCbrRqZe','ROLE_PATIENT'),('bobbyOD',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_OD'),('BobTheFourYearOld',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_PATIENT'),('candy',1,'$2a$10$wVMdwTWuaIY5LIHN.eoiOeKrtetOHS.qG9WipFr.1qcB2D2WmLumq','ROLE_HCP'),('er',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_ER'),('hcp',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_HCP'),('jbean',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_PATIENT'),('jerry',1,'$2a$10$Zp/63ee1xlKFs8TiWnrgdOq/S7h2sPGavB6RD3eGbl9MLr6/G/Yji','ROLE_PATIENT'),('JillBob',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_PATIENT'),('kingfour',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_PATIENT'),('kingone',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_PATIENT'),('kingthree',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_PATIENT'),('kingtwo',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_PATIENT'),('knightSolaire',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_ER'),('labtech',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_LABTECH'),('labtech2',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_LABTECH'),('labtech3',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_LABTECH'),('larrytech',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_LABTECH'),('lockoutUser',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_HCP'),('lockoutUser2',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_HCP'),('logapitest',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_PATIENT'),('nsanderson',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_PATIENT'),('onionman',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_PATIENT'),('patient',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_PATIENT'),('patient2',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_PATIENT'),('patient3',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_PATIENT'),('patientTestDad',1,'123456','ROLE_PATIENT'),('patientTestMom',1,'123456','ROLE_PATIENT'),('patientTestPatient',1,'123456','ROLE_PATIENT'),('patientTestRep',1,'123456','ROLE_PATIENT'),('pwtestuser1',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_HCP'),('pwtestuser2',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_HCP'),('pwtestuser3',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_HCP'),('pwtestuser4',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_HCP'),('pwtestuser5',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_HCP'),('robortOPH',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_OPH'),('svang',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_HCP'),('sven_forkbeard',0,'$2a$10$S5p0AmoU.gwKBd0OYfeSbOEd1e4hzdXhUzkC3bcrxfgib.cevDXV2','ROLE_PATIENT'),('terry',1,'$2a$10$hSnR.ZPP2NNmNShtvPW.lOtZcu1zSCtB6u4FeSqhZZFjwRzHbPqKy','ROLE_PATIENT'),('TimTheOneYearOld',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_PATIENT');
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (1729),(1729),(1729),(1729),(1729),(1729),(1729),(1729),(1729),(1729),(1729),(1729),(1729),(1729),(1729),(1729),(1729),(1729),(1729),(1729);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-29 11:58:25
