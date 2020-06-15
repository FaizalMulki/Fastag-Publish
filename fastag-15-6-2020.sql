CREATE DATABASE  IF NOT EXISTS `fastag` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `fastag`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: fastag
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `document`
--

DROP TABLE IF EXISTS `document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `DocumentName` varchar(1250) DEFAULT NULL,
  `DocumentType` varchar(1250) DEFAULT NULL,
  `Extension` varchar(1250) DEFAULT NULL,
  `DocumentPath` varchar(5545) DEFAULT NULL,
  `Documents` mediumblob,
  `ReferenceId` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `ForeignReference_idx` (`ReferenceId`),
  CONSTRAINT `registration_document_id` FOREIGN KEY (`ReferenceId`) REFERENCES `registration` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document`
--

LOCK TABLES `document` WRITE;
/*!40000 ALTER TABLE `document` DISABLE KEYS */;
/*!40000 ALTER TABLE `document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration`
--

DROP TABLE IF EXISTS `registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registration` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `Email` varchar(145) DEFAULT NULL,
  `Phone` varchar(45) DEFAULT NULL,
  `Mobile` varchar(45) DEFAULT NULL,
  `DeliveryAddress` varchar(1500) DEFAULT NULL,
  `VehicleTypeId` int DEFAULT NULL,
  `VehicleRegNo` varchar(150) DEFAULT NULL,
  `SecurityDeposit` decimal(10,0) DEFAULT NULL,
  `FastagFee` decimal(10,0) DEFAULT NULL,
  `MinimumBalanceDeposit` decimal(10,0) DEFAULT NULL,
  `Others` decimal(10,0) DEFAULT NULL,
  `TotalPayable` decimal(10,0) DEFAULT NULL,
  `IsDeleted` bit(1) DEFAULT NULL,
  `CreatedBy` varchar(500) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `ModifiedBy` varchar(500) DEFAULT NULL,
  `ModifiedDate` datetime DEFAULT NULL,
  `ReferenceNumber` varchar(300) DEFAULT NULL,
  `PaymentType` varchar(45) DEFAULT NULL,
  `FromAccountNumber` varchar(45) DEFAULT NULL,
  `ToAccountNumber` varchar(45) DEFAULT NULL,
  `BranchCode` varchar(45) DEFAULT NULL,
  `FatherName` varchar(500) DEFAULT NULL,
  `DOB` datetime DEFAULT NULL,
  `FinacleTransNumber` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `vehicle_registartion_id_idx` (`VehicleTypeId`),
  CONSTRAINT `vehicle_registartion_id` FOREIGN KEY (`VehicleTypeId`) REFERENCES `vehicletype` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration`
--

LOCK TABLES `registration` WRITE;
/*!40000 ALTER TABLE `registration` DISABLE KEYS */;
INSERT  IGNORE INTO `registration` (`Id`, `FirstName`, `LastName`, `Email`, `Phone`, `Mobile`, `DeliveryAddress`, `VehicleTypeId`, `VehicleRegNo`, `SecurityDeposit`, `FastagFee`, `MinimumBalanceDeposit`, `Others`, `TotalPayable`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`, `ReferenceNumber`, `PaymentType`, `FromAccountNumber`, `ToAccountNumber`, `BranchCode`, `FatherName`, `DOB`, `FinacleTransNumber`) VALUES (44,'dsfdsf','dsff',NULL,NULL,'dsfdsf','xczxcz',7,'sdsfsd',5,5,5,5,20,_binary '\0','admin','2020-06-13 15:57:09',NULL,NULL,'0001130620201','Transfer','zczxc','dsfsd',NULL,NULL,NULL,'123');
/*!40000 ALTER TABLE `registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting`
--

DROP TABLE IF EXISTS `setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `setting` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `VehicleTypeId` int DEFAULT NULL,
  `RefundableSecurityDeposit` decimal(10,0) DEFAULT NULL,
  `FastagFee` decimal(10,0) DEFAULT NULL,
  `MinimumBalanceWalletDeposit` decimal(10,0) DEFAULT NULL,
  `Others` decimal(10,0) DEFAULT NULL,
  `IsDeleted` tinyint DEFAULT '0',
  `CreatedBy` varchar(500) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ModifiedDate` datetime DEFAULT NULL,
  `ModifiedBy` varchar(500) DEFAULT NULL,
  `EffectiveFrom` datetime DEFAULT NULL,
  `EffectiveTo` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `VehicleTypeReference_idx` (`VehicleTypeId`),
  CONSTRAINT `VehicleTypeReference` FOREIGN KEY (`VehicleTypeId`) REFERENCES `vehicletype` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting`
--

LOCK TABLES `setting` WRITE;
/*!40000 ALTER TABLE `setting` DISABLE KEYS */;
INSERT  IGNORE INTO `setting` (`Id`, `VehicleTypeId`, `RefundableSecurityDeposit`, `FastagFee`, `MinimumBalanceWalletDeposit`, `Others`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedDate`, `ModifiedBy`, `EffectiveFrom`, `EffectiveTo`) VALUES (9,7,4,4,4,4,0,'admin','2020-06-13 13:57:39',NULL,NULL,'2020-06-04 00:00:00','2020-06-18 00:00:00'),(10,7,5,5,5,5,0,'admin','2020-06-13 14:09:02',NULL,NULL,'2020-06-19 00:00:00','2020-06-20 00:00:00'),(11,9,4,3,1,7,0,'admin','2020-06-13 14:14:59',NULL,NULL,'2020-06-04 00:00:00','2020-06-16 00:00:00');
/*!40000 ALTER TABLE `setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicletype`
--

DROP TABLE IF EXISTS `vehicletype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicletype` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Type` varchar(150) DEFAULT NULL,
  `Code` varchar(150) DEFAULT NULL,
  `IsDeleted` tinyint DEFAULT NULL,
  `CreatedBy` varchar(250) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `ModifiedBy` varchar(250) DEFAULT NULL,
  `ModifiedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicletype`
--

LOCK TABLES `vehicletype` WRITE;
/*!40000 ALTER TABLE `vehicletype` DISABLE KEYS */;
INSERT  IGNORE INTO `vehicletype` (`Id`, `Type`, `Code`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`) VALUES (7,'Car',NULL,0,'admin','2020-06-04 14:36:37',NULL,'0001-01-01 00:00:00'),(8,'Jeep',NULL,1,'admin','2020-06-04 15:38:56',NULL,'0001-01-01 00:00:00'),(9,'jeep',NULL,0,'admin','2020-06-13 13:32:03',NULL,'0001-01-01 00:00:00');
/*!40000 ALTER TABLE `vehicletype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'fastag'
--
/*!50003 DROP PROCEDURE IF EXISTS `CheckDataWithinDateRange` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CheckDataWithinDateRange`(
IN VehicleTypeId INT,
IN EffectiveFrom varchar(200),
IN EffectiveTo varchar(200))
BEGIN
Select * from setting s where s.IsDeleted = 0 and s.VehicleTypeId= VehicleTypeId and (s.EffectiveFrom >= EffectiveFrom or s.EffectiveTo <= EffectiveTo);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllRegisterdItems` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllRegisterdItems`(
IN Search varchar(1000),
IN p_iPageIndex INT,    
IN p_iPageSize INT,    
OUT p_iTotalCount  INT  
)
BEGIN
SELECT * FROM(    
SELECT ROW_NUMBER() OVER (ORDER BY ID DESC)  AS RowNumber ,r.*,v.Type as VehicleType from fastag.registration r
inner join fastag.vehicletype v on v.Id=r.VehicleTypeId
where r.isdeleted=0 
and ( r.FirstName LIKE CONCAT ('%', Search, '%') 
		OR r.LastName LIKE CONCAT ('%', Search, '%') OR r.Email LIKE CONCAT ('%', Search, '%') OR r.Mobile LIKE CONCAT ('%', Search, '%') OR r.ReferenceNumber LIKE CONCAT ('%', Search, '%') OR v.Type LIKE CONCAT ('%', Search, '%') OR r.CreatedBy LIKE CONCAT ('%', Search, '%')
        or Search is null)


 )     
 A     
 WHERE RowNumber BETWEEN ((p_iPageIndex*p_iPageSize)-p_iPageSize+1) AND (p_iPageIndex*p_iPageSize); 
 
 SET p_iTotalCount = (SELECT COUNT(*)  from  fastag.registration r
inner join fastag.vehicletype v on v.Id=r.VehicleTypeId
where r.isdeleted=0
 and ( r.FirstName LIKE CONCAT ('%', Search, '%') 
		OR r.LastName LIKE CONCAT ('%', Search, '%') OR r.Email LIKE CONCAT ('%', Search, '%') OR r.Mobile LIKE CONCAT ('%', Search, '%') OR r.ReferenceNumber LIKE CONCAT ('%', Search, '%') OR v.Type LIKE CONCAT ('%', Search, '%') OR r.CreatedBy LIKE CONCAT ('%', Search, '%')
        or Search is null)
        );
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllSettings` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllSettings`(
IN Search varchar(1000),
IN p_iPageIndex INT,    
IN p_iPageSize INT,    
OUT p_iTotalCount  INT  

)
BEGIN
SELECT * FROM(    
SELECT ROW_NUMBER() OVER (ORDER BY ID DESC)  AS RowNumber ,s.*,v.Type as VehicleType from fastag.setting s
inner join fastag.vehicletype v on s.VehicleTypeId=v.Id
where s.isdeleted=0 
and (s.RefundableSecurityDeposit LIKE CONCAT ('%', Search, '%')
		OR s.MinimumBalanceWalletDeposit LIKE CONCAT ('%', Search, '%') OR s.Others LIKE CONCAT ('%', Search, '%') OR s.CreatedBy LIKE CONCAT ('%', Search, '%') 
        or Search is null)


 )     
 A     
 WHERE RowNumber BETWEEN ((p_iPageIndex*p_iPageSize)-p_iPageSize+1) AND (p_iPageIndex*p_iPageSize); 
 
 SET p_iTotalCount = (SELECT COUNT(*)  from fastag.setting s where s.isdeleted=0
 and 
		(s.RefundableSecurityDeposit LIKE CONCAT ('%', Search, '%') 	OR s.FastagFee LIKE CONCAT ('%', Search, '%') OR s.MinimumBalanceWalletDeposit LIKE CONCAT ('%', Search, '%') OR s.Others LIKE CONCAT ('%', Search, '%') OR s.CreatedBy LIKE CONCAT ('%', Search, '%') 
        or Search is null)
        );
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllVehicles` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllVehicles`(
IN Search varchar(1000),
IN p_iPageIndex INT,    
IN p_iPageSize INT,    
OUT p_iTotalCount  INT  )
BEGIN
SELECT * FROM(    
SELECT ROW_NUMBER() OVER (ORDER BY ID DESC)  AS RowNumber ,vt.* from fastag.vehicletype vt
where vt.isdeleted=0 
and ( vt.Type LIKE CONCAT ('%', Search, '%') 
		OR vt.CreatedBy LIKE CONCAT ('%', Search, '%') 
        or Search is null)


 )     
 A     
 WHERE RowNumber BETWEEN ((p_iPageIndex*p_iPageSize)-p_iPageSize+1) AND (p_iPageIndex*p_iPageSize); 
 
 SET p_iTotalCount = (SELECT COUNT(*)  from fastag.vehicletype vt where vt.isdeleted=0
and ( vt.Type LIKE CONCAT ('%', Search, '%') 
		OR vt.CreatedBy LIKE CONCAT ('%', Search, '%') 
        or Search is null)
        );
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetDashBoardCount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDashBoardCount`(
/*IN IsSuperAdmin varchar(150),
IN CreatedBy varchar(250)*/
)
BEGIN
/*IF IsSuperAdmin = 'True' THEN*/
select count(r.Id) As TotalReg,SUM(r.TotalPayable) as TotalAmount from fastag.registration r where r.isdeleted=0;
/*else
select count(statusid) As Total,s.name from notification.messagedetail md  inner join notification.message m on m.Id=md.messageid inner join  notification.status s on s.id = md.statusid where m.isdeleted=0 and  md.isdeleted=0 and m.createdby=CreatedBy or md.createdby=CreatedBy group by statusid;
END If;*/
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetRegisteredItemById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetRegisteredItemById`(
IN Id INT
)
BEGIN
SELECT r.*,v.Type as VehicleType from fastag.registration r
inner join fastag.vehicletype v on v.Id=r.VehicleTypeId
where  r.Id=Id and r.isdeleted=0 ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-15 11:05:14
