-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommercedb
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS categories;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE categories (
  CategoryID int NOT NULL AUTO_INCREMENT,
  CategoryName varchar(50) NOT NULL,
  PRIMARY KEY (CategoryID)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES categories WRITE;
/*!40000 ALTER TABLE categories DISABLE KEYS */;
INSERT INTO categories VALUES (1,'Electronics'),(2,'Clothing'),(3,'Books'),(4,'Home Appliances'),(5,'Sports');
/*!40000 ALTER TABLE categories ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `customerdetail`
--

DROP TABLE IF EXISTS customerdetail;
/*!50001 DROP VIEW IF EXISTS customerdetail*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `customerdetail` AS SELECT 
 1 AS customerID,
 1 AS customerName,
 1 AS TotalOrder,
 1 AS totalSpent*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `customerdetails`
--

DROP TABLE IF EXISTS customerdetails;
/*!50001 DROP VIEW IF EXISTS customerdetails*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `customerdetails` AS SELECT 
 1 AS customerID,
 1 AS customerName,
 1 AS TotalOrder,
 1 AS totalSpent*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS customers;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE customers (
  CustomerID int NOT NULL AUTO_INCREMENT,
  FirstName varchar(50) DEFAULT NULL,
  LastName varchar(50) DEFAULT NULL,
  Email varchar(100) DEFAULT NULL,
  Country varchar(50) DEFAULT NULL,
  PRIMARY KEY (CustomerID)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES customers WRITE;
/*!40000 ALTER TABLE customers DISABLE KEYS */;
INSERT INTO customers VALUES (1,'Alice','Johnson','alice.johnson@email.com','USA'),(2,'Bob','Smith','bob.smith@email.com','Canada'),(3,'Charlie','Williams','charlie.w@email.com','UK'),(4,'Diana','Brown','diana.brown@email.com','Germany'),(5,'Ethan','Jones','ethan.jones@email.com','Australia'),(6,'Fiona','Miller','fiona.miller@email.com','USA'),(7,'George','Davis','george.davis@email.com','India'),(8,'Hannah','Wilson','hannah.w@email.com','UK'),(9,'Ian','Taylor','ian.taylor@email.com','USA'),(10,'Julia','Anderson','julia.anderson@email.com','Canada'),(11,'Kevin','Thomas','kevin.thomas@email.com','Germany'),(12,'Laura','Jackson','laura.jackson@email.com','Australia'),(13,'Mike','White','mike.white@email.com','USA'),(14,'Nina','Harris','nina.harris@email.com','UK'),(15,'Oscar','Martin','oscar.martin@email.com','USA'),(16,'Paula','Thompson','paula.thompson@email.com','Canada'),(17,'Quinn','Garcia','quinn.garcia@email.com','Germany'),(18,'Ryan','Martinez','ryan.martinez@email.com','Australia'),(19,'Sophia','Lopez','sophia.lopez@email.com','USA'),(20,'Tom','Gonzalez','tom.gonzalez@email.com','UK');
/*!40000 ALTER TABLE customers ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetails`
--

DROP TABLE IF EXISTS orderdetails;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE orderdetails (
  OrderDetailID int NOT NULL AUTO_INCREMENT,
  OrderID int DEFAULT NULL,
  ProductID int DEFAULT NULL,
  Quantity int DEFAULT NULL,
  PRIMARY KEY (OrderDetailID),
  KEY OrderID (OrderID),
  KEY ProductID (ProductID),
  CONSTRAINT orderdetails_ibfk_1 FOREIGN KEY (OrderID) REFERENCES orders (OrderID),
  CONSTRAINT orderdetails_ibfk_2 FOREIGN KEY (ProductID) REFERENCES products (ProductID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetails`
--

LOCK TABLES orderdetails WRITE;
/*!40000 ALTER TABLE orderdetails DISABLE KEYS */;
/*!40000 ALTER TABLE orderdetails ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS orders;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE orders (
  OrderID int NOT NULL AUTO_INCREMENT,
  CustomerID int DEFAULT NULL,
  OrderDate date DEFAULT NULL,
  ShipperID int DEFAULT NULL,
  PRIMARY KEY (OrderID),
  KEY CustomerID (CustomerID),
  KEY ShipperID (ShipperID),
  KEY idx_orders_date (OrderDate DESC),
  CONSTRAINT orders_ibfk_1 FOREIGN KEY (CustomerID) REFERENCES customers (CustomerID),
  CONSTRAINT orders_ibfk_2 FOREIGN KEY (ShipperID) REFERENCES shippers (ShipperID)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES orders WRITE;
/*!40000 ALTER TABLE orders DISABLE KEYS */;
INSERT INTO orders VALUES (1,1,'2024-01-15',1),(2,2,'2024-02-10',2),(3,3,'2024-03-05',3),(4,4,'2024-04-01',1),(5,5,'2024-05-20',2),(6,6,'2024-06-25',3),(7,7,'2024-07-18',1),(8,8,'2024-08-12',2),(9,9,'2024-09-10',3),(10,10,'2024-10-15',1),(11,11,'2024-11-05',2),(12,12,'2024-12-22',3),(13,1,'2024-01-15',1),(14,2,'2024-02-10',2),(15,3,'2024-03-05',3),(16,4,'2024-04-01',1),(17,5,'2024-05-20',2),(18,6,'2024-06-25',3),(19,7,'2024-07-18',1),(20,8,'2024-08-12',2),(21,9,'2024-09-10',3),(22,10,'2024-10-15',1),(23,11,'2024-11-05',2),(24,12,'2024-12-22',3);
/*!40000 ALTER TABLE orders ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS products;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE products (
  ProductID int NOT NULL AUTO_INCREMENT,
  ProductName varchar(100) DEFAULT NULL,
  SupplierID int DEFAULT NULL,
  CategoryID int DEFAULT NULL,
  UnitPrice decimal(10,2) DEFAULT NULL,
  Stock int DEFAULT NULL,
  PRIMARY KEY (ProductID),
  KEY SupplierID (SupplierID),
  KEY CategoryID (CategoryID),
  CONSTRAINT products_ibfk_1 FOREIGN KEY (SupplierID) REFERENCES suppliers (SupplierID),
  CONSTRAINT products_ibfk_2 FOREIGN KEY (CategoryID) REFERENCES categories (CategoryID)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES products WRITE;
/*!40000 ALTER TABLE products DISABLE KEYS */;
INSERT INTO products VALUES (1,'Laptop',1,1,800.00,50),(2,'Smartphone',1,1,600.00,120),(3,'T-Shirt',2,2,20.00,200),(4,'Jeans',2,2,35.00,150),(5,'Fiction Novel',3,3,15.00,100),(6,'Cookbook',3,3,25.00,80),(7,'Microwave',4,4,150.00,60),(8,'Vacuum Cleaner',4,4,120.00,70),(9,'Football',5,5,30.00,90),(10,'Tennis Racket',5,5,45.00,75),(11,'Tablet',1,1,300.00,85),(12,'Headphones',1,1,50.00,180),(13,'Jacket',2,2,60.00,110),(14,'Biography Book',3,3,22.00,95),(15,'Blender',4,4,80.00,65),(16,'Basketball',5,5,28.00,100),(17,'Camera',1,1,450.00,40),(18,'Dress',2,2,55.00,70),(19,'Horror Novel',3,3,18.00,88),(20,'Air Fryer',4,4,130.00,55);
/*!40000 ALTER TABLE products ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shippers`
--

DROP TABLE IF EXISTS shippers;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE shippers (
  ShipperID int NOT NULL AUTO_INCREMENT,
  ShipperName varchar(100) DEFAULT NULL,
  Phone varchar(20) DEFAULT NULL,
  PRIMARY KEY (ShipperID)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shippers`
--

LOCK TABLES shippers WRITE;
/*!40000 ALTER TABLE shippers DISABLE KEYS */;
INSERT INTO shippers VALUES (1,'DHL','1234567890'),(2,'FedEx','0987654321'),(3,'BlueDart','1112223333');
/*!40000 ALTER TABLE shippers ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS suppliers;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE suppliers (
  SupplierID int NOT NULL AUTO_INCREMENT,
  SupplierName varchar(100) DEFAULT NULL,
  ContactName varchar(100) DEFAULT NULL,
  Country varchar(50) DEFAULT NULL,
  PRIMARY KEY (SupplierID)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES suppliers WRITE;
/*!40000 ALTER TABLE suppliers DISABLE KEYS */;
INSERT INTO suppliers VALUES (1,'TechWorld','John Smith','USA'),(2,'FashionHub','Emma Davis','UK'),(3,'BookPlanet','David Lee','Canada'),(4,'HomeCare','Sophia White','Germany'),(5,'Sportify','Liam Brown','Australia');
/*!40000 ALTER TABLE suppliers ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `customerdetail`
--

/*!50001 DROP VIEW IF EXISTS customerdetail*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=root@localhost SQL SECURITY DEFINER */
/*!50001 VIEW customerdetail AS select c.CustomerID AS customerID,concat(c.FirstName,'',c.LastName) AS customerName,count(o.OrderID) AS TotalOrder,sum((od.Quantity * p.UnitPrice)) AS totalSpent from (((customers c left join orders o on((c.CustomerID = o.CustomerID))) left join orderdetails od on((o.OrderID = od.OrderID))) left join products p on((p.ProductID = od.ProductID))) group by c.CustomerID */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `customerdetails`
--

/*!50001 DROP VIEW IF EXISTS customerdetails*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=root@localhost SQL SECURITY DEFINER */
/*!50001 VIEW customerdetails AS select c.CustomerID AS customerID,concat(c.FirstName,'',c.LastName) AS customerName,count(o.OrderID) AS TotalOrder,sum((od.Quantity * p.UnitPrice)) AS totalSpent from (((customers c left join orders o on((c.CustomerID = o.CustomerID))) left join orderdetails od on((o.OrderID = od.OrderID))) left join products p on((p.ProductID = od.ProductID))) group by c.CustomerID */;
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

-- Dump completed on 2025-08-10  3:38:29
