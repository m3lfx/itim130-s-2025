-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: db_sales_s_2025
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

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
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `last_name` varchar(45) NOT NULL,
  `first_name` char(32) NOT NULL,
  `address` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `zipcode2` char(15) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Stones','Jenny','27 Rowan Avenue','Hightown','12345','1630'),(2,'Stones','Andrew','52 The Willows','Lowtown','876 3527','1630'),(3,'Matthew','Alex','4 The Street','Nicetown','010 4567','1630'),(4,'Matthew','Adrian','The Barn','Yuleville','487 3871','1630'),(5,'Cozens','Simon','7 Shady Lane','Oakenham','514 5926','1630'),(6,'Matthew','Neil','5 Pasture Lane','Nicetown','267 1232','1630'),(7,'Stones','Richard','34 Holly Way','Bingham','342 5982','1630'),(8,'Stones','Ann','34 Holly Way','Bingham','342 5982','1630'),(9,'Hickman','Christine','36 Queen Street','Histon','342 5432','1630'),(10,'Howard','Mike','86 Dysart Street','Tibsville','505 5482','1630'),(11,'Jones','Dave','54 Vale Rise','Bingham','342 8264','1630'),(12,'Neill','Richard','42 Thatched Way','Winnersby','505 6482','1630'),(13,'Hardy','Laura','73 Margarita Way','Oxbridge','821 2335','1630'),(14,'O\'Neill','Bill','2 Beamer Street','Welltown','435 1234','1630'),(15,'Hudson','David','4 The Square','Milltown','961 4526','1630'),(31,'bbb','aaa','tenement','taguig','98099','1630'),(32,'bbb','aaa','tenement','taguig','98099','1630'),(33,'bbb','aaa','tenement','taguig','98099','1630'),(34,'bbb','aaa','tenement','taguig','98099','1630'),(35,'bbb','aaa','tenement','taguig','98099','1630'),(36,'bbb','aaa','tenement','taguig','98099','1630'),(37,'bbb','aaa','tenement','taguig','98099','1630'),(38,'bbb','aaa','tenement','taguig','98099','1630'),(39,'bbb','aaa','tenement','taguig','98099','1630'),(40,'bbb','aaa','tenement','taguig','98099','1630'),(41,'bbb','aaa','tenement','taguig','98099','1630'),(42,'bbb','aaa','tenement','taguig','98099','1630'),(43,'bbb','aaa','tenement','taguig','98099','1630'),(45,'getfield','james','north signal','taguig','12345','12345'),(46,'mustaine','dave','canada','alabang city','12345','12345'),(47,'hammet','KIRK','usa','taguig','123345','98080');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `cost_price` decimal(3,2) DEFAULT NULL,
  `sell_price` decimal(3,2) DEFAULT NULL,
  `supplier_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (13,'laptop',5.67,8.90,'acer'),(14,'softdrinks',5.00,6.00,'coca cola'),(15,'biscuits',4.00,5.00,'skyflakes'),(16,'bottled water',4.00,6.00,'tubig'),(17,'tocino',3.00,5.00,'taguigs best'),(18,'monitor',9.99,9.99,'acer'),(19,'hotdog',9.99,9.99,'CDO'),(20,'tuna',9.99,9.99,'century'),(21,'foo',9.99,9.99,'bar');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderinfo`
--

DROP TABLE IF EXISTS `orderinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderinfo` (
  `orderinfo_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `date_placed` date NOT NULL,
  `date_shipped` date DEFAULT NULL,
  `shipping` decimal(7,2) DEFAULT NULL,
  PRIMARY KEY (`orderinfo_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `orderinfo_customer_id_fk` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderinfo`
--

LOCK TABLES `orderinfo` WRITE;
/*!40000 ALTER TABLE `orderinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderline`
--

DROP TABLE IF EXISTS `orderline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderline` (
  `item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `quantity` smallint(2) DEFAULT NULL,
  PRIMARY KEY (`item_id`,`order_id`),
  KEY `fk_items_has_orders_orders1_idx` (`order_id`),
  KEY `fk_items_has_orders_items1_idx` (`item_id`),
  CONSTRAINT `fk_items_has_orders_items1` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_items_has_orders_orders1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderline`
--

LOCK TABLES `orderline` WRITE;
/*!40000 ALTER TABLE `orderline` DISABLE KEYS */;
INSERT INTO `orderline` VALUES (13,1,1),(13,4,5),(13,5,5),(13,6,5),(13,8,5),(14,3,10),(15,4,5),(15,7,12),(16,3,2),(16,4,5),(16,8,5),(17,4,3),(17,5,5),(17,6,3);
/*!40000 ALTER TABLE `orderline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `date_ordered` date DEFAULT NULL,
  `date_delivery` date DEFAULT NULL,
  `status` enum('processing','delivered','canceled') NOT NULL,
  `customer_id` int(11) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `fk_orders_customers_idx` (`customer_id`),
  CONSTRAINT `fk_orders_customers` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2025-06-01','2025-06-30','delivered',1),(3,'2025-05-15','2025-05-15','delivered',15),(4,'2025-05-15','2025-05-15','delivered',15),(5,'2025-05-15','2025-05-20','delivered',2),(6,'2025-05-15','2025-05-15','processing',2),(7,'2025-05-15','2025-05-20','processing',3),(8,'2025-05-15','2025-05-20','processing',15);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `cost_price` decimal(3,2) DEFAULT NULL,
  `sell_price` decimal(3,2) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `supplier_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'softdrinks',5.00,6.00,100,'coca cola'),(2,'biscuits',4.00,5.00,90,'skyflakes'),(3,'bottled water',4.00,6.00,80,'tubig'),(4,'tocino',3.00,5.00,15,'taguigs best');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stocks`
--

DROP TABLE IF EXISTS `stocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stocks` (
  `item_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `stock_item_id_fk` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stocks`
--

LOCK TABLES `stocks` WRITE;
/*!40000 ALTER TABLE `stocks` DISABLE KEYS */;
INSERT INTO `stocks` VALUES (18,12),(19,120),(20,10),(21,10);
/*!40000 ALTER TABLE `stocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testcolcons`
--

DROP TABLE IF EXISTS `testcolcons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testcolcons` (
  `Colnotnull` int(11) NOT NULL,
  `Colprikey` int(11) NOT NULL,
  `Coldefault` int(11) DEFAULT 42,
  PRIMARY KEY (`Colprikey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testcolcons`
--

LOCK TABLES `testcolcons` WRITE;
/*!40000 ALTER TABLE `testcolcons` DISABLE KEYS */;
INSERT INTO `testcolcons` VALUES (1,1,1),(2,2,NULL),(3,3,42);
/*!40000 ALTER TABLE `testcolcons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ttconst`
--

DROP TABLE IF EXISTS `ttconst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ttconst` (
  `mykey1` int(11) DEFAULT NULL,
  `mykey2` int(11) NOT NULL,
  `mystring` varchar(15) NOT NULL,
  PRIMARY KEY (`mykey2`,`mystring`),
  UNIQUE KEY `cs1` (`mykey1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ttconst`
--

LOCK TABLES `ttconst` WRITE;
/*!40000 ALTER TABLE `ttconst` DISABLE KEYS */;
INSERT INTO `ttconst` VALUES (1,2,'Amy Jones'),(2,2,'Dave jones');
/*!40000 ALTER TABLE `ttconst` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-29  9:10:45
