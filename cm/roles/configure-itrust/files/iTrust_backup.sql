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
INSERT INTO `AppointmentRequests` VALUES (149,'Test appointment please ignore','2030-11-19 04:50:00','APPROVED','GENERAL_CHECKUP','hcp','patient');
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
INSERT INTO `BasicHealthMetrics` VALUES (20,1,1,NULL,1,1,1,1,1,100,1,'hcp','onionman'),(32,1,1,NULL,1,1,1,1,1,100,1,'hcp','onionman'),(45,1,1,NULL,1,1,1,1,1,100,1,'hcp','onionman'),(58,1,1,NULL,1,1,1,1,1,100,1,'hcp','onionman'),(79,1,1,NULL,1,1,1,2,1,100,1,'hcp','patient'),(87,1,1,NULL,1,1,1,2,1,100,1,'hcp','patient'),(91,1,1,NULL,1,1,1,2,1,100,1,'hcp','patient'),(113,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'hcp','patient'),(119,83,70,20,69.1,3,30,2,102,150,175.2,'hcp','antti'),(130,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'hcp','patient'),(135,83,70,20,69.1,3,30,2,102,150,175.2,'hcp','antti'),(153,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'hcp','patient'),(158,83,70,20,69.1,3,30,2,102,150,175.2,'hcp','antti'),(168,100,75,NULL,75,1,NULL,NULL,NULL,NULL,NULL,'hcp','AliceThirteen'),(185,100,75,NULL,75,1,NULL,NULL,NULL,NULL,NULL,'hcp','AliceThirteen'),(200,100,75,NULL,75,1,NULL,NULL,NULL,NULL,NULL,'hcp','AliceThirteen'),(804,150,NULL,NULL,75,1,NULL,NULL,NULL,NULL,130,'bobbyOD','AliceThirteen'),(806,150,75,NULL,75,1,75,1,150,300,130,'bobbyOD','AliceThirteen'),(808,150,75,NULL,75,1,75,1,150,300,130,'hcp','AliceThirteen'),(825,150,75,NULL,75,1,75,1,150,300,130,'bobbyOD','AliceThirteen'),(830,100,75,NULL,75,1,NULL,NULL,NULL,NULL,NULL,'hcp','AliceThirteen'),(839,150,75,NULL,75,1,75,1,150,300,130,'hcp','patient'),(846,150,75,NULL,75,1,75,1,150,300,130,'hcp','patient'),(851,100,75,NULL,75,1,NULL,NULL,NULL,NULL,NULL,'hcp','AliceThirteen');
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
INSERT INTO `BloodSugarDiaryEntries` VALUES (827,'2018-09-02 23:00:00',20,30,10,70,'patient'),(828,'2018-07-31 23:00:00',10,NULL,NULL,NULL,'patient');
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
INSERT INTO `BloodSugarLimits` VALUES (257,100,140,'bobbo'),(259,100,140,'terry'),(261,100,140,'antti'),(287,100,140,'patient');
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
INSERT INTO `Diagnoses` VALUES (837,'This is bad',831,835),(858,'This is bad',852,856);
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
INSERT INTO `Drugs` VALUES (5,'1000-0001-10','atypical antipsychotic and antidepressant','Quetiane Fumarate'),(14,'1111-2222-33','Estus to heal up those wounds!','Sunny D'),(16,'3333-2222-11','Medicinal purple moss clump.\nReduces poison build-up. Cures poison.','Purple Moss'),(26,'1111-2222-33','Estus to heal up those wounds!','Sunny D'),(28,'3333-2222-11','Medicinal purple moss clump.\nReduces poison build-up. Cures poison.','Purple Moss'),(39,'1111-2222-33','Estus to heal up those wounds!','Sunny D'),(41,'3333-2222-11','Medicinal purple moss clump.\nReduces poison build-up. Cures poison.','Purple Moss'),(52,'1111-2222-33','Estus to heal up those wounds!','Sunny D'),(54,'3333-2222-11','Medicinal purple moss clump.\nReduces poison build-up. Cures poison.','Purple Moss'),(170,'1234-4321-89','Lithium Compounds','Li2O8'),(187,'1234-4321-89','Lithium Compounds','Li2O8'),(202,'1234-4321-89','Lithium Compounds','Li2O8'),(212,'0000-0000-20','DESC','TEST'),(816,'1234-4321-89','Lithium Compounds','Li2O8'),(832,'1234-4321-89','Lithium Compounds','Li2O8'),(853,'1234-4321-89','Lithium Compounds','Li2O8');
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
INSERT INTO `FoodDiaryEntry` VALUES (823,900,100,'2018-09-02 23:00:00',30,40,'Peanut Butter and Jelly Sandwich','Lunch','patient',10,1,60,50),(824,100,10,'2018-09-02 23:00:00',10,10,'Peanut Butter','Lunch','patient',30,1,20,10);
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
INSERT INTO `GeneralCheckups` VALUES (835,'2020-04-28 22:27:10',NULL,'GENERAL_CHECKUP',NULL,830,'AliceThirteen','Dr. Jenkins\' Insane Asylum','AliceThirteen'),(840,'2048-04-16 08:50:00','Test office visit','GENERAL_CHECKUP',NULL,839,'hcp','Dr. Jenkins\' Insane Asylum','patient'),(847,'2048-04-16 08:50:00','Test office visit','GENERAL_CHECKUP',NULL,846,'hcp','Dr. Jenkins\' Insane Asylum','patient'),(856,'2020-04-28 22:27:10',NULL,'GENERAL_CHECKUP',NULL,851,'AliceThirteen','Dr. Jenkins\' Insane Asylum','AliceThirteen');
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
INSERT INTO `ICDCodes` VALUES (6,'E11.9','Type 2 Diabetes'),(7,'R73.03','Prediabetes'),(18,'T49','Poisoned by topical agents.  Probably in Blighttown'),(19,'S34','Injury of lumbar and sacral spinal cord.  Probably carrying teammates.'),(30,'T49','Poisoned by topical agents.  Probably in Blighttown'),(31,'S34','Injury of lumbar and sacral spinal cord.  Probably carrying teammates.'),(43,'T49','Poisoned by topical agents.  Probably in Blighttown'),(44,'S34','Injury of lumbar and sacral spinal cord.  Probably carrying teammates.'),(56,'T49','Poisoned by topical agents.  Probably in Blighttown'),(57,'S34','Injury of lumbar and sacral spinal cord.  Probably carrying teammates.'),(74,'T10','Test 10'),(76,'T10','Test 10'),(169,'A21','Top Quality'),(186,'A21','Top Quality'),(201,'A21','Top Quality'),(810,'A21','Top Quality'),(831,'A21','Top Quality'),(852,'A21','Top Quality');
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
INSERT INTO `LOINCCodes` VALUES (850,'20436-2','Glucose 2 Hr After Glucose, Blood','Glucose^2H post dose glucose','MCnc','QUANTITATIVE',849);
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
INSERT INTO `LOINCResult` VALUES ('QuantitativeLOINCResult',849);
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
INSERT INTO `LabProcedures` VALUES (859,NULL,'CRITICAL','150','COMPLETED','labtech',850,'patient',7,856);
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
INSERT INTO `LogEntries` VALUES (22,41,'edu.ncsu.csc.itrust2.models.persistent.User@46ed09f7 created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@a6e627c2','hcp','onionman','2020-04-28 22:26:28'),(24,41,'edu.ncsu.csc.itrust2.models.persistent.User@46ed09f7 created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@a6e627c2','hcp','onionman','2020-04-28 22:26:28'),(34,41,'edu.ncsu.csc.itrust2.models.persistent.User@46ed09f7 created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@a6e627c2','hcp','onionman','2020-04-28 22:26:29'),(36,41,'edu.ncsu.csc.itrust2.models.persistent.User@46ed09f7 created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@a6e627c2','hcp','onionman','2020-04-28 22:26:29'),(38,63,'Fetched Emergency Record for user onionman','hcp','onionman','2020-04-28 22:26:30'),(47,41,'edu.ncsu.csc.itrust2.models.persistent.User@46ed09f7 created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@a6e627c2','hcp','onionman','2020-04-28 22:26:30'),(49,41,'edu.ncsu.csc.itrust2.models.persistent.User@46ed09f7 created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@a6e627c2','hcp','onionman','2020-04-28 22:26:30'),(51,64,'Fetched Emergency Record for user onionman','er','onionman','2020-04-28 22:26:30'),(60,41,'edu.ncsu.csc.itrust2.models.persistent.User@46ed09f7 created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@a6e627c2','hcp','onionman','2020-04-28 22:26:31'),(62,41,'edu.ncsu.csc.itrust2.models.persistent.User@46ed09f7 created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@a6e627c2','hcp','onionman','2020-04-28 22:26:31'),(64,14,NULL,'hcp',NULL,'2020-04-28 22:26:31'),(66,82,NULL,'hcp','patient','2020-04-28 22:26:32'),(67,14,NULL,'patent',NULL,'2020-04-28 22:26:32'),(69,14,NULL,'patient',NULL,'2020-04-28 22:26:32'),(72,80,NULL,'patient',NULL,'2020-04-28 22:26:32'),(73,81,NULL,'patient',NULL,'2020-04-28 22:26:32'),(75,33,'admin created an ICD Code','admin',NULL,'2020-04-28 22:26:33'),(77,33,'admin created an ICD Code','admin',NULL,'2020-04-28 22:26:33'),(78,30,NULL,'admin',NULL,'2020-04-28 22:26:33'),(81,41,'edu.ncsu.csc.itrust2.models.persistent.User@46ed09f7 created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@f8ad77d6','hcp','patient','2020-04-28 22:26:33'),(83,41,'edu.ncsu.csc.itrust2.models.persistent.User@46ed09f7 created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@f8ad77d6','hcp','patient','2020-04-28 22:26:33'),(85,26,'patient','admin',NULL,'2020-04-28 22:26:33'),(86,39,'Retrieved diagnoses for office visit with id 80','admin','patient','2020-04-28 22:26:33'),(88,42,'edu.ncsu.csc.itrust2.models.persistent.User@46ed09f7 edit a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@f8ad77d6','hcp','patient','2020-04-28 22:26:34'),(89,28,NULL,'admin',NULL,'2020-04-28 22:26:34'),(90,39,'Retrieved diagnoses for office visit with id 80','admin','patient','2020-04-28 22:26:34'),(92,43,'hcp deleted a diagnosis for patient','hcp','patient','2020-04-28 22:26:34'),(93,28,NULL,'admin',NULL,'2020-04-28 22:26:34'),(94,39,'Retrieved diagnoses for office visit with id 80','admin','patient','2020-04-28 22:26:34'),(95,7,NULL,'SPRING_API_TEST_USER','sven_forkbeard','2020-04-28 22:26:34'),(96,9,NULL,'SPRING_API_TEST_USER',NULL,'2020-04-28 22:26:34'),(97,8,NULL,'sven_forkbeard',NULL,'2020-04-28 22:26:34'),(98,11,NULL,'SPRING_API_TEST_USER',NULL,'2020-04-28 22:26:34'),(99,8,NULL,'-1',NULL,'2020-04-28 22:26:35'),(101,20,NULL,'patient','hcp','2020-04-28 22:26:35'),(102,21,NULL,'patient','hcp','2020-04-28 22:26:35'),(103,25,NULL,'patient','hcp','2020-04-28 22:26:36'),(104,24,NULL,'patient','hcp','2020-04-28 22:26:36'),(105,22,NULL,'patient','hcp','2020-04-28 22:26:36'),(107,33,'admin created an ICD Code','admin',NULL,'2020-04-28 22:26:36'),(108,36,'Fetched icd code with id 106','admin',NULL,'2020-04-28 22:26:36'),(109,35,'admin edited an ICD Code','admin',NULL,'2020-04-28 22:26:36'),(110,36,'Fetched icd code with id 106','admin',NULL,'2020-04-28 22:26:36'),(111,34,'admin deleted an ICD Code','admin',NULL,'2020-04-28 22:26:36'),(112,30,NULL,'patient',NULL,'2020-04-28 22:26:36'),(115,99,'patient','patient',NULL,'2020-04-28 22:26:36'),(116,7,NULL,'patient','antti','2020-04-28 22:26:37'),(117,102,NULL,'patient',NULL,'2020-04-28 22:26:37'),(118,101,'hcp updated basic health metrics for antti from 2048-04-16T09:45:00.000-04:00','hcp','antti','2020-04-28 22:26:37'),(120,101,NULL,'patient',NULL,'2020-04-28 22:26:37'),(121,103,NULL,'patient',NULL,'2020-04-28 22:26:37'),(122,30,NULL,'patient',NULL,'2020-04-28 22:26:37'),(124,20,NULL,'patient','hcp','2020-04-28 22:26:37'),(125,30,NULL,'robortOPH',NULL,'2020-04-28 22:26:37'),(127,20,NULL,'patient','hcp','2020-04-28 22:26:38'),(128,30,NULL,'bobbyOD',NULL,'2020-04-28 22:26:38'),(129,30,NULL,'patient',NULL,'2020-04-28 22:26:38'),(132,94,'patient','patient',NULL,'2020-04-28 22:26:39'),(133,97,NULL,'patient',NULL,'2020-04-28 22:26:39'),(134,96,'hcp updated basic health metrics for antti from 2048-04-16T09:45:00.000-04:00','hcp','antti','2020-04-28 22:26:39'),(136,96,NULL,'patient',NULL,'2020-04-28 22:26:39'),(137,98,NULL,'patient',NULL,'2020-04-28 22:26:39'),(138,30,NULL,'patient',NULL,'2020-04-28 22:26:39'),(140,44,'Drug 0000-0000-00 created','admin',NULL,'2020-04-28 22:26:39'),(141,44,'Conflict: drug with code 0000-0000-00 already exists','admin',NULL,'2020-04-28 22:26:39'),(143,44,'Drug 0000-0000-01 created','admin',NULL,'2020-04-28 22:26:39'),(144,47,'Fetched list of drugs','admin',NULL,'2020-04-28 22:26:39'),(145,45,'Drug with id 139 edited','admin',NULL,'2020-04-28 22:26:39'),(146,45,'Drug with id 142 edited','admin',NULL,'2020-04-28 22:26:39'),(147,46,'Deleted drug with id 139','admin',NULL,'2020-04-28 22:26:39'),(148,46,'Deleted drug with id 142','admin',NULL,'2020-04-28 22:26:39'),(150,20,NULL,'patient','hcp','2020-04-28 22:26:40'),(151,30,NULL,'hcp',NULL,'2020-04-28 22:26:40'),(152,30,NULL,'patient',NULL,'2020-04-28 22:26:40'),(155,26,'patient','patient',NULL,'2020-04-28 22:26:40'),(156,29,NULL,'patient',NULL,'2020-04-28 22:26:41'),(157,28,'hcp updated basic health metrics for antti from 2048-04-16T09:45:00.000-04:00','hcp','antti','2020-04-28 22:26:41'),(159,28,NULL,'patient',NULL,'2020-04-28 22:26:41'),(160,32,NULL,'patient',NULL,'2020-04-28 22:26:41'),(161,30,NULL,'patient',NULL,'2020-04-28 22:26:41'),(163,69,'admin created a LOINC Code','admin',NULL,'2020-04-28 22:26:41'),(164,71,'admin edited a LOINC Code','admin',NULL,'2020-04-28 22:26:41'),(165,70,'admin deleted a LOINC Code','admin',NULL,'2020-04-28 22:26:41'),(166,72,'LabTech labtech Views Their Lab Procedures','labtech',NULL,'2020-04-28 22:26:41'),(172,48,'Creating prescription with id 171','labtech','AliceThirteen','2020-04-28 22:26:41'),(174,41,'edu.ncsu.csc.itrust2.models.persistent.User@46ed09f7 created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@4c583248','hcp','AliceThirteen','2020-04-28 22:26:41'),(177,72,'LabTech labtech Views Lab Procedure 176','labtech',NULL,'2020-04-28 22:26:41'),(178,73,NULL,'labtech',NULL,'2020-04-28 22:26:41'),(179,74,'LabTech labtech Reassigns Procedure To assignedTech2','labtech','assignedTech2','2020-04-28 22:26:41'),(180,73,NULL,'labtech',NULL,'2020-04-28 22:26:41'),(181,74,'LabTech labtech Reassigns Procedure To assignedTech2','labtech','assignedTech2','2020-04-28 22:26:41'),(182,78,'HCP hcp Views Lab Procedures','hcp',NULL,'2020-04-28 22:26:42'),(183,77,NULL,'hcp',NULL,'2020-04-28 22:26:42'),(189,48,'Creating prescription with id 188','hcp','patient','2020-04-28 22:26:42'),(191,41,'edu.ncsu.csc.itrust2.models.persistent.User@f8ad77d6 created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@f8ad77d6','patient',NULL,'2020-04-28 22:26:42'),(194,75,NULL,'hcp',NULL,'2020-04-28 22:26:42'),(195,78,'HCP hcp Views Lab Procedures','hcp',NULL,'2020-04-28 22:26:42'),(196,78,'HCP hcp Views labtech\'s Lab Procedures','hcp','labtech','2020-04-28 22:26:42'),(197,78,'HCP hcp Views OfficeVisit 190 Lab Procedures','hcp',NULL,'2020-04-28 22:26:42'),(198,78,'HCP hcp Views Lab Procedure 193','hcp',NULL,'2020-04-28 22:26:42'),(199,77,NULL,'hcp',NULL,'2020-04-28 22:26:42'),(204,48,'Creating prescription with id 203','labtech','AliceThirteen','2020-04-28 22:26:42'),(206,41,'edu.ncsu.csc.itrust2.models.persistent.User@46ed09f7 created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@4c583248','hcp','AliceThirteen','2020-04-28 22:26:42'),(209,73,NULL,'labtech',NULL,'2020-04-28 22:26:43'),(210,74,'LabTech labtech Reassigns Procedure To assignedTech','labtech','assignedTech','2020-04-28 22:26:43'),(211,7,NULL,'hcp','api_test_patient','2020-04-28 22:26:47'),(213,44,'Drug 0000-0000-20 created','hcp',NULL,'2020-04-28 22:26:47'),(215,48,'Created prescription with id 214','hcp','api_test_patient','2020-04-28 22:26:47'),(217,48,'Created prescription with id 216','hcp','api_test_patient','2020-04-28 22:26:47'),(218,51,'HCP viewed a list of all prescriptions','hcp',NULL,'2020-04-28 22:26:47'),(219,49,'Edited prescription with id 214','hcp','api_test_patient','2020-04-28 22:26:47'),(220,49,'Edited prescription with id 214','hcp','api_test_patient','2020-04-28 22:26:47'),(221,49,'Failed to edit prescription','hcp',NULL,'2020-04-28 22:26:47'),(222,50,'Deleted prescription with id 214','hcp','api_test_patient','2020-04-28 22:26:47'),(223,50,'Deleted prescription with id 216','hcp','api_test_patient','2020-04-28 22:26:47'),(225,14,NULL,'patientPW',NULL,'2020-04-28 22:26:47'),(226,54,'Successfully changed password for user patientPW','patientPW',NULL,'2020-04-28 22:26:49'),(228,14,NULL,'patientPW',NULL,'2020-04-28 22:26:49'),(229,54,'Successfully changed password for user patientPW','patientPW',NULL,'2020-04-28 22:26:50'),(230,62,NULL,'patientPW',NULL,'2020-04-28 22:26:50'),(231,12,NULL,'hcp',NULL,'2020-04-28 22:26:50'),(232,13,NULL,'hcp',NULL,'2020-04-28 22:26:50'),(233,16,NULL,'admin',NULL,'2020-04-28 22:26:50'),(234,17,NULL,'admin',NULL,'2020-04-28 22:26:50'),(235,16,NULL,'admin',NULL,'2020-04-28 22:26:50'),(236,14,NULL,'hcp',NULL,'2020-04-28 22:26:51'),(238,56,'HCP retrieved demographics for patient with username antti','hcp','antti','2020-04-28 22:26:51'),(239,13,'User with username anttiupdated their demographics','hcp',NULL,'2020-04-28 22:26:51'),(240,57,'HCP edited demographics for patient with username antti','antti',NULL,'2020-04-28 22:26:51'),(241,7,NULL,'hcp','bobbo','2020-04-28 22:26:51'),(242,14,NULL,'hcp',NULL,'2020-04-28 22:26:51'),(244,7,NULL,'hcp','terry','2020-04-28 22:26:51'),(245,14,NULL,'hcp',NULL,'2020-04-28 22:26:51'),(247,7,NULL,'hcp','jerry','2020-04-28 22:26:51'),(248,14,NULL,'hcp',NULL,'2020-04-28 22:26:51'),(250,7,NULL,'hcp','candy','2020-04-28 22:26:52'),(251,65,'HCP hcp has declared terry as a representative for bobbo','hcp','terry','2020-04-28 22:26:52'),(252,65,'HCP hcp has declared jerry as a representative for bobbo','hcp','jerry','2020-04-28 22:26:52'),(253,65,'HCP hcp has declared bobbo as a representative for terry','hcp','bobbo','2020-04-28 22:26:52'),(254,65,'HCP hcp has declared bobbo as a representative for jerry','hcp','bobbo','2020-04-28 22:26:52'),(255,68,'User terry has undeclared self as representative for bobbo','bobbo','terry','2020-04-28 22:26:53'),(256,14,NULL,'antti',NULL,'2020-04-28 22:26:53'),(258,14,NULL,'antti',NULL,'2020-04-28 22:26:53'),(260,14,NULL,'antti',NULL,'2020-04-28 22:26:53'),(262,66,'User bobbo has been added as a representative for user antti','antti','bobbo','2020-04-28 22:26:53'),(263,67,'User antti has undeclared representative bobbo','antti','bobbo','2020-04-28 22:26:53'),(264,14,NULL,'patent',NULL,'2020-04-28 22:26:54'),(267,14,NULL,'patient',NULL,'2020-04-28 22:26:54'),(270,104,NULL,'patient',NULL,'2020-04-28 22:26:54'),(271,107,NULL,'patient',NULL,'2020-04-28 22:26:54'),(272,105,NULL,'patient',NULL,'2020-04-28 22:26:54'),(274,104,NULL,'patient',NULL,'2020-04-28 22:26:54'),(275,105,NULL,'patient',NULL,'2020-04-28 22:26:54'),(276,14,NULL,'hcp',NULL,'2020-04-28 22:26:55'),(278,106,NULL,'hcp','patient','2020-04-28 22:26:55'),(279,14,NULL,'hcp',NULL,'2020-04-28 22:26:55'),(281,109,NULL,'hcp',NULL,'2020-04-28 22:26:55'),(282,110,NULL,'hcp',NULL,'2020-04-28 22:26:55'),(283,14,NULL,'patient',NULL,'2020-04-28 22:26:55'),(285,108,NULL,'patient',NULL,'2020-04-28 22:26:55'),(286,14,NULL,'patient',NULL,'2020-04-28 22:26:56'),(289,104,NULL,'patient',NULL,'2020-04-28 22:26:56'),(291,104,NULL,'patient',NULL,'2020-04-28 22:26:56'),(293,104,NULL,'patient',NULL,'2020-04-28 22:26:56'),(295,104,NULL,'patient',NULL,'2020-04-28 22:26:56'),(297,104,NULL,'patient',NULL,'2020-04-28 22:26:56'),(298,107,NULL,'patient',NULL,'2020-04-28 22:26:56'),(299,107,NULL,'patient',NULL,'2020-04-28 22:26:56'),(300,5,NULL,'logapitest',NULL,'2020-04-28 22:26:56'),(301,5,NULL,'logapitest',NULL,'2020-04-28 22:26:56'),(302,5,NULL,'logapitest',NULL,'2020-04-28 22:26:56'),(303,5,NULL,'logapitest',NULL,'2020-04-28 22:26:56'),(304,5,NULL,'logapitest',NULL,'2020-04-28 22:26:56'),(305,5,NULL,'logapitest',NULL,'2020-04-28 22:26:56'),(306,5,NULL,'logapitest',NULL,'2020-04-28 22:26:56'),(307,5,NULL,'logapitest',NULL,'2020-04-28 22:26:56'),(308,5,NULL,'logapitest',NULL,'2020-04-28 22:26:56'),(309,5,NULL,'logapitest',NULL,'2020-04-28 22:26:56'),(310,5,NULL,'logapitest',NULL,'2020-04-28 22:26:56'),(311,5,NULL,'logapitest',NULL,'2020-04-28 22:26:56'),(312,5,NULL,'logapitest',NULL,'2020-04-28 22:26:56'),(313,5,NULL,'logapitest',NULL,'2020-04-28 22:26:56'),(314,5,NULL,'logapitest',NULL,'2020-04-28 22:26:56'),(315,5,NULL,'logapitest',NULL,'2020-04-28 22:26:56'),(316,5,NULL,'logapitest',NULL,'2020-04-28 22:26:56'),(317,5,NULL,'logapitest',NULL,'2020-04-28 22:26:56'),(318,5,NULL,'logapitest',NULL,'2020-04-28 22:26:56'),(319,5,NULL,'logapitest',NULL,'2020-04-28 22:26:56'),(320,5,NULL,'logapitest',NULL,'2020-04-28 22:26:56'),(321,5,NULL,'logapitest',NULL,'2020-04-28 22:26:56'),(322,5,NULL,'logapitest',NULL,'2020-04-28 22:26:56'),(323,5,NULL,'logapitest',NULL,'2020-04-28 22:26:56'),(324,5,NULL,'logapitest',NULL,'2020-04-28 22:26:56'),(325,5,NULL,'logapitest',NULL,'2020-04-28 22:26:56'),(326,5,NULL,'logapitest',NULL,'2020-04-28 22:26:57'),(327,5,NULL,'logapitest',NULL,'2020-04-28 22:26:57'),(328,5,NULL,'logapitest',NULL,'2020-04-28 22:26:57'),(329,5,NULL,'logapitest',NULL,'2020-04-28 22:26:57'),(330,5,NULL,'logapitest',NULL,'2020-04-28 22:26:57'),(331,5,NULL,'logapitest',NULL,'2020-04-28 22:26:57'),(332,5,NULL,'logapitest',NULL,'2020-04-28 22:26:57'),(333,5,NULL,'logapitest',NULL,'2020-04-28 22:26:57'),(334,5,NULL,'logapitest',NULL,'2020-04-28 22:26:57'),(335,5,NULL,'logapitest',NULL,'2020-04-28 22:26:57'),(336,5,NULL,'logapitest',NULL,'2020-04-28 22:26:57'),(337,5,NULL,'logapitest',NULL,'2020-04-28 22:26:57'),(338,5,NULL,'logapitest',NULL,'2020-04-28 22:26:57'),(339,5,NULL,'logapitest',NULL,'2020-04-28 22:26:57'),(340,5,NULL,'logapitest',NULL,'2020-04-28 22:26:57'),(341,5,NULL,'logapitest',NULL,'2020-04-28 22:26:57'),(342,5,NULL,'logapitest',NULL,'2020-04-28 22:26:57'),(343,5,NULL,'logapitest',NULL,'2020-04-28 22:26:57'),(344,5,NULL,'logapitest',NULL,'2020-04-28 22:26:57'),(345,5,NULL,'logapitest',NULL,'2020-04-28 22:26:57'),(346,5,NULL,'logapitest',NULL,'2020-04-28 22:26:57'),(347,5,NULL,'logapitest',NULL,'2020-04-28 22:26:57'),(348,5,NULL,'logapitest',NULL,'2020-04-28 22:26:57'),(349,5,NULL,'logapitest',NULL,'2020-04-28 22:26:57'),(350,5,NULL,'logapitest',NULL,'2020-04-28 22:26:57'),(351,5,NULL,'logapitest',NULL,'2020-04-28 22:26:57'),(352,5,NULL,'logapitest',NULL,'2020-04-28 22:26:57'),(353,5,NULL,'logapitest',NULL,'2020-04-28 22:26:57'),(354,5,NULL,'logapitest',NULL,'2020-04-28 22:26:57'),(355,5,NULL,'logapitest',NULL,'2020-04-28 22:26:57'),(356,5,NULL,'logapitest',NULL,'2020-04-28 22:26:57'),(357,5,NULL,'logapitest',NULL,'2020-04-28 22:26:57'),(358,5,NULL,'logapitest',NULL,'2020-04-28 22:26:57'),(359,5,NULL,'logapitest',NULL,'2020-04-28 22:26:57'),(360,5,NULL,'logapitest',NULL,'2020-04-28 22:26:57'),(361,5,NULL,'logapitest',NULL,'2020-04-28 22:26:57'),(362,5,NULL,'logapitest',NULL,'2020-04-28 22:26:57'),(363,5,NULL,'logapitest',NULL,'2020-04-28 22:26:57'),(364,5,NULL,'logapitest',NULL,'2020-04-28 22:26:57'),(365,5,NULL,'logapitest',NULL,'2020-04-28 22:26:57'),(366,5,NULL,'logapitest',NULL,'2020-04-28 22:26:57'),(367,5,NULL,'logapitest',NULL,'2020-04-28 22:26:57'),(368,5,NULL,'logapitest',NULL,'2020-04-28 22:26:57'),(369,5,NULL,'logapitest',NULL,'2020-04-28 22:26:57'),(370,5,NULL,'logapitest',NULL,'2020-04-28 22:26:57'),(371,5,NULL,'logapitest',NULL,'2020-04-28 22:26:57'),(372,5,NULL,'logapitest',NULL,'2020-04-28 22:26:57'),(373,5,NULL,'logapitest',NULL,'2020-04-28 22:26:57'),(374,5,NULL,'logapitest',NULL,'2020-04-28 22:26:57'),(375,5,NULL,'logapitest',NULL,'2020-04-28 22:26:57'),(376,5,NULL,'logapitest',NULL,'2020-04-28 22:26:57'),(377,5,NULL,'logapitest',NULL,'2020-04-28 22:26:57'),(378,5,NULL,'logapitest',NULL,'2020-04-28 22:26:57'),(379,5,NULL,'logapitest',NULL,'2020-04-28 22:26:57'),(380,5,NULL,'logapitest',NULL,'2020-04-28 22:26:57'),(381,5,NULL,'logapitest',NULL,'2020-04-28 22:26:57'),(382,5,NULL,'logapitest',NULL,'2020-04-28 22:26:57'),(383,5,NULL,'logapitest',NULL,'2020-04-28 22:26:58'),(384,5,NULL,'logapitest',NULL,'2020-04-28 22:26:58'),(385,5,NULL,'logapitest',NULL,'2020-04-28 22:26:58'),(386,5,NULL,'logapitest',NULL,'2020-04-28 22:26:58'),(387,5,NULL,'logapitest',NULL,'2020-04-28 22:26:58'),(388,5,NULL,'logapitest',NULL,'2020-04-28 22:26:58'),(389,5,NULL,'logapitest',NULL,'2020-04-28 22:26:58'),(390,5,NULL,'logapitest',NULL,'2020-04-28 22:26:58'),(391,5,NULL,'logapitest',NULL,'2020-04-28 22:26:58'),(392,5,NULL,'logapitest',NULL,'2020-04-28 22:26:58'),(393,5,NULL,'logapitest',NULL,'2020-04-28 22:26:58'),(394,5,NULL,'logapitest',NULL,'2020-04-28 22:26:58'),(395,5,NULL,'logapitest',NULL,'2020-04-28 22:26:58'),(396,5,NULL,'logapitest',NULL,'2020-04-28 22:26:58'),(397,5,NULL,'logapitest',NULL,'2020-04-28 22:26:58'),(398,5,NULL,'logapitest',NULL,'2020-04-28 22:26:58'),(399,5,NULL,'logapitest',NULL,'2020-04-28 22:26:58'),(400,5,NULL,'logapitest',NULL,'2020-04-28 22:26:58'),(401,5,NULL,'logapitest',NULL,'2020-04-28 22:26:58'),(402,5,NULL,'logapitest',NULL,'2020-04-28 22:26:58'),(403,5,NULL,'logapitest',NULL,'2020-04-28 22:26:58'),(404,5,NULL,'logapitest',NULL,'2020-04-28 22:26:58'),(405,5,NULL,'logapitest',NULL,'2020-04-28 22:26:58'),(406,5,NULL,'logapitest',NULL,'2020-04-28 22:26:58'),(407,5,NULL,'logapitest',NULL,'2020-04-28 22:26:58'),(408,5,NULL,'logapitest',NULL,'2020-04-28 22:26:58'),(409,5,NULL,'logapitest',NULL,'2020-04-28 22:26:58'),(410,5,NULL,'logapitest',NULL,'2020-04-28 22:26:58'),(411,5,NULL,'logapitest',NULL,'2020-04-28 22:26:58'),(412,5,NULL,'logapitest',NULL,'2020-04-28 22:26:58'),(413,5,NULL,'logapitest',NULL,'2020-04-28 22:26:58'),(414,5,NULL,'logapitest',NULL,'2020-04-28 22:26:58'),(415,5,NULL,'logapitest',NULL,'2020-04-28 22:26:58'),(416,5,NULL,'logapitest',NULL,'2020-04-28 22:26:58'),(417,5,NULL,'logapitest',NULL,'2020-04-28 22:26:58'),(418,5,NULL,'logapitest',NULL,'2020-04-28 22:26:58'),(419,5,NULL,'logapitest',NULL,'2020-04-28 22:26:58'),(420,5,NULL,'logapitest',NULL,'2020-04-28 22:26:58'),(421,5,NULL,'logapitest',NULL,'2020-04-28 22:26:58'),(422,5,NULL,'logapitest',NULL,'2020-04-28 22:26:58'),(423,5,NULL,'logapitest',NULL,'2020-04-28 22:26:58'),(424,5,NULL,'logapitest',NULL,'2020-04-28 22:26:58'),(425,5,NULL,'logapitest',NULL,'2020-04-28 22:26:58'),(426,5,NULL,'logapitest',NULL,'2020-04-28 22:26:58'),(427,5,NULL,'logapitest',NULL,'2020-04-28 22:26:58'),(428,5,NULL,'logapitest',NULL,'2020-04-28 22:26:58'),(429,5,NULL,'logapitest',NULL,'2020-04-28 22:26:58'),(430,5,NULL,'logapitest',NULL,'2020-04-28 22:26:58'),(431,5,NULL,'logapitest',NULL,'2020-04-28 22:26:58'),(432,5,NULL,'logapitest',NULL,'2020-04-28 22:26:58'),(433,5,NULL,'logapitest',NULL,'2020-04-28 22:26:58'),(434,5,NULL,'logapitest',NULL,'2020-04-28 22:26:58'),(435,5,NULL,'logapitest',NULL,'2020-04-28 22:26:58'),(436,5,NULL,'logapitest',NULL,'2020-04-28 22:26:58'),(437,5,NULL,'logapitest',NULL,'2020-04-28 22:26:58'),(438,5,NULL,'logapitest',NULL,'2020-04-28 22:26:58'),(439,5,NULL,'logapitest',NULL,'2020-04-28 22:26:58'),(440,5,NULL,'logapitest',NULL,'2020-04-28 22:26:59'),(441,5,NULL,'logapitest',NULL,'2020-04-28 22:26:59'),(442,5,NULL,'logapitest',NULL,'2020-04-28 22:26:59'),(443,5,NULL,'logapitest',NULL,'2020-04-28 22:26:59'),(444,5,NULL,'logapitest',NULL,'2020-04-28 22:26:59'),(445,5,NULL,'logapitest',NULL,'2020-04-28 22:26:59'),(446,5,NULL,'logapitest',NULL,'2020-04-28 22:26:59'),(447,5,NULL,'logapitest',NULL,'2020-04-28 22:26:59'),(448,5,NULL,'logapitest',NULL,'2020-04-28 22:26:59'),(449,5,NULL,'logapitest',NULL,'2020-04-28 22:26:59'),(450,5,NULL,'logapitest',NULL,'2020-04-28 22:26:59'),(451,5,NULL,'logapitest',NULL,'2020-04-28 22:26:59'),(452,5,NULL,'logapitest',NULL,'2020-04-28 22:26:59'),(453,5,NULL,'logapitest',NULL,'2020-04-28 22:26:59'),(454,5,NULL,'logapitest',NULL,'2020-04-28 22:26:59'),(455,5,NULL,'logapitest',NULL,'2020-04-28 22:26:59'),(456,5,NULL,'logapitest',NULL,'2020-04-28 22:26:59'),(457,5,NULL,'logapitest',NULL,'2020-04-28 22:26:59'),(458,5,NULL,'logapitest',NULL,'2020-04-28 22:26:59'),(459,5,NULL,'logapitest',NULL,'2020-04-28 22:26:59'),(460,5,NULL,'logapitest',NULL,'2020-04-28 22:26:59'),(461,5,NULL,'logapitest',NULL,'2020-04-28 22:26:59'),(462,5,NULL,'logapitest',NULL,'2020-04-28 22:26:59'),(463,5,NULL,'logapitest',NULL,'2020-04-28 22:26:59'),(464,5,NULL,'logapitest',NULL,'2020-04-28 22:26:59'),(465,5,NULL,'logapitest',NULL,'2020-04-28 22:26:59'),(466,5,NULL,'logapitest',NULL,'2020-04-28 22:26:59'),(467,5,NULL,'logapitest',NULL,'2020-04-28 22:26:59'),(468,5,NULL,'logapitest',NULL,'2020-04-28 22:26:59'),(469,5,NULL,'logapitest',NULL,'2020-04-28 22:26:59'),(470,5,NULL,'logapitest',NULL,'2020-04-28 22:26:59'),(471,5,NULL,'logapitest',NULL,'2020-04-28 22:26:59'),(472,5,NULL,'logapitest',NULL,'2020-04-28 22:26:59'),(473,5,NULL,'logapitest',NULL,'2020-04-28 22:26:59'),(474,5,NULL,'logapitest',NULL,'2020-04-28 22:26:59'),(475,5,NULL,'logapitest',NULL,'2020-04-28 22:26:59'),(476,5,NULL,'logapitest',NULL,'2020-04-28 22:26:59'),(477,5,NULL,'logapitest',NULL,'2020-04-28 22:26:59'),(478,5,NULL,'logapitest',NULL,'2020-04-28 22:26:59'),(479,5,NULL,'logapitest',NULL,'2020-04-28 22:26:59'),(480,5,NULL,'logapitest',NULL,'2020-04-28 22:26:59'),(481,5,NULL,'logapitest',NULL,'2020-04-28 22:26:59'),(482,5,NULL,'logapitest',NULL,'2020-04-28 22:26:59'),(483,5,NULL,'logapitest',NULL,'2020-04-28 22:26:59'),(484,5,NULL,'logapitest',NULL,'2020-04-28 22:26:59'),(485,5,NULL,'logapitest',NULL,'2020-04-28 22:26:59'),(486,5,NULL,'logapitest',NULL,'2020-04-28 22:26:59'),(487,5,NULL,'logapitest',NULL,'2020-04-28 22:26:59'),(488,5,NULL,'logapitest',NULL,'2020-04-28 22:26:59'),(489,5,NULL,'logapitest',NULL,'2020-04-28 22:26:59'),(490,5,NULL,'logapitest',NULL,'2020-04-28 22:26:59'),(491,5,NULL,'logapitest',NULL,'2020-04-28 22:26:59'),(492,5,NULL,'logapitest',NULL,'2020-04-28 22:26:59'),(493,5,NULL,'logapitest',NULL,'2020-04-28 22:26:59'),(494,5,NULL,'logapitest',NULL,'2020-04-28 22:26:59'),(495,5,NULL,'logapitest',NULL,'2020-04-28 22:26:59'),(496,5,NULL,'logapitest',NULL,'2020-04-28 22:26:59'),(497,5,NULL,'logapitest',NULL,'2020-04-28 22:26:59'),(498,5,NULL,'logapitest',NULL,'2020-04-28 22:26:59'),(499,5,NULL,'logapitest',NULL,'2020-04-28 22:27:00'),(500,5,NULL,'logapitest',NULL,'2020-04-28 22:27:00'),(501,5,NULL,'logapitest',NULL,'2020-04-28 22:27:00'),(502,5,NULL,'logapitest',NULL,'2020-04-28 22:27:00'),(503,5,NULL,'logapitest',NULL,'2020-04-28 22:27:00'),(504,5,NULL,'logapitest',NULL,'2020-04-28 22:27:00'),(505,5,NULL,'logapitest',NULL,'2020-04-28 22:27:00'),(506,5,NULL,'logapitest',NULL,'2020-04-28 22:27:00'),(507,5,NULL,'logapitest',NULL,'2020-04-28 22:27:00'),(508,5,NULL,'logapitest',NULL,'2020-04-28 22:27:00'),(509,5,NULL,'logapitest',NULL,'2020-04-28 22:27:00'),(510,5,NULL,'logapitest',NULL,'2020-04-28 22:27:00'),(511,5,NULL,'logapitest',NULL,'2020-04-28 22:27:00'),(512,5,NULL,'logapitest',NULL,'2020-04-28 22:27:00'),(513,5,NULL,'logapitest',NULL,'2020-04-28 22:27:00'),(514,5,NULL,'logapitest',NULL,'2020-04-28 22:27:00'),(515,5,NULL,'logapitest',NULL,'2020-04-28 22:27:00'),(516,5,NULL,'logapitest',NULL,'2020-04-28 22:27:00'),(517,5,NULL,'logapitest',NULL,'2020-04-28 22:27:00'),(518,5,NULL,'logapitest',NULL,'2020-04-28 22:27:00'),(519,5,NULL,'logapitest',NULL,'2020-04-28 22:27:00'),(520,5,NULL,'logapitest',NULL,'2020-04-28 22:27:00'),(521,5,NULL,'logapitest',NULL,'2020-04-28 22:27:00'),(522,5,NULL,'logapitest',NULL,'2020-04-28 22:27:00'),(523,5,NULL,'logapitest',NULL,'2020-04-28 22:27:00'),(524,5,NULL,'logapitest',NULL,'2020-04-28 22:27:00'),(525,5,NULL,'logapitest',NULL,'2020-04-28 22:27:00'),(526,5,NULL,'logapitest',NULL,'2020-04-28 22:27:00'),(527,5,NULL,'logapitest',NULL,'2020-04-28 22:27:00'),(528,5,NULL,'logapitest',NULL,'2020-04-28 22:27:00'),(529,5,NULL,'logapitest',NULL,'2020-04-28 22:27:00'),(530,5,NULL,'logapitest',NULL,'2020-04-28 22:27:00'),(531,5,NULL,'logapitest',NULL,'2020-04-28 22:27:00'),(532,5,NULL,'logapitest',NULL,'2020-04-28 22:27:00'),(533,5,NULL,'logapitest',NULL,'2020-04-28 22:27:00'),(534,5,NULL,'logapitest',NULL,'2020-04-28 22:27:00'),(535,5,NULL,'logapitest',NULL,'2020-04-28 22:27:00'),(536,5,NULL,'logapitest',NULL,'2020-04-28 22:27:00'),(537,5,NULL,'logapitest',NULL,'2020-04-28 22:27:00'),(538,5,NULL,'logapitest',NULL,'2020-04-28 22:27:00'),(539,5,NULL,'logapitest',NULL,'2020-04-28 22:27:00'),(540,5,NULL,'logapitest',NULL,'2020-04-28 22:27:00'),(541,5,NULL,'logapitest',NULL,'2020-04-28 22:27:00'),(542,5,NULL,'logapitest',NULL,'2020-04-28 22:27:00'),(543,5,NULL,'logapitest',NULL,'2020-04-28 22:27:00'),(544,5,NULL,'logapitest',NULL,'2020-04-28 22:27:00'),(545,5,NULL,'logapitest',NULL,'2020-04-28 22:27:00'),(546,5,NULL,'logapitest',NULL,'2020-04-28 22:27:00'),(547,5,NULL,'logapitest',NULL,'2020-04-28 22:27:00'),(548,5,NULL,'logapitest',NULL,'2020-04-28 22:27:00'),(549,5,NULL,'logapitest',NULL,'2020-04-28 22:27:00'),(550,5,NULL,'logapitest',NULL,'2020-04-28 22:27:00'),(551,5,NULL,'logapitest',NULL,'2020-04-28 22:27:00'),(552,5,NULL,'logapitest',NULL,'2020-04-28 22:27:00'),(553,5,NULL,'logapitest',NULL,'2020-04-28 22:27:00'),(554,5,NULL,'logapitest',NULL,'2020-04-28 22:27:00'),(555,5,NULL,'logapitest',NULL,'2020-04-28 22:27:01'),(556,5,NULL,'logapitest',NULL,'2020-04-28 22:27:01'),(557,5,NULL,'logapitest',NULL,'2020-04-28 22:27:01'),(558,5,NULL,'logapitest',NULL,'2020-04-28 22:27:01'),(559,5,NULL,'logapitest',NULL,'2020-04-28 22:27:01'),(560,5,NULL,'logapitest',NULL,'2020-04-28 22:27:01'),(561,5,NULL,'logapitest',NULL,'2020-04-28 22:27:01'),(562,5,NULL,'logapitest',NULL,'2020-04-28 22:27:01'),(563,5,NULL,'logapitest',NULL,'2020-04-28 22:27:01'),(564,5,NULL,'logapitest',NULL,'2020-04-28 22:27:01'),(565,5,NULL,'logapitest',NULL,'2020-04-28 22:27:01'),(566,5,NULL,'logapitest',NULL,'2020-04-28 22:27:01'),(567,5,NULL,'logapitest',NULL,'2020-04-28 22:27:01'),(568,5,NULL,'logapitest',NULL,'2020-04-28 22:27:01'),(569,5,NULL,'logapitest',NULL,'2020-04-28 22:27:01'),(570,5,NULL,'logapitest',NULL,'2020-04-28 22:27:01'),(571,5,NULL,'logapitest',NULL,'2020-04-28 22:27:01'),(572,5,NULL,'logapitest',NULL,'2020-04-28 22:27:01'),(573,5,NULL,'logapitest',NULL,'2020-04-28 22:27:01'),(574,5,NULL,'logapitest',NULL,'2020-04-28 22:27:01'),(575,5,NULL,'logapitest',NULL,'2020-04-28 22:27:01'),(576,5,NULL,'logapitest',NULL,'2020-04-28 22:27:01'),(577,5,NULL,'logapitest',NULL,'2020-04-28 22:27:01'),(578,5,NULL,'logapitest',NULL,'2020-04-28 22:27:01'),(579,5,NULL,'logapitest',NULL,'2020-04-28 22:27:01'),(580,5,NULL,'logapitest',NULL,'2020-04-28 22:27:01'),(581,5,NULL,'logapitest',NULL,'2020-04-28 22:27:01'),(582,5,NULL,'logapitest',NULL,'2020-04-28 22:27:01'),(583,5,NULL,'logapitest',NULL,'2020-04-28 22:27:01'),(584,5,NULL,'logapitest',NULL,'2020-04-28 22:27:01'),(585,5,NULL,'logapitest',NULL,'2020-04-28 22:27:01'),(586,5,NULL,'logapitest',NULL,'2020-04-28 22:27:01'),(587,5,NULL,'logapitest',NULL,'2020-04-28 22:27:01'),(588,5,NULL,'logapitest',NULL,'2020-04-28 22:27:01'),(589,5,NULL,'logapitest',NULL,'2020-04-28 22:27:01'),(590,5,NULL,'logapitest',NULL,'2020-04-28 22:27:01'),(591,5,NULL,'logapitest',NULL,'2020-04-28 22:27:01'),(592,5,NULL,'logapitest',NULL,'2020-04-28 22:27:01'),(593,5,NULL,'logapitest',NULL,'2020-04-28 22:27:01'),(594,5,NULL,'logapitest',NULL,'2020-04-28 22:27:01'),(595,5,NULL,'logapitest',NULL,'2020-04-28 22:27:01'),(596,5,NULL,'logapitest',NULL,'2020-04-28 22:27:01'),(597,5,NULL,'logapitest',NULL,'2020-04-28 22:27:01'),(598,5,NULL,'logapitest',NULL,'2020-04-28 22:27:01'),(599,5,NULL,'logapitest',NULL,'2020-04-28 22:27:01'),(600,5,NULL,'logapitest',NULL,'2020-04-28 22:27:01'),(601,5,NULL,'logapitest',NULL,'2020-04-28 22:27:01'),(602,5,NULL,'logapitest',NULL,'2020-04-28 22:27:01'),(603,5,NULL,'logapitest',NULL,'2020-04-28 22:27:01'),(604,5,NULL,'logapitest',NULL,'2020-04-28 22:27:01'),(605,5,NULL,'logapitest',NULL,'2020-04-28 22:27:01'),(606,5,NULL,'logapitest',NULL,'2020-04-28 22:27:01'),(607,5,NULL,'logapitest',NULL,'2020-04-28 22:27:01'),(608,5,NULL,'logapitest',NULL,'2020-04-28 22:27:01'),(609,5,NULL,'logapitest',NULL,'2020-04-28 22:27:01'),(610,5,NULL,'logapitest',NULL,'2020-04-28 22:27:01'),(611,5,NULL,'logapitest',NULL,'2020-04-28 22:27:01'),(612,5,NULL,'logapitest',NULL,'2020-04-28 22:27:02'),(613,5,NULL,'logapitest',NULL,'2020-04-28 22:27:02'),(614,5,NULL,'logapitest',NULL,'2020-04-28 22:27:02'),(615,5,NULL,'logapitest',NULL,'2020-04-28 22:27:02'),(616,5,NULL,'logapitest',NULL,'2020-04-28 22:27:02'),(617,5,NULL,'logapitest',NULL,'2020-04-28 22:27:02'),(618,5,NULL,'logapitest',NULL,'2020-04-28 22:27:02'),(619,5,NULL,'logapitest',NULL,'2020-04-28 22:27:02'),(620,5,NULL,'logapitest',NULL,'2020-04-28 22:27:02'),(621,5,NULL,'logapitest',NULL,'2020-04-28 22:27:02'),(622,5,NULL,'logapitest',NULL,'2020-04-28 22:27:02'),(623,5,NULL,'logapitest',NULL,'2020-04-28 22:27:02'),(624,5,NULL,'logapitest',NULL,'2020-04-28 22:27:02'),(625,5,NULL,'logapitest',NULL,'2020-04-28 22:27:02'),(626,5,NULL,'logapitest',NULL,'2020-04-28 22:27:02'),(627,5,NULL,'logapitest',NULL,'2020-04-28 22:27:02'),(628,5,NULL,'logapitest',NULL,'2020-04-28 22:27:02'),(629,5,NULL,'logapitest',NULL,'2020-04-28 22:27:02'),(630,5,NULL,'logapitest',NULL,'2020-04-28 22:27:02'),(631,5,NULL,'logapitest',NULL,'2020-04-28 22:27:02'),(632,5,NULL,'logapitest',NULL,'2020-04-28 22:27:02'),(633,5,NULL,'logapitest',NULL,'2020-04-28 22:27:02'),(634,5,NULL,'logapitest',NULL,'2020-04-28 22:27:02'),(635,5,NULL,'logapitest',NULL,'2020-04-28 22:27:02'),(636,5,NULL,'logapitest',NULL,'2020-04-28 22:27:02'),(637,5,NULL,'logapitest',NULL,'2020-04-28 22:27:02'),(638,5,NULL,'logapitest',NULL,'2020-04-28 22:27:02'),(639,5,NULL,'logapitest',NULL,'2020-04-28 22:27:02'),(640,5,NULL,'logapitest',NULL,'2020-04-28 22:27:02'),(641,5,NULL,'logapitest',NULL,'2020-04-28 22:27:02'),(642,5,NULL,'logapitest',NULL,'2020-04-28 22:27:02'),(643,5,NULL,'logapitest',NULL,'2020-04-28 22:27:02'),(644,5,NULL,'logapitest',NULL,'2020-04-28 22:27:02'),(645,5,NULL,'logapitest',NULL,'2020-04-28 22:27:02'),(646,5,NULL,'logapitest',NULL,'2020-04-28 22:27:02'),(647,5,NULL,'logapitest',NULL,'2020-04-28 22:27:02'),(648,5,NULL,'logapitest',NULL,'2020-04-28 22:27:02'),(649,5,NULL,'logapitest',NULL,'2020-04-28 22:27:02'),(650,5,NULL,'logapitest',NULL,'2020-04-28 22:27:02'),(651,5,NULL,'logapitest',NULL,'2020-04-28 22:27:02'),(652,5,NULL,'logapitest',NULL,'2020-04-28 22:27:02'),(653,5,NULL,'logapitest',NULL,'2020-04-28 22:27:02'),(654,5,NULL,'logapitest',NULL,'2020-04-28 22:27:02'),(655,5,NULL,'logapitest',NULL,'2020-04-28 22:27:02'),(656,5,NULL,'logapitest',NULL,'2020-04-28 22:27:02'),(657,5,NULL,'logapitest',NULL,'2020-04-28 22:27:02'),(658,5,NULL,'logapitest',NULL,'2020-04-28 22:27:02'),(659,5,NULL,'logapitest',NULL,'2020-04-28 22:27:02'),(660,5,NULL,'logapitest',NULL,'2020-04-28 22:27:02'),(661,5,NULL,'logapitest',NULL,'2020-04-28 22:27:02'),(662,5,NULL,'logapitest',NULL,'2020-04-28 22:27:02'),(663,5,NULL,'logapitest',NULL,'2020-04-28 22:27:02'),(664,5,NULL,'logapitest',NULL,'2020-04-28 22:27:02'),(665,5,NULL,'logapitest',NULL,'2020-04-28 22:27:02'),(666,5,NULL,'logapitest',NULL,'2020-04-28 22:27:02'),(667,5,NULL,'logapitest',NULL,'2020-04-28 22:27:02'),(668,5,NULL,'logapitest',NULL,'2020-04-28 22:27:02'),(669,5,NULL,'logapitest',NULL,'2020-04-28 22:27:03'),(670,5,NULL,'logapitest',NULL,'2020-04-28 22:27:03'),(671,5,NULL,'logapitest',NULL,'2020-04-28 22:27:03'),(672,5,NULL,'logapitest',NULL,'2020-04-28 22:27:03'),(673,5,NULL,'logapitest',NULL,'2020-04-28 22:27:03'),(674,5,NULL,'logapitest',NULL,'2020-04-28 22:27:03'),(675,5,NULL,'logapitest',NULL,'2020-04-28 22:27:03'),(676,5,NULL,'logapitest',NULL,'2020-04-28 22:27:03'),(677,5,NULL,'logapitest',NULL,'2020-04-28 22:27:03'),(678,5,NULL,'logapitest',NULL,'2020-04-28 22:27:03'),(679,5,NULL,'logapitest',NULL,'2020-04-28 22:27:03'),(680,5,NULL,'logapitest',NULL,'2020-04-28 22:27:03'),(681,5,NULL,'logapitest',NULL,'2020-04-28 22:27:03'),(682,5,NULL,'logapitest',NULL,'2020-04-28 22:27:03'),(683,5,NULL,'logapitest',NULL,'2020-04-28 22:27:03'),(684,5,NULL,'logapitest',NULL,'2020-04-28 22:27:03'),(685,5,NULL,'logapitest',NULL,'2020-04-28 22:27:03'),(686,5,NULL,'logapitest',NULL,'2020-04-28 22:27:03'),(687,5,NULL,'logapitest',NULL,'2020-04-28 22:27:03'),(688,5,NULL,'logapitest',NULL,'2020-04-28 22:27:03'),(689,5,NULL,'logapitest',NULL,'2020-04-28 22:27:03'),(690,5,NULL,'logapitest',NULL,'2020-04-28 22:27:03'),(691,5,NULL,'logapitest',NULL,'2020-04-28 22:27:03'),(692,5,NULL,'logapitest',NULL,'2020-04-28 22:27:03'),(693,5,NULL,'logapitest',NULL,'2020-04-28 22:27:03'),(694,5,NULL,'logapitest',NULL,'2020-04-28 22:27:03'),(695,5,NULL,'logapitest',NULL,'2020-04-28 22:27:03'),(696,5,NULL,'logapitest',NULL,'2020-04-28 22:27:03'),(697,5,NULL,'logapitest',NULL,'2020-04-28 22:27:03'),(698,5,NULL,'logapitest',NULL,'2020-04-28 22:27:03'),(699,5,NULL,'logapitest',NULL,'2020-04-28 22:27:03'),(700,5,NULL,'logapitest',NULL,'2020-04-28 22:27:03'),(701,5,NULL,'logapitest',NULL,'2020-04-28 22:27:03'),(702,5,NULL,'logapitest',NULL,'2020-04-28 22:27:03'),(703,5,NULL,'logapitest',NULL,'2020-04-28 22:27:03'),(704,5,NULL,'logapitest',NULL,'2020-04-28 22:27:03'),(705,5,NULL,'logapitest',NULL,'2020-04-28 22:27:03'),(706,5,NULL,'logapitest',NULL,'2020-04-28 22:27:03'),(707,5,NULL,'logapitest',NULL,'2020-04-28 22:27:03'),(708,5,NULL,'logapitest',NULL,'2020-04-28 22:27:03'),(709,5,NULL,'logapitest',NULL,'2020-04-28 22:27:03'),(710,5,NULL,'logapitest',NULL,'2020-04-28 22:27:03'),(711,5,NULL,'logapitest',NULL,'2020-04-28 22:27:03'),(712,5,NULL,'logapitest',NULL,'2020-04-28 22:27:03'),(713,5,NULL,'logapitest',NULL,'2020-04-28 22:27:03'),(714,5,NULL,'logapitest',NULL,'2020-04-28 22:27:03'),(715,5,NULL,'logapitest',NULL,'2020-04-28 22:27:03'),(716,5,NULL,'logapitest',NULL,'2020-04-28 22:27:03'),(717,5,NULL,'logapitest',NULL,'2020-04-28 22:27:03'),(718,5,NULL,'logapitest',NULL,'2020-04-28 22:27:03'),(719,5,NULL,'logapitest',NULL,'2020-04-28 22:27:03'),(720,5,NULL,'logapitest',NULL,'2020-04-28 22:27:03'),(721,5,NULL,'logapitest',NULL,'2020-04-28 22:27:03'),(722,5,NULL,'logapitest',NULL,'2020-04-28 22:27:03'),(723,5,NULL,'logapitest',NULL,'2020-04-28 22:27:03'),(724,5,NULL,'logapitest',NULL,'2020-04-28 22:27:03'),(725,5,NULL,'logapitest',NULL,'2020-04-28 22:27:03'),(726,5,NULL,'logapitest',NULL,'2020-04-28 22:27:03'),(727,5,NULL,'logapitest',NULL,'2020-04-28 22:27:04'),(728,5,NULL,'logapitest',NULL,'2020-04-28 22:27:04'),(729,5,NULL,'logapitest',NULL,'2020-04-28 22:27:04'),(730,5,NULL,'logapitest',NULL,'2020-04-28 22:27:04'),(731,5,NULL,'logapitest',NULL,'2020-04-28 22:27:04'),(732,5,NULL,'logapitest',NULL,'2020-04-28 22:27:04'),(733,5,NULL,'logapitest',NULL,'2020-04-28 22:27:04'),(734,5,NULL,'logapitest',NULL,'2020-04-28 22:27:04'),(735,5,NULL,'logapitest',NULL,'2020-04-28 22:27:04'),(736,5,NULL,'logapitest',NULL,'2020-04-28 22:27:04'),(737,5,NULL,'logapitest',NULL,'2020-04-28 22:27:04'),(738,5,NULL,'logapitest',NULL,'2020-04-28 22:27:04'),(739,5,NULL,'logapitest',NULL,'2020-04-28 22:27:04'),(740,5,NULL,'logapitest',NULL,'2020-04-28 22:27:04'),(741,5,NULL,'logapitest',NULL,'2020-04-28 22:27:04'),(742,5,NULL,'logapitest',NULL,'2020-04-28 22:27:04'),(743,5,NULL,'logapitest',NULL,'2020-04-28 22:27:04'),(744,5,NULL,'logapitest',NULL,'2020-04-28 22:27:04'),(745,5,NULL,'logapitest',NULL,'2020-04-28 22:27:04'),(746,5,NULL,'logapitest',NULL,'2020-04-28 22:27:04'),(747,5,NULL,'logapitest',NULL,'2020-04-28 22:27:04'),(748,5,NULL,'logapitest',NULL,'2020-04-28 22:27:04'),(749,5,NULL,'logapitest',NULL,'2020-04-28 22:27:04'),(750,5,NULL,'logapitest',NULL,'2020-04-28 22:27:04'),(751,5,NULL,'logapitest',NULL,'2020-04-28 22:27:04'),(752,5,NULL,'logapitest',NULL,'2020-04-28 22:27:04'),(753,5,NULL,'logapitest',NULL,'2020-04-28 22:27:04'),(754,5,NULL,'logapitest',NULL,'2020-04-28 22:27:04'),(755,5,NULL,'logapitest',NULL,'2020-04-28 22:27:04'),(756,5,NULL,'logapitest',NULL,'2020-04-28 22:27:04'),(757,5,NULL,'logapitest',NULL,'2020-04-28 22:27:04'),(758,5,NULL,'logapitest',NULL,'2020-04-28 22:27:04'),(759,5,NULL,'logapitest',NULL,'2020-04-28 22:27:04'),(760,5,NULL,'logapitest',NULL,'2020-04-28 22:27:04'),(761,5,NULL,'logapitest',NULL,'2020-04-28 22:27:04'),(762,5,NULL,'logapitest',NULL,'2020-04-28 22:27:04'),(763,5,NULL,'logapitest',NULL,'2020-04-28 22:27:04'),(764,5,NULL,'logapitest',NULL,'2020-04-28 22:27:04'),(765,5,NULL,'logapitest',NULL,'2020-04-28 22:27:04'),(766,5,NULL,'logapitest',NULL,'2020-04-28 22:27:04'),(767,5,NULL,'logapitest',NULL,'2020-04-28 22:27:04'),(768,5,NULL,'logapitest',NULL,'2020-04-28 22:27:04'),(769,5,NULL,'logapitest',NULL,'2020-04-28 22:27:04'),(770,5,NULL,'logapitest',NULL,'2020-04-28 22:27:04'),(771,5,NULL,'logapitest',NULL,'2020-04-28 22:27:04'),(772,5,NULL,'logapitest',NULL,'2020-04-28 22:27:04'),(773,5,NULL,'logapitest',NULL,'2020-04-28 22:27:04'),(774,5,NULL,'logapitest',NULL,'2020-04-28 22:27:04'),(775,5,NULL,'logapitest',NULL,'2020-04-28 22:27:04'),(776,5,NULL,'logapitest',NULL,'2020-04-28 22:27:04'),(777,5,NULL,'logapitest',NULL,'2020-04-28 22:27:04'),(778,5,NULL,'logapitest',NULL,'2020-04-28 22:27:04'),(779,5,NULL,'logapitest',NULL,'2020-04-28 22:27:04'),(780,5,NULL,'logapitest',NULL,'2020-04-28 22:27:04'),(781,5,NULL,'logapitest',NULL,'2020-04-28 22:27:04'),(782,5,NULL,'logapitest',NULL,'2020-04-28 22:27:04'),(783,5,NULL,'logapitest',NULL,'2020-04-28 22:27:04'),(784,5,NULL,'logapitest',NULL,'2020-04-28 22:27:05'),(785,5,NULL,'logapitest',NULL,'2020-04-28 22:27:05'),(786,5,NULL,'logapitest',NULL,'2020-04-28 22:27:05'),(787,5,NULL,'logapitest',NULL,'2020-04-28 22:27:05'),(788,5,NULL,'logapitest',NULL,'2020-04-28 22:27:05'),(789,5,NULL,'logapitest',NULL,'2020-04-28 22:27:05'),(790,5,NULL,'logapitest',NULL,'2020-04-28 22:27:05'),(791,5,NULL,'logapitest',NULL,'2020-04-28 22:27:05'),(792,5,NULL,'logapitest',NULL,'2020-04-28 22:27:05'),(793,5,NULL,'logapitest',NULL,'2020-04-28 22:27:05'),(794,5,NULL,'logapitest',NULL,'2020-04-28 22:27:05'),(795,5,NULL,'logapitest',NULL,'2020-04-28 22:27:05'),(796,5,NULL,'logapitest',NULL,'2020-04-28 22:27:05'),(797,5,NULL,'logapitest',NULL,'2020-04-28 22:27:05'),(798,5,NULL,'logapitest',NULL,'2020-04-28 22:27:05'),(799,5,NULL,'logapitest',NULL,'2020-04-28 22:27:05'),(800,58,NULL,'admin',NULL,'2020-04-28 22:27:05'),(811,41,'edu.ncsu.csc.itrust2.models.persistent.User@46ed09f7 created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@4c583248','hcp','AliceThirteen','2020-04-28 22:27:06'),(814,75,'edu.ncsu.csc.itrust2.models.persistent.User@46ed09f7 created a Lab Procedure for edu.ncsu.csc.itrust2.models.persistent.User@4c583248','hcp','AliceThirteen','2020-04-28 22:27:06'),(818,48,'Creating prescription with id 817','SPRING_API_TEST_USER','AliceThirteen','2020-04-28 22:27:06'),(819,43,'edu.ncsu.csc.itrust2.models.persistent.User@46ed09f7 deleted a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@4c583248','hcp','AliceThirteen','2020-04-28 22:27:06'),(820,77,'hcp deleted a Lab Procedure for AliceThirteen','hcp','AliceThirteen','2020-04-28 22:27:06'),(834,48,'Creating prescription with id 833','SPRING_API_TEST_USER','AliceThirteen','2020-04-28 22:27:10'),(836,41,'edu.ncsu.csc.itrust2.models.persistent.User@4c583248 created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@4c583248','AliceThirteen',NULL,'2020-04-28 22:27:10'),(855,48,'Creating prescription with id 854','SPRING_API_TEST_USER','AliceThirteen','2020-04-28 22:27:10'),(857,41,'edu.ncsu.csc.itrust2.models.persistent.User@4c583248 created a diagnosis for edu.ncsu.csc.itrust2.models.persistent.User@4c583248','AliceThirteen',NULL,'2020-04-28 22:27:11'),(860,19,'test log entry with patient and hcp','logPatient','logHcp','2020-04-28 22:27:11'),(861,15,NULL,'logAdmin',NULL,'2020-04-28 22:27:11'),(862,1,'login succeeded for logPatient.','logPatient',NULL,'2020-04-28 22:27:11'),(863,1,'login succeeded for dupUser.','dupUser',NULL,'2020-04-28 22:27:11'),(864,1,'User has logged in','test',NULL,'2020-04-28 22:27:11');
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
INSERT INTO `Prescriptions` VALUES (15,1,'2020-06-26 23:00:00',20,'2020-03-28 23:00:00',14,'onionman',NULL),(17,1,'2020-05-27 23:00:00',99,'2020-02-28 00:00:00',16,'onionman',NULL),(27,1,'2020-06-26 23:00:00',20,'2020-03-28 23:00:00',26,'onionman',NULL),(29,1,'2020-05-27 23:00:00',99,'2020-02-28 00:00:00',28,'onionman',NULL),(40,1,'2020-06-26 23:00:00',20,'2020-03-28 23:00:00',39,'onionman',NULL),(42,1,'2020-05-27 23:00:00',99,'2020-02-28 00:00:00',41,'onionman',NULL),(53,1,'2020-06-26 23:00:00',20,'2020-03-28 23:00:00',52,'onionman',NULL),(55,1,'2020-05-27 23:00:00',99,'2020-02-28 00:00:00',54,'onionman',NULL),(171,3,'2020-05-07 23:00:00',5,'2020-04-27 23:00:00',170,'AliceThirteen',NULL),(188,3,'2020-05-07 23:00:00',5,'2020-04-27 23:00:00',187,'patient',NULL),(203,3,'2020-05-07 23:00:00',5,'2020-04-27 23:00:00',202,'AliceThirteen',NULL),(817,3,'2020-05-07 23:00:00',5,'2020-04-27 23:00:00',816,'AliceThirteen',NULL),(833,3,'2020-05-07 23:00:00',5,'2020-04-27 23:00:00',832,'AliceThirteen',835),(854,3,'2020-05-07 23:00:00',5,'2020-04-27 23:00:00',853,'AliceThirteen',856);
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
INSERT INTO `QuantitativeLOINCResult_resultRanges` VALUES (849,NULL,139,0),(849,7,199,140),(849,6,5000,200);
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
INSERT INTO `Users` VALUES ('admin',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_ADMIN'),('AliceThirteen',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_PATIENT'),('alminister',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_ADMIN'),('antti',1,'$2a$10$6ocJb52up.iL2oibrV8sv.RlAr.s64Nsln5dWqLFa4NBFa4ErUtli','ROLE_PATIENT'),('api_test_patient',1,'$2a$10$u2tcLTygbqdQlBdDZpDAF./Rh1w/Sp3JvWuDh5wo4tOyOy1G5v.Da','ROLE_PATIENT'),('assignedTech',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_LABTECH'),('assignedTech2',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_LABTECH'),('BillyBob',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_PATIENT'),('bobbo',1,'$2a$10$lfUV.IuIvDjfRvPsjDZbDOcZMICgX6M2bdmhNw0LZgVutw66kY1Nm','ROLE_PATIENT'),('bobbyOD',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_OD'),('BobTheFourYearOld',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_PATIENT'),('candy',1,'$2a$10$edb0wpWWVcXfvuEchUdmauLgpy90HKJI.FYvuV8Hrd.2a8ymvBNVC','ROLE_HCP'),('er',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_ER'),('hcp',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_HCP'),('jbean',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_PATIENT'),('jerry',1,'$2a$10$gm5Pq1vUHgEtaV17wB5r..aeT8GnxTf2sfyhEJJDnBcIuZvfQgA66','ROLE_PATIENT'),('JillBob',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_PATIENT'),('kingfour',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_PATIENT'),('kingone',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_PATIENT'),('kingthree',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_PATIENT'),('kingtwo',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_PATIENT'),('knightSolaire',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_ER'),('labtech',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_LABTECH'),('labtech2',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_LABTECH'),('labtech3',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_LABTECH'),('larrytech',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_LABTECH'),('lockoutUser',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_HCP'),('lockoutUser2',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_HCP'),('logapitest',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_PATIENT'),('nsanderson',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_PATIENT'),('onionman',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_PATIENT'),('patient',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_PATIENT'),('patient2',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_PATIENT'),('patient3',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_PATIENT'),('patientTestDad',1,'123456','ROLE_PATIENT'),('patientTestMom',1,'123456','ROLE_PATIENT'),('patientTestPatient',1,'123456','ROLE_PATIENT'),('patientTestRep',1,'123456','ROLE_PATIENT'),('pwtestuser1',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_HCP'),('pwtestuser2',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_HCP'),('pwtestuser3',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_HCP'),('pwtestuser4',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_HCP'),('pwtestuser5',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_HCP'),('robortOPH',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_OPH'),('svang',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_HCP'),('sven_forkbeard',0,'$2a$10$Ao6.WikhTlBQ71st3BDikO4qJfrN1YadfD/7gfqtQNHmlFIYroTeO','ROLE_PATIENT'),('terry',1,'$2a$10$wn/FeGmntBOUjCJhiF8rJ.AaFh/ql8HmXntW2mcn1ZCY7kMKoUHlS','ROLE_PATIENT'),('TimTheOneYearOld',1,'$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.','ROLE_PATIENT');
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
INSERT INTO `hibernate_sequence` VALUES (875),(875),(875),(875),(875),(875),(875),(875),(875),(875),(875),(875),(875),(875),(875),(875),(875),(875),(875),(875);
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

-- Dump completed on 2020-04-29  0:14:24
