-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: localhost    Database: produccion
-- ------------------------------------------------------
-- Server version	8.0.35-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cargos`
--

DROP TABLE IF EXISTS `cargos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cargos` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) DEFAULT NULL,
  `sueldo_base` double DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargos`
--

LOCK TABLES `cargos` WRITE;
/*!40000 ALTER TABLE `cargos` DISABLE KEYS */;
INSERT INTO `cargos` VALUES (1,'Vendedor',1500000),(2,'Administrador',3000000),(3,'Diseñador',2500000),(4,'Costurero',1000000),(5,'Almacenista',800000),(6,'Vendedor',1500000),(7,'Administrador',3000000),(8,'Diseñador',2500000),(9,'Costurero',1000000),(10,'Almacenista',800000);
/*!40000 ALTER TABLE `cargos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `IdCliente` varchar(255) DEFAULT NULL,
  `IdPersonaFk` int DEFAULT NULL,
  `fechaRegistro` date DEFAULT NULL,
  `IdMunicipioFk` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IdPersonaFk` (`IdPersonaFk`),
  KEY `IdMunicipioFk` (`IdMunicipioFk`),
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`IdPersonaFk`) REFERENCES `tipo_persona` (`Id`),
  CONSTRAINT `cliente_ibfk_2` FOREIGN KEY (`IdMunicipioFk`) REFERENCES `municipio` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Juan Pérez','123456789',1,'2023-07-20',1),(2,'María López','987654321',2,'2023-08-03',2),(3,'Sofía García','321654987',3,'2023-08-10',3),(4,'Pedro Gómez','789456123',1,'2023-08-17',4),(5,'Ana Sánchez','234567891',2,'2023-08-24',5),(6,'Carlos Hernández','654987321',3,'2023-08-31',6),(7,'Luisa Rodríguez','9876543210',1,'2023-09-07',7),(8,'Daniela Castillo','1098765432',2,'2023-09-14',8),(9,'Andrés Morales','3210987654',3,'2023-09-21',9),(10,'Camila Gutiérrez','7654321098',1,'2023-09-28',10);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `color`
--

DROP TABLE IF EXISTS `color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `color` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color`
--

LOCK TABLES `color` WRITE;
/*!40000 ALTER TABLE `color` DISABLE KEYS */;
/*!40000 ALTER TABLE `color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamento` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `IdPaisFk` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IdPaisFk` (`IdPaisFk`),
  CONSTRAINT `departamento_ibfk_1` FOREIGN KEY (`IdPaisFk`) REFERENCES `pais` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,'Antioquia',1),(2,'Bogotá',1),(3,'Cundinamarca',1),(4,'Valle del Cauca',1),(5,'Buenos Aires',2),(6,'Ciudad de México',3),(7,'Miami',4),(8,'Londres',5),(9,'París',6),(10,'Tokio',7);
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_orden`
--

DROP TABLE IF EXISTS `detalle_orden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_orden` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `IdOrdenFk` int DEFAULT NULL,
  `IdPrendaFk` int DEFAULT NULL,
  `PrendaId` int DEFAULT NULL,
  `cantidad_producir` int DEFAULT NULL,
  `IdColorFk` int DEFAULT NULL,
  `cantidad_producida` int DEFAULT NULL,
  `IdEstadoFk` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IdOrdenFk` (`IdOrdenFk`),
  KEY `PrendaId` (`PrendaId`),
  KEY `IdColorFk` (`IdColorFk`),
  KEY `IdEstadoFk` (`IdEstadoFk`),
  CONSTRAINT `detalle_orden_ibfk_1` FOREIGN KEY (`IdOrdenFk`) REFERENCES `orden` (`Id`),
  CONSTRAINT `detalle_orden_ibfk_2` FOREIGN KEY (`PrendaId`) REFERENCES `prenda` (`Id`),
  CONSTRAINT `detalle_orden_ibfk_3` FOREIGN KEY (`IdColorFk`) REFERENCES `color` (`Id`),
  CONSTRAINT `detalle_orden_ibfk_4` FOREIGN KEY (`IdEstadoFk`) REFERENCES `estado` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_orden`
--

LOCK TABLES `detalle_orden` WRITE;
/*!40000 ALTER TABLE `detalle_orden` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_orden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_venta`
--

DROP TABLE IF EXISTS `detalle_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_venta` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `IdVentaFk` int DEFAULT NULL,
  `IdProductoFk` int DEFAULT NULL,
  `IdTallaFk` int DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `valor_unit` double DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IdVentaFk` (`IdVentaFk`),
  KEY `IdProductoFk` (`IdProductoFk`),
  KEY `IdTallaFk` (`IdTallaFk`),
  CONSTRAINT `detalle_venta_ibfk_1` FOREIGN KEY (`IdVentaFk`) REFERENCES `venta` (`Id`),
  CONSTRAINT `detalle_venta_ibfk_2` FOREIGN KEY (`IdProductoFk`) REFERENCES `inventario` (`Id`),
  CONSTRAINT `detalle_venta_ibfk_3` FOREIGN KEY (`IdTallaFk`) REFERENCES `inventario_talla` (`IdInvFk`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_venta`
--

LOCK TABLES `detalle_venta` WRITE;
/*!40000 ALTER TABLE `detalle_venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `IdCargoFk` int DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `IdMunicipioFk` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IdMunicipioFk` (`IdMunicipioFk`),
  KEY `IdCargoFk` (`IdCargoFk`),
  CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`IdMunicipioFk`) REFERENCES `municipio` (`Id`),
  CONSTRAINT `empleado_ibfk_2` FOREIGN KEY (`IdCargoFk`) REFERENCES `cargos` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'Juan Pérez',1,'2023-07-20',1),(2,'María López',2,'2023-08-03',2),(3,'Sofía García',3,'2023-08-10',3),(4,'Pedro Gómez',1,'2023-08-17',4),(5,'Ana Sánchez',2,'2023-08-24',5),(6,'Carlos Hernández',3,'2023-08-31',6),(7,'Luisa Rodríguez',1,'2023-09-07',7),(8,'Daniela Castillo',2,'2023-09-14',8),(9,'Andrés Morales',3,'2023-09-21',9),(10,'Camila Gutiérrez',1,'2023-09-28',10);
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresa` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `nit` varchar(50) DEFAULT NULL,
  `razon_social` text,
  `representante_legal` varchar(50) DEFAULT NULL,
  `FechaCreacion` date DEFAULT NULL,
  `IdMunicipioFk` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IdMunicipioFk` (`IdMunicipioFk`),
  CONSTRAINT `empresa_ibfk_1` FOREIGN KEY (`IdMunicipioFk`) REFERENCES `municipio` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` VALUES (1,'900000000-1','Empresa de Ropa S.A.S.','Juan Pérez','2023-01-01',1),(2,'900000000-2','Empresa de Calzado S.A.S.','María Rodríguez','2023-02-02',2),(3,'900000000-3','Empresa de Accesorios S.A.S.','Pedro Gómez','2023-03-03',3),(4,'900000000-4','Empresa de Textiles S.A.S.','Ana García','2023-04-04',4),(5,'900000000-5','Empresa de Confección S.A.S.','Carlos Hernández','2023-05-05',5);
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) DEFAULT NULL,
  `IdTipoEstadoFk` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IdTipoEstadoFk` (`IdTipoEstadoFk`),
  CONSTRAINT `estado_ibfk_1` FOREIGN KEY (`IdTipoEstadoFk`) REFERENCES `tipo_estado` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (1,'Pendiente',1),(2,'En proceso',2),(3,'Listo para enviar',3),(4,'Enviado',4),(5,'Entregado',5);
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forma_pago`
--

DROP TABLE IF EXISTS `forma_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forma_pago` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forma_pago`
--

LOCK TABLES `forma_pago` WRITE;
/*!40000 ALTER TABLE `forma_pago` DISABLE KEYS */;
INSERT INTO `forma_pago` VALUES (1,'Efectivo'),(2,'Tarjeta de crédito'),(3,'Tarjeta de débito'),(4,'Transferencia bancaria'),(5,'Paypal');
/*!40000 ALTER TABLE `forma_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genero` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
INSERT INTO `genero` VALUES (1,'Masculino'),(2,'Femenino'),(3,'Unisex');
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insumo`
--

DROP TABLE IF EXISTS `insumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insumo` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `valor_unit` double DEFAULT NULL,
  `stock_min` double DEFAULT NULL,
  `stock_max` double DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insumo`
--

LOCK TABLES `insumo` WRITE;
/*!40000 ALTER TABLE `insumo` DISABLE KEYS */;
INSERT INTO `insumo` VALUES (1,'Tela de algodón',10000,100,1000),(2,'Tela de poliéster',20000,50,500),(3,'Hilo',5000,20,200),(4,'Botones',2000,10,100),(5,'Cierres',3000,5,50);
/*!40000 ALTER TABLE `insumo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insumo_prendas`
--

DROP TABLE IF EXISTS `insumo_prendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insumo_prendas` (
  `IdInsumoFk` int DEFAULT NULL,
  `IdPrendaFk` int DEFAULT NULL,
  `Cantidad` int DEFAULT NULL,
  KEY `IdInsumoFk` (`IdInsumoFk`),
  KEY `IdPrendaFk` (`IdPrendaFk`),
  CONSTRAINT `insumo_prendas_ibfk_1` FOREIGN KEY (`IdInsumoFk`) REFERENCES `insumo` (`Id`),
  CONSTRAINT `insumo_prendas_ibfk_2` FOREIGN KEY (`IdPrendaFk`) REFERENCES `prenda` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insumo_prendas`
--

LOCK TABLES `insumo_prendas` WRITE;
/*!40000 ALTER TABLE `insumo_prendas` DISABLE KEYS */;
INSERT INTO `insumo_prendas` VALUES (1,1,2),(2,2,1),(3,3,3),(4,4,2),(5,5,1);
/*!40000 ALTER TABLE `insumo_prendas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insumo_proveedor`
--

DROP TABLE IF EXISTS `insumo_proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insumo_proveedor` (
  `IdInsumoFk` int DEFAULT NULL,
  `IdProveedorFk` int DEFAULT NULL,
  KEY `IdInsumoFk` (`IdInsumoFk`),
  KEY `IdProveedorFk` (`IdProveedorFk`),
  CONSTRAINT `insumo_proveedor_ibfk_1` FOREIGN KEY (`IdInsumoFk`) REFERENCES `insumo` (`Id`),
  CONSTRAINT `insumo_proveedor_ibfk_2` FOREIGN KEY (`IdProveedorFk`) REFERENCES `proveedor` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insumo_proveedor`
--

LOCK TABLES `insumo_proveedor` WRITE;
/*!40000 ALTER TABLE `insumo_proveedor` DISABLE KEYS */;
INSERT INTO `insumo_proveedor` VALUES (1,5),(2,1),(3,2),(4,3),(5,4);
/*!40000 ALTER TABLE `insumo_proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CodInv` varchar(255) DEFAULT NULL,
  `IdPrendaFk` int DEFAULT NULL,
  `ValorVtaCop` double DEFAULT NULL,
  `ValorVtaUsd` double DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IdPrendaFk` (`IdPrendaFk`),
  CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`IdPrendaFk`) REFERENCES `prenda` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
INSERT INTO `inventario` VALUES (1,'INV001',1,25000,6.25),(2,'INV002',2,37500,9.375),(3,'INV003',3,50000,12.5),(4,'INV004',4,62500,15.625),(5,'INV005',5,75000,18.75),(6,'INV006',6,12500,3.125),(7,'INV007',7,187500,46.875),(8,'INV008',8,62500,15.625),(9,'INV009',9,12500,3.125),(10,'INV010',10,5000,1.25);
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario_talla`
--

DROP TABLE IF EXISTS `inventario_talla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario_talla` (
  `IdInvFk` int DEFAULT NULL,
  `IdTallaFk` int DEFAULT NULL,
  KEY `IdInvFk` (`IdInvFk`),
  CONSTRAINT `inventario_talla_ibfk_1` FOREIGN KEY (`IdInvFk`) REFERENCES `talla` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario_talla`
--

LOCK TABLES `inventario_talla` WRITE;
/*!40000 ALTER TABLE `inventario_talla` DISABLE KEYS */;
INSERT INTO `inventario_talla` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `inventario_talla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `municipio`
--

DROP TABLE IF EXISTS `municipio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `municipio` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `IdDepartamentoFk` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IdDepartamentoFk` (`IdDepartamentoFk`),
  CONSTRAINT `municipio_ibfk_1` FOREIGN KEY (`IdDepartamentoFk`) REFERENCES `departamento` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `municipio`
--

LOCK TABLES `municipio` WRITE;
/*!40000 ALTER TABLE `municipio` DISABLE KEYS */;
INSERT INTO `municipio` VALUES (1,'Medellín',1),(2,'Bogotá, D.C.',2),(3,'Zipaquirá',2),(4,'Cali',4),(5,'Buenos Aires',5),(6,'Ciudad de México',6),(7,'Miami',7),(8,'Londres',8),(9,'París',9),(10,'Tokio',10);
/*!40000 ALTER TABLE `municipio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden`
--

DROP TABLE IF EXISTS `orden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `IdEmpleadoFk` int DEFAULT NULL,
  `IdClienteFk` int DEFAULT NULL,
  `IdEstadoFk` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IdEmpleadoFk` (`IdEmpleadoFk`),
  KEY `IdClienteFk` (`IdClienteFk`),
  KEY `IdEstadoFk` (`IdEstadoFk`),
  CONSTRAINT `orden_ibfk_1` FOREIGN KEY (`IdEmpleadoFk`) REFERENCES `empleado` (`Id`),
  CONSTRAINT `orden_ibfk_2` FOREIGN KEY (`IdClienteFk`) REFERENCES `cliente` (`Id`),
  CONSTRAINT `orden_ibfk_3` FOREIGN KEY (`IdEstadoFk`) REFERENCES `estado` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden`
--

LOCK TABLES `orden` WRITE;
/*!40000 ALTER TABLE `orden` DISABLE KEYS */;
INSERT INTO `orden` VALUES (1,'2023-07-20',1,1,1),(2,'2023-08-03',2,2,2),(3,'2023-08-10',3,3,3),(4,'2023-08-17',1,4,4),(5,'2023-08-24',2,5,5);
/*!40000 ALTER TABLE `orden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pais` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
INSERT INTO `pais` VALUES (1,'Colombia'),(2,'México'),(3,'Estados Unidos'),(4,'España'),(5,'China'),(6,'Brasil'),(7,'Argentina'),(8,'India'),(9,'Francia'),(10,'Inglaterra');
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prenda`
--

DROP TABLE IF EXISTS `prenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prenda` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) DEFAULT NULL,
  `ValorUnitCop` double DEFAULT NULL,
  `ValorUnitUsd` double DEFAULT NULL,
  `IdEstadoFk` int DEFAULT NULL,
  `IdTipoProteccion` int DEFAULT NULL,
  `IdGeneroFk` int DEFAULT NULL,
  `Codigo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IdEstadoFk` (`IdEstadoFk`),
  KEY `IdTipoProteccion` (`IdTipoProteccion`),
  KEY `IdGeneroFk` (`IdGeneroFk`),
  CONSTRAINT `prenda_ibfk_1` FOREIGN KEY (`IdEstadoFk`) REFERENCES `estado` (`Id`),
  CONSTRAINT `prenda_ibfk_2` FOREIGN KEY (`IdTipoProteccion`) REFERENCES `tipo_proteccion` (`Id`),
  CONSTRAINT `prenda_ibfk_3` FOREIGN KEY (`IdGeneroFk`) REFERENCES `genero` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prenda`
--

LOCK TABLES `prenda` WRITE;
/*!40000 ALTER TABLE `prenda` DISABLE KEYS */;
INSERT INTO `prenda` VALUES (1,'Camiseta de algodón manga corta',20000,5,1,1,1,'PR001'),(2,'Camisa de manga larga',30000,7.5,1,1,1,'PR002'),(3,'Pantalón de mezclilla',40000,10,1,1,1,'PR003'),(4,'Vestido de algodón',50000,12.5,1,2,1,'PR004'),(5,'Zapatos casuales',60000,15,1,1,1,'PR005'),(6,'Gafas de sol',10000,2.5,1,1,1,'PR006'),(7,'Chaqueta de cuero',150000,37.5,1,1,1,'PR007'),(8,'Traje de baño',50000,12.5,1,1,1,'PR008'),(9,'Gorra',10000,2.5,1,1,1,'PR009'),(10,'Medias',5000,1.25,1,1,1,'PR010');
/*!40000 ALTER TABLE `prenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `NitProveedor` varchar(50) DEFAULT NULL,
  `IdTipoPersona` int DEFAULT NULL,
  `IdMunicipioFk` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IdMunicipioFk` (`IdMunicipioFk`),
  KEY `IdTipoPersona` (`IdTipoPersona`),
  CONSTRAINT `proveedor_ibfk_1` FOREIGN KEY (`IdMunicipioFk`) REFERENCES `municipio` (`Id`),
  CONSTRAINT `proveedor_ibfk_2` FOREIGN KEY (`IdTipoPersona`) REFERENCES `tipo_persona` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'900000000-1',1,1),(2,'900000000-2',2,2),(3,'900000000-3',3,3),(4,'900000000-4',1,4),(5,'900000000-5',2,5);
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `talla`
--

DROP TABLE IF EXISTS `talla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `talla` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `talla`
--

LOCK TABLES `talla` WRITE;
/*!40000 ALTER TABLE `talla` DISABLE KEYS */;
INSERT INTO `talla` VALUES (1,'XS - Extra pequeña'),(2,'S - Pequeña'),(3,'M - Mediana'),(4,'L - Grande'),(5,'XL - Extra grande'),(6,'XXL - Extra extra grande');
/*!40000 ALTER TABLE `talla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_estado`
--

DROP TABLE IF EXISTS `tipo_estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_estado` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_estado`
--

LOCK TABLES `tipo_estado` WRITE;
/*!40000 ALTER TABLE `tipo_estado` DISABLE KEYS */;
INSERT INTO `tipo_estado` VALUES (1,'Nuevo'),(2,'En proceso'),(3,'Listo para enviar'),(4,'Enviado'),(5,'Entregado');
/*!40000 ALTER TABLE `tipo_estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_persona`
--

DROP TABLE IF EXISTS `tipo_persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_persona` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_persona`
--

LOCK TABLES `tipo_persona` WRITE;
/*!40000 ALTER TABLE `tipo_persona` DISABLE KEYS */;
INSERT INTO `tipo_persona` VALUES (1,'Cliente'),(2,'Proveedor'),(3,'Empleado');
/*!40000 ALTER TABLE `tipo_persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_proteccion`
--

DROP TABLE IF EXISTS `tipo_proteccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_proteccion` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_proteccion`
--

LOCK TABLES `tipo_proteccion` WRITE;
/*!40000 ALTER TABLE `tipo_proteccion` DISABLE KEYS */;
INSERT INTO `tipo_proteccion` VALUES (1,'Protección contra el sol'),(2,'Protección contra el agua'),(3,'Protección contra el frío'),(4,'Protección contra el viento'),(5,'Protección contra los insectos');
/*!40000 ALTER TABLE `tipo_proteccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Fecha` date DEFAULT NULL,
  `IdEmpleadoFk` int DEFAULT NULL,
  `IdClienteFk` int DEFAULT NULL,
  `IdFormaPagoFk` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IdEmpleadoFk` (`IdEmpleadoFk`),
  KEY `IdClienteFk` (`IdClienteFk`),
  KEY `IdFormaPagoFk` (`IdFormaPagoFk`),
  CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`IdEmpleadoFk`) REFERENCES `empleado` (`Id`),
  CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`IdClienteFk`) REFERENCES `cliente` (`Id`),
  CONSTRAINT `venta_ibfk_3` FOREIGN KEY (`IdFormaPagoFk`) REFERENCES `forma_pago` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (1,'2023-07-20',1,1,1),(2,'2023-08-03',2,2,2),(3,'2023-08-10',3,3,3),(4,'2023-08-17',1,4,1),(5,'2023-08-24',2,5,2),(6,'2023-08-31',3,6,3),(7,'2023-09-07',1,7,1),(8,'2023-09-14',2,8,2),(9,'2023-09-21',3,9,3),(10,'2023-09-28',1,10,1);
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-01 17:15:03
