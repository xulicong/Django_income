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
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$150000$FRzd1jvx2axv$6mu7ZCQp1VWujH0z6EuWidZk8SjKk/BAcM5Yburq/mI=','2019-05-28 14:56:17.134543',1,'admin','','','401719568@qq.com',1,1,'2019-05-05 02:53:05.310948'),(2,'pbkdf2_sha256$150000$1yXHeo6uaR4P$44MJgeDgdb6JyspTmWeMBcED7jSoZc9S5+e/Wdau98A=','2019-06-07 07:30:49.688301',0,'Lison','立聪','许','401719568@qq.com',1,1,'2019-05-12 08:07:00.000000'),(3,'pbkdf2_sha256$150000$hWQsZzpKicse$fBuQ+9VyKfH4hKiOgcuxSojEoe09i4Tr8s8Npfm9pFk=',NULL,0,'Aloe','茹会','王','',1,1,'2019-05-12 08:08:00.000000');
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-05-12 08:07:57.326612','2','Lison',1,'[{\"added\": {}}]',2,1),(2,'2019-05-12 08:08:14.222901','2','Lison',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"email\", \"is_staff\"]}}]',2,1),(3,'2019-05-12 08:08:39.673728','3','Aloe',1,'[{\"added\": {}}]',2,1),(4,'2019-05-12 08:08:56.081776','3','Aloe',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"is_staff\"]}}]',2,1),(5,'2019-05-19 11:33:11.594600','1','2019 5月',2,'[{\"changed\": {\"fields\": [\"comment\"]}}]',8,1),(6,'2019-05-19 13:20:15.488398','1','2019 4月',2,'[{\"changed\": {\"fields\": [\"monthly\"]}}]',8,1),(7,'2019-05-28 12:57:02.229615','7','沈钉友',2,'[{\"changed\": {\"fields\": [\"debtee\"]}}]',9,1),(8,'2019-05-28 12:57:12.504401','5','林根成',2,'[{\"changed\": {\"fields\": [\"debtee\"]}}]',9,1),(9,'2019-05-28 12:57:26.641830','6','李成龙',2,'[{\"changed\": {\"fields\": [\"debtee\"]}}]',9,1),(10,'2019-05-28 13:12:37.828256','2','2019 5月',3,'',8,1),(11,'2019-05-28 13:15:22.126216','3','2019 5月',3,'',8,1),(12,'2019-05-28 13:26:33.126588','4','2019 5月',3,'',8,1),(13,'2019-05-28 13:46:49.508927','5','2019 5月',3,'',8,1),(14,'2019-05-28 13:49:07.150957','6','2019 5月',3,'',8,1),(15,'2019-05-28 14:21:41.560820','7','2019 5月',3,'',8,1),(16,'2019-05-28 14:26:15.682004','8','2019 5月',3,'',8,1),(17,'2019-05-28 14:28:24.491776','9','2019 5月',3,'',8,1),(18,'2019-05-28 14:58:29.880010','10','2019 5月',2,'[{\"changed\": {\"fields\": [\"comment\"]}}]',8,1);
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
INSERT INTO `django_session` VALUES ('0bynvgnm5t8xze9yqr1lfl3kwt3sxktu','N2YzNDU3MmM2NTY3NTgwYWUwZDNjMGQ1ZTgwZWYwYWZmZmNiZDJjZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OWRmNTI4M2JkYjhhZDg2MzBmYWFmOTk0YzE4ZTAzN2U0Yzc0YjFmIn0=','2019-06-10 02:55:25.495203'),('32lyxx7kvm9jtcd5lxthd0uhkc5btd3g','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2019-06-21 05:56:13.763066'),('3bh01i8w3ywdxxwj25h92gkqno8hthqo','N2YzNDU3MmM2NTY3NTgwYWUwZDNjMGQ1ZTgwZWYwYWZmZmNiZDJjZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OWRmNTI4M2JkYjhhZDg2MzBmYWFmOTk0YzE4ZTAzN2U0Yzc0YjFmIn0=','2019-06-04 01:39:07.002943'),('71kxz0apv08pretsc72jvrtbah751m88','N2YzNDU3MmM2NTY3NTgwYWUwZDNjMGQ1ZTgwZWYwYWZmZmNiZDJjZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OWRmNTI4M2JkYjhhZDg2MzBmYWFmOTk0YzE4ZTAzN2U0Yzc0YjFmIn0=','2019-05-31 05:44:04.235346'),('7js8y3jrbz6x1u3ftf3hvh9fjgs30a59','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2019-06-13 03:29:18.688994'),('81g7oz07sx4riqtlimk6mokxsevxyvfv','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2019-06-16 06:26:51.757267'),('82bxubqfg2dfuiwacnr7h8att921p3yy','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2019-06-21 03:50:06.352349'),('9766nwkqcjoyyc8i7qixcpt40yz0vr41','ZGM3MDg3ZDBlNGYxZjQzM2ZiNjUwZTk4YWY2N2Q0MTM3ZDgwYWViODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OWRmNTI4M2JkYjhhZDg2MzBmYWFmOTk0YzE4ZTAzN2U0Yzc0YjFmIiwidXNlciI6ImFkbWluIn0=','2019-06-11 14:56:17.137596'),('aho9psi3o6qixvhejfu1fa84ehzf3kqf','N2YzNDU3MmM2NTY3NTgwYWUwZDNjMGQ1ZTgwZWYwYWZmZmNiZDJjZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OWRmNTI4M2JkYjhhZDg2MzBmYWFmOTk0YzE4ZTAzN2U0Yzc0YjFmIn0=','2019-06-11 12:56:04.780020'),('fl9nksdvqd77yli0utjijiesdnr7tluz','N2YzNDU3MmM2NTY3NTgwYWUwZDNjMGQ1ZTgwZWYwYWZmZmNiZDJjZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OWRmNTI4M2JkYjhhZDg2MzBmYWFmOTk0YzE4ZTAzN2U0Yzc0YjFmIn0=','2019-05-26 07:49:25.296416'),('iom84mm02ikpdve7p3hvycwvniparujq','ZWY2OWZhYWVkYWY3OTE3NjI5Mjk5ZDc3Y2VmMDVkMzhiZDIxZmQyODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNDlkZjUyODNiZGI4YWQ4NjMwZmFhZjk5NGMxOGUwMzdlNGM3NGIxZiIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2019-05-19 03:09:44.414295'),('iwqcakceefuhdbsdnopb04mpnjprhsph','N2YzNDU3MmM2NTY3NTgwYWUwZDNjMGQ1ZTgwZWYwYWZmZmNiZDJjZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OWRmNTI4M2JkYjhhZDg2MzBmYWFmOTk0YzE4ZTAzN2U0Yzc0YjFmIn0=','2019-06-11 13:46:37.357810'),('j2mpawhymcgo6vt2d3f1w9eps2ol1eio','N2YzNDU3MmM2NTY3NTgwYWUwZDNjMGQ1ZTgwZWYwYWZmZmNiZDJjZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OWRmNTI4M2JkYjhhZDg2MzBmYWFmOTk0YzE4ZTAzN2U0Yzc0YjFmIn0=','2019-06-02 11:30:57.322490'),('o638y4xvjw4125jrdu2yk061kpzh4wgk','N2YzNDU3MmM2NTY3NTgwYWUwZDNjMGQ1ZTgwZWYwYWZmZmNiZDJjZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OWRmNTI4M2JkYjhhZDg2MzBmYWFmOTk0YzE4ZTAzN2U0Yzc0YjFmIn0=','2019-06-02 14:34:13.518831'),('pegiahf82qsnxhlaoujntecddgw68oyd','N2YzNDU3MmM2NTY3NTgwYWUwZDNjMGQ1ZTgwZWYwYWZmZmNiZDJjZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OWRmNTI4M2JkYjhhZDg2MzBmYWFmOTk0YzE4ZTAzN2U0Yzc0YjFmIn0=','2019-06-03 04:45:42.503252'),('pymkvcm7rec5bshvkci0pzv8rbcm5z27','N2YzNDU3MmM2NTY3NTgwYWUwZDNjMGQ1ZTgwZWYwYWZmZmNiZDJjZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OWRmNTI4M2JkYjhhZDg2MzBmYWFmOTk0YzE4ZTAzN2U0Yzc0YjFmIn0=','2019-06-03 05:27:48.902062'),('uep02o13pcuerih74js6fzbbgwxigl8b','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2019-06-21 06:34:02.587113'),('unyspg5dwhwjkvemlxh1voox6r2lpxbk','N2YzNDU3MmM2NTY3NTgwYWUwZDNjMGQ1ZTgwZWYwYWZmZmNiZDJjZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OWRmNTI4M2JkYjhhZDg2MzBmYWFmOTk0YzE4ZTAzN2U0Yzc0YjFmIn0=','2019-06-11 13:10:12.193214'),('voymyvxe8vhfvi1e5ejpsa8n5r9l2ayv','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2019-06-16 08:23:18.159358'),('wswj4jaf267l0jwlh9s8qfwj9csonuxd','M2JkZTFhMGQ1NWVhYzdlZTQ4ZTZhMzNkMTY4ZGQ0MGI0NzU5OTQzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzkzZmFmOWQxZTk2NDVhMTlkNDQ2YWZjMWYxYmQ1ZWY1OWU2MDc5IiwidXNlciI6Ikxpc29uIn0=','2019-06-21 07:30:49.691558'),('wwlxj2ifa4592am2a9rfr0gp07daaqt6','N2YzNDU3MmM2NTY3NTgwYWUwZDNjMGQ1ZTgwZWYwYWZmZmNiZDJjZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OWRmNTI4M2JkYjhhZDg2MzBmYWFmOTk0YzE4ZTAzN2U0Yzc0YjFmIn0=','2019-06-07 05:45:51.798037'),('z2agjeadxe7ck7uap3j1swxoo1i4z0dz','N2YzNDU3MmM2NTY3NTgwYWUwZDNjMGQ1ZTgwZWYwYWZmZmNiZDJjZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OWRmNTI4M2JkYjhhZDg2MzBmYWFmOTk0YzE4ZTAzN2U0Yzc0YjFmIn0=','2019-06-02 13:19:02.310493');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piggy_bank_debtsdb`
--

LOCK TABLES `piggy_bank_debtsdb` WRITE;
/*!40000 ALTER TABLE `piggy_bank_debtsdb` DISABLE KEYS */;
INSERT INTO `piggy_bank_debtsdb` VALUES (1,'许智慧',90000.00,90000.00,0.00,0.00,90000.00,'2019-05-28 12:17:48.835911'),(2,'王茹会',20000.00,20000.00,0.00,0.00,20000.00,'2019-05-28 12:18:02.653412'),(3,'许学满',30000.00,30000.00,0.00,0.00,30000.00,'2019-05-28 12:18:23.714521'),(4,'许学然',10000.00,10000.00,0.00,0.00,10000.00,'2019-05-28 12:18:40.060138'),(5,'林根成',10000.00,10000.00,0.00,0.00,10000.00,'2019-05-28 12:57:12.503489'),(6,'李成龙',20000.00,20000.00,0.00,0.00,20000.00,'2019-05-28 12:57:26.640908'),(7,'沈钉友',20000.00,20000.00,0.00,0.00,20000.00,'2019-05-28 12:57:02.228710'),(8,'支付宝借呗',10000.00,10000.00,0.00,0.00,10000.00,'2019-05-28 14:19:28.221206');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piggy_bank_incomdb`
--

LOCK TABLES `piggy_bank_incomdb` WRITE;
/*!40000 ALTER TABLE `piggy_bank_incomdb` DISABLE KEYS */;
INSERT INTO `piggy_bank_incomdb` VALUES (1,'4月',135555.82,9092.45,399.91,1927.74,143120.44,142633.00,487.44,7077.18,'2019-05-19 13:20:15.487393',1,'第一笔账'),(10,'5月',142633.00,9000.00,330000.00,429904.93,51728.07,53313.61,-1585.54,-89319.39,'2019-05-28 14:58:29.869844',1,'买房，借款28万，王洋还款5万，首付款427977');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piggy_bank_yeardb`
--

LOCK TABLES `piggy_bank_yeardb` WRITE;
/*!40000 ALTER TABLE `piggy_bank_yeardb` DISABLE KEYS */;
INSERT INTO `piggy_bank_yeardb` VALUES (1,'2019');
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

-- Dump completed on 2019-06-07 15:45:58
