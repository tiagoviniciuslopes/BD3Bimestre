-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: trabbd3
-- ------------------------------------------------------
-- Server version	5.7.14

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
-- Table structure for table `bairro`
--

DROP TABLE IF EXISTS `bairro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bairro` (
  `idBairro` int(11) NOT NULL AUTO_INCREMENT,
  `nomeBairro` varchar(45) NOT NULL,
  PRIMARY KEY (`idBairro`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bairro`
--

LOCK TABLES `bairro` WRITE;
/*!40000 ALTER TABLE `bairro` DISABLE KEYS */;
INSERT INTO `bairro` VALUES (1,'Belvedere'),(2,'Brooklyn');
/*!40000 ALTER TABLE `bairro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciaaerea`
--

DROP TABLE IF EXISTS `ciaaerea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ciaaerea` (
  `idCiaAerea` int(11) NOT NULL AUTO_INCREMENT,
  `nomeCiaArea` varchar(45) NOT NULL,
  `cnpjCiaAerea` varchar(45) NOT NULL,
  PRIMARY KEY (`idCiaAerea`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciaaerea`
--

LOCK TABLES `ciaaerea` WRITE;
/*!40000 ALTER TABLE `ciaaerea` DISABLE KEYS */;
INSERT INTO `ciaaerea` VALUES (1,'GOL','07.575.651/0001-59');
/*!40000 ALTER TABLE `ciaaerea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cidade`
--

DROP TABLE IF EXISTS `cidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cidade` (
  `idCidade` int(11) NOT NULL AUTO_INCREMENT,
  `nomeCidade` varchar(45) NOT NULL,
  `estado_idEstado` int(11) NOT NULL,
  PRIMARY KEY (`idCidade`),
  KEY `fk_cidade_estado1_idx` (`estado_idEstado`),
  CONSTRAINT `fk_cidade_estado1` FOREIGN KEY (`estado_idEstado`) REFERENCES `estado` (`idEstado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cidade`
--

LOCK TABLES `cidade` WRITE;
/*!40000 ALTER TABLE `cidade` DISABLE KEYS */;
INSERT INTO `cidade` VALUES (1,'Foz do Iguacu',1),(2,'New York',2);
/*!40000 ALTER TABLE `cidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `nomeCliente` varchar(45) NOT NULL,
  `cpfCliente` varchar(14) NOT NULL,
  `rgCliente` varchar(20) NOT NULL,
  `enderecoEspecifico_idEnderecoEspecifico` int(11) NOT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE KEY `idcliente_UNIQUE` (`idCliente`),
  KEY `fk_cliente_enderecoEspecifico1_idx` (`enderecoEspecifico_idEnderecoEspecifico`),
  CONSTRAINT `fk_cliente_enderecoEspecifico1` FOREIGN KEY (`enderecoEspecifico_idEnderecoEspecifico`) REFERENCES `enderecoespecifico` (`idEnderecoEspecifico`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Tiago Pereira','097.228.799-01','9.766.425-0',1);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientehotel`
--

DROP TABLE IF EXISTS `clientehotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientehotel` (
  `cliente_idCliente` int(11) NOT NULL,
  `hotel_idHotel` int(11) NOT NULL,
  `dataInicioReserva` varchar(10) NOT NULL,
  `dataFinalReserva` varchar(10) NOT NULL,
  `precoHotel` float NOT NULL,
  PRIMARY KEY (`cliente_idCliente`,`hotel_idHotel`,`dataInicioReserva`,`dataFinalReserva`),
  KEY `fk_cliente_has_hotel_hotel1_idx` (`hotel_idHotel`),
  KEY `fk_cliente_has_hotel_cliente1_idx` (`cliente_idCliente`),
  CONSTRAINT `fk_cliente_has_hotel_cliente1` FOREIGN KEY (`cliente_idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cliente_has_hotel_hotel1` FOREIGN KEY (`hotel_idHotel`) REFERENCES `hotel` (`idHotel`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientehotel`
--

LOCK TABLES `clientehotel` WRITE;
/*!40000 ALTER TABLE `clientehotel` DISABLE KEYS */;
INSERT INTO `clientehotel` VALUES (1,1,'08/01/2019','15/01/2019',384.6);
/*!40000 ALTER TABLE `clientehotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientepassagem`
--

DROP TABLE IF EXISTS `clientepassagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientepassagem` (
  `cliente_idCliente` int(11) NOT NULL,
  `passagem_idPassagem` int(10) unsigned NOT NULL,
  `precoPassagem` float NOT NULL,
  PRIMARY KEY (`cliente_idCliente`,`passagem_idPassagem`),
  KEY `fk_cliente_has_passagem_passagem1_idx` (`passagem_idPassagem`),
  KEY `fk_cliente_has_passagem_cliente1_idx` (`cliente_idCliente`),
  CONSTRAINT `fk_cliente_has_passagem_cliente1` FOREIGN KEY (`cliente_idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cliente_has_passagem_passagem1` FOREIGN KEY (`passagem_idPassagem`) REFERENCES `passagem` (`idPassagem`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientepassagem`
--

LOCK TABLES `clientepassagem` WRITE;
/*!40000 ALTER TABLE `clientepassagem` DISABLE KEYS */;
INSERT INTO `clientepassagem` VALUES (1,1,579.99);
/*!40000 ALTER TABLE `clientepassagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientepasseio`
--

DROP TABLE IF EXISTS `clientepasseio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientepasseio` (
  `cliente_idCliente` int(11) NOT NULL,
  `passeio_idPasseio` int(11) NOT NULL,
  `dataPasseio` varchar(10) NOT NULL,
  `precoPasseio` float NOT NULL,
  PRIMARY KEY (`cliente_idCliente`,`passeio_idPasseio`,`dataPasseio`),
  KEY `fk_cliente_has_passeio_passeio1_idx` (`passeio_idPasseio`),
  KEY `fk_cliente_has_passeio_cliente1_idx` (`cliente_idCliente`),
  CONSTRAINT `fk_cliente_has_passeio_cliente1` FOREIGN KEY (`cliente_idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cliente_has_passeio_passeio1` FOREIGN KEY (`passeio_idPasseio`) REFERENCES `passeio` (`idPasseio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientepasseio`
--

LOCK TABLES `clientepasseio` WRITE;
/*!40000 ALTER TABLE `clientepasseio` DISABLE KEYS */;
INSERT INTO `clientepasseio` VALUES (1,1,'08/01/2019',80);
/*!40000 ALTER TABLE `clientepasseio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emailcliente`
--

DROP TABLE IF EXISTS `emailcliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emailcliente` (
  `idEmailCliente` int(11) NOT NULL AUTO_INCREMENT,
  `emailCliente` varchar(45) NOT NULL,
  `cliente_idCliente` int(11) NOT NULL,
  PRIMARY KEY (`idEmailCliente`),
  UNIQUE KEY `idEmailCliente_UNIQUE` (`idEmailCliente`),
  KEY `fk_emailCliente_cliente1_idx` (`cliente_idCliente`),
  CONSTRAINT `fk_emailCliente_cliente1` FOREIGN KEY (`cliente_idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emailcliente`
--

LOCK TABLES `emailcliente` WRITE;
/*!40000 ALTER TABLE `emailcliente` DISABLE KEYS */;
INSERT INTO `emailcliente` VALUES (1,'tiago.foz@hotmail.com',1);
/*!40000 ALTER TABLE `emailcliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emailhotel`
--

DROP TABLE IF EXISTS `emailhotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emailhotel` (
  `idEmailHotel` int(11) NOT NULL AUTO_INCREMENT,
  `emailHotel` varchar(45) NOT NULL,
  `hotel_idHotel` int(11) NOT NULL,
  PRIMARY KEY (`idEmailHotel`),
  UNIQUE KEY `idEmailCliente_UNIQUE` (`idEmailHotel`),
  KEY `fk_emailHotel_hotel1_idx` (`hotel_idHotel`),
  CONSTRAINT `fk_emailHotel_hotel1` FOREIGN KEY (`hotel_idHotel`) REFERENCES `hotel` (`idHotel`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emailhotel`
--

LOCK TABLES `emailhotel` WRITE;
/*!40000 ALTER TABLE `emailhotel` DISABLE KEYS */;
INSERT INTO `emailhotel` VALUES (1,'brooklynhotel@brooklyn.com',1);
/*!40000 ALTER TABLE `emailhotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `endereco` (
  `idEndereco` int(11) NOT NULL AUTO_INCREMENT,
  `cidade_idCidade` int(11) NOT NULL,
  `bairro_idBairro` int(11) NOT NULL,
  `rua_idRua` int(11) NOT NULL,
  PRIMARY KEY (`idEndereco`),
  KEY `fk_enderecoCliente_cidade1_idx` (`cidade_idCidade`),
  KEY `fk_enderecoCliente_bairro1_idx` (`bairro_idBairro`),
  KEY `fk_enderecoCliente_rua1_idx` (`rua_idRua`),
  CONSTRAINT `fk_enderecoCliente_bairro1` FOREIGN KEY (`bairro_idBairro`) REFERENCES `bairro` (`idBairro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_enderecoCliente_cidade1` FOREIGN KEY (`cidade_idCidade`) REFERENCES `cidade` (`idCidade`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_enderecoCliente_rua1` FOREIGN KEY (`rua_idRua`) REFERENCES `rua` (`idRua`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
INSERT INTO `endereco` VALUES (1,1,1,1),(2,2,2,2);
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enderecoespecifico`
--

DROP TABLE IF EXISTS `enderecoespecifico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enderecoespecifico` (
  `idEnderecoEspecifico` int(11) NOT NULL,
  `numeroEndereco` varchar(45) NOT NULL,
  `cepEndereco` varchar(20) NOT NULL,
  `complementoEndereco` text,
  `endereco_idEndereco` int(11) NOT NULL,
  PRIMARY KEY (`idEnderecoEspecifico`),
  KEY `fk_enderecoEspecifico_endereco1_idx` (`endereco_idEndereco`),
  CONSTRAINT `fk_enderecoEspecifico_endereco1` FOREIGN KEY (`endereco_idEndereco`) REFERENCES `endereco` (`idEndereco`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enderecoespecifico`
--

LOCK TABLES `enderecoespecifico` WRITE;
/*!40000 ALTER TABLE `enderecoespecifico` DISABLE KEYS */;
INSERT INTO `enderecoespecifico` VALUES (1,'23','85867-530',NULL,1),(2,'730','88888-555',NULL,2);
/*!40000 ALTER TABLE `enderecoespecifico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado` (
  `idEstado` int(11) NOT NULL AUTO_INCREMENT,
  `nomeEstado` varchar(45) NOT NULL,
  `pais_idPais` int(11) NOT NULL,
  PRIMARY KEY (`idEstado`),
  KEY `fk_estado_pais1_idx` (`pais_idPais`),
  CONSTRAINT `fk_estado_pais1` FOREIGN KEY (`pais_idPais`) REFERENCES `pais` (`idPais`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (1,'Parana',1),(2,'New York',2);
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel`
--

DROP TABLE IF EXISTS `hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotel` (
  `idHotel` int(11) NOT NULL AUTO_INCREMENT,
  `nomeHotel` varchar(45) NOT NULL,
  `cnpjHotel` varchar(20) NOT NULL,
  PRIMARY KEY (`idHotel`),
  UNIQUE KEY `idHotel_UNIQUE` (`idHotel`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel`
--

LOCK TABLES `hotel` WRITE;
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
INSERT INTO `hotel` VALUES (1,'Brooklyn Hotel','07.575.656/0001-70');
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotelenderecoespecifico`
--

DROP TABLE IF EXISTS `hotelenderecoespecifico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotelenderecoespecifico` (
  `hotel_idHotel` int(11) NOT NULL,
  `enderecoEspecifico_idEnderecoEspecifico` int(11) NOT NULL,
  PRIMARY KEY (`hotel_idHotel`,`enderecoEspecifico_idEnderecoEspecifico`),
  KEY `fk_hotel_has_enderecoEspecifico_enderecoEspecifico1_idx` (`enderecoEspecifico_idEnderecoEspecifico`),
  KEY `fk_hotel_has_enderecoEspecifico_hotel1_idx` (`hotel_idHotel`),
  CONSTRAINT `fk_hotel_has_enderecoEspecifico_enderecoEspecifico1` FOREIGN KEY (`enderecoEspecifico_idEnderecoEspecifico`) REFERENCES `enderecoespecifico` (`idEnderecoEspecifico`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_hotel_has_enderecoEspecifico_hotel1` FOREIGN KEY (`hotel_idHotel`) REFERENCES `hotel` (`idHotel`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotelenderecoespecifico`
--

LOCK TABLES `hotelenderecoespecifico` WRITE;
/*!40000 ALTER TABLE `hotelenderecoespecifico` DISABLE KEYS */;
INSERT INTO `hotelenderecoespecifico` VALUES (1,2);
/*!40000 ALTER TABLE `hotelenderecoespecifico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pais` (
  `idPais` int(11) NOT NULL AUTO_INCREMENT,
  `nomePais` varchar(45) NOT NULL,
  PRIMARY KEY (`idPais`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
INSERT INTO `pais` VALUES (1,'Brasil'),(2,'United States');
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passagem`
--

DROP TABLE IF EXISTS `passagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passagem` (
  `idPassagem` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dataPassagem` varchar(10) NOT NULL,
  `horarioPassagem` varchar(8) NOT NULL,
  `somenteIda` tinyint(4) NOT NULL,
  `assento` varchar(15) NOT NULL,
  `ciaAerea_idCiaAerea` int(11) NOT NULL,
  `cidadeOrigem` int(11) NOT NULL,
  `cidadeDestino` int(11) NOT NULL,
  PRIMARY KEY (`idPassagem`),
  KEY `fk_passagem_ciaAerea1_idx` (`ciaAerea_idCiaAerea`),
  KEY `fk_passagem_cidade1_idx` (`cidadeOrigem`),
  KEY `fk_passagem_cidade2_idx` (`cidadeDestino`),
  CONSTRAINT `fk_passagem_ciaAerea1` FOREIGN KEY (`ciaAerea_idCiaAerea`) REFERENCES `ciaaerea` (`idCiaAerea`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_passagem_cidade1` FOREIGN KEY (`cidadeOrigem`) REFERENCES `cidade` (`idCidade`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_passagem_cidade2` FOREIGN KEY (`cidadeDestino`) REFERENCES `cidade` (`idCidade`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passagem`
--

LOCK TABLES `passagem` WRITE;
/*!40000 ALTER TABLE `passagem` DISABLE KEYS */;
INSERT INTO `passagem` VALUES (1,'08/01/2019','00:45',0,'A-0001',1,1,2);
/*!40000 ALTER TABLE `passagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passeio`
--

DROP TABLE IF EXISTS `passeio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passeio` (
  `idPasseio` int(11) NOT NULL AUTO_INCREMENT,
  `nomePasseio` varchar(45) NOT NULL,
  PRIMARY KEY (`idPasseio`),
  UNIQUE KEY `idPasseio_UNIQUE` (`idPasseio`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passeio`
--

LOCK TABLES `passeio` WRITE;
/*!40000 ALTER TABLE `passeio` DISABLE KEYS */;
INSERT INTO `passeio` VALUES (1,'Prospect Park');
/*!40000 ALTER TABLE `passeio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rua`
--

DROP TABLE IF EXISTS `rua`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rua` (
  `idRua` int(11) NOT NULL AUTO_INCREMENT,
  `nomeRua` varchar(45) NOT NULL,
  PRIMARY KEY (`idRua`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rua`
--

LOCK TABLES `rua` WRITE;
/*!40000 ALTER TABLE `rua` DISABLE KEYS */;
INSERT INTO `rua` VALUES (1,'Av Brasil'),(2,'Atlantic Ave');
/*!40000 ALTER TABLE `rua` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefonecliente`
--

DROP TABLE IF EXISTS `telefonecliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telefonecliente` (
  `idTelefoneCliente` int(11) NOT NULL AUTO_INCREMENT,
  `telefoneCliente` varchar(20) NOT NULL,
  `telefoneCliente_idCliente` int(11) NOT NULL,
  PRIMARY KEY (`idTelefoneCliente`),
  UNIQUE KEY `idTelefoneCliente_UNIQUE` (`idTelefoneCliente`),
  KEY `fk_telefoneCliente_cliente_idx` (`telefoneCliente_idCliente`),
  CONSTRAINT `fk_telefoneCliente_cliente` FOREIGN KEY (`telefoneCliente_idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefonecliente`
--

LOCK TABLES `telefonecliente` WRITE;
/*!40000 ALTER TABLE `telefonecliente` DISABLE KEYS */;
INSERT INTO `telefonecliente` VALUES (1,'999940308',1);
/*!40000 ALTER TABLE `telefonecliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefonehotel`
--

DROP TABLE IF EXISTS `telefonehotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telefonehotel` (
  `idTelefoneHotel` int(11) NOT NULL AUTO_INCREMENT,
  `telefoneHotel` varchar(20) NOT NULL,
  `hotel_idHotel` int(11) NOT NULL,
  PRIMARY KEY (`idTelefoneHotel`),
  UNIQUE KEY `idTelefoneCliente_UNIQUE` (`idTelefoneHotel`),
  KEY `fk_telefoneHotel_hotel1_idx` (`hotel_idHotel`),
  CONSTRAINT `fk_telefoneHotel_hotel1` FOREIGN KEY (`hotel_idHotel`) REFERENCES `hotel` (`idHotel`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefonehotel`
--

LOCK TABLES `telefonehotel` WRITE;
/*!40000 ALTER TABLE `telefonehotel` DISABLE KEYS */;
INSERT INTO `telefonehotel` VALUES (1,'8008-8080',1);
/*!40000 ALTER TABLE `telefonehotel` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-07 20:39:43
