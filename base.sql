-- MySQL dump 10.13  Distrib 5.6.16, for osx10.6 (x86_64)
--
-- Host: localhost    Database: rx
-- ------------------------------------------------------
-- Server version	5.6.16

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
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `answer` varchar(45) DEFAULT NULL,
  `answer_is_ok` tinyint(1) DEFAULT NULL,
  `value` decimal(18,2) DEFAULT NULL,
  `activa` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_answers_questions1_idx` (`question_id`),
  CONSTRAINT `fk_answers_questions1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` VALUES (1,1,'5',1,10.00,0),(13,9,'Filmosis',0,0.00,0),(14,9,'Higiene deficiente',0,0.00,0),(15,9,'Tabaquismo',1,0.00,0),(16,9,'CircunsiciÃ³n',0,1.00,0),(17,9,'Ninguna de las anteriores',0,1.00,0),(20,1,'8',0,1.00,0),(21,14,'Dieciocho',1,1.00,0),(22,14,'veintiseis',0,1.00,0),(23,2,'Noventa y Seis',1,1.00,0),(24,2,'ochenta y cuatro',0,1.00,0),(25,15,'Sensacional',1,1.00,0),(27,19,'Tabaquismo',1,1.00,1),(28,19,'Higiene deficiente',0,1.00,1),(29,19,'Circunsicion',0,1.00,1),(30,19,'Ninguna de las anteriores',0,1.00,0),(31,20,'Fimosis',1,1.00,1),(32,20,'Inflamacion cronica',0,1.00,1),(33,20,'Radiaciones',0,1.00,1),(34,20,'tabaquismo',0,1.00,1),(35,20,'Historia Sexual',0,1.00,1);
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar_events`
--

DROP TABLE IF EXISTS `calendar_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendar_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(150) NOT NULL,
  `descripcion` text NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `color_id` int(11) NOT NULL,
  `url` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `color_id` (`color_id`),
  CONSTRAINT `calendar_events_ibfk_1` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_events`
--

LOCK TABLES `calendar_events` WRITE;
/*!40000 ALTER TABLE `calendar_events` DISABLE KEYS */;
INSERT INTO `calendar_events` VALUES (1,'Cancer de Pene','Nuevo Examen Programado','2014-08-04 05:00:00',1,'http://localhost/rx/ScheduledExams/resolve/30'),(2,'Examen Medico II','Nuevo Examen Programado','2014-08-03 05:00:00',1,'http://localhost/rx/ScheduledExams/resolve/32'),(3,'Examen Medico III','Nuevo Examen Programado','2014-08-04 05:00:00',1,'http://localhost/rx/ScheduledExams/resolve/34');
/*!40000 ALTER TABLE `calendar_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colors`
--

DROP TABLE IF EXISTS `colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `colors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valor` varchar(50) NOT NULL,
  `color` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colors`
--

LOCK TABLES `colors` WRITE;
/*!40000 ALTER TABLE `colors` DISABLE KEYS */;
INSERT INTO `colors` VALUES (1,'alert-success','green'),(2,'alert-info','blue'),(3,'alert-warning','yellow'),(4,'alert-danger','red');
/*!40000 ALTER TABLE `colors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_answers`
--

DROP TABLE IF EXISTS `exam_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam_answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_id` int(11) NOT NULL,
  `pregunta` text NOT NULL,
  `respuesta` text NOT NULL,
  `correcta` tinyint(1) NOT NULL,
  `calificada` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_answers`
--

LOCK TABLES `exam_answers` WRITE;
/*!40000 ALTER TABLE `exam_answers` DISABLE KEYS */;
INSERT INTO `exam_answers` VALUES (1,1,'Factores de Riesgo para cancer de pene excepto','Fimosis',0,1),(2,1,'Factor de Riesgo mas importante para cancer de pene','Historia Sexual',0,1),(3,13,'Factores de Riesgo para cancer de pene excepto','Circunsicion',0,1),(4,13,'Factor de Riesgo mas importante para cancer de pene','Historia Sexual',0,1),(5,14,'Factores de Riesgo para cancer de pene excepto','Tabaquismo',1,1),(6,14,'Factor de Riesgo mas importante para cancer de pene','Radiaciones',0,1);
/*!40000 ALTER TABLE `exam_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_statuses`
--

DROP TABLE IF EXISTS `exam_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_statuses`
--

LOCK TABLES `exam_statuses` WRITE;
/*!40000 ALTER TABLE `exam_statuses` DISABLE KEYS */;
INSERT INTO `exam_statuses` VALUES (1,'iniciado'),(2,'concluido'),(3,'cancelado'),(4,'concluido');
/*!40000 ALTER TABLE `exam_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exams`
--

DROP TABLE IF EXISTS `exams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(150) NOT NULL,
  `descripcion` text NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `resultado` decimal(18,2) NOT NULL,
  `estatus` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exams`
--

LOCK TABLES `exams` WRITE;
/*!40000 ALTER TABLE `exams` DISABLE KEYS */;
INSERT INTO `exams` VALUES (13,'Cancer de Pene','Examen semestral de cancer de pene','2014-08-04 06:08:44',22,68.00,1),(14,'Examen Medico III','Comentarios de Prueba','2014-07-01 06:32:36',2,50.00,1),(15,'Examen Medico III','Comentarios de Prueba','2014-06-01 06:32:36',2,28.00,1);
/*!40000 ALTER TABLE `exams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `child_menu` int(11) DEFAULT NULL,
  `controller` varchar(45) DEFAULT NULL,
  `action` varchar(45) DEFAULT NULL,
  `class` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'Home',0,'pages','display','fa fa-home'),(6,'Usuarios',0,'users','index','fa fa-user'),(7,'Lista de Usuarios',6,'users','index',''),(8,'Estadisticas de Usuarios',6,'users','charts',''),(9,'Examenes',0,'','','fa fa-edit'),(10,'Examenes Resueltos',9,'exams','index',''),(12,'Preguntas',0,'questions','index','fa fa-question-circle'),(13,'Perfil',0,'Users','profile','fa fa-user'),(15,'Grupos de Usuario',6,'roles','index',''),(16,'Preguntas',12,'questions','index','fa fa-question-circle'),(17,'Categorias',12,'question_categories','index','fa fa-question-circle');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus_roles`
--

DROP TABLE IF EXISTS `menus_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menus_roles` (
  `menu_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`menu_id`,`role_id`),
  KEY `fk_menus_has_roles_roles1_idx` (`role_id`),
  KEY `fk_menus_has_roles_menus1_idx` (`menu_id`),
  CONSTRAINT `fk_menus_has_roles_menus1` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_menus_has_roles_roles1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus_roles`
--

LOCK TABLES `menus_roles` WRITE;
/*!40000 ALTER TABLE `menus_roles` DISABLE KEYS */;
INSERT INTO `menus_roles` VALUES (1,5),(6,5),(7,5),(9,5),(10,5),(12,5),(15,5),(16,5),(17,5),(1,6),(12,6),(13,6);
/*!40000 ALTER TABLE `menus_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `titulo` varchar(150) NOT NULL,
  `descripcion` text NOT NULL,
  `color_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (1,5,1,'2014-08-04 06:14:21','Hola como estas','Ya vas carnal',1),(2,0,2,'2014-08-04 06:38:34','Nuevo Examen Programado','Se ha programado un nuevo examen http://localhost/rx/ScheduledExams/resolve/26',2),(3,0,2,'2014-08-04 06:14:28','Nuevo Examen Programado','Se ha programado un nuevo examen <a href=\"http://localhost/rx/ScheduledExams/resolve/27\">Ver</a>',1),(4,0,2,'2014-08-04 06:38:37','Nuevo Examen Programado','Se ha programado un nuevo examen <a href=\"http://localhost/rx/ScheduledExams/resolve/28\">Ver</a>',4),(5,0,2,'2014-08-04 06:14:36','Nuevo Examen Programado','Se ha programado un nuevo examen <a href=\"http://localhost/rx/ScheduledExams/resolve/30\">Ver</a>',1),(6,0,2,'2014-08-04 06:38:40','Nuevo Examen Programado','Se ha programado un nuevo examen <a href=\"http://localhost/rx/ScheduledExams/resolve/32\">Ver</a>',2),(7,0,2,'2014-08-04 06:38:42','Nuevo Examen Programado','Se ha programado un nuevo examen <a href=\"http://localhost/rx/ScheduledExams/resolve/34\">Ver</a>',3);
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_categories`
--

DROP TABLE IF EXISTS `question_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `descripcion` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_categories`
--

LOCK TABLES `question_categories` WRITE;
/*!40000 ALTER TABLE `question_categories` DISABLE KEYS */;
INSERT INTO `question_categories` VALUES (1,'Cancer de Pene','Categoria definida para preguntas relacionadas a cancer de pene'),(2,'Cancer Prostatico','Preguntas relacionadas a cancer prostatico');
/*!40000 ALTER TABLE `question_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_questions`
--

DROP TABLE IF EXISTS `question_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `child_question_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='preguntas de relacion de columnas ligadas a otra pregunta';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_questions`
--

LOCK TABLES `question_questions` WRITE;
/*!40000 ALTER TABLE `question_questions` DISABLE KEYS */;
INSERT INTO `question_questions` VALUES (1,16,15),(3,16,9),(4,16,2);
/*!40000 ALTER TABLE `question_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_types`
--

DROP TABLE IF EXISTS `question_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_types`
--

LOCK TABLES `question_types` WRITE;
/*!40000 ALTER TABLE `question_types` DISABLE KEYS */;
INSERT INTO `question_types` VALUES (1,'Opcion multiple'),(2,'Relacion de columnas'),(3,'Prgunta abierta');
/*!40000 ALTER TABLE `question_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` text,
  `question_category_id` int(11) NOT NULL,
  `imagen` varchar(150) NOT NULL,
  `question_status_id` int(11) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `question_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,'Raiz Cuadrada de 25',2,'cover.jpg',3,'2014-07-28 04:13:44',0),(2,'Area de un cuadrado de 8cm de lado',1,'941164_3205218146449_589724074_n.jpg',3,'2014-07-28 04:13:44',1),(8,'aaa',2,'22.JPG',3,'2014-07-28 04:13:44',0),(9,'Factores de riesgo para cÃ¡ncer de pene excepto:',1,'10482835_308922619273117_1321548922_n.jpg',3,'2014-07-28 04:13:44',0),(10,'Raiz Cuadrada de 25',1,'cover.jpg',0,'2014-07-28 04:13:44',0),(11,'Raiz Cuadrada de 25',1,'cover.jpg',3,'2014-07-28 04:13:44',0),(12,'prueba',2,'',0,'2014-07-28 04:13:44',0),(13,'prueba',2,'',3,'2014-07-28 04:13:44',0),(14,'Cual es el tamaÃ±o de un pene',2,'10482835_308922619273117_1321548922_n.jpg',3,'0000-00-00 00:00:00',0),(15,'Cual es el area de un triangulo de 5cm de base y un angulo de 46 grados',2,'',3,'0000-00-00 00:00:00',1),(16,'Relacion de Columnas 1',2,'',3,'0000-00-00 00:00:00',2),(17,'Preguntame la pregunta',2,'',3,'2014-08-03 17:34:31',3),(18,'Hola como estas tu tambien',2,'',3,'2014-08-04 05:46:49',2),(19,'Factores de Riesgo para cancer de pene excepto',1,'tumblr_mjkfl4qTxM1re12ono1_500.jpg',2,'2014-08-04 05:49:58',1),(20,'Factor de Riesgo mas importante para cancer de pene',1,'',2,'2014-08-04 05:53:16',1);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions_scheduled_exams`
--

DROP TABLE IF EXISTS `questions_scheduled_exams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions_scheduled_exams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scheduled_exam_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions_scheduled_exams`
--

LOCK TABLES `questions_scheduled_exams` WRITE;
/*!40000 ALTER TABLE `questions_scheduled_exams` DISABLE KEYS */;
INSERT INTO `questions_scheduled_exams` VALUES (1,1,1),(2,1,2),(3,2,1),(4,2,2),(5,3,1),(6,4,1),(7,7,2),(8,11,1),(9,11,12),(10,11,9),(11,11,10),(12,13,9),(13,13,13),(14,13,9),(15,24,9),(16,28,2),(17,28,14),(18,29,16),(19,28,16),(20,30,19),(21,31,19),(22,31,20),(23,32,19),(24,32,19),(25,34,19),(26,34,20);
/*!40000 ALTER TABLE `questions_scheduled_exams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `user_role` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (5,'administradores',0),(6,'usuarios',0),(46,'adminisrador',1),(47,'usuario',1);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_scheduled_exams`
--

DROP TABLE IF EXISTS `roles_scheduled_exams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles_scheduled_exams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `scheduled_exam_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_scheduled_exams`
--

LOCK TABLES `roles_scheduled_exams` WRITE;
/*!40000 ALTER TABLE `roles_scheduled_exams` DISABLE KEYS */;
INSERT INTO `roles_scheduled_exams` VALUES (1,5,12),(2,6,12),(3,6,13),(4,6,31),(6,6,34);
/*!40000 ALTER TABLE `roles_scheduled_exams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_users`
--

DROP TABLE IF EXISTS `roles_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_has_role_users_idx` (`user_id`),
  KEY `fk_user_has_role_roles1_idx` (`role_id`),
  CONSTRAINT `fk_user_has_role_roles1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_role_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_users`
--

LOCK TABLES `roles_users` WRITE;
/*!40000 ALTER TABLE `roles_users` DISABLE KEYS */;
INSERT INTO `roles_users` VALUES (1,62,5),(2,63,6),(3,62,46),(4,63,47);
/*!40000 ALTER TABLE `roles_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scheduled_exams`
--

DROP TABLE IF EXISTS `scheduled_exams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scheduled_exams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_programada` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fecha_limite` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `estatus` int(11) NOT NULL,
  `titulo` varchar(150) NOT NULL,
  `comentarios` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduled_exams`
--

LOCK TABLES `scheduled_exams` WRITE;
/*!40000 ALTER TABLE `scheduled_exams` DISABLE KEYS */;
INSERT INTO `scheduled_exams` VALUES (31,'2014-08-04 05:00:00','2014-08-13 05:00:00',1,'Cancer de Pene','Examen semestral de cancer de pene'),(32,'2014-08-04 05:00:00','2014-08-05 05:00:00',1,'Examen Medico II','Resolver Correctamente'),(34,'2014-08-04 05:00:00','2014-08-04 05:00:00',1,'Examen Medico III','Comentarios de Prueba');
/*!40000 ALTER TABLE `scheduled_exams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_answers`
--

DROP TABLE IF EXISTS `user_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_exam_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL,
  `pregunta` varchar(45) NOT NULL,
  `respuesta` varchar(45) NOT NULL,
  `correcta` tinyint(1) NOT NULL,
  `valor` decimal(18,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_answers_user_exams1_idx` (`user_exam_id`),
  KEY `fk_user_answers_users1_idx` (`user_id`),
  KEY `fk_user_answers_questions1_idx` (`question_id`),
  KEY `fk_user_answers_answers1_idx` (`answer_id`),
  CONSTRAINT `fk_user_answers_answers1` FOREIGN KEY (`answer_id`) REFERENCES `answers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_answers_questions1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_answers_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_answers_user_exams1` FOREIGN KEY (`user_exam_id`) REFERENCES `user_exams` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_answers`
--

LOCK TABLES `user_answers` WRITE;
/*!40000 ALTER TABLE `user_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_exams`
--

DROP TABLE IF EXISTS `user_exams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_exams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_id` int(11) NOT NULL,
  `last_answer` int(11) DEFAULT NULL,
  `exam_status_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_exams_exams1_idx` (`exam_id`),
  KEY `fk_user_exams_exam_statuses1_idx` (`exam_status_id`),
  CONSTRAINT `fk_user_exams_exam_statuses1` FOREIGN KEY (`exam_status_id`) REFERENCES `exam_statuses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_exams`
--

LOCK TABLES `user_exams` WRITE;
/*!40000 ALTER TABLE `user_exams` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_exams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `email` varchar(150) NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `activo` tinyint(1) NOT NULL DEFAULT '0',
  `role_id` int(11) NOT NULL,
  `avatar` varchar(255) NOT NULL DEFAULT 'avatar77.jpg',
  `nombre_completo` varchar(255) NOT NULL,
  `baja` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (62,'administrador','29c95bad258e20251c8dc5a08b3889c8daf74fd9','','2014-08-05 05:00:00',1,0,'avatar77.jpg','',0),(63,'usuario','29c95bad258e20251c8dc5a08b3889c8daf74fd9','','2014-08-05 05:00:00',1,0,'avatar77.jpg','',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-08-05  3:32:55
