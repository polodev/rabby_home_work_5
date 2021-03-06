-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: art_work
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `another_galleries`
--

DROP TABLE IF EXISTS `another_galleries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `another_galleries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `loan_start_date` date DEFAULT NULL,
  `loan_end_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `another_galleries`
--

LOCK TABLES `another_galleries` WRITE;
/*!40000 ALTER TABLE `another_galleries` DISABLE KEYS */;
INSERT INTO `another_galleries` VALUES (1,'Gallery 1','Seoul','2020-08-09','2020-12-30'),(2,'Gallery 2','Busan','2020-08-09','2020-12-30'),(3,'Gallery 3','Seoul','2020-08-09','2020-12-30'),(4,'Gallery 4','Daegu','2020-08-09','2020-12-30'),(5,'Gallery 5','Seoul','2020-08-09','2020-12-30');
/*!40000 ALTER TABLE `another_galleries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `art_presence`
--

DROP TABLE IF EXISTS `art_presence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `art_presence` (
  `id` int NOT NULL AUTO_INCREMENT,
  `art_presence` enum('display_at_the_museum','held_in_storage','traveling_show','loan_to_another_gallery') NOT NULL DEFAULT 'display_at_the_museum',
  `art_id` int NOT NULL,
  `museum_id` int DEFAULT NULL,
  `traveling_show_id` int DEFAULT NULL,
  `another_gallery_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `art_id` (`art_id`),
  KEY `museum_id` (`museum_id`),
  KEY `traveling_show_id` (`traveling_show_id`),
  KEY `another_gallery_id` (`another_gallery_id`),
  CONSTRAINT `another_gallery_id` FOREIGN KEY (`another_gallery_id`) REFERENCES `another_galleries` (`id`),
  CONSTRAINT `art_id` FOREIGN KEY (`art_id`) REFERENCES `arts` (`id`),
  CONSTRAINT `museum_id` FOREIGN KEY (`museum_id`) REFERENCES `museums` (`id`),
  CONSTRAINT `traveling_show_id` FOREIGN KEY (`traveling_show_id`) REFERENCES `traveling_shows` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `art_presence`
--

LOCK TABLES `art_presence` WRITE;
/*!40000 ALTER TABLE `art_presence` DISABLE KEYS */;
INSERT INTO `art_presence` VALUES (1,'display_at_the_museum',1,1,NULL,NULL),(2,'display_at_the_museum',2,2,NULL,NULL),(3,'display_at_the_museum',3,3,NULL,NULL),(4,'display_at_the_museum',4,4,NULL,NULL),(5,'traveling_show',5,NULL,1,NULL),(6,'traveling_show',6,NULL,2,NULL),(7,'traveling_show',7,NULL,3,NULL),(8,'loan_to_another_gallery',8,NULL,NULL,1),(9,'loan_to_another_gallery',9,NULL,NULL,2),(10,'loan_to_another_gallery',10,NULL,NULL,3);
/*!40000 ALTER TABLE `art_presence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artist_art`
--

DROP TABLE IF EXISTS `artist_art`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artist_art` (
  `artist_id` int NOT NULL,
  `art_id` int NOT NULL,
  PRIMARY KEY (`artist_id`,`art_id`),
  KEY `art_id` (`art_id`),
  CONSTRAINT `artist_art_ibfk_1` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`id`),
  CONSTRAINT `artist_art_ibfk_2` FOREIGN KEY (`art_id`) REFERENCES `arts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artist_art`
--

LOCK TABLES `artist_art` WRITE;
/*!40000 ALTER TABLE `artist_art` DISABLE KEYS */;
INSERT INTO `artist_art` VALUES (1,1),(1,2),(1,3),(1,4),(2,5),(2,6),(2,7),(2,8),(3,9),(3,10),(3,11),(3,12),(4,13),(4,14),(4,15);
/*!40000 ALTER TABLE `artist_art` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artists`
--

DROP TABLE IF EXISTS `artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artists` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `other_information` varchar(200) DEFAULT NULL,
  `date_of_birth` date NOT NULL,
  `date_of_death` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists`
--

LOCK TABLES `artists` WRITE;
/*!40000 ALTER TABLE `artists` DISABLE KEYS */;
INSERT INTO `artists` VALUES (1,'John Smith',NULL,'1950-05-10',NULL),(2,'John doe',NULL,'1960-05-10',NULL),(3,'John man',NULL,'1970-05-10',NULL),(4,'Kabir Smith',NULL,'1980-05-10',NULL),(5,'jane Smith',NULL,'1959-05-10',NULL),(6,'Rabby Smith',NULL,'1990-05-10',NULL),(7,'Panseng Smith',NULL,'1988-05-10',NULL),(8,'Gadha Smith',NULL,'1930-05-10',NULL),(9,'bolod smith',NULL,'1980-05-20',NULL);
/*!40000 ALTER TABLE `artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `arts`
--

DROP TABLE IF EXISTS `arts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `arts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `item_code` varchar(50) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `size` varchar(50) DEFAULT NULL,
  `other_information` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `item_code` (`item_code`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arts`
--

LOCK TABLES `arts` WRITE;
/*!40000 ALTER TABLE `arts` DISABLE KEYS */;
INSERT INTO `arts` VALUES (1,'39473984','The Foetus in the Womb','Painting','50inch X 70inch',''),(2,'534534','Rembrandt – Self-Portrait with Two Circles','Painting','50inch X 70inch',''),(3,'345345345','Chauvet cave paintings','Painting','50inch X 70inch',''),(4,'3455345','One: Number ','Painting','50inch X 70inch',''),(5,'533453','Las Meninas','Painting','50inch X 70inch',''),(6,'2334545','Guernica ','Painting','50inch X 70inch',''),(7,'765765','Prisoners','Painting','50inch X 70inch',''),(8,'4564564','Parthenon Sculptures','Painting','50inch X 70inch',''),(9,'456645','Mont Sainte-Victoire','Painting','50inch X 70inch',''),(10,'5646543','Mona Lisa','Painting','50inch X 70inch',''),(11,'64534354','The Starry Night','Painting','50inch X 70inch',''),(12,'46346','The Scream','Painting','50inch X 70inch',''),(13,'346456','The Night Watch','Painting','50inch X 70inch',''),(14,'77745645','The Arnolfini Portrait','Painting','50inch X 70inch',''),(15,'45645453','The Girl With A Pearl Earring','Painting','50inch X 70inch',''),(16,'4564363','Impression, Sunrise','Painting','50inch X 70inch',''),(17,'46345634','The Creation Of Adam','Painting','50inch X 70inch',''),(18,'4643634','Luncheon Of The Boating Party','Painting','50inch X 70inch',''),(19,'364543','The Grand Odalisque','Painting','50inch X 70inch',''),(20,'436436','Napoleon Crossing The Alps','Painting','50inch X 70inch',''),(21,'4564536','The Birth Of Venus','Painting','50inch X 70inch',''),(22,'46435563','The Liberty Leading The People','Painting','50inch X 70inch','');
/*!40000 ALTER TABLE `arts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `museums`
--

DROP TABLE IF EXISTS `museums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `museums` (
  `id` int NOT NULL AUTO_INCREMENT,
  `location_in_museum` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `museums`
--

LOCK TABLES `museums` WRITE;
/*!40000 ALTER TABLE `museums` DISABLE KEYS */;
INSERT INTO `museums` VALUES (1,'2nd floor center'),(2,'1st floor center'),(3,'3rd floor center'),(4,'4th floor center'),(5,'5h floor center'),(6,'2nd floor left corner'),(7,'1st floor left corner'),(8,'3rd floor left corner'),(9,'4th floor left corner'),(10,'5h floor left corner'),(11,'2nd floor right corner'),(12,'1st floor right corner'),(13,'3rd floor right corner'),(14,'4th floor right corner'),(15,'5h floor right corner');
/*!40000 ALTER TABLE `museums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `traveling_shows`
--

DROP TABLE IF EXISTS `traveling_shows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `traveling_shows` (
  `id` int NOT NULL AUTO_INCREMENT,
  `city` varchar(50) NOT NULL,
  `traveling_show_start_date` date DEFAULT NULL,
  `traveling_show_end_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `traveling_shows`
--

LOCK TABLES `traveling_shows` WRITE;
/*!40000 ALTER TABLE `traveling_shows` DISABLE KEYS */;
INSERT INTO `traveling_shows` VALUES (1,'Seoul','2020-08-09','2020-12-30'),(2,'Busan','2020-08-09','2020-12-30'),(3,'Seoul','2020-08-09','2020-12-30'),(4,'Daegu','2020-08-09','2020-12-30'),(5,'Seoul','2020-08-09','2020-12-30');
/*!40000 ALTER TABLE `traveling_shows` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-30 17:55:58
