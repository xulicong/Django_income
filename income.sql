-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: income
-- ------------------------------------------------------
-- Server version	5.7.26-0ubuntu0.16.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',4,'add_permission'),(6,'Can change permission',4,'change_permission'),(7,'Can delete permission',4,'delete_permission'),(8,'Can view permission',4,'view_permission'),(9,'Can add user',2,'add_user'),(10,'Can change user',2,'change_user'),(11,'Can delete user',2,'delete_user'),(12,'Can view user',2,'view_user'),(13,'Can add group',3,'add_group'),(14,'Can change group',3,'change_group'),(15,'Can delete group',3,'delete_group'),(16,'Can view group',3,'view_group'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add 年份管理',7,'add_yeardb'),(26,'Can change 年份管理',7,'change_yeardb'),(27,'Can delete 年份管理',7,'delete_yeardb'),(28,'Can view 年份管理',7,'view_yeardb'),(29,'Can add 收入管理',8,'add_incomdb'),(30,'Can change 收入管理',8,'change_incomdb'),(31,'Can delete 收入管理',8,'delete_incomdb'),(32,'Can view 收入管理',8,'view_incomdb'),(33,'Can add 债务管理',9,'add_debtsdb'),(34,'Can change 债务管理',9,'change_debtsdb'),(35,'Can delete 债务管理',9,'delete_debtsdb'),(36,'Can view 债务管理',9,'view_debtsdb');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$150000$FRzd1jvx2axv$6mu7ZCQp1VWujH0z6EuWidZk8SjKk/BAcM5Yburq/mI=','2020-02-03 07:35:40.198739',1,'admin','','','401719568@qq.com',1,1,'2019-05-05 02:53:05.310948'),(2,'pbkdf2_sha256$150000$1yXHeo6uaR4P$44MJgeDgdb6JyspTmWeMBcED7jSoZc9S5+e/Wdau98A=','2020-02-23 11:16:36.332561',0,'Lison','立聪','许','401719568@qq.com',1,1,'2019-05-12 08:07:00.000000'),(3,'pbkdf2_sha256$150000$hWQsZzpKicse$fBuQ+9VyKfH4hKiOgcuxSojEoe09i4Tr8s8Npfm9pFk=','2019-06-15 09:00:40.289059',0,'Aloe','茹会','王','',1,1,'2019-05-12 08:08:00.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-05-12 08:07:57.326612','2','Lison',1,'[{\"added\": {}}]',2,1),(2,'2019-05-12 08:08:14.222901','2','Lison',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"email\", \"is_staff\"]}}]',2,1),(3,'2019-05-12 08:08:39.673728','3','Aloe',1,'[{\"added\": {}}]',2,1),(4,'2019-05-12 08:08:56.081776','3','Aloe',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"is_staff\"]}}]',2,1),(5,'2019-05-19 11:33:11.594600','1','2019 5月',2,'[{\"changed\": {\"fields\": [\"comment\"]}}]',8,1),(6,'2019-05-19 13:20:15.488398','1','2019 4月',2,'[{\"changed\": {\"fields\": [\"monthly\"]}}]',8,1),(7,'2019-05-28 12:57:02.229615','7','沈钉友',2,'[{\"changed\": {\"fields\": [\"debtee\"]}}]',9,1),(8,'2019-05-28 12:57:12.504401','5','林根成',2,'[{\"changed\": {\"fields\": [\"debtee\"]}}]',9,1),(9,'2019-05-28 12:57:26.641830','6','李成龙',2,'[{\"changed\": {\"fields\": [\"debtee\"]}}]',9,1),(10,'2019-05-28 13:12:37.828256','2','2019 5月',3,'',8,1),(11,'2019-05-28 13:15:22.126216','3','2019 5月',3,'',8,1),(12,'2019-05-28 13:26:33.126588','4','2019 5月',3,'',8,1),(13,'2019-05-28 13:46:49.508927','5','2019 5月',3,'',8,1),(14,'2019-05-28 13:49:07.150957','6','2019 5月',3,'',8,1),(15,'2019-05-28 14:21:41.560820','7','2019 5月',3,'',8,1),(16,'2019-05-28 14:26:15.682004','8','2019 5月',3,'',8,1),(17,'2019-05-28 14:28:24.491776','9','2019 5月',3,'',8,1),(18,'2019-05-28 14:58:29.880010','10','2019 5月',2,'[{\"changed\": {\"fields\": [\"comment\"]}}]',8,1),(19,'2019-07-01 13:07:46.693970','11','2019 7月',2,'[{\"changed\": {\"fields\": [\"comment\"]}}]',8,1),(20,'2019-07-11 12:22:38.469990','10','老妈朋友',3,'',9,1),(21,'2019-07-11 12:32:36.671676','11','沈钉友',3,'',9,1),(22,'2019-07-11 12:36:06.374941','12','沈钉友',3,'',9,1),(23,'2019-07-11 12:38:59.816583','13','沈钉友',3,'',9,1),(24,'2019-07-11 12:47:17.427970','14','沈钉友',3,'',9,1),(25,'2019-08-30 13:22:58.613192','11','2019 6月',2,'[{\"changed\": {\"fields\": [\"monthly\"]}}]',8,1),(26,'2019-08-30 13:23:12.729034','12','2019 8月',3,'',8,1),(27,'2019-08-30 13:32:56.688664','11','2019 6月',3,'',8,1),(28,'2019-08-30 13:34:47.502756','13','2019 6月',2,'[{\"changed\": {\"fields\": [\"monthly\"]}}]',8,1),(29,'2019-08-30 13:36:47.298803','13','2019 6月',2,'[{\"changed\": {\"fields\": [\"comment\"]}}]',8,1),(30,'2019-08-30 13:36:59.907242','13','2019 6月',2,'[{\"changed\": {\"fields\": [\"comment\"]}}]',8,1),(31,'2019-08-30 13:40:43.172952','14','2019 7月',2,'[{\"changed\": {\"fields\": [\"monthly\", \"comment\"]}}]',8,1),(32,'2019-08-30 13:49:39.124971','14','2019 7月',2,'[{\"changed\": {\"fields\": [\"payments\", \"expected_balance\", \"actual_balance\", \"actual_income\"]}}]',8,1),(33,'2019-08-30 14:01:59.632696','13','2019 6月',2,'[{\"changed\": {\"fields\": [\"payments\", \"expected_balance\", \"actual_balance\", \"actual_income\"]}}]',8,1),(34,'2019-08-30 14:04:46.404592','14','2019 7月',2,'[{\"changed\": {\"fields\": [\"last_balance\", \"expected_balance\", \"actual_balance\", \"actual_income\"]}}]',8,1),(35,'2019-08-30 14:05:06.325159','15','2019 8月',3,'',8,1),(36,'2019-08-30 14:08:00.251031','14','2019 7月',2,'[{\"changed\": {\"fields\": [\"actual_income\"]}}]',8,1),(37,'2019-09-18 14:21:13.138955','16','许学然',3,'',9,1),(38,'2019-09-18 14:27:26.815591','18','许学满',3,'',9,1),(39,'2019-09-18 14:34:56.063383','17','许学然',3,'',9,1),(40,'2019-09-30 15:12:48.953353','17','2019 9月',2,'[{\"changed\": {\"fields\": [\"comment\"]}}]',8,1),(41,'2019-12-01 05:19:14.154382','19','2019 11月',2,'[{\"changed\": {\"fields\": [\"monthly\", \"comment\"]}}]',8,1),(42,'2020-01-07 13:35:12.492358','20','2019 12月',2,'[{\"changed\": {\"fields\": [\"Year\", \"monthly\"]}}]',8,1),(43,'2020-02-03 07:33:25.086768','21','2020 1月',2,'[{\"changed\": {\"fields\": [\"monthly\", \"comment\"]}}]',8,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(4,'auth','permission'),(2,'auth','user'),(5,'contenttypes','contenttype'),(9,'piggy_bank','debtsdb'),(8,'piggy_bank','incomdb'),(7,'piggy_bank','yeardb'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-05-05 02:52:11.034195'),(2,'auth','0001_initial','2019-05-05 02:52:11.226205'),(3,'admin','0001_initial','2019-05-05 02:52:11.748841'),(4,'admin','0002_logentry_remove_auto_add','2019-05-05 02:52:11.842037'),(5,'admin','0003_logentry_add_action_flag_choices','2019-05-05 02:52:11.854234'),(6,'contenttypes','0002_remove_content_type_name','2019-05-05 02:52:11.937743'),(7,'auth','0002_alter_permission_name_max_length','2019-05-05 02:52:11.954128'),(8,'auth','0003_alter_user_email_max_length','2019-05-05 02:52:11.970305'),(9,'auth','0004_alter_user_username_opts','2019-05-05 02:52:11.981471'),(10,'auth','0005_alter_user_last_login_null','2019-05-05 02:52:12.041183'),(11,'auth','0006_require_contenttypes_0002','2019-05-05 02:52:12.045758'),(12,'auth','0007_alter_validators_add_error_messages','2019-05-05 02:52:12.061732'),(13,'auth','0008_alter_user_username_max_length','2019-05-05 02:52:12.081588'),(14,'auth','0009_alter_user_last_name_max_length','2019-05-05 02:52:12.101842'),(15,'auth','0010_alter_group_name_max_length','2019-05-05 02:52:12.118226'),(16,'auth','0011_update_proxy_permissions','2019-05-05 02:52:12.131108'),(17,'sessions','0001_initial','2019-05-05 02:52:12.151771'),(18,'piggy_bank','0001_initial','2019-05-12 07:50:25.552405'),(19,'piggy_bank','0002_incomdb','2019-05-12 07:50:25.647191'),(20,'piggy_bank','0003_remove_incomdb_comments','2019-05-12 07:50:25.733703'),(21,'piggy_bank','0004_incomdb_comment','2019-05-17 05:43:02.968230'),(22,'piggy_bank','0005_debtsdb','2019-05-28 12:09:21.307396');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('05msar0v3x34gj2dblw8nezd9npe60xi','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2019-06-22 03:37:36.987399'),('0bynvgnm5t8xze9yqr1lfl3kwt3sxktu','N2YzNDU3MmM2NTY3NTgwYWUwZDNjMGQ1ZTgwZWYwYWZmZmNiZDJjZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OWRmNTI4M2JkYjhhZDg2MzBmYWFmOTk0YzE4ZTAzN2U0Yzc0YjFmIn0=','2019-06-10 02:55:25.495203'),('0ogvxnomvomab9ynttxs7j848bmd85xl','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2019-06-22 11:00:02.590483'),('0yfgjyqh4at1wsqdt36kz40rav7goq3q','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2019-06-26 14:41:34.966882'),('103q7cgjuz1cb0mr48grissjkujnn5dl','ZGM3MDg3ZDBlNGYxZjQzM2ZiNjUwZTk4YWY2N2Q0MTM3ZDgwYWViODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OWRmNTI4M2JkYjhhZDg2MzBmYWFmOTk0YzE4ZTAzN2U0Yzc0YjFmIiwidXNlciI6ImFkbWluIn0=','2019-12-15 05:11:29.625098'),('18s2d4j24t10sampge5l84d9fu19oefz','NDE2MmEzOWY0YmM0NDYwMTJjMWQ3YTkwMmIxMTdmNjM1NzQyMGI1OTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ZDkwMDE4NjhmNTFkYWIwOWFkMzAxM2FkYjg5YzE1Yzc2Yzg0MDE4IiwidXNlciI6IkFsb2UifQ==','2019-06-22 12:52:43.832622'),('2ojnawuwn6skyr47rusg4myuly4pfd79','ZGM3MDg3ZDBlNGYxZjQzM2ZiNjUwZTk4YWY2N2Q0MTM3ZDgwYWViODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OWRmNTI4M2JkYjhhZDg2MzBmYWFmOTk0YzE4ZTAzN2U0Yzc0YjFmIiwidXNlciI6ImFkbWluIn0=','2019-12-15 05:37:52.352186'),('32lyxx7kvm9jtcd5lxthd0uhkc5btd3g','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2019-06-21 05:56:13.763066'),('36q0ex1kjhnbjq1ks4ywe73c6kt17jsz','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2019-06-21 12:59:42.962616'),('3bh01i8w3ywdxxwj25h92gkqno8hthqo','N2YzNDU3MmM2NTY3NTgwYWUwZDNjMGQ1ZTgwZWYwYWZmZmNiZDJjZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OWRmNTI4M2JkYjhhZDg2MzBmYWFmOTk0YzE4ZTAzN2U0Yzc0YjFmIn0=','2019-06-04 01:39:07.002943'),('3gveo9707dvk0xo01abfri179xjhrz19','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2019-06-21 08:20:45.620951'),('3mvd3iwopyaqr8847gxt3n14s25efq5z','ZGM3MDg3ZDBlNGYxZjQzM2ZiNjUwZTk4YWY2N2Q0MTM3ZDgwYWViODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OWRmNTI4M2JkYjhhZDg2MzBmYWFmOTk0YzE4ZTAzN2U0Yzc0YjFmIiwidXNlciI6ImFkbWluIn0=','2019-07-25 12:21:18.596991'),('48lrvh9g7301yf7nz9kbac74zkeow2jz','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2020-03-08 09:02:14.119973'),('5e8bkuoxovnyxy9lxe7fm1mg3z5xd291','MmQ2YmNjYjU4MWE5YTJkNzMxMmM2Yjk3MmRkYTdhMmM5OTA1OTZmNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OWRmNTI4M2JkYjhhZDg2MzBmYWFmOTk0YzE4ZTAzN2U0Yzc0YjFmIiwidXNlciI6IkFkbWluIn0=','2020-02-17 07:35:40.201343'),('5rbvmop26ev4vdhvx5fggvz27vrc1inx','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2019-06-29 08:59:45.100796'),('6480gtmqyzq00tfae8wvpof7zqnevf4b','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2019-11-28 14:22:53.703774'),('6ye1uyikc4mtrb4vjxvmhx0exd1n9v28','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2019-06-22 10:59:10.844021'),('71kxz0apv08pretsc72jvrtbah751m88','N2YzNDU3MmM2NTY3NTgwYWUwZDNjMGQ1ZTgwZWYwYWZmZmNiZDJjZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OWRmNTI4M2JkYjhhZDg2MzBmYWFmOTk0YzE4ZTAzN2U0Yzc0YjFmIn0=','2019-05-31 05:44:04.235346'),('73vxac875999ee6siyyqlkvf5svo95uj','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2019-07-06 13:55:55.119056'),('7js8y3jrbz6x1u3ftf3hvh9fjgs30a59','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2019-06-13 03:29:18.688994'),('81g7oz07sx4riqtlimk6mokxsevxyvfv','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2019-06-16 06:26:51.757267'),('82bxubqfg2dfuiwacnr7h8att921p3yy','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2019-06-21 03:50:06.352349'),('86eyxzvkvww9qj4oxij93y4qgr4kxva3','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2020-03-08 11:16:36.336212'),('8pbc6vc6q6h4o8rb4jwlbdv2dit1qs1w','ZGM3MDg3ZDBlNGYxZjQzM2ZiNjUwZTk4YWY2N2Q0MTM3ZDgwYWViODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OWRmNTI4M2JkYjhhZDg2MzBmYWFmOTk0YzE4ZTAzN2U0Yzc0YjFmIiwidXNlciI6ImFkbWluIn0=','2019-09-13 13:12:59.634899'),('9181yuqxkkqs3lupz74ckbci2uebj5nn','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2019-06-22 05:02:57.301036'),('92o0a4b91eeimlj7wkz3c1zekr1f56aa','ZGM3MDg3ZDBlNGYxZjQzM2ZiNjUwZTk4YWY2N2Q0MTM3ZDgwYWViODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OWRmNTI4M2JkYjhhZDg2MzBmYWFmOTk0YzE4ZTAzN2U0Yzc0YjFmIiwidXNlciI6ImFkbWluIn0=','2020-01-21 13:23:22.332754'),('9766nwkqcjoyyc8i7qixcpt40yz0vr41','ZGM3MDg3ZDBlNGYxZjQzM2ZiNjUwZTk4YWY2N2Q0MTM3ZDgwYWViODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OWRmNTI4M2JkYjhhZDg2MzBmYWFmOTk0YzE4ZTAzN2U0Yzc0YjFmIiwidXNlciI6ImFkbWluIn0=','2019-06-11 14:56:17.137596'),('9gj9ei39jsty3kfyp0vv06eg05i1enk5','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2019-06-22 10:46:52.668909'),('aho9psi3o6qixvhejfu1fa84ehzf3kqf','N2YzNDU3MmM2NTY3NTgwYWUwZDNjMGQ1ZTgwZWYwYWZmZmNiZDJjZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OWRmNTI4M2JkYjhhZDg2MzBmYWFmOTk0YzE4ZTAzN2U0Yzc0YjFmIn0=','2019-06-11 12:56:04.780020'),('alcqwhqzs1b3s1ed1fyln5xfxluvwsfr','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2019-06-21 14:42:50.835647'),('aq488z7oketr1le82bx9s7unjcjkl0z0','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2020-03-08 10:08:46.105996'),('btczydyy4qow76mwyastnxjb3yu8pymg','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2019-06-22 14:31:55.245640'),('c9ufwj2n02ahf5lwxmnhgafznmj8tr3k','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2019-10-02 14:36:02.745062'),('cm0th72996ay2r9wsnfjgzavjpbbr07e','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2019-06-22 03:06:25.703176'),('d5x8kd9uf10dadbc1j32a4382711hapn','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2019-06-22 11:32:59.198255'),('e6uehcgy1r8nm75jmduaf6fszccjsh5s','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2019-06-22 07:55:10.897157'),('etuwf96y43u56oqiu4x6fni2m4gw7am2','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2019-06-26 11:46:17.179608'),('f7lf6xkqpchc58ur6sbn0lz33rwb1olu','MmQ2YmNjYjU4MWE5YTJkNzMxMmM2Yjk3MmRkYTdhMmM5OTA1OTZmNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OWRmNTI4M2JkYjhhZDg2MzBmYWFmOTk0YzE4ZTAzN2U0Yzc0YjFmIiwidXNlciI6IkFkbWluIn0=','2020-02-17 07:24:51.882231'),('fl9nksdvqd77yli0utjijiesdnr7tluz','N2YzNDU3MmM2NTY3NTgwYWUwZDNjMGQ1ZTgwZWYwYWZmZmNiZDJjZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OWRmNTI4M2JkYjhhZDg2MzBmYWFmOTk0YzE4ZTAzN2U0Yzc0YjFmIn0=','2019-05-26 07:49:25.296416'),('fn15wzk2m9rizaqif77yuh3c2r1a1ufa','N2YzNDU3MmM2NTY3NTgwYWUwZDNjMGQ1ZTgwZWYwYWZmZmNiZDJjZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OWRmNTI4M2JkYjhhZDg2MzBmYWFmOTk0YzE4ZTAzN2U0Yzc0YjFmIn0=','2019-06-22 13:01:59.269942'),('fw749rlzmv5rreor1d0hnuovn4lbkiq1','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2020-03-08 11:11:11.664201'),('h580gmilb1huz8ca66l67w4acnnogvas','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2019-06-21 09:37:31.897912'),('h63akjkebsgl9xy17yj6kwy52gnyj2d8','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2020-03-08 09:37:16.636206'),('i8mle8ah2dd55ir129zeu26udd6bof9g','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2019-06-22 01:53:35.298138'),('iom84mm02ikpdve7p3hvycwvniparujq','ZWY2OWZhYWVkYWY3OTE3NjI5Mjk5ZDc3Y2VmMDVkMzhiZDIxZmQyODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNDlkZjUyODNiZGI4YWQ4NjMwZmFhZjk5NGMxOGUwMzdlNGM3NGIxZiIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2019-05-19 03:09:44.414295'),('iwqcakceefuhdbsdnopb04mpnjprhsph','N2YzNDU3MmM2NTY3NTgwYWUwZDNjMGQ1ZTgwZWYwYWZmZmNiZDJjZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OWRmNTI4M2JkYjhhZDg2MzBmYWFmOTk0YzE4ZTAzN2U0Yzc0YjFmIn0=','2019-06-11 13:46:37.357810'),('j2mpawhymcgo6vt2d3f1w9eps2ol1eio','N2YzNDU3MmM2NTY3NTgwYWUwZDNjMGQ1ZTgwZWYwYWZmZmNiZDJjZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OWRmNTI4M2JkYjhhZDg2MzBmYWFmOTk0YzE4ZTAzN2U0Yzc0YjFmIn0=','2019-06-02 11:30:57.322490'),('j7fcedhi3ve27oia5cnqbv003pwwl8s3','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2019-06-22 07:41:49.237873'),('jbxdw55p4n02406nuxarb19rv1ub6r5p','ZGM3MDg3ZDBlNGYxZjQzM2ZiNjUwZTk4YWY2N2Q0MTM3ZDgwYWViODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OWRmNTI4M2JkYjhhZDg2MzBmYWFmOTk0YzE4ZTAzN2U0Yzc0YjFmIiwidXNlciI6ImFkbWluIn0=','2019-09-13 13:46:53.778141'),('l3wyau28jjiv9jsknyyn2v7n316h3ntb','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2019-06-22 04:34:19.333087'),('l80j959w3wpbenilqvxpmom1e9mb63al','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2019-06-22 11:23:09.366622'),('m86xtgu4u3kgv8aqro9vx5spz4iush72','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2019-06-21 11:53:39.095403'),('meu611wwp4anpuyw8zosl03pp07uaj50','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2019-06-22 12:34:51.678685'),('mg9tl8wd0ghuygnce13hzku84i8jlen1','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2019-06-21 14:49:00.540153'),('mlwmhsmskiycv8bqyimbyk7naqmtzkmx','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2019-06-22 03:06:25.701604'),('mpg0ch94xeixd6yb6m9dc7p30a77w1q6','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2019-06-22 03:57:39.217832'),('msy5d543l90d2l6i8t3r5fhw9a2l5dxu','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2019-06-22 04:44:28.096702'),('n6c8as8zpze9cjou9x1t96tizyzcvsj9','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2019-06-21 09:05:12.573961'),('o3kbgf6hamkguk1iv20vzkdgp64fruht','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2019-06-22 02:53:47.606056'),('o638y4xvjw4125jrdu2yk061kpzh4wgk','N2YzNDU3MmM2NTY3NTgwYWUwZDNjMGQ1ZTgwZWYwYWZmZmNiZDJjZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OWRmNTI4M2JkYjhhZDg2MzBmYWFmOTk0YzE4ZTAzN2U0Yzc0YjFmIn0=','2019-06-02 14:34:13.518831'),('oiffosleqemxn3qy15y8jof1zgn55zxi','NDE2MmEzOWY0YmM0NDYwMTJjMWQ3YTkwMmIxMTdmNjM1NzQyMGI1OTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ZDkwMDE4NjhmNTFkYWIwOWFkMzAxM2FkYjg5YzE1Yzc2Yzg0MDE4IiwidXNlciI6IkFsb2UifQ==','2019-06-29 09:00:40.292311'),('oj0g5eiwh29z7uosshzk7fst772z7cqc','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2019-06-21 14:50:16.268905'),('pegiahf82qsnxhlaoujntecddgw68oyd','N2YzNDU3MmM2NTY3NTgwYWUwZDNjMGQ1ZTgwZWYwYWZmZmNiZDJjZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OWRmNTI4M2JkYjhhZDg2MzBmYWFmOTk0YzE4ZTAzN2U0Yzc0YjFmIn0=','2019-06-03 04:45:42.503252'),('pewwp1a4ixpg594v64srxi7hgi4qwzpr','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2019-06-22 02:51:11.155599'),('pymkvcm7rec5bshvkci0pzv8rbcm5z27','N2YzNDU3MmM2NTY3NTgwYWUwZDNjMGQ1ZTgwZWYwYWZmZmNiZDJjZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OWRmNTI4M2JkYjhhZDg2MzBmYWFmOTk0YzE4ZTAzN2U0Yzc0YjFmIn0=','2019-06-03 05:27:48.902062'),('rmuahk6nvfppy4h8lkhew1lc3tvgga9b','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2019-07-25 12:15:55.851207'),('rscb431awz7pzr0f3qqxqxo0y2g8vina','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2020-03-08 08:43:04.767229'),('te1oak70uwbafspcfd9ur7fxgia0ya4g','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2019-06-26 13:49:48.330407'),('uep02o13pcuerih74js6fzbbgwxigl8b','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2019-06-21 06:34:02.587113'),('uhuf0vvehho8cl9olcwv31q28wwtc5bi','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2019-06-21 14:53:17.315056'),('unyspg5dwhwjkvemlxh1voox6r2lpxbk','N2YzNDU3MmM2NTY3NTgwYWUwZDNjMGQ1ZTgwZWYwYWZmZmNiZDJjZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OWRmNTI4M2JkYjhhZDg2MzBmYWFmOTk0YzE4ZTAzN2U0Yzc0YjFmIn0=','2019-06-11 13:10:12.193214'),('v0wqdrevuuwc27mbz4lf27br6ko9ymvx','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2019-06-22 10:45:44.367561'),('v5va26anqemtcgystoappwmkxa47u4av','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2019-06-22 11:45:10.898546'),('vd9bgs2bccdyvaoagpx0vokd9uhoc9gi','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2019-06-24 02:34:58.777183'),('voymyvxe8vhfvi1e5ejpsa8n5r9l2ayv','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2019-06-16 08:23:18.159358'),('vz68ognnkci22faa66x0dg9ncq9tvlk4','N2YzNDU3MmM2NTY3NTgwYWUwZDNjMGQ1ZTgwZWYwYWZmZmNiZDJjZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OWRmNTI4M2JkYjhhZDg2MzBmYWFmOTk0YzE4ZTAzN2U0Yzc0YjFmIn0=','2019-07-15 13:06:55.503047'),('w1fnr71j6v4zxrp1qei99gu73o7c2mrq','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2019-07-06 13:53:51.152512'),('wljqqo847zrzj66tctfospi92ygizzje','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2019-09-17 14:56:20.703140'),('wsbeyude425bs3kl9mdi7bqak0n6hphy','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2019-10-22 14:39:16.823125'),('wswj4jaf267l0jwlh9s8qfwj9csonuxd','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2019-06-21 07:30:49.691558'),('wwlxj2ifa4592am2a9rfr0gp07daaqt6','N2YzNDU3MmM2NTY3NTgwYWUwZDNjMGQ1ZTgwZWYwYWZmZmNiZDJjZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OWRmNTI4M2JkYjhhZDg2MzBmYWFmOTk0YzE4ZTAzN2U0Yzc0YjFmIn0=','2019-06-07 05:45:51.798037'),('x705vtgzkpg5gu9802gviex943eiscun','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2019-06-21 14:39:07.915134'),('xhrea4fvbuhyoinh3kkbx9lf94yxj5oo','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2019-06-22 11:22:04.977899'),('xlb7s92vzqovn8qbyf3qlfe391uuoh8f','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2019-06-22 12:37:14.311483'),('xvq40sbughhlmeamppzd5x4knvano2tq','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2019-06-22 01:51:58.010773'),('y81kagu72xrud8bluaud1y8424mt6mfe','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2019-06-21 14:40:03.996861'),('yam7hm7s9nvv9ya23hvxwfb242vomy6n','ZGM3MDg3ZDBlNGYxZjQzM2ZiNjUwZTk4YWY2N2Q0MTM3ZDgwYWViODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OWRmNTI4M2JkYjhhZDg2MzBmYWFmOTk0YzE4ZTAzN2U0Yzc0YjFmIiwidXNlciI6ImFkbWluIn0=','2019-06-22 14:40:30.729820'),('ynvfglt38wblqkfbv51bj2dcdsgdrxwk','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2020-03-08 07:32:59.448976'),('yvb7g1o7fk1j2btgxufwnldqemnoxxgt','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2019-06-22 11:40:05.079207'),('z2agjeadxe7ck7uap3j1swxoo1i4z0dz','N2YzNDU3MmM2NTY3NTgwYWUwZDNjMGQ1ZTgwZWYwYWZmZmNiZDJjZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OWRmNTI4M2JkYjhhZDg2MzBmYWFmOTk0YzE4ZTAzN2U0Yzc0YjFmIn0=','2019-06-02 13:19:02.310493'),('z7788cascg21849kn39ge2mzzfve85lz','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2019-11-14 14:14:48.184093');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piggy_bank_debtsdb`
--

DROP TABLE IF EXISTS `piggy_bank_debtsdb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piggy_bank_debtsdb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `debtee` varchar(20) NOT NULL,
  `money` decimal(10,2) NOT NULL,
  `all_money` decimal(10,2) NOT NULL,
  `paid` decimal(10,2) NOT NULL,
  `all_paid` decimal(10,2) NOT NULL,
  `remaining` decimal(10,2) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piggy_bank_debtsdb`
--

LOCK TABLES `piggy_bank_debtsdb` WRITE;
/*!40000 ALTER TABLE `piggy_bank_debtsdb` DISABLE KEYS */;
INSERT INTO `piggy_bank_debtsdb` VALUES (1,'许智慧',90000.00,90000.00,0.00,0.00,90000.00,'2019-05-28 12:17:48.835911'),(2,'王茹会',20000.00,20000.00,0.00,0.00,20000.00,'2019-05-28 12:18:02.653412'),(3,'许学满',30000.00,30000.00,0.00,0.00,30000.00,'2019-05-28 12:18:23.714521'),(4,'许学然',10000.00,10000.00,0.00,0.00,10000.00,'2019-05-28 12:18:40.060138'),(5,'林根成',10000.00,10000.00,0.00,0.00,10000.00,'2019-05-28 12:57:12.503489'),(6,'李成龙',20000.00,20000.00,0.00,0.00,20000.00,'2019-05-28 12:57:26.640908'),(7,'沈钉友',20000.00,20000.00,0.00,0.00,20000.00,'2019-05-28 12:57:02.228710'),(8,'支付宝借呗',10000.00,10000.00,0.00,0.00,10000.00,'2019-05-28 14:19:28.221206'),(9,'支付宝借呗',0.00,10000.00,10000.00,10000.00,0.00,'2019-06-22 13:54:41.947682'),(15,'沈钉友',0.00,20000.00,20000.00,20000.00,0.00,'2019-07-11 12:49:04.332554'),(19,'许学然',0.00,10000.00,10000.00,10000.00,0.00,'2019-09-18 14:35:13.953842'),(20,'王茹会',0.00,20000.00,20000.00,20000.00,0.00,'2019-12-01 05:20:32.465027'),(21,'李成龙',0.00,20000.00,20000.00,20000.00,0.00,'2020-02-03 07:36:36.987029'),(22,'林根成',0.00,10000.00,10000.00,10000.00,0.00,'2020-02-03 07:37:31.951367');
/*!40000 ALTER TABLE `piggy_bank_debtsdb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piggy_bank_incomdb`
--

DROP TABLE IF EXISTS `piggy_bank_incomdb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piggy_bank_incomdb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `monthly` varchar(20) DEFAULT NULL,
  `last_balance` decimal(10,2) NOT NULL,
  `salary` decimal(10,2) NOT NULL,
  `other_income` decimal(10,2) NOT NULL,
  `payments` decimal(10,2) NOT NULL,
  `expected_balance` decimal(10,2) NOT NULL,
  `actual_balance` decimal(10,2) NOT NULL,
  `balance_diff` decimal(10,2) NOT NULL,
  `actual_income` decimal(10,2) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `Year_id` int(11) DEFAULT NULL,
  `comment` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `piggy_bank_incomdb_Year_id_38e3259f_fk_piggy_bank_yeardb_id` (`Year_id`),
  CONSTRAINT `piggy_bank_incomdb_Year_id_38e3259f_fk_piggy_bank_yeardb_id` FOREIGN KEY (`Year_id`) REFERENCES `piggy_bank_yeardb` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piggy_bank_incomdb`
--

LOCK TABLES `piggy_bank_incomdb` WRITE;
/*!40000 ALTER TABLE `piggy_bank_incomdb` DISABLE KEYS */;
INSERT INTO `piggy_bank_incomdb` VALUES (1,'4月',135555.82,9092.45,399.91,1927.74,143120.44,142633.00,487.44,7077.18,'2019-05-19 13:20:15.487393',1,'第一笔账'),(10,'5月',142633.00,9000.00,330000.00,429904.93,51728.07,53313.61,-1585.54,-89319.39,'2019-05-28 14:58:29.869844',1,'买房，借款28万，王洋还款5万，首付款427977'),(13,'6月',53313.61,9697.33,27.77,5958.39,57080.32,45935.92,11144.40,-7377.69,'2019-08-30 14:01:59.631730',1,'理财提现10000还了蚂蚁借呗'),(14,'7月',45935.92,12074.25,24.41,7537.28,50497.30,30497.30,20000.00,-15438.62,'2019-08-30 14:08:00.241351',1,'还老妈朋友20000'),(16,'8月',30497.30,12074.25,31.02,7394.48,35208.09,34564.56,643.53,4067.26,'2019-08-30 14:05:39.186082',1,''),(17,'9月',34564.56,12008.25,26.50,8232.42,38366.89,26712.43,11654.46,-7852.13,'2019-09-30 15:12:48.952300',1,'还二爷10000'),(18,'10月',26712.43,12008.25,23.41,7853.80,30890.29,30958.50,-68.21,4246.07,'2019-10-31 14:29:03.560338',1,''),(19,'11月',30958.50,12008.25,-139.00,8512.70,34315.05,14284.75,20030.30,-16673.75,'2019-12-01 05:19:14.153352',1,'还茹会20000'),(20,'12月',14284.75,11663.66,51.91,8700.81,17299.51,16592.15,707.36,2307.40,'2020-01-07 13:35:12.489583',1,''),(21,'1月',16592.15,35970.18,173.25,10340.67,42394.91,22898.25,19496.66,6306.10,'2020-02-03 07:33:25.085874',2,'还小姨夫20000');
/*!40000 ALTER TABLE `piggy_bank_incomdb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piggy_bank_yeardb`
--

DROP TABLE IF EXISTS `piggy_bank_yeardb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piggy_bank_yeardb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piggy_bank_yeardb`
--

LOCK TABLES `piggy_bank_yeardb` WRITE;
/*!40000 ALTER TABLE `piggy_bank_yeardb` DISABLE KEYS */;
INSERT INTO `piggy_bank_yeardb` VALUES (1,'2019'),(2,'2020');
/*!40000 ALTER TABLE `piggy_bank_yeardb` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-23 19:32:46
