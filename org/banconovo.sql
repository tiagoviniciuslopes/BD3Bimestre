-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: mydbnovo
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
-- Table structure for table `tbaluno`
--

DROP TABLE IF EXISTS `tbaluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbaluno` (
  `codAluno` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `cpf` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`codAluno`),
  UNIQUE KEY `codAluno_UNIQUE` (`codAluno`),
  UNIQUE KEY `cpf_UNIQUE` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbaluno`
--

LOCK TABLES `tbaluno` WRITE;
/*!40000 ALTER TABLE `tbaluno` DISABLE KEYS */;
INSERT INTO `tbaluno` VALUES (2,'Jose da Silva Lima','123.432.123.34','zesilva@gmail.com'),(3,'Guilherme Locks','134.456.789.09','locks@gmail.com'),(4,'Victor Hugo','123.456.789.12','locks@gmail.com'),(5,'Renan Bertolazo','123.232.432.56','renanzito@gmail.com'),(6,'Ellen Luana','134.675.345.45','ellenluana@hotmail.com'),(7,'Mariana Meyer','167.890.001.03','mari@hotmail.com');
/*!40000 ALTER TABLE `tbaluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbcurso`
--

DROP TABLE IF EXISTS `tbcurso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbcurso` (
  `codCurso` int(11) NOT NULL AUTO_INCREMENT,
  `nomeCurso` varchar(45) NOT NULL,
  PRIMARY KEY (`codCurso`),
  UNIQUE KEY `codCurso_UNIQUE` (`codCurso`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbcurso`
--

LOCK TABLES `tbcurso` WRITE;
/*!40000 ALTER TABLE `tbcurso` DISABLE KEYS */;
INSERT INTO `tbcurso` VALUES (1,'Ciencia da Computacao'),(2,'Engenharia Mecanica'),(3,'Engenharia Eletrica'),(4,'Matematica');
/*!40000 ALTER TABLE `tbcurso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbdisciplina`
--

DROP TABLE IF EXISTS `tbdisciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbdisciplina` (
  `codDisciplina` int(11) NOT NULL AUTO_INCREMENT,
  `nomeDisciplina` varchar(45) NOT NULL,
  `Curso_codCurso` int(11) NOT NULL,
  `Professor_codProfessor` int(11) NOT NULL,
  PRIMARY KEY (`codDisciplina`),
  UNIQUE KEY `codDisciplina_UNIQUE` (`codDisciplina`),
  KEY `fk_Disciplina_Curso1_idx` (`Curso_codCurso`),
  KEY `fk_Disciplina_Professor1_idx` (`Professor_codProfessor`),
  CONSTRAINT `fk_Disciplina_Curso1` FOREIGN KEY (`Curso_codCurso`) REFERENCES `tbcurso` (`codCurso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Disciplina_Professor1` FOREIGN KEY (`Professor_codProfessor`) REFERENCES `tbprofessor` (`codProfessor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbdisciplina`
--

LOCK TABLES `tbdisciplina` WRITE;
/*!40000 ALTER TABLE `tbdisciplina` DISABLE KEYS */;
INSERT INTO `tbdisciplina` VALUES (1,'Banco de Dados',1,1),(2,'Redes de Computadores',1,2),(3,'Calculo I',2,3),(4,'Fisica II',2,4),(5,'Quimica I',3,5),(6,'Materiais Condutivos',3,6),(7,'Calculo Numerico',4,7),(8,'Geometria Analitica',4,8);
/*!40000 ALTER TABLE `tbdisciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbmatriculaaluno`
--

DROP TABLE IF EXISTS `tbmatriculaaluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbmatriculaaluno` (
  `anoLetivo` int(11) NOT NULL,
  `dtMatricula` varchar(45) NOT NULL,
  `Aluno_codAluno` int(11) NOT NULL,
  `Curso_codCurso` int(11) NOT NULL,
  `codMatricula` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`codMatricula`),
  UNIQUE KEY `codMatricula_UNIQUE` (`codMatricula`),
  KEY `fk_MatriculaAluno_Curso1_idx` (`Curso_codCurso`),
  KEY `fk_MatriculaAluno_Aluno` (`Aluno_codAluno`),
  CONSTRAINT `fk_MatriculaAluno_Aluno` FOREIGN KEY (`Aluno_codAluno`) REFERENCES `tbaluno` (`codAluno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_MatriculaAluno_Curso1` FOREIGN KEY (`Curso_codCurso`) REFERENCES `tbcurso` (`codCurso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbmatriculaaluno`
--

LOCK TABLES `tbmatriculaaluno` WRITE;
/*!40000 ALTER TABLE `tbmatriculaaluno` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbmatriculaaluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbmatriculadisciplina`
--

DROP TABLE IF EXISTS `tbmatriculadisciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbmatriculadisciplina` (
  `MatriculaAluno_codMatricula` int(11) NOT NULL,
  `Disciplina_codDisciplina` int(11) NOT NULL,
  PRIMARY KEY (`MatriculaAluno_codMatricula`,`Disciplina_codDisciplina`),
  KEY `fk_MatriculaDisciplina_Disciplina1_idx` (`Disciplina_codDisciplina`),
  CONSTRAINT `fk_MatriculaDisciplina_Disciplina1` FOREIGN KEY (`Disciplina_codDisciplina`) REFERENCES `tbdisciplina` (`codDisciplina`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_MatriculaDisciplina_MatriculaAluno1` FOREIGN KEY (`MatriculaAluno_codMatricula`) REFERENCES `tbmatriculaaluno` (`codMatricula`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbmatriculadisciplina`
--

LOCK TABLES `tbmatriculadisciplina` WRITE;
/*!40000 ALTER TABLE `tbmatriculadisciplina` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbmatriculadisciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbprofessor`
--

DROP TABLE IF EXISTS `tbprofessor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbprofessor` (
  `codProfessor` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`codProfessor`),
  UNIQUE KEY `codProfessor_UNIQUE` (`codProfessor`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbprofessor`
--

LOCK TABLES `tbprofessor` WRITE;
/*!40000 ALTER TABLE `tbprofessor` DISABLE KEYS */;
INSERT INTO `tbprofessor` VALUES (1,'Giu Brazil','giubr@unioeste.br'),(2,'Renato Bobsin','renatinho@unioeste.br'),(3,'Daniel Salinas','salinas@unioeste.br'),(4,'Fernanda Nodari','fer.nodari@unioeste.br'),(5,'Felipe Bittencurt','arrocha@unioeste.br'),(6,'Elisa Moraes','elisa.mo@unioeste.br'),(7,'Roberto Marinho','robertinho@unioeste.br'),(8,'Eustacio de Melo','eustaciodemelo@unioeste.br');
/*!40000 ALTER TABLE `tbprofessor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-01 19:01:03
