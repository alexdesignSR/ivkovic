-- MySQL dump 10.13  Distrib 5.7.24, for Win64 (x86_64)
--
-- Host: localhost    Database: ivkovic
-- ------------------------------------------------------
-- Server version	5.7.24

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
-- Table structure for table `wp_actionscheduler_actions`
--

DROP TABLE IF EXISTS `wp_actionscheduler_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_actionscheduler_actions` (
  `action_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `hook` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `scheduled_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scheduled_date_local` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `args` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `schedule` longtext COLLATE utf8mb4_unicode_520_ci,
  `group_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `attempts` int(11) NOT NULL DEFAULT '0',
  `last_attempt_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_attempt_local` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `claim_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `extended_args` varchar(8000) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`action_id`),
  KEY `hook` (`hook`),
  KEY `status` (`status`),
  KEY `scheduled_date_gmt` (`scheduled_date_gmt`),
  KEY `args` (`args`),
  KEY `group_id` (`group_id`),
  KEY `last_attempt_gmt` (`last_attempt_gmt`),
  KEY `claim_id` (`claim_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_actionscheduler_actions`
--

LOCK TABLES `wp_actionscheduler_actions` WRITE;
/*!40000 ALTER TABLE `wp_actionscheduler_actions` DISABLE KEYS */;
INSERT INTO `wp_actionscheduler_actions` VALUES (27,'action_scheduler/migration_hook','complete','2021-05-29 17:54:28','2021-05-29 19:54:28','[]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1622310868;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1622310868;}',1,1,'2021-05-29 17:54:45','2021-05-29 19:54:45',0,NULL),(28,'woocommerce_update_marketplace_suggestions','complete','2021-05-29 20:58:31','2021-05-29 22:58:31','[]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1622321911;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1622321911;}',0,1,'2021-05-29 20:59:18','2021-05-29 22:59:18',0,NULL);
/*!40000 ALTER TABLE `wp_actionscheduler_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_actionscheduler_claims`
--

DROP TABLE IF EXISTS `wp_actionscheduler_claims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_actionscheduler_claims` (
  `claim_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `date_created_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`claim_id`),
  KEY `date_created_gmt` (`date_created_gmt`)
) ENGINE=InnoDB AUTO_INCREMENT=347 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_actionscheduler_claims`
--

LOCK TABLES `wp_actionscheduler_claims` WRITE;
/*!40000 ALTER TABLE `wp_actionscheduler_claims` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_actionscheduler_claims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_actionscheduler_groups`
--

DROP TABLE IF EXISTS `wp_actionscheduler_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_actionscheduler_groups` (
  `group_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `slug` (`slug`(191))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_actionscheduler_groups`
--

LOCK TABLES `wp_actionscheduler_groups` WRITE;
/*!40000 ALTER TABLE `wp_actionscheduler_groups` DISABLE KEYS */;
INSERT INTO `wp_actionscheduler_groups` VALUES (1,'action-scheduler-migration');
/*!40000 ALTER TABLE `wp_actionscheduler_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_actionscheduler_logs`
--

DROP TABLE IF EXISTS `wp_actionscheduler_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_actionscheduler_logs` (
  `log_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `action_id` bigint(20) unsigned NOT NULL,
  `message` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `log_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `log_date_local` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`log_id`),
  KEY `action_id` (`action_id`),
  KEY `log_date_gmt` (`log_date_gmt`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_actionscheduler_logs`
--

LOCK TABLES `wp_actionscheduler_logs` WRITE;
/*!40000 ALTER TABLE `wp_actionscheduler_logs` DISABLE KEYS */;
INSERT INTO `wp_actionscheduler_logs` VALUES (1,27,'action created','2021-05-29 17:53:28','2021-05-29 19:53:28'),(2,27,'action started via Async Request','2021-05-29 17:54:45','2021-05-29 19:54:45'),(3,27,'action complete via Async Request','2021-05-29 17:54:45','2021-05-29 19:54:45'),(4,28,'action created','2021-05-29 20:58:31','2021-05-29 22:58:31'),(5,28,'action started via Async Request','2021-05-29 20:59:17','2021-05-29 22:59:17'),(6,28,'action complete via Async Request','2021-05-29 20:59:18','2021-05-29 22:59:18');
/*!40000 ALTER TABLE `wp_actionscheduler_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_commentmeta`
--

DROP TABLE IF EXISTS `wp_commentmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_commentmeta`
--

LOCK TABLES `wp_commentmeta` WRITE;
/*!40000 ALTER TABLE `wp_commentmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_commentmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_comments`
--

DROP TABLE IF EXISTS `wp_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'comment',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10)),
  KEY `woo_idx_comment_type` (`comment_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_comments`
--

LOCK TABLES `wp_comments` WRITE;
/*!40000 ALTER TABLE `wp_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_icl_content_status`
--

DROP TABLE IF EXISTS `wp_icl_content_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_icl_content_status` (
  `rid` bigint(20) NOT NULL,
  `nid` bigint(20) NOT NULL,
  `timestamp` datetime NOT NULL,
  `md5` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`rid`),
  KEY `nid` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_icl_content_status`
--

LOCK TABLES `wp_icl_content_status` WRITE;
/*!40000 ALTER TABLE `wp_icl_content_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_icl_content_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_icl_core_status`
--

DROP TABLE IF EXISTS `wp_icl_core_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_icl_core_status` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rid` bigint(20) NOT NULL,
  `module` varchar(16) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `origin` varchar(64) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `target` varchar(64) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `status` smallint(6) NOT NULL,
  `tp_revision` int(11) NOT NULL DEFAULT '1',
  `ts_status` text COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_icl_core_status`
--

LOCK TABLES `wp_icl_core_status` WRITE;
/*!40000 ALTER TABLE `wp_icl_core_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_icl_core_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_icl_flags`
--

DROP TABLE IF EXISTS `wp_icl_flags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_icl_flags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang_code` varchar(10) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `flag` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `from_template` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `lang_code` (`lang_code`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_icl_flags`
--

LOCK TABLES `wp_icl_flags` WRITE;
/*!40000 ALTER TABLE `wp_icl_flags` DISABLE KEYS */;
INSERT INTO `wp_icl_flags` VALUES (1,'ar','ar.png',0),(2,'az','az.png',0),(3,'bg','bg.png',0),(4,'bn','bn.png',0),(5,'bs','bs.png',0),(6,'ca','ca.png',0),(7,'cs','cs.png',0),(8,'cy','cy.png',0),(9,'da','da.png',0),(10,'de','de.png',0),(11,'el','el.png',0),(12,'en','en.png',0),(13,'eo','eo.png',0),(14,'es','es.png',0),(15,'et','et.png',0),(16,'eu','eu.png',0),(17,'fa','fa.png',0),(18,'fi','fi.png',0),(19,'fr','fr.png',0),(20,'ga','ga.png',0),(21,'gl','gl.png',0),(22,'he','he.png',0),(23,'hi','hi.png',0),(24,'hr','hr.png',0),(25,'hu','hu.png',0),(26,'hy','hy.png',0),(27,'id','id.png',0),(28,'is','is.png',0),(29,'it','it.png',0),(30,'ja','ja.png',0),(31,'ko','ko.png',0),(32,'ku','ku.png',0),(33,'lt','lt.png',0),(34,'lv','lv.png',0),(35,'mk','mk.png',0),(36,'mn','mn.png',0),(37,'ms','ms.png',0),(38,'mt','mt.png',0),(39,'ne','ne.png',0),(40,'nl','nl.png',0),(41,'no','no.png',0),(42,'pa','pa.png',0),(43,'pl','pl.png',0),(44,'pt-br','pt-br.png',0),(45,'pt-pt','pt-pt.png',0),(46,'qu','qu.png',0),(47,'ro','ro.png',0),(48,'ru','ru.png',0),(49,'sk','sk.png',0),(50,'sl','sl.png',0),(51,'so','so.png',0),(52,'sq','sq.png',0),(53,'sr','sr.png',0),(54,'sv','sv.png',0),(55,'ta','ta.png',0),(56,'th','th.png',0),(57,'tr','tr.png',0),(58,'uk','uk.png',0),(59,'ur','ur.png',0),(60,'uz','uz.png',0),(61,'vi','vi.png',0),(62,'yi','yi.png',0),(63,'zh-hans','zh.png',0),(64,'zh-hant','zh.png',0),(65,'zu','zu.png',0);
/*!40000 ALTER TABLE `wp_icl_flags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_icl_languages`
--

DROP TABLE IF EXISTS `wp_icl_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_icl_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(7) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `english_name` varchar(128) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `major` tinyint(4) NOT NULL DEFAULT '0',
  `active` tinyint(4) NOT NULL,
  `default_locale` varchar(35) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `tag` varchar(35) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `encode_url` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `english_name` (`english_name`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_icl_languages`
--

LOCK TABLES `wp_icl_languages` WRITE;
/*!40000 ALTER TABLE `wp_icl_languages` DISABLE KEYS */;
INSERT INTO `wp_icl_languages` VALUES (1,'en','English',1,1,'en_US','en',0),(2,'es','Spanish',1,0,'es_ES','es',0),(3,'de','German',1,0,'de_DE','de',0),(4,'fr','French',1,0,'fr_FR','fr',0),(5,'ar','Arabic',0,0,'ar','ar',0),(6,'bs','Bosnian',0,0,'bs_BA','bs',0),(7,'bg','Bulgarian',0,0,'bg_BG','bg',0),(8,'ca','Catalan',0,0,'ca','ca',0),(9,'cs','Czech',0,0,'cs_CZ','cs',0),(10,'sk','Slovak',0,0,'sk_SK','sk',0),(11,'cy','Welsh',0,0,'cy_GB','cy',0),(12,'da','Danish',1,0,'da_DK','da',0),(13,'el','Greek',0,0,'el','el',0),(14,'eo','Esperanto',0,0,'eo_UY','eo',0),(15,'et','Estonian',0,0,'et','et',0),(16,'eu','Basque',0,0,'eu_ES','eu',0),(17,'fa','Persian',0,0,'fa_IR','fa',0),(18,'fi','Finnish',0,0,'fi','fi',0),(19,'ga','Irish',0,0,'ga_IE','ga',0),(20,'he','Hebrew',0,0,'he_IL','he',0),(21,'hi','Hindi',0,0,'hi_IN','hi',0),(22,'hr','Croatian',0,0,'hr','hr',0),(23,'hu','Hungarian',0,0,'hu_HU','hu',0),(24,'hy','Armenian',0,0,'hy_AM','hy',0),(25,'id','Indonesian',0,0,'id_ID','id',0),(26,'is','Icelandic',0,0,'is_IS','is',0),(27,'it','Italian',1,0,'it_IT','it',0),(28,'ja','Japanese',1,0,'ja','ja',0),(29,'ko','Korean',0,0,'ko_KR','ko',0),(30,'ku','Kurdish',0,0,'ckb','ku',0),(31,'lv','Latvian',0,0,'lv_LV','lv',0),(32,'lt','Lithuanian',0,0,'lt_LT','lt',0),(33,'mk','Macedonian',0,0,'mk_MK','mk',0),(34,'mt','Maltese',0,0,'mt_MT','mt',0),(35,'mn','Mongolian',0,0,'mn_MN','mn',0),(36,'ne','Nepali',0,0,'ne','ne',0),(37,'nl','Dutch',1,0,'nl_NL','nl',0),(38,'no','Norwegian Bokmål',0,0,'nb_NO','no',0),(39,'pa','Punjabi',0,0,'pa_IN','pa',0),(40,'pl','Polish',0,0,'pl_PL','pl',0),(41,'pt-pt','Portuguese, Portugal',0,0,'pt_PT','pt-pt',0),(42,'pt-br','Portuguese, Brazil',0,0,'pt_BR','pt-br',0),(43,'qu','Quechua',0,0,'quz_PE','qu',0),(44,'ro','Romanian',0,0,'ro_RO','ro',0),(45,'ru','Russian',1,0,'ru_RU','ru',0),(46,'sl','Slovenian',0,0,'sl_SI','sl',0),(47,'so','Somali',0,0,'so_SO','so',0),(48,'sq','Albanian',0,0,'sq_AL','sq',0),(49,'sr','Serbian',0,1,'sr_RS','sr',0),(50,'sv','Swedish',0,0,'sv_SE','sv',0),(51,'ta','Tamil',0,0,'ta_IN','ta',0),(52,'th','Thai',0,0,'th','th',0),(53,'tr','Turkish',0,0,'tr_TR','tr',0),(54,'uk','Ukrainian',0,0,'uk','uk',0),(55,'ur','Urdu',0,0,'ur','ur',0),(56,'uz','Uzbek',0,0,'uz_UZ','uz',0),(57,'vi','Vietnamese',0,0,'vi_VN','vi',0),(58,'yi','Yiddish',0,0,'','yi',0),(59,'zh-hans','Chinese (Simplified)',1,0,'zh_CN','zh-hans',0),(60,'zu','Zulu',0,0,'','zu',0),(61,'zh-hant','Chinese (Traditional)',1,0,'zh_TW','zh-hant',0),(62,'ms','Malay',0,0,'ms_MY','ms',0),(63,'gl','Galician',0,0,'gl_ES','gl',0),(64,'bn','Bengali',0,0,'bn_BD','bn',0),(65,'az','Azerbaijani',0,0,'az','az',0);
/*!40000 ALTER TABLE `wp_icl_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_icl_languages_translations`
--

DROP TABLE IF EXISTS `wp_icl_languages_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_icl_languages_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language_code` varchar(7) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `display_language_code` varchar(7) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `language_code` (`language_code`,`display_language_code`)
) ENGINE=InnoDB AUTO_INCREMENT=4226 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_icl_languages_translations`
--

LOCK TABLES `wp_icl_languages_translations` WRITE;
/*!40000 ALTER TABLE `wp_icl_languages_translations` DISABLE KEYS */;
INSERT INTO `wp_icl_languages_translations` VALUES (1,'en','en','ENG'),(2,'en','es','Inglés'),(3,'en','de','Englisch'),(4,'en','fr','Anglais'),(5,'en','ar','الإنجليزية'),(6,'en','bs','English'),(7,'en','bg','Английски'),(8,'en','ca','English'),(9,'en','cs','Angličtina'),(10,'en','sk','Angličtina'),(11,'en','cy','English'),(12,'en','da','English'),(13,'en','el','Αγγλικά'),(14,'en','eo','English'),(15,'en','et','English'),(16,'en','eu','English'),(17,'en','fa','English'),(18,'en','fi','englanti'),(19,'en','ga','English'),(20,'en','he','אנגלית'),(21,'en','hi','English'),(22,'en','hr','engleski'),(23,'en','hu','angol'),(24,'en','hy','English'),(25,'en','id','English'),(26,'en','is','English'),(27,'en','it','Inglese'),(28,'en','ja','英語'),(29,'en','ko','영어'),(30,'en','ku','English'),(31,'en','lv','English'),(32,'en','lt','English'),(33,'en','mk','English'),(34,'en','mt','English'),(35,'en','mn','English'),(36,'en','ne','English'),(37,'en','nl','Engels'),(38,'en','no','Engelsk'),(39,'en','pa','English'),(40,'en','pl','angielski'),(41,'en','pt-pt','Inglês'),(42,'en','pt-br','Inglês'),(43,'en','qu','English'),(44,'en','ro','Engleză'),(45,'en','ru','Английский'),(46,'en','sl','Angleščina'),(47,'en','so','English'),(48,'en','sq','English'),(49,'en','sr','ENG'),(50,'en','sv','Engelska'),(51,'en','ta','English'),(52,'en','th','อังกฤษ'),(53,'en','tr','İngilizce'),(54,'en','uk','English'),(55,'en','ur','English'),(56,'en','uz','English'),(57,'en','vi','English'),(58,'en','yi','English'),(59,'en','zh-hans','英语'),(60,'en','zu','English'),(61,'en','zh-hant','英語'),(62,'en','ms','English'),(63,'en','gl','English'),(64,'en','bn','English'),(65,'en','az','Ingilis'),(66,'es','en','Spanish'),(67,'es','es','Español'),(68,'es','de','Spanisch'),(69,'es','fr','Espagnol'),(70,'es','ar','الأسبانية'),(71,'es','bs','Spanish'),(72,'es','bg','Испански'),(73,'es','ca','Spanish'),(74,'es','cs','Španělský'),(75,'es','sk','Španielčina'),(76,'es','cy','Spanish'),(77,'es','da','Spanish'),(78,'es','el','Ισπανικά'),(79,'es','eo','Spanish'),(80,'es','et','Spanish'),(81,'es','eu','Spanish'),(82,'es','fa','Spanish'),(83,'es','fi','espanja'),(84,'es','ga','Spanish'),(85,'es','he','ספרדית'),(86,'es','hi','Spanish'),(87,'es','hr','španjolski'),(88,'es','hu','spanyol'),(89,'es','hy','Spanish'),(90,'es','id','Spanish'),(91,'es','is','Spanish'),(92,'es','it','Spagnolo'),(93,'es','ja','スペイン語'),(94,'es','ko','스페인어'),(95,'es','ku','Spanish'),(96,'es','lv','Spanish'),(97,'es','lt','Spanish'),(98,'es','mk','Spanish'),(99,'es','mt','Spanish'),(100,'es','mn','Spanish'),(101,'es','ne','Spanish'),(102,'es','nl','Spaans'),(103,'es','no','Spansk'),(104,'es','pa','Spanish'),(105,'es','pl','hiszpański'),(106,'es','pt-pt','Espanhol'),(107,'es','pt-br','Espanhol'),(108,'es','qu','Spanish'),(109,'es','ro','Spaniolă'),(110,'es','ru','Испанский'),(111,'es','sl','Španščina'),(112,'es','so','Spanish'),(113,'es','sq','Spanish'),(114,'es','sr','шпански'),(115,'es','sv','Spanska'),(116,'es','ta','Spanish'),(117,'es','th','สเปน'),(118,'es','tr','İspanyolca'),(119,'es','uk','Spanish'),(120,'es','ur','Spanish'),(121,'es','uz','Spanish'),(122,'es','vi','Spanish'),(123,'es','yi','Spanish'),(124,'es','zh-hans','西班牙语'),(125,'es','zu','Spanish'),(126,'es','zh-hant','西班牙語'),(127,'es','ms','Spanish'),(128,'es','gl','Spanish'),(129,'es','bn','Spanish'),(130,'es','az','Spanish'),(131,'de','en','German'),(132,'de','es','Alemán'),(133,'de','de','Deutsch'),(134,'de','fr','Allemand'),(135,'de','ar','الألمانية'),(136,'de','bs','German'),(137,'de','bg','Немски'),(138,'de','ca','German'),(139,'de','cs','Němec'),(140,'de','sk','Nemčina'),(141,'de','cy','German'),(142,'de','da','German'),(143,'de','el','Γερμανικά'),(144,'de','eo','German'),(145,'de','et','German'),(146,'de','eu','German'),(147,'de','fa','German'),(148,'de','fi','saksa'),(149,'de','ga','German'),(150,'de','he','גרמנית'),(151,'de','hi','German'),(152,'de','hr','njemački'),(153,'de','hu','német'),(154,'de','hy','German'),(155,'de','id','German'),(156,'de','is','German'),(157,'de','it','Tedesco'),(158,'de','ja','ドイツ語'),(159,'de','ko','독어'),(160,'de','ku','German'),(161,'de','lv','German'),(162,'de','lt','German'),(163,'de','mk','German'),(164,'de','mt','German'),(165,'de','mn','German'),(166,'de','ne','German'),(167,'de','nl','Duits'),(168,'de','no','Tysk'),(169,'de','pa','German'),(170,'de','pl','niemiecki'),(171,'de','pt-pt','Alemão'),(172,'de','pt-br','Alemão'),(173,'de','qu','German'),(174,'de','ro','Germană'),(175,'de','ru','Немецкий'),(176,'de','sl','Nemščina'),(177,'de','so','German'),(178,'de','sq','German'),(179,'de','sr','немачки'),(180,'de','sv','Tyska'),(181,'de','ta','German'),(182,'de','th','เยอรมัน'),(183,'de','tr','Almanca'),(184,'de','uk','German'),(185,'de','ur','German'),(186,'de','uz','German'),(187,'de','vi','German'),(188,'de','yi','German'),(189,'de','zh-hans','德语'),(190,'de','zu','German'),(191,'de','zh-hant','德語'),(192,'de','ms','German'),(193,'de','gl','German'),(194,'de','bn','German'),(195,'de','az','German'),(196,'fr','en','French'),(197,'fr','es','Francés'),(198,'fr','de','Französisch'),(199,'fr','fr','Français'),(200,'fr','ar','الفرنسية'),(201,'fr','bs','French'),(202,'fr','bg','Френски'),(203,'fr','ca','French'),(204,'fr','cs','Francouzština'),(205,'fr','sk','Francúzština'),(206,'fr','cy','French'),(207,'fr','da','French'),(208,'fr','el','Γαλλικά'),(209,'fr','eo','French'),(210,'fr','et','French'),(211,'fr','eu','French'),(212,'fr','fa','French'),(213,'fr','fi','ranska'),(214,'fr','ga','French'),(215,'fr','he','צרפתית'),(216,'fr','hi','French'),(217,'fr','hr','francuski'),(218,'fr','hu','francia'),(219,'fr','hy','French'),(220,'fr','id','French'),(221,'fr','is','French'),(222,'fr','it','Francese'),(223,'fr','ja','フランス語'),(224,'fr','ko','불어'),(225,'fr','ku','French'),(226,'fr','lv','French'),(227,'fr','lt','French'),(228,'fr','mk','French'),(229,'fr','mt','French'),(230,'fr','mn','French'),(231,'fr','ne','French'),(232,'fr','nl','Frans'),(233,'fr','no','Fransk'),(234,'fr','pa','French'),(235,'fr','pl','francuski'),(236,'fr','pt-pt','Francês'),(237,'fr','pt-br','Francês'),(238,'fr','qu','French'),(239,'fr','ro','Franceză'),(240,'fr','ru','Французский'),(241,'fr','sl','Francoščina'),(242,'fr','so','French'),(243,'fr','sq','French'),(244,'fr','sr','француски'),(245,'fr','sv','Franska'),(246,'fr','ta','French'),(247,'fr','th','ฝรั่งเศส'),(248,'fr','tr','Fransızca'),(249,'fr','uk','French'),(250,'fr','ur','French'),(251,'fr','uz','French'),(252,'fr','vi','French'),(253,'fr','yi','French'),(254,'fr','zh-hans','法语'),(255,'fr','zu','French'),(256,'fr','zh-hant','法語'),(257,'fr','ms','French'),(258,'fr','gl','French'),(259,'fr','bn','French'),(260,'fr','az','French'),(261,'ar','en','Arabic'),(262,'ar','es','Árabe'),(263,'ar','de','Arabisch'),(264,'ar','fr','Arabe'),(265,'ar','ar','العربية'),(266,'ar','bs','Arabic'),(267,'ar','bg','Арабски'),(268,'ar','ca','Arabic'),(269,'ar','cs','Arabština'),(270,'ar','sk','Arabčina'),(271,'ar','cy','Arabic'),(272,'ar','da','Arabic'),(273,'ar','el','Αραβικά'),(274,'ar','eo','Arabic'),(275,'ar','et','Arabic'),(276,'ar','eu','Arabic'),(277,'ar','fa','Arabic'),(278,'ar','fi','arabia'),(279,'ar','ga','Arabic'),(280,'ar','he','ערבית'),(281,'ar','hi','Arabic'),(282,'ar','hr','arapski'),(283,'ar','hu','arab'),(284,'ar','hy','Arabic'),(285,'ar','id','Arabic'),(286,'ar','is','Arabic'),(287,'ar','it','Arabo'),(288,'ar','ja','アラビア語'),(289,'ar','ko','아랍어'),(290,'ar','ku','Arabic'),(291,'ar','lv','Arabic'),(292,'ar','lt','Arabic'),(293,'ar','mk','Arabic'),(294,'ar','mt','Arabic'),(295,'ar','mn','Arabic'),(296,'ar','ne','Arabic'),(297,'ar','nl','Arabisch'),(298,'ar','no','Arabisk'),(299,'ar','pa','Arabic'),(300,'ar','pl','arabski'),(301,'ar','pt-pt','Árabe'),(302,'ar','pt-br','Árabe'),(303,'ar','qu','Arabic'),(304,'ar','ro','Arabică'),(305,'ar','ru','Арабский'),(306,'ar','sl','Arabščina'),(307,'ar','so','Arabic'),(308,'ar','sq','Arabic'),(309,'ar','sr','арапски'),(310,'ar','sv','Arabiska'),(311,'ar','ta','Arabic'),(312,'ar','th','อารบิก'),(313,'ar','tr','Arapça'),(314,'ar','uk','Arabic'),(315,'ar','ur','Arabic'),(316,'ar','uz','Arabic'),(317,'ar','vi','Arabic'),(318,'ar','yi','Arabic'),(319,'ar','zh-hans','阿拉伯语'),(320,'ar','zu','Arabic'),(321,'ar','zh-hant','阿拉伯語'),(322,'ar','ms','Arabic'),(323,'ar','gl','Arabic'),(324,'ar','bn','Arabic'),(325,'ar','az','Arabic'),(326,'bs','en','Bosnian'),(327,'bs','es','Bosnio'),(328,'bs','de','Bosnisch'),(329,'bs','fr','Bosnien'),(330,'bs','ar','البوسنية'),(331,'bs','bs','Bosnian'),(332,'bs','bg','Босненски'),(333,'bs','ca','Bosnian'),(334,'bs','cs','Bosenština'),(335,'bs','sk','Bosniačtina'),(336,'bs','cy','Bosnian'),(337,'bs','da','Bosnian'),(338,'bs','el','Βοσνιακά'),(339,'bs','eo','Bosnian'),(340,'bs','et','Bosnian'),(341,'bs','eu','Bosnian'),(342,'bs','fa','Bosnian'),(343,'bs','fi','bosnia'),(344,'bs','ga','Bosnian'),(345,'bs','he','בוסנית'),(346,'bs','hi','Bosnian'),(347,'bs','hr','bosanski'),(348,'bs','hu','bosnyák'),(349,'bs','hy','Bosnian'),(350,'bs','id','Bosnian'),(351,'bs','is','Bosnian'),(352,'bs','it','Bosniaco'),(353,'bs','ja','ボスニア語'),(354,'bs','ko','보즈니아어'),(355,'bs','ku','Bosnian'),(356,'bs','lv','Bosnian'),(357,'bs','lt','Bosnian'),(358,'bs','mk','Bosnian'),(359,'bs','mt','Bosnian'),(360,'bs','mn','Bosnian'),(361,'bs','ne','Bosnian'),(362,'bs','nl','Bosnisch'),(363,'bs','no','Bosnisk'),(364,'bs','pa','Bosnian'),(365,'bs','pl','bośniacki'),(366,'bs','pt-pt','Bósnio'),(367,'bs','pt-br','Bósnio'),(368,'bs','qu','Bosnian'),(369,'bs','ro','Bosniacă'),(370,'bs','ru','Боснийский'),(371,'bs','sl','Bosanski'),(372,'bs','so','Bosnian'),(373,'bs','sq','Bosnian'),(374,'bs','sr','босански'),(375,'bs','sv','Bosniska'),(376,'bs','ta','Bosnian'),(377,'bs','th','บอสเนียน'),(378,'bs','tr','Boşnakça'),(379,'bs','uk','Bosnian'),(380,'bs','ur','Bosnian'),(381,'bs','uz','Bosnian'),(382,'bs','vi','Bosnian'),(383,'bs','yi','Bosnian'),(384,'bs','zh-hans','波斯尼亚语'),(385,'bs','zu','Bosnian'),(386,'bs','zh-hant','波士尼亞語'),(387,'bs','ms','Bosnian'),(388,'bs','gl','Bosnian'),(389,'bs','bn','Bosnian'),(390,'bs','az','Bosnian'),(391,'bg','en','Bulgarian'),(392,'bg','es','Búlgaro'),(393,'bg','de','Bulgarisch'),(394,'bg','fr','Bulgare'),(395,'bg','ar','البلغارية'),(396,'bg','bs','Bulgarian'),(397,'bg','bg','Български'),(398,'bg','ca','Bulgarian'),(399,'bg','cs','Bulharština'),(400,'bg','sk','Bulharčina'),(401,'bg','cy','Bulgarian'),(402,'bg','da','Bulgarian'),(403,'bg','el','Βουλγαρικά'),(404,'bg','eo','Bulgarian'),(405,'bg','et','Bulgarian'),(406,'bg','eu','Bulgarian'),(407,'bg','fa','Bulgarian'),(408,'bg','fi','bulgaria'),(409,'bg','ga','Bulgarian'),(410,'bg','he','בולגרית'),(411,'bg','hi','Bulgarian'),(412,'bg','hr','bugarski'),(413,'bg','hu','bolgár'),(414,'bg','hy','Bulgarian'),(415,'bg','id','Bulgarian'),(416,'bg','is','Bulgarian'),(417,'bg','it','Bulgaro'),(418,'bg','ja','ブルガリア語'),(419,'bg','ko','불가리아어'),(420,'bg','ku','Bulgarian'),(421,'bg','lv','Bulgarian'),(422,'bg','lt','Bulgarian'),(423,'bg','mk','Bulgarian'),(424,'bg','mt','Bulgarian'),(425,'bg','mn','Bulgarian'),(426,'bg','ne','Bulgarian'),(427,'bg','nl','Bulgaars'),(428,'bg','no','Bulgarian'),(429,'bg','pa','Bulgarian'),(430,'bg','pl','bułgarski'),(431,'bg','pt-pt','Búlgaro'),(432,'bg','pt-br','Búlgaro'),(433,'bg','qu','Bulgarian'),(434,'bg','ro','Bulgară'),(435,'bg','ru','Болгарский'),(436,'bg','sl','Bolgarščina'),(437,'bg','so','Bulgarian'),(438,'bg','sq','Bulgarian'),(439,'bg','sr','бугарски'),(440,'bg','sv','Bulgariska'),(441,'bg','ta','Bulgarian'),(442,'bg','th','บัลแกเรียน'),(443,'bg','tr','Bulgarca'),(444,'bg','uk','Bulgarian'),(445,'bg','ur','Bulgarian'),(446,'bg','uz','Bulgarian'),(447,'bg','vi','Bulgarian'),(448,'bg','yi','Bulgarian'),(449,'bg','zh-hans','保加利亚语'),(450,'bg','zu','Bulgarian'),(451,'bg','zh-hant','保加利亞語'),(452,'bg','ms','Bulgarian'),(453,'bg','gl','Bulgarian'),(454,'bg','bn','Bulgarian'),(455,'bg','az','Bulgarian'),(456,'ca','en','Catalan'),(457,'ca','es','Catalán'),(458,'ca','de','Katalanisch'),(459,'ca','fr','Catalan'),(460,'ca','ar','الكاتالوينية'),(461,'ca','bs','Catalan'),(462,'ca','bg','Каталонски'),(463,'ca','ca','Català'),(464,'ca','cs','Katalánština'),(465,'ca','sk','Katalánčina'),(466,'ca','cy','Catalan'),(467,'ca','da','Catalan'),(468,'ca','el','Καταλανικά'),(469,'ca','eo','Catalan'),(470,'ca','et','Catalan'),(471,'ca','eu','Catalan'),(472,'ca','fa','Catalan'),(473,'ca','fi','katalaani'),(474,'ca','ga','Catalan'),(475,'ca','he','קטלאנית'),(476,'ca','hi','Catalan'),(477,'ca','hr','katalonski'),(478,'ca','hu','katalán'),(479,'ca','hy','Catalan'),(480,'ca','id','Catalan'),(481,'ca','is','Catalan'),(482,'ca','it','Catalano'),(483,'ca','ja','カタルーニャ語'),(484,'ca','ko','카탈로니아어'),(485,'ca','ku','Catalan'),(486,'ca','lv','Catalan'),(487,'ca','lt','Catalan'),(488,'ca','mk','Catalan'),(489,'ca','mt','Catalan'),(490,'ca','mn','Catalan'),(491,'ca','ne','Catalan'),(492,'ca','nl','Catalaans'),(493,'ca','no','catalan'),(494,'ca','pa','Catalan'),(495,'ca','pl','kataloński'),(496,'ca','pt-pt','Catalão'),(497,'ca','pt-br','Catalão'),(498,'ca','qu','Catalan'),(499,'ca','ro','Catalană'),(500,'ca','ru','Каталанский'),(501,'ca','sl','Katalonščina'),(502,'ca','so','Catalan'),(503,'ca','sq','Catalan'),(504,'ca','sr','каталонски'),(505,'ca','sv','Katalanska'),(506,'ca','ta','Catalan'),(507,'ca','th','คะตะลาน'),(508,'ca','tr','Katalan dili'),(509,'ca','uk','Catalan'),(510,'ca','ur','Catalan'),(511,'ca','uz','Catalan'),(512,'ca','vi','Catalan'),(513,'ca','yi','Catalan'),(514,'ca','zh-hans','加泰罗尼亚语'),(515,'ca','zu','Catalan'),(516,'ca','zh-hant','加泰羅尼亞語'),(517,'ca','ms','Catalan'),(518,'ca','gl','Catalan'),(519,'ca','bn','Catalan'),(520,'ca','az','Catalan'),(521,'cs','en','Czech'),(522,'cs','es','Checo'),(523,'cs','de','Tschechisch'),(524,'cs','fr','Tchèque'),(525,'cs','ar','التشيكية'),(526,'cs','bs','Czech'),(527,'cs','bg','Чешки'),(528,'cs','ca','Czech'),(529,'cs','cs','Čeština'),(530,'cs','sk','Čeština'),(531,'cs','cy','Czech'),(532,'cs','da','Czech'),(533,'cs','el','Τσεχικά'),(534,'cs','eo','Czech'),(535,'cs','et','Czech'),(536,'cs','eu','Czech'),(537,'cs','fa','Czech'),(538,'cs','fi','tsekki'),(539,'cs','ga','Czech'),(540,'cs','he','צ\'כית'),(541,'cs','hi','Czech'),(542,'cs','hr','češki'),(543,'cs','hu','cseh'),(544,'cs','hy','Czech'),(545,'cs','id','Czech'),(546,'cs','is','Czech'),(547,'cs','it','Ceco'),(548,'cs','ja','チェコ語'),(549,'cs','ko','체코슬로바키아어'),(550,'cs','ku','Czech'),(551,'cs','lv','Czech'),(552,'cs','lt','Czech'),(553,'cs','mk','Czech'),(554,'cs','mt','Czech'),(555,'cs','mn','Czech'),(556,'cs','ne','Czech'),(557,'cs','nl','Tsjechisch'),(558,'cs','no','Czech'),(559,'cs','pa','Czech'),(560,'cs','pl','czeski'),(561,'cs','pt-pt','Tcheco'),(562,'cs','pt-br','Tcheco'),(563,'cs','qu','Czech'),(564,'cs','ro','Cehă'),(565,'cs','ru','Чешский'),(566,'cs','sl','Češčina'),(567,'cs','so','Czech'),(568,'cs','sq','Czech'),(569,'cs','sr','чешки'),(570,'cs','sv','Tjeckiska'),(571,'cs','ta','Czech'),(572,'cs','th','เช็ก'),(573,'cs','tr','Çekçe'),(574,'cs','uk','Czech'),(575,'cs','ur','Czech'),(576,'cs','uz','Czech'),(577,'cs','vi','Czech'),(578,'cs','yi','Czech'),(579,'cs','zh-hans','捷克语'),(580,'cs','zu','Czech'),(581,'cs','zh-hant','捷克語'),(582,'cs','ms','Czech'),(583,'cs','gl','Czech'),(584,'cs','bn','Czech'),(585,'cs','az','Czech'),(586,'sk','en','Slovak'),(587,'sk','es','Eslavo'),(588,'sk','de','Slowakisch'),(589,'sk','fr','Slave'),(590,'sk','ar','السلافية'),(591,'sk','bs','Slovak'),(592,'sk','bg','Словашки'),(593,'sk','ca','Slovak'),(594,'sk','cs','Slovenština'),(595,'sk','sk','Slovenčina'),(596,'sk','cy','Slovak'),(597,'sk','da','Slovak'),(598,'sk','el','Σλαβική'),(599,'sk','eo','Slovak'),(600,'sk','et','Slovak'),(601,'sk','eu','Slovak'),(602,'sk','fa','Slovak'),(603,'sk','fi','slaavi'),(604,'sk','ga','Slovak'),(605,'sk','he','סלאבית'),(606,'sk','hi','Slovak'),(607,'sk','hr','slovački'),(608,'sk','hu','szlovák'),(609,'sk','hy','Slovak'),(610,'sk','id','Slovak'),(611,'sk','is','Slovak'),(612,'sk','it','Slavo'),(613,'sk','ja','スラヴ語派'),(614,'sk','ko','슬라브어'),(615,'sk','ku','Slovak'),(616,'sk','lv','Slovak'),(617,'sk','lt','Slovak'),(618,'sk','mk','Slovak'),(619,'sk','mt','Slovak'),(620,'sk','mn','Slovak'),(621,'sk','ne','Slovak'),(622,'sk','nl','Slavisch'),(623,'sk','no','Slovak'),(624,'sk','pa','Slovak'),(625,'sk','pl','słowacki'),(626,'sk','pt-pt','Eslavo'),(627,'sk','pt-br','Eslavo'),(628,'sk','qu','Slovak'),(629,'sk','ro','Slavă'),(630,'sk','ru','Славянский'),(631,'sk','sl','Slovaščina'),(632,'sk','so','Slovak'),(633,'sk','sq','Slovak'),(634,'sk','sr','словачки'),(635,'sk','sv','Slavisk'),(636,'sk','ta','Slovak'),(637,'sk','th','สลาวิก'),(638,'sk','tr','Slav dili'),(639,'sk','uk','Slovak'),(640,'sk','ur','Slovak'),(641,'sk','uz','Slovak'),(642,'sk','vi','Slovak'),(643,'sk','yi','Slovak'),(644,'sk','zh-hans','斯拉夫语'),(645,'sk','zu','Slovak'),(646,'sk','zh-hant','斯拉夫語'),(647,'sk','ms','Slovak'),(648,'sk','gl','Slovak'),(649,'sk','bn','Slovak'),(650,'sk','az','Slovak'),(651,'cy','en','Welsh'),(652,'cy','es','Galés'),(653,'cy','de','Walisisch'),(654,'cy','fr','Gallois'),(655,'cy','ar','الولزية'),(656,'cy','bs','Welsh'),(657,'cy','bg','Уелски'),(658,'cy','ca','Welsh'),(659,'cy','cs','Velšský'),(660,'cy','sk','Welština'),(661,'cy','cy','Cymraeg'),(662,'cy','da','Welsh'),(663,'cy','el','Oυαλικά'),(664,'cy','eo','Welsh'),(665,'cy','et','Welsh'),(666,'cy','eu','Welsh'),(667,'cy','fa','Welsh'),(668,'cy','fi','kymri'),(669,'cy','ga','Welsh'),(670,'cy','he','וולשית'),(671,'cy','hi','Welsh'),(672,'cy','hr','velški'),(673,'cy','hu','vels'),(674,'cy','hy','Welsh'),(675,'cy','id','Welsh'),(676,'cy','is','Welsh'),(677,'cy','it','Gallese'),(678,'cy','ja','ウェールズ語'),(679,'cy','ko','웨일즈어'),(680,'cy','ku','Welsh'),(681,'cy','lv','Welsh'),(682,'cy','lt','Welsh'),(683,'cy','mk','Welsh'),(684,'cy','mt','Welsh'),(685,'cy','mn','Welsh'),(686,'cy','ne','Welsh'),(687,'cy','nl','Welsh'),(688,'cy','no','Welsh'),(689,'cy','pa','Welsh'),(690,'cy','pl','walijski'),(691,'cy','pt-pt','Galês'),(692,'cy','pt-br','Galês'),(693,'cy','qu','Welsh'),(694,'cy','ro','Galeză'),(695,'cy','ru','Валлийский'),(696,'cy','sl','Welsh'),(697,'cy','so','Welsh'),(698,'cy','sq','Welsh'),(699,'cy','sr','велшки'),(700,'cy','sv','Walesiska'),(701,'cy','ta','Welsh'),(702,'cy','th','เวลช์'),(703,'cy','tr','Galce'),(704,'cy','uk','Welsh'),(705,'cy','ur','Welsh'),(706,'cy','uz','Welsh'),(707,'cy','vi','Welsh'),(708,'cy','yi','Welsh'),(709,'cy','zh-hans','威尔士语'),(710,'cy','zu','Welsh'),(711,'cy','zh-hant','威爾士語'),(712,'cy','ms','Welsh'),(713,'cy','gl','Welsh'),(714,'cy','bn','Welsh'),(715,'cy','az','Welsh'),(716,'da','en','Danish'),(717,'da','es','Danés'),(718,'da','de','Dänisch'),(719,'da','fr','Danois'),(720,'da','ar','الدانماركية'),(721,'da','bs','Danish'),(722,'da','bg','Датски'),(723,'da','ca','Danish'),(724,'da','cs','Dánský'),(725,'da','sk','Dánčina'),(726,'da','cy','Danish'),(727,'da','da','Dansk'),(728,'da','el','Δανέζικα'),(729,'da','eo','Danish'),(730,'da','et','Danish'),(731,'da','eu','Danish'),(732,'da','fa','Danish'),(733,'da','fi','tanska'),(734,'da','ga','Danish'),(735,'da','he','דנית'),(736,'da','hi','Danish'),(737,'da','hr','danski'),(738,'da','hu','dán'),(739,'da','hy','Danish'),(740,'da','id','Danish'),(741,'da','is','Danish'),(742,'da','it','Danese'),(743,'da','ja','デンマーク語'),(744,'da','ko','덴마크어'),(745,'da','ku','Danish'),(746,'da','lv','Danish'),(747,'da','lt','Danish'),(748,'da','mk','Danish'),(749,'da','mt','Danish'),(750,'da','mn','Danish'),(751,'da','ne','Danish'),(752,'da','nl','Deens'),(753,'da','no','Danish'),(754,'da','pa','Danish'),(755,'da','pl','duński'),(756,'da','pt-pt','Dinamarquês'),(757,'da','pt-br','Dinamarquês'),(758,'da','qu','Danish'),(759,'da','ro','Daneză'),(760,'da','ru','Датский'),(761,'da','sl','Danščina'),(762,'da','so','Danish'),(763,'da','sq','Danish'),(764,'da','sr','дански'),(765,'da','sv','Danska'),(766,'da','ta','Danish'),(767,'da','th','เดนมาร์ก'),(768,'da','tr','Danca'),(769,'da','uk','Danish'),(770,'da','ur','Danish'),(771,'da','uz','Danish'),(772,'da','vi','Danish'),(773,'da','yi','Danish'),(774,'da','zh-hans','丹麦语'),(775,'da','zu','Danish'),(776,'da','zh-hant','丹麥語'),(777,'da','ms','Danish'),(778,'da','gl','Danish'),(779,'da','bn','Danish'),(780,'da','az','Danish'),(781,'el','en','Greek'),(782,'el','es','Griego'),(783,'el','de','Griechisch'),(784,'el','fr','Grec moderne'),(785,'el','ar','اليونانية'),(786,'el','bs','Greek'),(787,'el','bg','Гръцки'),(788,'el','ca','Greek'),(789,'el','cs','Řečtina'),(790,'el','sk','Gréčtina'),(791,'el','cy','Greek'),(792,'el','da','Greek'),(793,'el','el','Ελληνικά'),(794,'el','eo','Greek'),(795,'el','et','Greek'),(796,'el','eu','Greek'),(797,'el','fa','Greek'),(798,'el','fi','kreikka'),(799,'el','ga','Greek'),(800,'el','he','יוונית'),(801,'el','hi','Greek'),(802,'el','hr','grčki'),(803,'el','hu','görög'),(804,'el','hy','Greek'),(805,'el','id','Greek'),(806,'el','is','Greek'),(807,'el','it','Greco'),(808,'el','ja','ギリシア語'),(809,'el','ko','그리스어'),(810,'el','ku','Greek'),(811,'el','lv','Greek'),(812,'el','lt','Greek'),(813,'el','mk','Greek'),(814,'el','mt','Greek'),(815,'el','mn','Greek'),(816,'el','ne','Greek'),(817,'el','nl','Grieks'),(818,'el','no','Gresk'),(819,'el','pa','Greek'),(820,'el','pl','grecki'),(821,'el','pt-pt','Grego'),(822,'el','pt-br','Grego'),(823,'el','qu','Greek'),(824,'el','ro','Greacă'),(825,'el','ru','Греческий'),(826,'el','sl','Greek'),(827,'el','so','Greek'),(828,'el','sq','Greek'),(829,'el','sr','грчки'),(830,'el','sv','Grekiska'),(831,'el','ta','Greek'),(832,'el','th','กรีก'),(833,'el','tr','Yunanca'),(834,'el','uk','Greek'),(835,'el','ur','Greek'),(836,'el','uz','Greek'),(837,'el','vi','Greek'),(838,'el','yi','Greek'),(839,'el','zh-hans','希腊语'),(840,'el','zu','Greek'),(841,'el','zh-hant','希臘語'),(842,'el','ms','Greek'),(843,'el','gl','Greek'),(844,'el','bn','Greek'),(845,'el','az','Greek'),(846,'eo','en','Esperanto'),(847,'eo','es','Esperanto'),(848,'eo','de','Esperanto'),(849,'eo','fr','Espéranto'),(850,'eo','ar','الاسبرانتو'),(851,'eo','bs','Esperanto'),(852,'eo','bg','Есперанто'),(853,'eo','ca','Esperanto'),(854,'eo','cs','Esperanto'),(855,'eo','sk','Esperanto'),(856,'eo','cy','Esperanto'),(857,'eo','da','Esperanto'),(858,'eo','el','Εσπεράντο'),(859,'eo','eo','Esperanta'),(860,'eo','et','Esperanto'),(861,'eo','eu','Esperanto'),(862,'eo','fa','Esperanto'),(863,'eo','fi','esperanto'),(864,'eo','ga','Esperanto'),(865,'eo','he','אספרנטו'),(866,'eo','hi','Esperanto'),(867,'eo','hr','esperanto'),(868,'eo','hu','eszperantó'),(869,'eo','hy','Esperanto'),(870,'eo','id','Esperanto'),(871,'eo','is','Esperanto'),(872,'eo','it','Esperanto'),(873,'eo','ja','エスペラント語'),(874,'eo','ko','에스페란토어'),(875,'eo','ku','Esperanto'),(876,'eo','lv','Esperanto'),(877,'eo','lt','Esperanto'),(878,'eo','mk','Esperanto'),(879,'eo','mt','Esperanto'),(880,'eo','mn','Esperanto'),(881,'eo','ne','Esperanto'),(882,'eo','nl','Esperanto'),(883,'eo','no','Esperanto'),(884,'eo','pa','Esperanto'),(885,'eo','pl','esperanto'),(886,'eo','pt-pt','Esperanto'),(887,'eo','pt-br','Esperanto'),(888,'eo','qu','Esperanto'),(889,'eo','ro','Esperanto'),(890,'eo','ru','Эсперанто'),(891,'eo','sl','Esperanto'),(892,'eo','so','Esperanto'),(893,'eo','sq','Esperanto'),(894,'eo','sr','есперанто'),(895,'eo','sv','Esperanto'),(896,'eo','ta','Esperanto'),(897,'eo','th','เอสเปอรันโต'),(898,'eo','tr','Esperanto'),(899,'eo','uk','Esperanto'),(900,'eo','ur','Esperanto'),(901,'eo','uz','Esperanto'),(902,'eo','vi','Esperanto'),(903,'eo','yi','Esperanto'),(904,'eo','zh-hans','世界语'),(905,'eo','zu','Esperanto'),(906,'eo','zh-hant','世界語'),(907,'eo','ms','Esperanto'),(908,'eo','gl','Esperanto'),(909,'eo','bn','Esperanto'),(910,'eo','az','Esperanto'),(911,'et','en','Estonian'),(912,'et','es','Estonio'),(913,'et','de','Estnisch'),(914,'et','fr','Estonien'),(915,'et','ar','الأستونية'),(916,'et','bs','Estonian'),(917,'et','bg','Естонски'),(918,'et','ca','Estonian'),(919,'et','cs','Estonština'),(920,'et','sk','Estónčina'),(921,'et','cy','Estonian'),(922,'et','da','Estonian'),(923,'et','el','Εσθονικά'),(924,'et','eo','Estonian'),(925,'et','et','Eesti'),(926,'et','eu','Estonian'),(927,'et','fa','Estonian'),(928,'et','fi','eesti'),(929,'et','ga','Estonian'),(930,'et','he','אסטונית'),(931,'et','hi','Estonian'),(932,'et','hr','estonski'),(933,'et','hu','észt'),(934,'et','hy','Estonian'),(935,'et','id','Estonian'),(936,'et','is','Estonian'),(937,'et','it','Estone'),(938,'et','ja','エストニア語'),(939,'et','ko','에스토니아어'),(940,'et','ku','Estonian'),(941,'et','lv','Estonian'),(942,'et','lt','Estonian'),(943,'et','mk','Estonian'),(944,'et','mt','Estonian'),(945,'et','mn','Estonian'),(946,'et','ne','Estonian'),(947,'et','nl','Ests'),(948,'et','no','Estonian'),(949,'et','pa','Estonian'),(950,'et','pl','estoński'),(951,'et','pt-pt','Estoniano'),(952,'et','pt-br','Estoniano'),(953,'et','qu','Estonian'),(954,'et','ro','Estoniană'),(955,'et','ru','Эстонский'),(956,'et','sl','Estonščina'),(957,'et','so','Estonian'),(958,'et','sq','Estonian'),(959,'et','sr','естонски'),(960,'et','sv','Estniska'),(961,'et','ta','Estonian'),(962,'et','th','เอสโตเนียน'),(963,'et','tr','Estonya dili'),(964,'et','uk','Estonian'),(965,'et','ur','Estonian'),(966,'et','uz','Estonian'),(967,'et','vi','Estonian'),(968,'et','yi','Estonian'),(969,'et','zh-hans','爱沙尼亚语'),(970,'et','zu','Estonian'),(971,'et','zh-hant','愛沙尼亞語'),(972,'et','ms','Estonian'),(973,'et','gl','Estonian'),(974,'et','bn','Estonian'),(975,'et','az','Estonian'),(976,'eu','en','Basque'),(977,'eu','es','Euskera'),(978,'eu','de','Baskisch'),(979,'eu','fr','Basque'),(980,'eu','ar','لغة الباسك'),(981,'eu','bs','Basque'),(982,'eu','bg','Баски'),(983,'eu','ca','Basque'),(984,'eu','cs','Basque'),(985,'eu','sk','Baskičtina'),(986,'eu','cy','Basque'),(987,'eu','da','Basque'),(988,'eu','el','Βασκικά'),(989,'eu','eo','Basque'),(990,'eu','et','Basque'),(991,'eu','eu','Euskara'),(992,'eu','fa','Basque'),(993,'eu','fi','baski'),(994,'eu','ga','Basque'),(995,'eu','he','בסקית'),(996,'eu','hi','Basque'),(997,'eu','hr','baskijski'),(998,'eu','hu','baszk'),(999,'eu','hy','Basque'),(1000,'eu','id','Basque'),(1001,'eu','is','Basque'),(1002,'eu','it','Basco'),(1003,'eu','ja','バスク語'),(1004,'eu','ko','바스크어'),(1005,'eu','ku','Basque'),(1006,'eu','lv','Basque'),(1007,'eu','lt','Basque'),(1008,'eu','mk','Basque'),(1009,'eu','mt','Basque'),(1010,'eu','mn','Basque'),(1011,'eu','ne','Basque'),(1012,'eu','nl','Baskisch'),(1013,'eu','no','Basque'),(1014,'eu','pa','Basque'),(1015,'eu','pl','baskijski'),(1016,'eu','pt-pt','Basco'),(1017,'eu','pt-br','Basco'),(1018,'eu','qu','Basque'),(1019,'eu','ro','Bască'),(1020,'eu','ru','Баскский'),(1021,'eu','sl','Baskovščina'),(1022,'eu','so','Basque'),(1023,'eu','sq','Basque'),(1024,'eu','sr','баскијски'),(1025,'eu','sv','Baskiska'),(1026,'eu','ta','Basque'),(1027,'eu','th','บาสค์'),(1028,'eu','tr','Bask dili'),(1029,'eu','uk','Basque'),(1030,'eu','ur','Basque'),(1031,'eu','uz','Basque'),(1032,'eu','vi','Basque'),(1033,'eu','yi','Basque'),(1034,'eu','zh-hans','巴斯克语'),(1035,'eu','zu','Basque'),(1036,'eu','zh-hant','巴斯克語'),(1037,'eu','ms','Basque'),(1038,'eu','gl','Basque'),(1039,'eu','bn','Basque'),(1040,'eu','az','Basque'),(1041,'fa','en','Persian'),(1042,'fa','es','Persa'),(1043,'fa','de','Persisch'),(1044,'fa','fr','Perse'),(1045,'fa','ar','الفارسية'),(1046,'fa','bs','Persian'),(1047,'fa','bg','Персийски'),(1048,'fa','ca','Persian'),(1049,'fa','cs','Perský'),(1050,'fa','sk','Perzština'),(1051,'fa','cy','Persian'),(1052,'fa','da','Persian'),(1053,'fa','el','Περσικά'),(1054,'fa','eo','Persian'),(1055,'fa','et','Persian'),(1056,'fa','eu','Persian'),(1057,'fa','fa','فارسی'),(1058,'fa','fi','persia'),(1059,'fa','ga','Persian'),(1060,'fa','he','פרסית'),(1061,'fa','hi','Persian'),(1062,'fa','hr','perzijski'),(1063,'fa','hu','perzsa'),(1064,'fa','hy','Persian'),(1065,'fa','id','Persian'),(1066,'fa','is','Persian'),(1067,'fa','it','Persiano'),(1068,'fa','ja','ペルシア語'),(1069,'fa','ko','페르시아어'),(1070,'fa','ku','Persian'),(1071,'fa','lv','Persian'),(1072,'fa','lt','Persian'),(1073,'fa','mk','Persian'),(1074,'fa','mt','Persian'),(1075,'fa','mn','Persian'),(1076,'fa','ne','Persian'),(1077,'fa','nl','Perzisch'),(1078,'fa','no','Persisk'),(1079,'fa','pa','Persian'),(1080,'fa','pl','perski'),(1081,'fa','pt-pt','Persa'),(1082,'fa','pt-br','Persa'),(1083,'fa','qu','Persian'),(1084,'fa','ro','Persană'),(1085,'fa','ru','Персидский'),(1086,'fa','sl','Perzijski'),(1087,'fa','so','Persian'),(1088,'fa','sq','Persian'),(1089,'fa','sr','персијски'),(1090,'fa','sv','Persiska'),(1091,'fa','ta','Persian'),(1092,'fa','th','เปอร์เซียน'),(1093,'fa','tr','Farsça'),(1094,'fa','uk','Persian'),(1095,'fa','ur','Persian'),(1096,'fa','uz','Persian'),(1097,'fa','vi','Persian'),(1098,'fa','yi','Persian'),(1099,'fa','zh-hans','波斯语'),(1100,'fa','zu','Persian'),(1101,'fa','zh-hant','波斯語'),(1102,'fa','ms','Persian'),(1103,'fa','gl','Persian'),(1104,'fa','bn','Persian'),(1105,'fa','az','Persian'),(1106,'fi','en','Finnish'),(1107,'fi','es','Finlandés'),(1108,'fi','de','Finnisch'),(1109,'fi','fr','Finnois'),(1110,'fi','ar','الفنلندية'),(1111,'fi','bs','Finnish'),(1112,'fi','bg','Фински'),(1113,'fi','ca','Finnish'),(1114,'fi','cs','Finský'),(1115,'fi','sk','Fínština'),(1116,'fi','cy','Finnish'),(1117,'fi','da','Finnish'),(1118,'fi','el','Φινλανδικά'),(1119,'fi','eo','Finnish'),(1120,'fi','et','Finnish'),(1121,'fi','eu','Finnish'),(1122,'fi','fa','Finnish'),(1123,'fi','fi','Suomi'),(1124,'fi','ga','Finnish'),(1125,'fi','he','פינית'),(1126,'fi','hi','Finnish'),(1127,'fi','hr','finski'),(1128,'fi','hu','finn'),(1129,'fi','hy','Finnish'),(1130,'fi','id','Finnish'),(1131,'fi','is','Finnish'),(1132,'fi','it','Finlandese'),(1133,'fi','ja','フィンランド語'),(1134,'fi','ko','핀란드어'),(1135,'fi','ku','Finnish'),(1136,'fi','lv','Finnish'),(1137,'fi','lt','Finnish'),(1138,'fi','mk','Finnish'),(1139,'fi','mt','Finnish'),(1140,'fi','mn','Finnish'),(1141,'fi','ne','Finnish'),(1142,'fi','nl','Fins'),(1143,'fi','no','Finsk'),(1144,'fi','pa','Finnish'),(1145,'fi','pl','fiński'),(1146,'fi','pt-pt','Finlandês'),(1147,'fi','pt-br','Finlandês'),(1148,'fi','qu','Finnish'),(1149,'fi','ro','Finlandeză'),(1150,'fi','ru','Финский'),(1151,'fi','sl','Finski'),(1152,'fi','so','Finnish'),(1153,'fi','sq','Finnish'),(1154,'fi','sr','фински'),(1155,'fi','sv','Finska'),(1156,'fi','ta','Finnish'),(1157,'fi','th','ฟินนิช'),(1158,'fi','tr','Fince'),(1159,'fi','uk','Finnish'),(1160,'fi','ur','Finnish'),(1161,'fi','uz','Finnish'),(1162,'fi','vi','Finnish'),(1163,'fi','yi','Finnish'),(1164,'fi','zh-hans','芬兰语'),(1165,'fi','zu','Finnish'),(1166,'fi','zh-hant','芬蘭語'),(1167,'fi','ms','Finnish'),(1168,'fi','gl','Finnish'),(1169,'fi','bn','Finnish'),(1170,'fi','az','Finnish'),(1171,'ga','en','Irish'),(1172,'ga','es','Irlandés'),(1173,'ga','de','Irisch'),(1174,'ga','fr','Irlandais'),(1175,'ga','ar','الأيرلندية'),(1176,'ga','bs','Irish'),(1177,'ga','bg','Ирландски'),(1178,'ga','ca','Irish'),(1179,'ga','cs','Irský'),(1180,'ga','sk','Írština'),(1181,'ga','cy','Irish'),(1182,'ga','da','Irish'),(1183,'ga','el','Ιρλανδικά'),(1184,'ga','eo','Irish'),(1185,'ga','et','Irish'),(1186,'ga','eu','Irish'),(1187,'ga','fa','Irish'),(1188,'ga','fi','iiri'),(1189,'ga','ga','Gaeilge'),(1190,'ga','he','אירית'),(1191,'ga','hi','Irish'),(1192,'ga','hr','irski'),(1193,'ga','hu','ír'),(1194,'ga','hy','Irish'),(1195,'ga','id','Irish'),(1196,'ga','is','Irish'),(1197,'ga','it','Irlandese'),(1198,'ga','ja','アイルランド語'),(1199,'ga','ko','아일랜드어'),(1200,'ga','ku','Irish'),(1201,'ga','lv','Irish'),(1202,'ga','lt','Irish'),(1203,'ga','mk','Irish'),(1204,'ga','mt','Irish'),(1205,'ga','mn','Irish'),(1206,'ga','ne','Irish'),(1207,'ga','nl','Iers'),(1208,'ga','no','Irish'),(1209,'ga','pa','Irish'),(1210,'ga','pl','irlandzki'),(1211,'ga','pt-pt','Irlandês'),(1212,'ga','pt-br','Irlandês'),(1213,'ga','qu','Irish'),(1214,'ga','ro','Irlandeză'),(1215,'ga','ru','Ирландский'),(1216,'ga','sl','Irski'),(1217,'ga','so','Irish'),(1218,'ga','sq','Irish'),(1219,'ga','sr','ирски'),(1220,'ga','sv','Irländska'),(1221,'ga','ta','Irish'),(1222,'ga','th','ไอริช'),(1223,'ga','tr','İrlanda dili'),(1224,'ga','uk','Irish'),(1225,'ga','ur','Irish'),(1226,'ga','uz','Irish'),(1227,'ga','vi','Irish'),(1228,'ga','yi','Irish'),(1229,'ga','zh-hans','爱尔兰语'),(1230,'ga','zu','Irish'),(1231,'ga','zh-hant','愛爾蘭語'),(1232,'ga','ms','Irish'),(1233,'ga','gl','Irish'),(1234,'ga','bn','Irish'),(1235,'ga','az','Irish'),(1236,'he','en','Hebrew'),(1237,'he','es','Hebreo'),(1238,'he','de','Hebräisch'),(1239,'he','fr','Hébreu'),(1240,'he','ar','العبرية'),(1241,'he','bs','Hebrew'),(1242,'he','bg','Иврит'),(1243,'he','ca','Hebrew'),(1244,'he','cs','Hebrejština'),(1245,'he','sk','Hebrejčina'),(1246,'he','cy','Hebrew'),(1247,'he','da','Hebrew'),(1248,'he','el','Εβραϊκά'),(1249,'he','eo','Hebrew'),(1250,'he','et','Hebrew'),(1251,'he','eu','Hebrew'),(1252,'he','fa','Hebrew'),(1253,'he','fi','heprea'),(1254,'he','ga','Hebrew'),(1255,'he','he','עברית'),(1256,'he','hi','Hebrew'),(1257,'he','hr','hebrejski'),(1258,'he','hu','héber'),(1259,'he','hy','Hebrew'),(1260,'he','id','Hebrew'),(1261,'he','is','Hebrew'),(1262,'he','it','Ebraico'),(1263,'he','ja','ヘブライ語'),(1264,'he','ko','히브리어'),(1265,'he','ku','Hebrew'),(1266,'he','lv','Hebrew'),(1267,'he','lt','Hebrew'),(1268,'he','mk','Hebrew'),(1269,'he','mt','Hebrew'),(1270,'he','mn','Hebrew'),(1271,'he','ne','Hebrew'),(1272,'he','nl','Hebreeuws'),(1273,'he','no','Hebraisk'),(1274,'he','pa','Hebrew'),(1275,'he','pl','hebrajski'),(1276,'he','pt-pt','Hebraico'),(1277,'he','pt-br','Hebraico'),(1278,'he','qu','Hebrew'),(1279,'he','ro','Ebraică'),(1280,'he','ru','Иврит'),(1281,'he','sl','Hebrejščina'),(1282,'he','so','Hebrew'),(1283,'he','sq','Hebrew'),(1284,'he','sr','Хебрејски'),(1285,'he','sv','Hebreiska'),(1286,'he','ta','Hebrew'),(1287,'he','th','ฮิบรู'),(1288,'he','tr','İbranice'),(1289,'he','uk','Hebrew'),(1290,'he','ur','Hebrew'),(1291,'he','uz','Hebrew'),(1292,'he','vi','Hebrew'),(1293,'he','yi','Hebrew'),(1294,'he','zh-hans','希伯来语'),(1295,'he','zu','Hebrew'),(1296,'he','zh-hant','希伯來語'),(1297,'he','ms','Hebrew'),(1298,'he','gl','Hebrew'),(1299,'he','bn','Hebrew'),(1300,'he','az','Hebrew'),(1301,'hi','en','Hindi'),(1302,'hi','es','Hindi'),(1303,'hi','de','Hindi'),(1304,'hi','fr','Hindi'),(1305,'hi','ar','الهندية'),(1306,'hi','bs','Hindi'),(1307,'hi','bg','Хинди'),(1308,'hi','ca','Hindi'),(1309,'hi','cs','Hindština'),(1310,'hi','sk','Hindčina'),(1311,'hi','cy','Hindi'),(1312,'hi','da','Hindi'),(1313,'hi','el','Ινδικά'),(1314,'hi','eo','Hindi'),(1315,'hi','et','Hindi'),(1316,'hi','eu','Hindi'),(1317,'hi','fa','Hindi'),(1318,'hi','fi','hindi'),(1319,'hi','ga','Hindi'),(1320,'hi','he','הודית'),(1321,'hi','hi','हिन्दी'),(1322,'hi','hr','hindski'),(1323,'hi','hu','hindi'),(1324,'hi','hy','Hindi'),(1325,'hi','id','Hindi'),(1326,'hi','is','Hindi'),(1327,'hi','it','Hindi'),(1328,'hi','ja','ヒンディー語'),(1329,'hi','ko','힌두어'),(1330,'hi','ku','Hindi'),(1331,'hi','lv','Hindi'),(1332,'hi','lt','Hindi'),(1333,'hi','mk','Hindi'),(1334,'hi','mt','Hindi'),(1335,'hi','mn','Hindi'),(1336,'hi','ne','Hindi'),(1337,'hi','nl','Hindi'),(1338,'hi','no','Hindi'),(1339,'hi','pa','Hindi'),(1340,'hi','pl','hindi'),(1341,'hi','pt-pt','Hindi'),(1342,'hi','pt-br','Hindi'),(1343,'hi','qu','Hindi'),(1344,'hi','ro','Hindi'),(1345,'hi','ru','Хинди'),(1346,'hi','sl','Hindi'),(1347,'hi','so','Hindi'),(1348,'hi','sq','Hindi'),(1349,'hi','sr','хинди'),(1350,'hi','sv','Hindi'),(1351,'hi','ta','Hindi'),(1352,'hi','th','ฮินดิ'),(1353,'hi','tr','Hintçe'),(1354,'hi','uk','Hindi'),(1355,'hi','ur','Hindi'),(1356,'hi','uz','Hindi'),(1357,'hi','vi','Hindi'),(1358,'hi','yi','Hindi'),(1359,'hi','zh-hans','印地语'),(1360,'hi','zu','Hindi'),(1361,'hi','zh-hant','印地語'),(1362,'hi','ms','Hindi'),(1363,'hi','gl','Hindi'),(1364,'hi','bn','Hindi'),(1365,'hi','az','Hindi'),(1366,'hr','en','Croatian'),(1367,'hr','es','Croata'),(1368,'hr','de','Kroatisch'),(1369,'hr','fr','Croate'),(1370,'hr','ar','الكرواتية'),(1371,'hr','bs','Croatian'),(1372,'hr','bg','Хърватски'),(1373,'hr','ca','Croatian'),(1374,'hr','cs','Chorvatský'),(1375,'hr','sk','Chorvátština'),(1376,'hr','cy','Croatian'),(1377,'hr','da','Croatian'),(1378,'hr','el','Κροατικά'),(1379,'hr','eo','Croatian'),(1380,'hr','et','Croatian'),(1381,'hr','eu','Croatian'),(1382,'hr','fa','Croatian'),(1383,'hr','fi','kroatia'),(1384,'hr','ga','Croatian'),(1385,'hr','he','קרוטאית'),(1386,'hr','hi','Croatian'),(1387,'hr','hr','hrvatski'),(1388,'hr','hu','horvát'),(1389,'hr','hy','Croatian'),(1390,'hr','id','Croatian'),(1391,'hr','is','Croatian'),(1392,'hr','it','Croato'),(1393,'hr','ja','クロアチア語'),(1394,'hr','ko','크로아시아어'),(1395,'hr','ku','Croatian'),(1396,'hr','lv','Croatian'),(1397,'hr','lt','Croatian'),(1398,'hr','mk','Croatian'),(1399,'hr','mt','Croatian'),(1400,'hr','mn','Croatian'),(1401,'hr','ne','Croatian'),(1402,'hr','nl','Kroatisch'),(1403,'hr','no','Kroatisk'),(1404,'hr','pa','Croatian'),(1405,'hr','pl','chorwacki'),(1406,'hr','pt-pt','Croata'),(1407,'hr','pt-br','Croata'),(1408,'hr','qu','Croatian'),(1409,'hr','ro','Croată'),(1410,'hr','ru','Хорватский'),(1411,'hr','sl','Hrvaški'),(1412,'hr','so','Croatian'),(1413,'hr','sq','Croatian'),(1414,'hr','sr','хрватски'),(1415,'hr','sv','Kroatiska'),(1416,'hr','ta','Croatian'),(1417,'hr','th','โครเอเชีย'),(1418,'hr','tr','Hırvatça'),(1419,'hr','uk','Croatian'),(1420,'hr','ur','Croatian'),(1421,'hr','uz','Croatian'),(1422,'hr','vi','Croatian'),(1423,'hr','yi','Croatian'),(1424,'hr','zh-hans','克罗地亚语'),(1425,'hr','zu','Croatian'),(1426,'hr','zh-hant','克羅地亞語'),(1427,'hr','ms','Croatian'),(1428,'hr','gl','Croatian'),(1429,'hr','bn','Croatian'),(1430,'hr','az','Croatian'),(1431,'hu','en','Hungarian'),(1432,'hu','es','Húngaro'),(1433,'hu','de','Ungarisch'),(1434,'hu','fr','Hongrois'),(1435,'hu','ar','الهنغارية'),(1436,'hu','bs','Hungarian'),(1437,'hu','bg','Унгарски'),(1438,'hu','ca','Hungarian'),(1439,'hu','cs','Maďarština'),(1440,'hu','sk','Maďarčina'),(1441,'hu','cy','Hungarian'),(1442,'hu','da','Hungarian'),(1443,'hu','el','Ουγγρικά'),(1444,'hu','eo','Hungarian'),(1445,'hu','et','Hungarian'),(1446,'hu','eu','Hungarian'),(1447,'hu','fa','Hungarian'),(1448,'hu','fi','unkari'),(1449,'hu','ga','Hungarian'),(1450,'hu','he','הונגרית'),(1451,'hu','hi','Hungarian'),(1452,'hu','hr','mađarski'),(1453,'hu','hu','Magyar'),(1454,'hu','hy','Hungarian'),(1455,'hu','id','Hungarian'),(1456,'hu','is','Hungarian'),(1457,'hu','it','Ungherese'),(1458,'hu','ja','ハンガリー語'),(1459,'hu','ko','헝가리어'),(1460,'hu','ku','Hungarian'),(1461,'hu','lv','Hungarian'),(1462,'hu','lt','Hungarian'),(1463,'hu','mk','Hungarian'),(1464,'hu','mt','Hungarian'),(1465,'hu','mn','Hungarian'),(1466,'hu','ne','Hungarian'),(1467,'hu','nl','Hongaars'),(1468,'hu','no','Ungarsk'),(1469,'hu','pa','Hungarian'),(1470,'hu','pl','węgierski'),(1471,'hu','pt-pt','Húngaro'),(1472,'hu','pt-br','Húngaro'),(1473,'hu','qu','Hungarian'),(1474,'hu','ro','Ungară'),(1475,'hu','ru','Венгерский'),(1476,'hu','sl','Madžarski'),(1477,'hu','so','Hungarian'),(1478,'hu','sq','Hungarian'),(1479,'hu','sr','мађарски'),(1480,'hu','sv','Ungerska'),(1481,'hu','ta','Hungarian'),(1482,'hu','th','ฮังการี'),(1483,'hu','tr','Macarca'),(1484,'hu','uk','Hungarian'),(1485,'hu','ur','Hungarian'),(1486,'hu','uz','Hungarian'),(1487,'hu','vi','Hungarian'),(1488,'hu','yi','Hungarian'),(1489,'hu','zh-hans','匈牙利语'),(1490,'hu','zu','Hungarian'),(1491,'hu','zh-hant','匈牙利語'),(1492,'hu','ms','Hungarian'),(1493,'hu','gl','Hungarian'),(1494,'hu','bn','Hungarian'),(1495,'hu','az','Hungarian'),(1496,'hy','en','Armenian'),(1497,'hy','es','Armenio'),(1498,'hy','de','Armenisch'),(1499,'hy','fr','Arménien'),(1500,'hy','ar','الأرمينية'),(1501,'hy','bs','Armenian'),(1502,'hy','bg','Арменски'),(1503,'hy','ca','Armenian'),(1504,'hy','cs','Arménský'),(1505,'hy','sk','Arménčina'),(1506,'hy','cy','Armenian'),(1507,'hy','da','Armenian'),(1508,'hy','el','Αρμένικα'),(1509,'hy','eo','Armenian'),(1510,'hy','et','Armenian'),(1511,'hy','eu','Armenian'),(1512,'hy','fa','Armenian'),(1513,'hy','fi','armenia'),(1514,'hy','ga','Armenian'),(1515,'hy','he','ארמנית'),(1516,'hy','hi','Armenian'),(1517,'hy','hr','armenski'),(1518,'hy','hu','örmény'),(1519,'hy','hy','Հայերեն'),(1520,'hy','id','Armenian'),(1521,'hy','is','Armenian'),(1522,'hy','it','Armeno'),(1523,'hy','ja','アルメニア語'),(1524,'hy','ko','아르메니아어'),(1525,'hy','ku','Armenian'),(1526,'hy','lv','Armenian'),(1527,'hy','lt','Armenian'),(1528,'hy','mk','Armenian'),(1529,'hy','mt','Armenian'),(1530,'hy','mn','Armenian'),(1531,'hy','ne','Armenian'),(1532,'hy','nl','Armeens'),(1533,'hy','no','Armensk'),(1534,'hy','pa','Armenian'),(1535,'hy','pl','ormiański'),(1536,'hy','pt-pt','Arménio'),(1537,'hy','pt-br','Arménio'),(1538,'hy','qu','Armenian'),(1539,'hy','ro','Armeană'),(1540,'hy','ru','Армянский'),(1541,'hy','sl','Armenski'),(1542,'hy','so','Armenian'),(1543,'hy','sq','Armenian'),(1544,'hy','sr','јерменски'),(1545,'hy','sv','Armeniska'),(1546,'hy','ta','Armenian'),(1547,'hy','th','อาร์เมเนีย'),(1548,'hy','tr','Ermenice'),(1549,'hy','uk','Armenian'),(1550,'hy','ur','Armenian'),(1551,'hy','uz','Armenian'),(1552,'hy','vi','Armenian'),(1553,'hy','yi','Armenian'),(1554,'hy','zh-hans','亚美尼亚语'),(1555,'hy','zu','Armenian'),(1556,'hy','zh-hant','亞美尼亞語'),(1557,'hy','ms','Armenian'),(1558,'hy','gl','Armenian'),(1559,'hy','bn','Armenian'),(1560,'hy','az','Armenian'),(1561,'id','en','Indonesian'),(1562,'id','es','Indonesio'),(1563,'id','de','Indonesisch'),(1564,'id','fr','Indonésien'),(1565,'id','ar','الأندونيسية'),(1566,'id','bs','Indonesian'),(1567,'id','bg','Индонезийски'),(1568,'id','ca','Indonesian'),(1569,'id','cs','Indonéský'),(1570,'id','sk','Indonézčina'),(1571,'id','cy','Indonesian'),(1572,'id','da','Indonesian'),(1573,'id','el','Ινδονησιακά'),(1574,'id','eo','Indonesian'),(1575,'id','et','Indonesian'),(1576,'id','eu','Indonesian'),(1577,'id','fa','Indonesian'),(1578,'id','fi','indonesia'),(1579,'id','ga','Indonesian'),(1580,'id','he','אינדונזית'),(1581,'id','hi','Indonesian'),(1582,'id','hr','indonezijski'),(1583,'id','hu','indonéz'),(1584,'id','hy','Indonesian'),(1585,'id','id','Indonesia'),(1586,'id','is','Indonesian'),(1587,'id','it','Indonesiano'),(1588,'id','ja','インドネシア語'),(1589,'id','ko','인도네시아어'),(1590,'id','ku','Indonesian'),(1591,'id','lv','Indonesian'),(1592,'id','lt','Indonesian'),(1593,'id','mk','Indonesian'),(1594,'id','mt','Indonesian'),(1595,'id','mn','Indonesian'),(1596,'id','ne','Indonesian'),(1597,'id','nl','Indonesisch'),(1598,'id','no','Indonesian'),(1599,'id','pa','Indonesian'),(1600,'id','pl','indonezyjski'),(1601,'id','pt-pt','Indonésio'),(1602,'id','pt-br','Indonésio'),(1603,'id','qu','Indonesian'),(1604,'id','ro','Indoneziană'),(1605,'id','ru','Индонезийский'),(1606,'id','sl','Indonezijski'),(1607,'id','so','Indonesian'),(1608,'id','sq','Indonesian'),(1609,'id','sr','индонезијски'),(1610,'id','sv','Indonesiska'),(1611,'id','ta','Indonesian'),(1612,'id','th','อินโดนีเซีย'),(1613,'id','tr','Endonezya dili'),(1614,'id','uk','Indonesian'),(1615,'id','ur','Indonesian'),(1616,'id','uz','Indonesian'),(1617,'id','vi','Indonesian'),(1618,'id','yi','Indonesian'),(1619,'id','zh-hans','印度尼西亚语'),(1620,'id','zu','Indonesian'),(1621,'id','zh-hant','印尼語'),(1622,'id','ms','Indonesian'),(1623,'id','gl','Indonesian'),(1624,'id','bn','Indonesian'),(1625,'id','az','Indonesian'),(1626,'is','en','Icelandic'),(1627,'is','es','Islandés'),(1628,'is','de','Isländisch'),(1629,'is','fr','Islandais'),(1630,'is','ar','الأيسلاندية'),(1631,'is','bs','Icelandic'),(1632,'is','bg','Исландски'),(1633,'is','ca','Icelandic'),(1634,'is','cs','Islandský'),(1635,'is','sk','Islančina'),(1636,'is','cy','Icelandic'),(1637,'is','da','Icelandic'),(1638,'is','el','Ισλανδικά'),(1639,'is','eo','Icelandic'),(1640,'is','et','Icelandic'),(1641,'is','eu','Icelandic'),(1642,'is','fa','Icelandic'),(1643,'is','fi','islanti'),(1644,'is','ga','Icelandic'),(1645,'is','he','איסלנדית'),(1646,'is','hi','Icelandic'),(1647,'is','hr','islandski'),(1648,'is','hu','izlandi'),(1649,'is','hy','Icelandic'),(1650,'is','id','Icelandic'),(1651,'is','is','Íslenska'),(1652,'is','it','Islandese'),(1653,'is','ja','アイスランド語'),(1654,'is','ko','아이슬랜드어'),(1655,'is','ku','Icelandic'),(1656,'is','lv','Icelandic'),(1657,'is','lt','Icelandic'),(1658,'is','mk','Icelandic'),(1659,'is','mt','Icelandic'),(1660,'is','mn','Icelandic'),(1661,'is','ne','Icelandic'),(1662,'is','nl','Ijslands'),(1663,'is','no','Islandsk'),(1664,'is','pa','Icelandic'),(1665,'is','pl','islandzki'),(1666,'is','pt-pt','Islandês'),(1667,'is','pt-br','Islandês'),(1668,'is','qu','Icelandic'),(1669,'is','ro','Islandeză'),(1670,'is','ru','Исландский'),(1671,'is','sl','Islandski'),(1672,'is','so','Icelandic'),(1673,'is','sq','Icelandic'),(1674,'is','sr','исландски'),(1675,'is','sv','Isländska'),(1676,'is','ta','Icelandic'),(1677,'is','th','ไอซ์แลนด์'),(1678,'is','tr','İzlandaca'),(1679,'is','uk','Icelandic'),(1680,'is','ur','Icelandic'),(1681,'is','uz','Icelandic'),(1682,'is','vi','Icelandic'),(1683,'is','yi','Icelandic'),(1684,'is','zh-hans','冰岛语'),(1685,'is','zu','Icelandic'),(1686,'is','zh-hant','冰島語'),(1687,'is','ms','Icelandic'),(1688,'is','gl','Icelandic'),(1689,'is','bn','Icelandic'),(1690,'is','az','Icelandic'),(1691,'it','en','Italian'),(1692,'it','es','Italiano'),(1693,'it','de','Italienisch'),(1694,'it','fr','Italien'),(1695,'it','ar','الإيطالية'),(1696,'it','bs','Italian'),(1697,'it','bg','Италиански'),(1698,'it','ca','Italian'),(1699,'it','cs','Ital'),(1700,'it','sk','Taliančina'),(1701,'it','cy','Italian'),(1702,'it','da','Italian'),(1703,'it','el','Ιταλικά'),(1704,'it','eo','Italian'),(1705,'it','et','Italian'),(1706,'it','eu','Italian'),(1707,'it','fa','Italian'),(1708,'it','fi','italia'),(1709,'it','ga','Italian'),(1710,'it','he','איטלקית'),(1711,'it','hi','Italian'),(1712,'it','hr','talijanski'),(1713,'it','hu','olasz'),(1714,'it','hy','Italian'),(1715,'it','id','Italian'),(1716,'it','is','Italian'),(1717,'it','it','Italiano'),(1718,'it','ja','イタリア語'),(1719,'it','ko','이태리어'),(1720,'it','ku','Italian'),(1721,'it','lv','Italian'),(1722,'it','lt','Italian'),(1723,'it','mk','Italian'),(1724,'it','mt','Italian'),(1725,'it','mn','Italian'),(1726,'it','ne','Italian'),(1727,'it','nl','Italiaans'),(1728,'it','no','Italiensk'),(1729,'it','pa','Italian'),(1730,'it','pl','włoski'),(1731,'it','pt-pt','Italiano'),(1732,'it','pt-br','Italiano'),(1733,'it','qu','Italian'),(1734,'it','ro','Italiană'),(1735,'it','ru','Итальянский'),(1736,'it','sl','Italijanski'),(1737,'it','so','Italian'),(1738,'it','sq','Italian'),(1739,'it','sr','италијански'),(1740,'it','sv','Italienska'),(1741,'it','ta','Italian'),(1742,'it','th','อิตาลี'),(1743,'it','tr','İtalyanca'),(1744,'it','uk','Italian'),(1745,'it','ur','Italian'),(1746,'it','uz','Italian'),(1747,'it','vi','Italian'),(1748,'it','yi','Italian'),(1749,'it','zh-hans','意大利语'),(1750,'it','zu','Italian'),(1751,'it','zh-hant','義大利語'),(1752,'it','ms','Italian'),(1753,'it','gl','Italian'),(1754,'it','bn','Italian'),(1755,'it','az','Italian'),(1756,'ja','en','Japanese'),(1757,'ja','es','Japonés'),(1758,'ja','de','Japanisch'),(1759,'ja','fr','Japonais'),(1760,'ja','ar','اليابانية'),(1761,'ja','bs','Japanese'),(1762,'ja','bg','Японски'),(1763,'ja','ca','Japanese'),(1764,'ja','cs','Japonský'),(1765,'ja','sk','Japonština'),(1766,'ja','cy','Japanese'),(1767,'ja','da','Japanese'),(1768,'ja','el','Ιαπωνικά'),(1769,'ja','eo','Japanese'),(1770,'ja','et','Japanese'),(1771,'ja','eu','Japanese'),(1772,'ja','fa','Japanese'),(1773,'ja','fi','japani'),(1774,'ja','ga','Japanese'),(1775,'ja','he','יפנית'),(1776,'ja','hi','Japanese'),(1777,'ja','hr','japanski'),(1778,'ja','hu','japán'),(1779,'ja','hy','Japanese'),(1780,'ja','id','Japanese'),(1781,'ja','is','Japanese'),(1782,'ja','it','Giapponese'),(1783,'ja','ja','日本語'),(1784,'ja','ko','일어'),(1785,'ja','ku','Japanese'),(1786,'ja','lv','Japanese'),(1787,'ja','lt','Japanese'),(1788,'ja','mk','Japanese'),(1789,'ja','mt','Japanese'),(1790,'ja','mn','Japanese'),(1791,'ja','ne','Japanese'),(1792,'ja','nl','Japans'),(1793,'ja','no','Japansk'),(1794,'ja','pa','Japanese'),(1795,'ja','pl','japoński'),(1796,'ja','pt-pt','Japonês'),(1797,'ja','pt-br','Japonês'),(1798,'ja','qu','Japanese'),(1799,'ja','ro','Japoneză'),(1800,'ja','ru','Японский'),(1801,'ja','sl','Japonski'),(1802,'ja','so','Japanese'),(1803,'ja','sq','Japanese'),(1804,'ja','sr','јапански'),(1805,'ja','sv','Japanska'),(1806,'ja','ta','Japanese'),(1807,'ja','th','ญี่ปุ่น'),(1808,'ja','tr','Japonca'),(1809,'ja','uk','Japanese'),(1810,'ja','ur','Japanese'),(1811,'ja','uz','Japanese'),(1812,'ja','vi','Japanese'),(1813,'ja','yi','Japanese'),(1814,'ja','zh-hans','日语'),(1815,'ja','zu','Japanese'),(1816,'ja','zh-hant','日語'),(1817,'ja','ms','Japanese'),(1818,'ja','gl','Japanese'),(1819,'ja','bn','Japanese'),(1820,'ja','az','Japanese'),(1821,'ko','en','Korean'),(1822,'ko','es','Coreano'),(1823,'ko','de','Koreanisch'),(1824,'ko','fr','Coréen'),(1825,'ko','ar','الكورية'),(1826,'ko','bs','Korean'),(1827,'ko','bg','Корейски'),(1828,'ko','ca','Korean'),(1829,'ko','cs','Korejský'),(1830,'ko','sk','Kórejčina'),(1831,'ko','cy','Korean'),(1832,'ko','da','Korean'),(1833,'ko','el','Κορεάτικα'),(1834,'ko','eo','Korean'),(1835,'ko','et','Korean'),(1836,'ko','eu','Korean'),(1837,'ko','fa','Korean'),(1838,'ko','fi','korea'),(1839,'ko','ga','Korean'),(1840,'ko','he','קוראנית'),(1841,'ko','hi','Korean'),(1842,'ko','hr','korejski'),(1843,'ko','hu','koreai'),(1844,'ko','hy','Korean'),(1845,'ko','id','Korean'),(1846,'ko','is','Korean'),(1847,'ko','it','Coreano'),(1848,'ko','ja','韓国語'),(1849,'ko','ko','한국어'),(1850,'ko','ku','Korean'),(1851,'ko','lv','Korean'),(1852,'ko','lt','Korean'),(1853,'ko','mk','Korean'),(1854,'ko','mt','Korean'),(1855,'ko','mn','Korean'),(1856,'ko','ne','Korean'),(1857,'ko','nl','Koreaans'),(1858,'ko','no','Koreanske'),(1859,'ko','pa','Korean'),(1860,'ko','pl','koreański'),(1861,'ko','pt-pt','Coreano'),(1862,'ko','pt-br','Coreano'),(1863,'ko','qu','Korean'),(1864,'ko','ro','Coreană'),(1865,'ko','ru','Корейский'),(1866,'ko','sl','Korejski'),(1867,'ko','so','Korean'),(1868,'ko','sq','Korean'),(1869,'ko','sr','корејски'),(1870,'ko','sv','Koreanska'),(1871,'ko','ta','Korean'),(1872,'ko','th','เกาหลี'),(1873,'ko','tr','Kore dili'),(1874,'ko','uk','Korean'),(1875,'ko','ur','Korean'),(1876,'ko','uz','Korean'),(1877,'ko','vi','Korean'),(1878,'ko','yi','Korean'),(1879,'ko','zh-hans','韩语'),(1880,'ko','zu','Korean'),(1881,'ko','zh-hant','韓語'),(1882,'ko','ms','Korean'),(1883,'ko','gl','Korean'),(1884,'ko','bn','Korean'),(1885,'ko','az','Korean'),(1886,'ku','en','Kurdish'),(1887,'ku','es','Kurdo'),(1888,'ku','de','Kurdisch'),(1889,'ku','fr','Kurde'),(1890,'ku','ar','الكردية'),(1891,'ku','bs','Kurdish'),(1892,'ku','bg','Кюрдски'),(1893,'ku','ca','Kurdish'),(1894,'ku','cs','Kurdský'),(1895,'ku','sk','Kurdština'),(1896,'ku','cy','Kurdish'),(1897,'ku','da','Kurdish'),(1898,'ku','el','Κουρδικά'),(1899,'ku','eo','Kurdish'),(1900,'ku','et','Kurdish'),(1901,'ku','eu','Kurdish'),(1902,'ku','fa','Kurdish'),(1903,'ku','fi','kurdi'),(1904,'ku','ga','Kurdish'),(1905,'ku','he','כורדית'),(1906,'ku','hi','Kurdish'),(1907,'ku','hr','kurdski'),(1908,'ku','hu','kurd'),(1909,'ku','hy','Kurdish'),(1910,'ku','id','Kurdish'),(1911,'ku','is','Kurdish'),(1912,'ku','it','Curdo'),(1913,'ku','ja','クルド語'),(1914,'ku','ko','쿠르드어'),(1915,'ku','ku','Kurdish'),(1916,'ku','lv','Kurdish'),(1917,'ku','lt','Kurdish'),(1918,'ku','mk','Kurdish'),(1919,'ku','mt','Kurdish'),(1920,'ku','mn','Kurdish'),(1921,'ku','ne','Kurdish'),(1922,'ku','nl','Koerdish'),(1923,'ku','no','Kurdisk'),(1924,'ku','pa','Kurdish'),(1925,'ku','pl','kurdyjski'),(1926,'ku','pt-pt','Curdo'),(1927,'ku','pt-br','Curdo'),(1928,'ku','qu','Kurdish'),(1929,'ku','ro','Kurdă'),(1930,'ku','ru','Курдский'),(1931,'ku','sl','Kurdščina'),(1932,'ku','so','Kurdish'),(1933,'ku','sq','Kurdish'),(1934,'ku','sr','курдски'),(1935,'ku','sv','Kurdiska'),(1936,'ku','ta','Kurdish'),(1937,'ku','th','เคอร์ดิช'),(1938,'ku','tr','Kürtçe'),(1939,'ku','uk','Kurdish'),(1940,'ku','ur','Kurdish'),(1941,'ku','uz','Kurdish'),(1942,'ku','vi','Kurdish'),(1943,'ku','yi','Kurdish'),(1944,'ku','zh-hans','库尔德语'),(1945,'ku','zu','Kurdish'),(1946,'ku','zh-hant','庫爾德語'),(1947,'ku','ms','Kurdish'),(1948,'ku','gl','Kurdish'),(1949,'ku','bn','Kurdish'),(1950,'ku','az','Kurdish'),(1951,'lv','en','Latvian'),(1952,'lv','es','Letón'),(1953,'lv','de','Lettisch'),(1954,'lv','fr','Letton'),(1955,'lv','ar','اللاتفية'),(1956,'lv','bs','Latvian'),(1957,'lv','bg','Латвийски'),(1958,'lv','ca','Latvian'),(1959,'lv','cs','Lotyština'),(1960,'lv','sk','Lotyština'),(1961,'lv','cy','Latvian'),(1962,'lv','da','Latvian'),(1963,'lv','el','Λετονικά'),(1964,'lv','eo','Latvian'),(1965,'lv','et','Latvian'),(1966,'lv','eu','Latvian'),(1967,'lv','fa','Latvian'),(1968,'lv','fi','latvia'),(1969,'lv','ga','Latvian'),(1970,'lv','he','לטבית'),(1971,'lv','hi','Latvian'),(1972,'lv','hr','latvijski'),(1973,'lv','hu','lett'),(1974,'lv','hy','Latvian'),(1975,'lv','id','Latvian'),(1976,'lv','is','Latvian'),(1977,'lv','it','Lettone'),(1978,'lv','ja','ラトビア語'),(1979,'lv','ko','라트비아어'),(1980,'lv','ku','Latvian'),(1981,'lv','lv','Latviešu'),(1982,'lv','lt','Latvian'),(1983,'lv','mk','Latvian'),(1984,'lv','mt','Latvian'),(1985,'lv','mn','Latvian'),(1986,'lv','ne','Latvian'),(1987,'lv','nl','Lets'),(1988,'lv','no','Latvisk'),(1989,'lv','pa','Latvian'),(1990,'lv','pl','łotewski'),(1991,'lv','pt-pt','Letão'),(1992,'lv','pt-br','Letão'),(1993,'lv','qu','Latvian'),(1994,'lv','ro','Letoniană'),(1995,'lv','ru','латышский'),(1996,'lv','sl','Latvijščina'),(1997,'lv','so','Latvian'),(1998,'lv','sq','Latvian'),(1999,'lv','sr','летонски'),(2000,'lv','sv','Lettiska'),(2001,'lv','ta','Latvian'),(2002,'lv','th','ลัตเวีย'),(2003,'lv','tr','Letonca'),(2004,'lv','uk','Latvian'),(2005,'lv','ur','Latvian'),(2006,'lv','uz','Latvian'),(2007,'lv','vi','Latvian'),(2008,'lv','yi','Latvian'),(2009,'lv','zh-hans','拉脱维亚语'),(2010,'lv','zu','Latvian'),(2011,'lv','zh-hant','拉脫維亞語'),(2012,'lv','ms','Latvian'),(2013,'lv','gl','Latvian'),(2014,'lv','bn','Latvian'),(2015,'lv','az','Latvian'),(2016,'lt','en','Lithuanian'),(2017,'lt','es','Lituano'),(2018,'lt','de','Litauisch'),(2019,'lt','fr','Lituanien'),(2020,'lt','ar','اللتوانية'),(2021,'lt','bs','Lithuanian'),(2022,'lt','bg','Литовски'),(2023,'lt','ca','Lithuanian'),(2024,'lt','cs','litevský'),(2025,'lt','sk','Litovčina'),(2026,'lt','cy','Lithuanian'),(2027,'lt','da','Lithuanian'),(2028,'lt','el','Λιθουανικά'),(2029,'lt','eo','Lithuanian'),(2030,'lt','et','Lithuanian'),(2031,'lt','eu','Lithuanian'),(2032,'lt','fa','Lithuanian'),(2033,'lt','fi','liettua'),(2034,'lt','ga','Lithuanian'),(2035,'lt','he','ליטאית'),(2036,'lt','hi','Lithuanian'),(2037,'lt','hr','litavski'),(2038,'lt','hu','litván'),(2039,'lt','hy','Lithuanian'),(2040,'lt','id','Lithuanian'),(2041,'lt','is','Lithuanian'),(2042,'lt','it','Lituano'),(2043,'lt','ja','リトアニア語'),(2044,'lt','ko','리투아니아어'),(2045,'lt','ku','Lithuanian'),(2046,'lt','lv','Lithuanian'),(2047,'lt','lt','Lietuvių'),(2048,'lt','mk','Lithuanian'),(2049,'lt','mt','Lithuanian'),(2050,'lt','mn','Lithuanian'),(2051,'lt','ne','Lithuanian'),(2052,'lt','nl','Litouws'),(2053,'lt','no','Litauisk'),(2054,'lt','pa','Lithuanian'),(2055,'lt','pl','litewski'),(2056,'lt','pt-pt','Lituano'),(2057,'lt','pt-br','Lituano'),(2058,'lt','qu','Lithuanian'),(2059,'lt','ro','Lituaniană'),(2060,'lt','ru','Литовский'),(2061,'lt','sl','Litovščina'),(2062,'lt','so','Lithuanian'),(2063,'lt','sq','Lithuanian'),(2064,'lt','sr','литвански'),(2065,'lt','sv','Litauiska'),(2066,'lt','ta','Lithuanian'),(2067,'lt','th','ลิธัวเนีย'),(2068,'lt','tr','Litvanyaca'),(2069,'lt','uk','Lithuanian'),(2070,'lt','ur','Lithuanian'),(2071,'lt','uz','Lithuanian'),(2072,'lt','vi','Lithuanian'),(2073,'lt','yi','Lithuanian'),(2074,'lt','zh-hans','立陶宛语'),(2075,'lt','zu','Lithuanian'),(2076,'lt','zh-hant','立陶宛語'),(2077,'lt','ms','Lithuanian'),(2078,'lt','gl','Lithuanian'),(2079,'lt','bn','Lithuanian'),(2080,'lt','az','Lithuanian'),(2081,'mk','en','Macedonian'),(2082,'mk','es','Macedonio'),(2083,'mk','de','Mazedonisch'),(2084,'mk','fr','Macédonien'),(2085,'mk','ar','المقدونية'),(2086,'mk','bs','Macedonian'),(2087,'mk','bg','Македонски'),(2088,'mk','ca','Macedonian'),(2089,'mk','cs','Makedonský'),(2090,'mk','sk','Macedónština'),(2091,'mk','cy','Macedonian'),(2092,'mk','da','Macedonian'),(2093,'mk','el','Μακεδονικά'),(2094,'mk','eo','Macedonian'),(2095,'mk','et','Macedonian'),(2096,'mk','eu','Macedonian'),(2097,'mk','fa','Macedonian'),(2098,'mk','fi','makedonia'),(2099,'mk','ga','Macedonian'),(2100,'mk','he','מקדונית'),(2101,'mk','hi','Macedonian'),(2102,'mk','hr','makedonski'),(2103,'mk','hu','macedón'),(2104,'mk','hy','Macedonian'),(2105,'mk','id','Macedonian'),(2106,'mk','is','Macedonian'),(2107,'mk','it','Macedone'),(2108,'mk','ja','マケドニア語'),(2109,'mk','ko','마케도니아어'),(2110,'mk','ku','Macedonian'),(2111,'mk','lv','Macedonian'),(2112,'mk','lt','Macedonian'),(2113,'mk','mk','македонски'),(2114,'mk','mt','Macedonian'),(2115,'mk','mn','Macedonian'),(2116,'mk','ne','Macedonian'),(2117,'mk','nl','Macedonisch'),(2118,'mk','no','Makedonsk'),(2119,'mk','pa','Macedonian'),(2120,'mk','pl','macedoński'),(2121,'mk','pt-pt','Macedônio'),(2122,'mk','pt-br','Macedônio'),(2123,'mk','qu','Macedonian'),(2124,'mk','ro','Macedoniană'),(2125,'mk','ru','Македонский'),(2126,'mk','sl','Makedonski'),(2127,'mk','so','Macedonian'),(2128,'mk','sq','Macedonian'),(2129,'mk','sr','македонски'),(2130,'mk','sv','Makedonska'),(2131,'mk','ta','Macedonian'),(2132,'mk','th','มาซิโดเนีย'),(2133,'mk','tr','Makedonyaca'),(2134,'mk','uk','Macedonian'),(2135,'mk','ur','Macedonian'),(2136,'mk','uz','Macedonian'),(2137,'mk','vi','Macedonian'),(2138,'mk','yi','Macedonian'),(2139,'mk','zh-hans','马其顿语'),(2140,'mk','zu','Macedonian'),(2141,'mk','zh-hant','馬其頓語'),(2142,'mk','ms','Macedonian'),(2143,'mk','gl','Macedonian'),(2144,'mk','bn','Macedonian'),(2145,'mk','az','Macedonian'),(2146,'mt','en','Maltese'),(2147,'mt','es','Maltés'),(2148,'mt','de','Maltesisch'),(2149,'mt','fr','Maltais'),(2150,'mt','ar','المالطية'),(2151,'mt','bs','Maltese'),(2152,'mt','bg','Малтийски'),(2153,'mt','ca','Maltese'),(2154,'mt','cs','Maltština'),(2155,'mt','sk','Maltézština'),(2156,'mt','cy','Maltese'),(2157,'mt','da','Maltese'),(2158,'mt','el','Μαλτέζικα'),(2159,'mt','eo','Maltese'),(2160,'mt','et','Maltese'),(2161,'mt','eu','Maltese'),(2162,'mt','fa','Maltese'),(2163,'mt','fi','malta'),(2164,'mt','ga','Maltese'),(2165,'mt','he','מלטזית'),(2166,'mt','hi','Maltese'),(2167,'mt','hr','malteški'),(2168,'mt','hu','máltai'),(2169,'mt','hy','Maltese'),(2170,'mt','id','Maltese'),(2171,'mt','is','Maltese'),(2172,'mt','it','Maltese'),(2173,'mt','ja','マルタ語'),(2174,'mt','ko','몰타어'),(2175,'mt','ku','Maltese'),(2176,'mt','lv','Maltese'),(2177,'mt','lt','Maltese'),(2178,'mt','mk','Maltese'),(2179,'mt','mt','Malti'),(2180,'mt','mn','Maltese'),(2181,'mt','ne','Maltese'),(2182,'mt','nl','Maltees'),(2183,'mt','no','Maltese'),(2184,'mt','pa','Maltese'),(2185,'mt','pl','maltański'),(2186,'mt','pt-pt','Maltês'),(2187,'mt','pt-br','Maltês'),(2188,'mt','qu','Maltese'),(2189,'mt','ro','Malteză'),(2190,'mt','ru','Мальтийский'),(2191,'mt','sl','Malteški'),(2192,'mt','so','Maltese'),(2193,'mt','sq','Maltese'),(2194,'mt','sr','малтешки'),(2195,'mt','sv','Maltesiska'),(2196,'mt','ta','Maltese'),(2197,'mt','th','มอลทีส'),(2198,'mt','tr','Malta dili'),(2199,'mt','uk','Maltese'),(2200,'mt','ur','Maltese'),(2201,'mt','uz','Maltese'),(2202,'mt','vi','Maltese'),(2203,'mt','yi','Maltese'),(2204,'mt','zh-hans','马耳他语'),(2205,'mt','zu','Maltese'),(2206,'mt','zh-hant','馬爾他語'),(2207,'mt','ms','Maltese'),(2208,'mt','gl','Maltese'),(2209,'mt','bn','Maltese'),(2210,'mt','az','Maltese'),(2211,'mn','en','Mongolian'),(2212,'mn','es','Mongol'),(2213,'mn','de','Mongolisch'),(2214,'mn','fr','Mongol'),(2215,'mn','ar','المنغولية'),(2216,'mn','bs','Mongolian'),(2217,'mn','bg','Монголски'),(2218,'mn','ca','Mongolian'),(2219,'mn','cs','Mongolský'),(2220,'mn','sk','Mongolština'),(2221,'mn','cy','Mongolian'),(2222,'mn','da','Mongolian'),(2223,'mn','el','Μογγολικά'),(2224,'mn','eo','Mongolian'),(2225,'mn','et','Mongolian'),(2226,'mn','eu','Mongolian'),(2227,'mn','fa','Mongolian'),(2228,'mn','fi','mongoli'),(2229,'mn','ga','Mongolian'),(2230,'mn','he','מונגולית'),(2231,'mn','hi','Mongolian'),(2232,'mn','hr','mongolski'),(2233,'mn','hu','mongol'),(2234,'mn','hy','Mongolian'),(2235,'mn','id','Mongolian'),(2236,'mn','is','Mongolian'),(2237,'mn','it','Mongolo'),(2238,'mn','ja','モンゴル語'),(2239,'mn','ko','몽골어'),(2240,'mn','ku','Mongolian'),(2241,'mn','lv','Mongolian'),(2242,'mn','lt','Mongolian'),(2243,'mn','mk','Mongolian'),(2244,'mn','mt','Mongolian'),(2245,'mn','mn','Mongolian'),(2246,'mn','ne','Mongolian'),(2247,'mn','nl','Mongools'),(2248,'mn','no','Mongolsk'),(2249,'mn','pa','Mongolian'),(2250,'mn','pl','mongolski'),(2251,'mn','pt-pt','Mongolian'),(2252,'mn','pt-br','Mongolian'),(2253,'mn','qu','Mongolian'),(2254,'mn','ro','Mongoleză'),(2255,'mn','ru','Монгольский'),(2256,'mn','sl','Mongolski'),(2257,'mn','so','Mongolian'),(2258,'mn','sq','Mongolian'),(2259,'mn','sr','монголски'),(2260,'mn','sv','Mongoliska'),(2261,'mn','ta','Mongolian'),(2262,'mn','th','มองโกเลีย'),(2263,'mn','tr','Mongolca'),(2264,'mn','uk','Mongolian'),(2265,'mn','ur','Mongolian'),(2266,'mn','uz','Mongolian'),(2267,'mn','vi','Mongolian'),(2268,'mn','yi','Mongolian'),(2269,'mn','zh-hans','蒙古语'),(2270,'mn','zu','Mongolian'),(2271,'mn','zh-hant','蒙古語'),(2272,'mn','ms','Mongolian'),(2273,'mn','gl','Mongolian'),(2274,'mn','bn','Mongolian'),(2275,'mn','az','Mongolian'),(2276,'ne','en','Nepali'),(2277,'ne','es','Nepalí'),(2278,'ne','de','Nepali'),(2279,'ne','fr','Népalais'),(2280,'ne','ar','النيبالية'),(2281,'ne','bs','Nepali'),(2282,'ne','bg','Непалски'),(2283,'ne','ca','Nepali'),(2284,'ne','cs','Nepálský'),(2285,'ne','sk','Nepálčina'),(2286,'ne','cy','Nepali'),(2287,'ne','da','Nepali'),(2288,'ne','el','Νεπαλικά'),(2289,'ne','eo','Nepali'),(2290,'ne','et','Nepali'),(2291,'ne','eu','Nepali'),(2292,'ne','fa','Nepali'),(2293,'ne','fi','nepali'),(2294,'ne','ga','Nepali'),(2295,'ne','he','נפאלית'),(2296,'ne','hi','Nepali'),(2297,'ne','hr','nepali'),(2298,'ne','hu','nepáli'),(2299,'ne','hy','Nepali'),(2300,'ne','id','Nepali'),(2301,'ne','is','Nepali'),(2302,'ne','it','Nepalese'),(2303,'ne','ja','ネパール語'),(2304,'ne','ko','네팔어'),(2305,'ne','ku','Nepali'),(2306,'ne','lv','Nepali'),(2307,'ne','lt','Nepali'),(2308,'ne','mk','Nepali'),(2309,'ne','mt','Nepali'),(2310,'ne','mn','Nepali'),(2311,'ne','ne','Nepali'),(2312,'ne','nl','Nepalees'),(2313,'ne','no','Nepali'),(2314,'ne','pa','Nepali'),(2315,'ne','pl','nepalski'),(2316,'ne','pt-pt','Nepali'),(2317,'ne','pt-br','Nepali'),(2318,'ne','qu','Nepali'),(2319,'ne','ro','Nepaleză'),(2320,'ne','ru','Непальский'),(2321,'ne','sl','Nepalščina'),(2322,'ne','so','Nepali'),(2323,'ne','sq','Nepali'),(2324,'ne','sr','непалски'),(2325,'ne','sv','Nepalesiska'),(2326,'ne','ta','Nepali'),(2327,'ne','th','เนปาล'),(2328,'ne','tr','Nepal dili'),(2329,'ne','uk','Nepali'),(2330,'ne','ur','Nepali'),(2331,'ne','uz','Nepali'),(2332,'ne','vi','Nepali'),(2333,'ne','yi','Nepali'),(2334,'ne','zh-hans','尼泊尔语'),(2335,'ne','zu','Nepali'),(2336,'ne','zh-hant','尼泊爾語'),(2337,'ne','ms','Nepali'),(2338,'ne','gl','Nepali'),(2339,'ne','bn','Nepali'),(2340,'ne','az','Nepali'),(2341,'nl','en','Dutch'),(2342,'nl','es','Holandés'),(2343,'nl','de','Niederländisch'),(2344,'nl','fr','Néerlandais'),(2345,'nl','ar','الهولندية'),(2346,'nl','bs','Dutch'),(2347,'nl','bg','Холандски'),(2348,'nl','ca','Dutch'),(2349,'nl','cs','Holandský'),(2350,'nl','sk','Holandčina'),(2351,'nl','cy','Dutch'),(2352,'nl','da','Dutch'),(2353,'nl','el','Ολλανδικά'),(2354,'nl','eo','Dutch'),(2355,'nl','et','Dutch'),(2356,'nl','eu','Dutch'),(2357,'nl','fa','Dutch'),(2358,'nl','fi','hollanti'),(2359,'nl','ga','Dutch'),(2360,'nl','he','הולנדית'),(2361,'nl','hi','Dutch'),(2362,'nl','hr','nizozemski'),(2363,'nl','hu','holland'),(2364,'nl','hy','Dutch'),(2365,'nl','id','Dutch'),(2366,'nl','is','Dutch'),(2367,'nl','it','Olandese'),(2368,'nl','ja','オランダ語'),(2369,'nl','ko','화란어'),(2370,'nl','ku','Dutch'),(2371,'nl','lv','Dutch'),(2372,'nl','lt','Dutch'),(2373,'nl','mk','Dutch'),(2374,'nl','mt','Dutch'),(2375,'nl','mn','Dutch'),(2376,'nl','ne','Dutch'),(2377,'nl','nl','Nederlands'),(2378,'nl','no','Nederlandsk'),(2379,'nl','pa','Dutch'),(2380,'nl','pl','holenderski'),(2381,'nl','pt-pt','Holandês'),(2382,'nl','pt-br','Holandês'),(2383,'nl','qu','Dutch'),(2384,'nl','ro','Olaneză'),(2385,'nl','ru','Голландский'),(2386,'nl','sl','Nizozemščina'),(2387,'nl','so','Dutch'),(2388,'nl','sq','Dutch'),(2389,'nl','sr','холандски'),(2390,'nl','sv','Nederländska'),(2391,'nl','ta','Dutch'),(2392,'nl','th','ดัตช์'),(2393,'nl','tr','Hollandaca'),(2394,'nl','uk','Dutch'),(2395,'nl','ur','Dutch'),(2396,'nl','uz','Dutch'),(2397,'nl','vi','Dutch'),(2398,'nl','yi','Dutch'),(2399,'nl','zh-hans','荷兰语'),(2400,'nl','zu','Dutch'),(2401,'nl','zh-hant','荷蘭語'),(2402,'nl','ms','Dutch'),(2403,'nl','gl','Dutch'),(2404,'nl','bn','Dutch'),(2405,'nl','az','Dutch'),(2406,'no','en','Norwegian Bokmål'),(2407,'no','es','Bokmål'),(2408,'no','de','Norwegisch (Buchsprache)'),(2409,'no','fr','Norvégien Bokmål'),(2410,'no','ar','البوكمالية النرويجية'),(2411,'no','bs','Norwegian Bokmål'),(2412,'no','bg','Норвежки книжовен'),(2413,'no','ca','Norwegian Bokmål'),(2414,'no','cs','Norwegian bokmål'),(2415,'no','sk','Nórsky jazyk Bokmål'),(2416,'no','cy','Norwegian Bokmål'),(2417,'no','da','Norwegian Bokmål'),(2418,'no','el','Νορβηγικά'),(2419,'no','eo','Norwegian Bokmål'),(2420,'no','et','Norwegian Bokmål'),(2421,'no','eu','Norwegian Bokmål'),(2422,'no','fa','Norwegian Bokmål'),(2423,'no','fi','kirjanorja'),(2424,'no','ga','Norwegian Bokmål'),(2425,'no','he','נורווגית'),(2426,'no','hi','Norwegian Bokmål'),(2427,'no','hr','književni norveški'),(2428,'no','hu','norvég bokmål'),(2429,'no','hy','Norwegian Bokmål'),(2430,'no','id','Norwegian Bokmål'),(2431,'no','is','Norwegian Bokmål'),(2432,'no','it','Norvegese Bokmål'),(2433,'no','ja','ノルウェー・ブークモール'),(2434,'no','ko','노르웨이 보크말어'),(2435,'no','ku','Norwegian Bokmål'),(2436,'no','lv','Norwegian Bokmål'),(2437,'no','lt','Norwegian Bokmål'),(2438,'no','mk','Norwegian Bokmål'),(2439,'no','mt','Norwegian Bokmål'),(2440,'no','mn','Norwegian Bokmål'),(2441,'no','ne','Norwegian Bokmål'),(2442,'no','nl','Noors Bokmål'),(2443,'no','no','Norsk bokmål'),(2444,'no','pa','Norwegian Bokmål'),(2445,'no','pl','norweski bokmål'),(2446,'no','pt-pt','Norueguês'),(2447,'no','pt-br','Norueguês'),(2448,'no','qu','Norwegian Bokmål'),(2449,'no','ro','Bokmål (norvegiană)'),(2450,'no','ru','Норвежский букмол'),(2451,'no','sl','Knjižna norveščina'),(2452,'no','so','Norwegian Bokmål'),(2453,'no','sq','Norwegian Bokmål'),(2454,'no','sr','Норвешки бокмал'),(2455,'no','sv','Norskt Bokmål'),(2456,'no','ta','Norwegian Bokmål'),(2457,'no','th','นอร์วิเจียนบอกมาล'),(2458,'no','tr','Bokmal Norveç dili'),(2459,'no','uk','Norwegian Bokmål'),(2460,'no','ur','Norwegian Bokmål'),(2461,'no','uz','Norwegian Bokmål'),(2462,'no','vi','Norwegian Bokmål'),(2463,'no','yi','Norwegian Bokmål'),(2464,'no','zh-hans','挪威布克莫尔语'),(2465,'no','zu','Norwegian Bokmål'),(2466,'no','zh-hant','挪威布克莫爾語'),(2467,'no','ms','Norwegian Bokmål'),(2468,'no','gl','Norwegian Bokmål'),(2469,'no','bn','Norwegian Bokmål'),(2470,'no','az','Norwegian Bokmål'),(2471,'pa','en','Punjabi'),(2472,'pa','es','Panyabí'),(2473,'pa','de','Pandschabi'),(2474,'pa','fr','Panjabi'),(2475,'pa','ar','البنجابية'),(2476,'pa','bs','Punjabi'),(2477,'pa','bg','Панджабски'),(2478,'pa','ca','Punjabi'),(2479,'pa','cs','Punjabi'),(2480,'pa','sk','Pandžábčina'),(2481,'pa','cy','Punjabi'),(2482,'pa','da','Punjabi'),(2483,'pa','el','Παντζάμπι'),(2484,'pa','eo','Punjabi'),(2485,'pa','et','Punjabi'),(2486,'pa','eu','Punjabi'),(2487,'pa','fa','Punjabi'),(2488,'pa','fi','pandzabi'),(2489,'pa','ga','Punjabi'),(2490,'pa','he','פנג\'אבית'),(2491,'pa','hi','Punjabi'),(2492,'pa','hr','pendžabljanin'),(2493,'pa','hu','pandzsábi'),(2494,'pa','hy','Punjabi'),(2495,'pa','id','Punjabi'),(2496,'pa','is','Punjabi'),(2497,'pa','it','Panjabi'),(2498,'pa','ja','パンジャーブ語'),(2499,'pa','ko','펀자브어'),(2500,'pa','ku','Punjabi'),(2501,'pa','lv','Punjabi'),(2502,'pa','lt','Punjabi'),(2503,'pa','mk','Punjabi'),(2504,'pa','mt','Punjabi'),(2505,'pa','mn','Punjabi'),(2506,'pa','ne','Punjabi'),(2507,'pa','nl','Punjabi'),(2508,'pa','no','Punjabi'),(2509,'pa','pa','Punjabi'),(2510,'pa','pl','pendżabi'),(2511,'pa','pt-pt','Panjabi'),(2512,'pa','pt-br','Panjabi'),(2513,'pa','qu','Punjabi'),(2514,'pa','ro','Punjabi'),(2515,'pa','ru','Панджаби'),(2516,'pa','sl','Pandžabščina'),(2517,'pa','so','Punjabi'),(2518,'pa','sq','Punjabi'),(2519,'pa','sr','панџаби'),(2520,'pa','sv','Punjabi'),(2521,'pa','ta','Punjabi'),(2522,'pa','th','ปัญจาบ'),(2523,'pa','tr','Pencapça'),(2524,'pa','uk','Punjabi'),(2525,'pa','ur','Punjabi'),(2526,'pa','uz','Punjabi'),(2527,'pa','vi','Punjabi'),(2528,'pa','yi','Punjabi'),(2529,'pa','zh-hans','旁遮普语'),(2530,'pa','zu','Punjabi'),(2531,'pa','zh-hant','旁遮普語'),(2532,'pa','ms','Punjabi'),(2533,'pa','gl','Punjabi'),(2534,'pa','bn','Punjabi'),(2535,'pa','az','Punjabi'),(2536,'pl','en','Polish'),(2537,'pl','es','Polaco'),(2538,'pl','de','Polnisch'),(2539,'pl','fr','Polonais'),(2540,'pl','ar','البولندية'),(2541,'pl','bs','Polish'),(2542,'pl','bg','Полски'),(2543,'pl','ca','Polish'),(2544,'pl','cs','Polský'),(2545,'pl','sk','Polština'),(2546,'pl','cy','Polish'),(2547,'pl','da','Polish'),(2548,'pl','el','Πολωνικά'),(2549,'pl','eo','Polish'),(2550,'pl','et','Polish'),(2551,'pl','eu','Polish'),(2552,'pl','fa','Polish'),(2553,'pl','fi','puola'),(2554,'pl','ga','Polish'),(2555,'pl','he','פולנית'),(2556,'pl','hi','Polish'),(2557,'pl','hr','poljski'),(2558,'pl','hu','lengyel'),(2559,'pl','hy','Polish'),(2560,'pl','id','Polish'),(2561,'pl','is','Polish'),(2562,'pl','it','Polacco'),(2563,'pl','ja','ポーランド語'),(2564,'pl','ko','폴란드어'),(2565,'pl','ku','Polish'),(2566,'pl','lv','Polish'),(2567,'pl','lt','Polish'),(2568,'pl','mk','Polish'),(2569,'pl','mt','Polish'),(2570,'pl','mn','Polish'),(2571,'pl','ne','Polish'),(2572,'pl','nl','Pools'),(2573,'pl','no','Polsk'),(2574,'pl','pa','Polish'),(2575,'pl','pl','polski'),(2576,'pl','pt-pt','Polonês'),(2577,'pl','pt-br','Polonês'),(2578,'pl','qu','Polish'),(2579,'pl','ro','Poloneză'),(2580,'pl','ru','Польский'),(2581,'pl','sl','Poljski'),(2582,'pl','so','Polish'),(2583,'pl','sq','Polish'),(2584,'pl','sr','пољски'),(2585,'pl','sv','Polska'),(2586,'pl','ta','Polish'),(2587,'pl','th','โปแลนด์'),(2588,'pl','tr','Polonyaca'),(2589,'pl','uk','Polish'),(2590,'pl','ur','Polish'),(2591,'pl','uz','Polish'),(2592,'pl','vi','Polish'),(2593,'pl','yi','Polish'),(2594,'pl','zh-hans','波兰语'),(2595,'pl','zu','Polish'),(2596,'pl','zh-hant','波蘭語'),(2597,'pl','ms','Polish'),(2598,'pl','gl','Polish'),(2599,'pl','bn','Polish'),(2600,'pl','az','Polish'),(2601,'pt-pt','en','Portuguese (Portugal)'),(2602,'pt-pt','es','Portugués, Portugal'),(2603,'pt-pt','de','Portugiesisch, Portugal'),(2604,'pt-pt','fr','Portugais - du Portugal'),(2605,'pt-pt','ar','البرتغالية ، البرتغال'),(2606,'pt-pt','bs','Portuguese, Portugal'),(2607,'pt-pt','bg','Португалски (Португалия)'),(2608,'pt-pt','ca','Portuguese, Portugal'),(2609,'pt-pt','cs','Portugalština ( Portugalsko)'),(2610,'pt-pt','sk','Portugalština'),(2611,'pt-pt','cy','Portuguese, Portugal'),(2612,'pt-pt','da','Portuguese, Portugal'),(2613,'pt-pt','el','Πορτογαλικά'),(2614,'pt-pt','eo','Portuguese, Portugal'),(2615,'pt-pt','et','Portuguese, Portugal'),(2616,'pt-pt','eu','Portuguese, Portugal'),(2617,'pt-pt','fa','Portuguese, Portugal'),(2618,'pt-pt','fi','portugali'),(2619,'pt-pt','ga','Portuguese, Portugal'),(2620,'pt-pt','he','פורטוגזית'),(2621,'pt-pt','hi','Portuguese, Portugal'),(2622,'pt-pt','hr','portugalski (Portugal)'),(2623,'pt-pt','hu','portugál'),(2624,'pt-pt','hy','Portuguese, Portugal'),(2625,'pt-pt','id','Portuguese, Portugal'),(2626,'pt-pt','is','Portuguese, Portugal'),(2627,'pt-pt','it','Portoghese, Portogallo'),(2628,'pt-pt','ja','ポルトガル語'),(2629,'pt-pt','ko','포르투갈 포르투갈어'),(2630,'pt-pt','ku','Portuguese, Portugal'),(2631,'pt-pt','lv','Portuguese, Portugal'),(2632,'pt-pt','lt','Portuguese, Portugal'),(2633,'pt-pt','mk','Portuguese, Portugal'),(2634,'pt-pt','mt','Portuguese, Portugal'),(2635,'pt-pt','mn','Portuguese, Portugal'),(2636,'pt-pt','ne','Portuguese, Portugal'),(2637,'pt-pt','nl','Portugees, Portugal'),(2638,'pt-pt','no','Portugisisk (Portugal)'),(2639,'pt-pt','pa','Portuguese, Portugal'),(2640,'pt-pt','pl','portugalski, Portugalia'),(2641,'pt-pt','pt-pt','Português'),(2642,'pt-pt','pt-br','Português'),(2643,'pt-pt','qu','Portuguese, Portugal'),(2644,'pt-pt','ro','Portugheză (Portugalia)'),(2645,'pt-pt','ru','Португальский, Португалия'),(2646,'pt-pt','sl','Portugalščina ( Portugalska )'),(2647,'pt-pt','so','Portuguese, Portugal'),(2648,'pt-pt','sq','Portuguese, Portugal'),(2649,'pt-pt','sr','Португалски (Португалија)'),(2650,'pt-pt','sv','Portugisiska, Portugal'),(2651,'pt-pt','ta','Portuguese, Portugal'),(2652,'pt-pt','th','โปรตุเกส'),(2653,'pt-pt','tr','Portekizce, Portekiz'),(2654,'pt-pt','uk','Portuguese, Portugal'),(2655,'pt-pt','ur','Portuguese, Portugal'),(2656,'pt-pt','uz','Portuguese, Portugal'),(2657,'pt-pt','vi','Portuguese, Portugal'),(2658,'pt-pt','yi','Portuguese, Portugal'),(2659,'pt-pt','zh-hans','葡萄牙语（葡萄牙）'),(2660,'pt-pt','zu','Portuguese, Portugal'),(2661,'pt-pt','zh-hant','葡萄牙語（葡萄牙）'),(2662,'pt-pt','ms','Portuguese, Portugal'),(2663,'pt-pt','gl','Portuguese, Portugal'),(2664,'pt-pt','bn','Portuguese, Portugal'),(2665,'pt-pt','az','Portuguese, Portugal'),(2666,'pt-br','en','Portuguese (Brazil)'),(2667,'pt-br','es','Portugués, Brasil'),(2668,'pt-br','de','Portugiesisch, Brasilien'),(2669,'pt-br','fr','Portugais - du Brésil'),(2670,'pt-br','ar','البرتغالية ،البرازيل'),(2671,'pt-br','bs','Portuguese, Brazil'),(2672,'pt-br','bg','Португалски (Бразилия)'),(2673,'pt-br','ca','Portuguese, Brazil'),(2674,'pt-br','cs','Portugalština ( Brazílie)'),(2675,'pt-br','sk','Brazílska Portugalština'),(2676,'pt-br','cy','Portuguese, Brazil'),(2677,'pt-br','da','Portuguese, Brazil'),(2678,'pt-br','el','Πορτογαλικά Βραζιλίας'),(2679,'pt-br','eo','Portuguese, Brazil'),(2680,'pt-br','et','Portuguese, Brazil'),(2681,'pt-br','eu','Portuguese, Brazil'),(2682,'pt-br','fa','Portuguese, Brazil'),(2683,'pt-br','fi','Brasilian portugali'),(2684,'pt-br','ga','Portuguese, Brazil'),(2685,'pt-br','he','פורטוגזית - ברזיל'),(2686,'pt-br','hi','Portuguese, Brazil'),(2687,'pt-br','hr','portugalski (Brazil)'),(2688,'pt-br','hu','brazil'),(2689,'pt-br','hy','Portuguese, Brazil'),(2690,'pt-br','id','Portuguese, Brazil'),(2691,'pt-br','is','Portuguese, Brazil'),(2692,'pt-br','it','Portoghese, Brasile'),(2693,'pt-br','ja','ポルトガル語（ブラジル）'),(2694,'pt-br','ko','브라질 포르투갈어'),(2695,'pt-br','ku','Portuguese, Brazil'),(2696,'pt-br','lv','Portuguese, Brazil'),(2697,'pt-br','lt','Portuguese, Brazil'),(2698,'pt-br','mk','Portuguese, Brazil'),(2699,'pt-br','mt','Portuguese, Brazil'),(2700,'pt-br','mn','Portuguese, Brazil'),(2701,'pt-br','ne','Portuguese, Brazil'),(2702,'pt-br','nl','Portugees, Brazilië'),(2703,'pt-br','no','Portugisisk (Brasil)'),(2704,'pt-br','pa','Portuguese, Brazil'),(2705,'pt-br','pl','portugalski, Brazylia'),(2706,'pt-br','pt-pt','Português'),(2707,'pt-br','pt-br','Português'),(2708,'pt-br','qu','Portuguese, Brazil'),(2709,'pt-br','ro','Portugheză (Brazilia)'),(2710,'pt-br','ru','Португальский, Бразилия'),(2711,'pt-br','sl','Portugalščina ( Brazilija )'),(2712,'pt-br','so','Portuguese, Brazil'),(2713,'pt-br','sq','Portuguese, Brazil'),(2714,'pt-br','sr','Португалски (Бразил)'),(2715,'pt-br','sv','Portugisiska, Brasilien'),(2716,'pt-br','ta','Portuguese, Brazil'),(2717,'pt-br','th','โปรตุเกสบราซิล'),(2718,'pt-br','tr','Portekizce, Brezilya'),(2719,'pt-br','uk','Portuguese, Brazil'),(2720,'pt-br','ur','Portuguese, Brazil'),(2721,'pt-br','uz','Portuguese, Brazil'),(2722,'pt-br','vi','Portuguese, Brazil'),(2723,'pt-br','yi','Portuguese, Brazil'),(2724,'pt-br','zh-hans','葡萄牙语（巴西）'),(2725,'pt-br','zu','Portuguese, Brazil'),(2726,'pt-br','zh-hant','葡萄牙語（巴西）'),(2727,'pt-br','ms','Portuguese, Brazil'),(2728,'pt-br','gl','Portuguese, Brazil'),(2729,'pt-br','bn','Portuguese, Brazil'),(2730,'pt-br','az','Portuguese, Brazil'),(2731,'qu','en','Quechua'),(2732,'qu','es','Quechua'),(2733,'qu','de','Quechua'),(2734,'qu','fr','Quechua'),(2735,'qu','ar','الكويتشوا'),(2736,'qu','bs','Quechua'),(2737,'qu','bg','Кечуа'),(2738,'qu','ca','Quechua'),(2739,'qu','cs','Quechua'),(2740,'qu','sk','Jazyk Quechua'),(2741,'qu','cy','Quechua'),(2742,'qu','da','Quechua'),(2743,'qu','el','Κέτσουα'),(2744,'qu','eo','Quechua'),(2745,'qu','et','Quechua'),(2746,'qu','eu','Quechua'),(2747,'qu','fa','Quechua'),(2748,'qu','fi','ketsua'),(2749,'qu','ga','Quechua'),(2750,'qu','he','קצ\'ואה'),(2751,'qu','hi','Quechua'),(2752,'qu','hr','quechua'),(2753,'qu','hu','quechua'),(2754,'qu','hy','Quechua'),(2755,'qu','id','Quechua'),(2756,'qu','is','Quechua'),(2757,'qu','it','Quechua'),(2758,'qu','ja','ケチュア語'),(2759,'qu','ko','케추아어'),(2760,'qu','ku','Quechua'),(2761,'qu','lv','Quechua'),(2762,'qu','lt','Quechua'),(2763,'qu','mk','Quechua'),(2764,'qu','mt','Quechua'),(2765,'qu','mn','Quechua'),(2766,'qu','ne','Quechua'),(2767,'qu','nl','Quechua'),(2768,'qu','no','Quechua'),(2769,'qu','pa','Quechua'),(2770,'qu','pl','keczua'),(2771,'qu','pt-pt','Quechua'),(2772,'qu','pt-br','Quechua'),(2773,'qu','qu','Quechua'),(2774,'qu','ro','Quechuană'),(2775,'qu','ru','Кечуа'),(2776,'qu','sl','Quechua'),(2777,'qu','so','Quechua'),(2778,'qu','sq','Quechua'),(2779,'qu','sr','Кечуа'),(2780,'qu','sv','Quechua'),(2781,'qu','ta','Quechua'),(2782,'qu','th','คิวชัว'),(2783,'qu','tr','Quechua dili'),(2784,'qu','uk','Quechua'),(2785,'qu','ur','Quechua'),(2786,'qu','uz','Quechua'),(2787,'qu','vi','Quechua'),(2788,'qu','yi','Quechua'),(2789,'qu','zh-hans','盖丘亚语'),(2790,'qu','zu','Quechua'),(2791,'qu','zh-hant','蓋丘亞語'),(2792,'qu','ms','Quechua'),(2793,'qu','gl','Quechua'),(2794,'qu','bn','Quechua'),(2795,'qu','az','Quechua'),(2796,'ro','en','Romanian'),(2797,'ro','es','Rumano'),(2798,'ro','de','Rumänisch'),(2799,'ro','fr','Roumain'),(2800,'ro','ar','الرومانية'),(2801,'ro','bs','Romanian'),(2802,'ro','bg','Румънски'),(2803,'ro','ca','Romanian'),(2804,'ro','cs','Rumunština'),(2805,'ro','sk','Rumunčina'),(2806,'ro','cy','Romanian'),(2807,'ro','da','Romanian'),(2808,'ro','el','Ρουμανικά'),(2809,'ro','eo','Romanian'),(2810,'ro','et','Romanian'),(2811,'ro','eu','Romanian'),(2812,'ro','fa','Romanian'),(2813,'ro','fi','romania'),(2814,'ro','ga','Romanian'),(2815,'ro','he','רומנית'),(2816,'ro','hi','Romanian'),(2817,'ro','hr','rumunjski'),(2818,'ro','hu','román'),(2819,'ro','hy','Romanian'),(2820,'ro','id','Romanian'),(2821,'ro','is','Romanian'),(2822,'ro','it','Rumeno'),(2823,'ro','ja','ルーマニア語'),(2824,'ro','ko','로마니아어'),(2825,'ro','ku','Romanian'),(2826,'ro','lv','Romanian'),(2827,'ro','lt','Romanian'),(2828,'ro','mk','Romanian'),(2829,'ro','mt','Romanian'),(2830,'ro','mn','Romanian'),(2831,'ro','ne','Romanian'),(2832,'ro','nl','Roemeens'),(2833,'ro','no','Rumensk'),(2834,'ro','pa','Romanian'),(2835,'ro','pl','rumuński'),(2836,'ro','pt-pt','Romeno'),(2837,'ro','pt-br','Romeno'),(2838,'ro','qu','Romanian'),(2839,'ro','ro','Română'),(2840,'ro','ru','Румынский'),(2841,'ro','sl','Romunščina'),(2842,'ro','so','Romanian'),(2843,'ro','sq','Romanian'),(2844,'ro','sr','румунски'),(2845,'ro','sv','Rumänska'),(2846,'ro','ta','Romanian'),(2847,'ro','th','โรมาเนีย'),(2848,'ro','tr','Rumence'),(2849,'ro','uk','Romanian'),(2850,'ro','ur','Romanian'),(2851,'ro','uz','Romanian'),(2852,'ro','vi','Romanian'),(2853,'ro','yi','Romanian'),(2854,'ro','zh-hans','罗马尼亚语'),(2855,'ro','zu','Romanian'),(2856,'ro','zh-hant','羅馬尼亞語'),(2857,'ro','ms','Romanian'),(2858,'ro','gl','Romanian'),(2859,'ro','bn','Romanian'),(2860,'ro','az','Romanian'),(2861,'ru','en','Russian'),(2862,'ru','es','Ruso'),(2863,'ru','de','Russisch'),(2864,'ru','fr','Russe'),(2865,'ru','ar','الروسية'),(2866,'ru','bs','Russian'),(2867,'ru','bg','Руски'),(2868,'ru','ca','Russian'),(2869,'ru','cs','Ruský'),(2870,'ru','sk','Ruština'),(2871,'ru','cy','Russian'),(2872,'ru','da','Russian'),(2873,'ru','el','Ρωσικά'),(2874,'ru','eo','Russian'),(2875,'ru','et','Russian'),(2876,'ru','eu','Russian'),(2877,'ru','fa','Russian'),(2878,'ru','fi','venäjä'),(2879,'ru','ga','Russian'),(2880,'ru','he','רוסית'),(2881,'ru','hi','Russian'),(2882,'ru','hr','ruski'),(2883,'ru','hu','orosz'),(2884,'ru','hy','Russian'),(2885,'ru','id','Russian'),(2886,'ru','is','Russian'),(2887,'ru','it','Russo'),(2888,'ru','ja','ロシア語'),(2889,'ru','ko','러시아어'),(2890,'ru','ku','Russian'),(2891,'ru','lv','Russian'),(2892,'ru','lt','Russian'),(2893,'ru','mk','Russian'),(2894,'ru','mt','Russian'),(2895,'ru','mn','Russian'),(2896,'ru','ne','Russian'),(2897,'ru','nl','Russisch'),(2898,'ru','no','Russisk'),(2899,'ru','pa','Russian'),(2900,'ru','pl','rosyjski'),(2901,'ru','pt-pt','Russo'),(2902,'ru','pt-br','Russo'),(2903,'ru','qu','Russian'),(2904,'ru','ro','Rusă'),(2905,'ru','ru','Русский'),(2906,'ru','sl','Ruščina'),(2907,'ru','so','Russian'),(2908,'ru','sq','Russian'),(2909,'ru','sr','руски'),(2910,'ru','sv','Ryska'),(2911,'ru','ta','Russian'),(2912,'ru','th','รัสเซีย'),(2913,'ru','tr','Rusça'),(2914,'ru','uk','Russian'),(2915,'ru','ur','Russian'),(2916,'ru','uz','Russian'),(2917,'ru','vi','Russian'),(2918,'ru','yi','Russian'),(2919,'ru','zh-hans','俄语'),(2920,'ru','zu','Russian'),(2921,'ru','zh-hant','俄語'),(2922,'ru','ms','Russian'),(2923,'ru','gl','Russian'),(2924,'ru','bn','Russian'),(2925,'ru','az','Russian'),(2926,'sl','en','Slovenian'),(2927,'sl','es','Esloveno'),(2928,'sl','de','Slowenisch'),(2929,'sl','fr','Slovène'),(2930,'sl','ar','السلوفانية'),(2931,'sl','bs','Slovenian'),(2932,'sl','bg','Словенски'),(2933,'sl','ca','Slovenian'),(2934,'sl','cs','Slovinština'),(2935,'sl','sk','Slovinčina'),(2936,'sl','cy','Slovenian'),(2937,'sl','da','Slovenian'),(2938,'sl','el','Σλοβενικά'),(2939,'sl','eo','Slovenian'),(2940,'sl','et','Slovenian'),(2941,'sl','eu','Slovenian'),(2942,'sl','fa','Slovenian'),(2943,'sl','fi','sloveeni'),(2944,'sl','ga','Slovenian'),(2945,'sl','he','סלובנית'),(2946,'sl','hi','Slovenian'),(2947,'sl','hr','slovenski'),(2948,'sl','hu','szlovén'),(2949,'sl','hy','Slovenian'),(2950,'sl','id','Slovenian'),(2951,'sl','is','Slovenian'),(2952,'sl','it','Sloveno'),(2953,'sl','ja','スロベニア語'),(2954,'sl','ko','슬로베니아어'),(2955,'sl','ku','Slovenian'),(2956,'sl','lv','Slovenian'),(2957,'sl','lt','Slovenian'),(2958,'sl','mk','Slovenian'),(2959,'sl','mt','Slovenian'),(2960,'sl','mn','Slovenian'),(2961,'sl','ne','Slovenian'),(2962,'sl','nl','Sloveens'),(2963,'sl','no','Slovensk'),(2964,'sl','pa','Slovenian'),(2965,'sl','pl','słoweński'),(2966,'sl','pt-pt','Esloveno'),(2967,'sl','pt-br','Esloveno'),(2968,'sl','qu','Slovenian'),(2969,'sl','ro','Slovenă'),(2970,'sl','ru','Словенский'),(2971,'sl','sl','Slovenščina'),(2972,'sl','so','Slovenian'),(2973,'sl','sq','Slovenian'),(2974,'sl','sr','словеначки'),(2975,'sl','sv','Slovenska'),(2976,'sl','ta','Slovenian'),(2977,'sl','th','สโลวีเนียน'),(2978,'sl','tr','Sloven dili'),(2979,'sl','uk','Slovenian'),(2980,'sl','ur','Slovenian'),(2981,'sl','uz','Slovenian'),(2982,'sl','vi','Slovenian'),(2983,'sl','yi','Slovenian'),(2984,'sl','zh-hans','斯洛文尼亚语'),(2985,'sl','zu','Slovenian'),(2986,'sl','zh-hant','斯洛文尼亞語'),(2987,'sl','ms','Slovenian'),(2988,'sl','gl','Slovenian'),(2989,'sl','bn','Slovenian'),(2990,'sl','az','Slovenian'),(2991,'so','en','Somali'),(2992,'so','es','Somalí'),(2993,'so','de','Somali'),(2994,'so','fr','Somali'),(2995,'so','ar','الصومالية'),(2996,'so','bs','Somali'),(2997,'so','bg','Сомалийски'),(2998,'so','ca','Somali'),(2999,'so','cs','Somali'),(3000,'so','sk','Somálčina'),(3001,'so','cy','Somali'),(3002,'so','da','Somali'),(3003,'so','el','Σομαλικά'),(3004,'so','eo','Somali'),(3005,'so','et','Somali'),(3006,'so','eu','Somali'),(3007,'so','fa','Somali'),(3008,'so','fi','somali'),(3009,'so','ga','Somali'),(3010,'so','he','סומלית'),(3011,'so','hi','Somali'),(3012,'so','hr','somalski'),(3013,'so','hu','szomáli'),(3014,'so','hy','Somali'),(3015,'so','id','Somali'),(3016,'so','is','Somali'),(3017,'so','it','Somalo'),(3018,'so','ja','ソマリ語'),(3019,'so','ko','소말리아어'),(3020,'so','ku','Somali'),(3021,'so','lv','Somali'),(3022,'so','lt','Somali'),(3023,'so','mk','Somali'),(3024,'so','mt','Somali'),(3025,'so','mn','Somali'),(3026,'so','ne','Somali'),(3027,'so','nl','Somalisch'),(3028,'so','no','Somali'),(3029,'so','pa','Somali'),(3030,'so','pl','somalijski'),(3031,'so','pt-pt','Somali'),(3032,'so','pt-br','Somali'),(3033,'so','qu','Somali'),(3034,'so','ro','Somaleză'),(3035,'so','ru','Сомалийский'),(3036,'so','sl','Somalski'),(3037,'so','so','Somali'),(3038,'so','sq','Somali'),(3039,'so','sr','Сомалијски'),(3040,'so','sv','Somaliska'),(3041,'so','ta','Somali'),(3042,'so','th','โซมาลี'),(3043,'so','tr','Somalice'),(3044,'so','uk','Somali'),(3045,'so','ur','Somali'),(3046,'so','uz','Somali'),(3047,'so','vi','Somali'),(3048,'so','yi','Somali'),(3049,'so','zh-hans','索马里语'),(3050,'so','zu','Somali'),(3051,'so','zh-hant','索馬里語'),(3052,'so','ms','Somali'),(3053,'so','gl','Somali'),(3054,'so','bn','Somali'),(3055,'so','az','Somali'),(3056,'sq','en','Albanian'),(3057,'sq','es','Albanés'),(3058,'sq','de','Albanisch'),(3059,'sq','fr','Albanais'),(3060,'sq','ar','الألبانية'),(3061,'sq','bs','Albanian'),(3062,'sq','bg','Албански'),(3063,'sq','ca','Albanian'),(3064,'sq','cs','Albánský'),(3065,'sq','sk','Albánčina'),(3066,'sq','cy','Albanian'),(3067,'sq','da','Albanian'),(3068,'sq','el','Αλβανικά'),(3069,'sq','eo','Albanian'),(3070,'sq','et','Albanian'),(3071,'sq','eu','Albanian'),(3072,'sq','fa','Albanian'),(3073,'sq','fi','albania'),(3074,'sq','ga','Albanian'),(3075,'sq','he','אלבנית'),(3076,'sq','hi','Albanian'),(3077,'sq','hr','albanski'),(3078,'sq','hu','albán'),(3079,'sq','hy','Albanian'),(3080,'sq','id','Albanian'),(3081,'sq','is','Albanian'),(3082,'sq','it','Albanese'),(3083,'sq','ja','アルバニア語'),(3084,'sq','ko','알바니아어'),(3085,'sq','ku','Albanian'),(3086,'sq','lv','Albanian'),(3087,'sq','lt','Albanian'),(3088,'sq','mk','Albanian'),(3089,'sq','mt','Albanian'),(3090,'sq','mn','Albanian'),(3091,'sq','ne','Albanian'),(3092,'sq','nl','Albaans'),(3093,'sq','no','Albansk'),(3094,'sq','pa','Albanian'),(3095,'sq','pl','albański'),(3096,'sq','pt-pt','Albanês'),(3097,'sq','pt-br','Albanês'),(3098,'sq','qu','Albanian'),(3099,'sq','ro','Albaneză'),(3100,'sq','ru','Албанский'),(3101,'sq','sl','Albanski'),(3102,'sq','so','Albanian'),(3103,'sq','sq','Albanian'),(3104,'sq','sr','албански'),(3105,'sq','sv','Albanska'),(3106,'sq','ta','Albanian'),(3107,'sq','th','อัลเบเนีย'),(3108,'sq','tr','Arnavutça'),(3109,'sq','uk','Albanian'),(3110,'sq','ur','Albanian'),(3111,'sq','uz','Albanian'),(3112,'sq','vi','Albanian'),(3113,'sq','yi','Albanian'),(3114,'sq','zh-hans','阿尔巴尼亚语'),(3115,'sq','zu','Albanian'),(3116,'sq','zh-hant','阿爾巴尼亞語'),(3117,'sq','ms','Albanian'),(3118,'sq','gl','Albanian'),(3119,'sq','bn','Albanian'),(3120,'sq','az','Albanian'),(3121,'sr','en','SRB'),(3122,'sr','es','Serbio'),(3123,'sr','de','Serbisch'),(3124,'sr','fr','Serbe'),(3125,'sr','ar','الصربية'),(3126,'sr','bs','Serbian'),(3127,'sr','bg','Сръбски'),(3128,'sr','ca','Serbian'),(3129,'sr','cs','Srbský'),(3130,'sr','sk','Srbština'),(3131,'sr','cy','Serbian'),(3132,'sr','da','Serbian'),(3133,'sr','el','Σερβικά'),(3134,'sr','eo','Serbian'),(3135,'sr','et','Serbian'),(3136,'sr','eu','Serbian'),(3137,'sr','fa','Serbian'),(3138,'sr','fi','serbia'),(3139,'sr','ga','Serbian'),(3140,'sr','he','סרבית'),(3141,'sr','hi','Serbian'),(3142,'sr','hr','srpski'),(3143,'sr','hu','szerb'),(3144,'sr','hy','Serbian'),(3145,'sr','id','Serbian'),(3146,'sr','is','Serbian'),(3147,'sr','it','Serbo'),(3148,'sr','ja','セルビア語'),(3149,'sr','ko','세르비아어'),(3150,'sr','ku','Serbian'),(3151,'sr','lv','Serbian'),(3152,'sr','lt','Serbian'),(3153,'sr','mk','Serbian'),(3154,'sr','mt','Serbian'),(3155,'sr','mn','Serbian'),(3156,'sr','ne','Serbian'),(3157,'sr','nl','Servisch'),(3158,'sr','no','Serbisk'),(3159,'sr','pa','Serbian'),(3160,'sr','pl','serbski'),(3161,'sr','pt-pt','Sérvio'),(3162,'sr','pt-br','Sérvio'),(3163,'sr','qu','Serbian'),(3164,'sr','ro','Sârbă'),(3165,'sr','ru','Сербский'),(3166,'sr','sl','Srbski'),(3167,'sr','so','Serbian'),(3168,'sr','sq','Serbian'),(3169,'sr','sr','SRB'),(3170,'sr','sv','Serbiska'),(3171,'sr','ta','Serbian'),(3172,'sr','th','เซอร์เบีย'),(3173,'sr','tr','Sırpça'),(3174,'sr','uk','Serbian'),(3175,'sr','ur','Serbian'),(3176,'sr','uz','Serbian'),(3177,'sr','vi','Serbian'),(3178,'sr','yi','Serbian'),(3179,'sr','zh-hans','赛尔维亚语'),(3180,'sr','zu','Serbian'),(3181,'sr','zh-hant','賽爾維亞語'),(3182,'sr','ms','Serbian'),(3183,'sr','gl','Serbian'),(3184,'sr','bn','Serbian'),(3185,'sr','az','Serbian'),(3186,'sv','en','Swedish'),(3187,'sv','es','Sueco'),(3188,'sv','de','Schwedisch'),(3189,'sv','fr','Suédois'),(3190,'sv','ar','السويدية'),(3191,'sv','bs','Swedish'),(3192,'sv','bg','Шведски'),(3193,'sv','ca','Swedish'),(3194,'sv','cs','Švédský'),(3195,'sv','sk','Švédština'),(3196,'sv','cy','Swedish'),(3197,'sv','da','Swedish'),(3198,'sv','el','Σουηδικά'),(3199,'sv','eo','Swedish'),(3200,'sv','et','Swedish'),(3201,'sv','eu','Swedish'),(3202,'sv','fa','Swedish'),(3203,'sv','fi','ruotsi'),(3204,'sv','ga','Swedish'),(3205,'sv','he','שוודית'),(3206,'sv','hi','Swedish'),(3207,'sv','hr','švedski'),(3208,'sv','hu','svéd'),(3209,'sv','hy','Swedish'),(3210,'sv','id','Swedish'),(3211,'sv','is','Swedish'),(3212,'sv','it','Svedese'),(3213,'sv','ja','スウェーデン語'),(3214,'sv','ko','스웨덴어'),(3215,'sv','ku','Swedish'),(3216,'sv','lv','Swedish'),(3217,'sv','lt','Swedish'),(3218,'sv','mk','Swedish'),(3219,'sv','mt','Swedish'),(3220,'sv','mn','Swedish'),(3221,'sv','ne','Swedish'),(3222,'sv','nl','Zweeds'),(3223,'sv','no','Swedish'),(3224,'sv','pa','Swedish'),(3225,'sv','pl','szwedzki'),(3226,'sv','pt-pt','Sueco'),(3227,'sv','pt-br','Sueco'),(3228,'sv','qu','Swedish'),(3229,'sv','ro','Suedeză'),(3230,'sv','ru','Шведский'),(3231,'sv','sl','Švedščina'),(3232,'sv','so','Swedish'),(3233,'sv','sq','Swedish'),(3234,'sv','sr','шведски'),(3235,'sv','sv','Svenska'),(3236,'sv','ta','Swedish'),(3237,'sv','th','สวีเดน'),(3238,'sv','tr','İsveççe'),(3239,'sv','uk','Swedish'),(3240,'sv','ur','Swedish'),(3241,'sv','uz','Swedish'),(3242,'sv','vi','Swedish'),(3243,'sv','yi','Swedish'),(3244,'sv','zh-hans','瑞典语'),(3245,'sv','zu','Swedish'),(3246,'sv','zh-hant','瑞典語'),(3247,'sv','ms','Swedish'),(3248,'sv','gl','Swedish'),(3249,'sv','bn','Swedish'),(3250,'sv','az','Swedish'),(3251,'ta','en','Tamil'),(3252,'ta','es','Tamil'),(3253,'ta','de','Tamil'),(3254,'ta','fr','Tamoul'),(3255,'ta','ar','التاميلية'),(3256,'ta','bs','Tamil'),(3257,'ta','bg','Тамилски'),(3258,'ta','ca','Tamil'),(3259,'ta','cs','Tamil'),(3260,'ta','sk','Tamilčina'),(3261,'ta','cy','Tamil'),(3262,'ta','da','Tamil'),(3263,'ta','el','Ταμίλ'),(3264,'ta','eo','Tamil'),(3265,'ta','et','Tamil'),(3266,'ta','eu','Tamil'),(3267,'ta','fa','Tamil'),(3268,'ta','fi','tamili'),(3269,'ta','ga','Tamil'),(3270,'ta','he','טמילית'),(3271,'ta','hi','Tamil'),(3272,'ta','hr','tamil'),(3273,'ta','hu','tamil'),(3274,'ta','hy','Tamil'),(3275,'ta','id','Tamil'),(3276,'ta','is','Tamil'),(3277,'ta','it','Tamil'),(3278,'ta','ja','タミル語'),(3279,'ta','ko','타밀어'),(3280,'ta','ku','Tamil'),(3281,'ta','lv','Tamil'),(3282,'ta','lt','Tamil'),(3283,'ta','mk','Tamil'),(3284,'ta','mt','Tamil'),(3285,'ta','mn','Tamil'),(3286,'ta','ne','Tamil'),(3287,'ta','nl','Tamil'),(3288,'ta','no','Tamil'),(3289,'ta','pa','Tamil'),(3290,'ta','pl','tamilski'),(3291,'ta','pt-pt','Tamil'),(3292,'ta','pt-br','Tamil'),(3293,'ta','qu','Tamil'),(3294,'ta','ro','Tamilă'),(3295,'ta','ru','Тамильский'),(3296,'ta','sl','Tamilščina'),(3297,'ta','so','Tamil'),(3298,'ta','sq','Tamil'),(3299,'ta','sr','тамилски'),(3300,'ta','sv','Tamil'),(3301,'ta','ta','Tamil'),(3302,'ta','th','ทมิฬ'),(3303,'ta','tr','Tamil dili'),(3304,'ta','uk','Tamil'),(3305,'ta','ur','Tamil'),(3306,'ta','uz','Tamil'),(3307,'ta','vi','Tamil'),(3308,'ta','yi','Tamil'),(3309,'ta','zh-hans','泰米尔语'),(3310,'ta','zu','Tamil'),(3311,'ta','zh-hant','泰米爾語'),(3312,'ta','ms','Tamil'),(3313,'ta','gl','Tamil'),(3314,'ta','bn','Tamil'),(3315,'ta','az','Tamil'),(3316,'th','en','Thai'),(3317,'th','es','Tailandés'),(3318,'th','de','Thai'),(3319,'th','fr','Thaï'),(3320,'th','ar','التايلندية'),(3321,'th','bs','Thai'),(3322,'th','bg','Тайски'),(3323,'th','ca','Thai'),(3324,'th','cs','Thai'),(3325,'th','sk','Thajština'),(3326,'th','cy','Thai'),(3327,'th','da','Thai'),(3328,'th','el','Ταϊλανδέζικα'),(3329,'th','eo','Thai'),(3330,'th','et','Thai'),(3331,'th','eu','Thai'),(3332,'th','fa','Thai'),(3333,'th','fi','thai'),(3334,'th','ga','Thai'),(3335,'th','he','תאילנדית'),(3336,'th','hi','Thai'),(3337,'th','hr','thai'),(3338,'th','hu','tájföldi'),(3339,'th','hy','Thai'),(3340,'th','id','Thai'),(3341,'th','is','Thai'),(3342,'th','it','Thai'),(3343,'th','ja','タイ語'),(3344,'th','ko','태국어'),(3345,'th','ku','Thai'),(3346,'th','lv','Thai'),(3347,'th','lt','Thai'),(3348,'th','mk','Thai'),(3349,'th','mt','Thai'),(3350,'th','mn','Thai'),(3351,'th','ne','Thai'),(3352,'th','nl','Thai'),(3353,'th','no','Thai'),(3354,'th','pa','Thai'),(3355,'th','pl','tajski'),(3356,'th','pt-pt','Tailandês'),(3357,'th','pt-br','Tailandês'),(3358,'th','qu','Thai'),(3359,'th','ro','Tailandeză'),(3360,'th','ru','Тайский'),(3361,'th','sl','Tajski'),(3362,'th','so','Thai'),(3363,'th','sq','Thai'),(3364,'th','sr','Тајландски'),(3365,'th','sv','Thailändska'),(3366,'th','ta','Thai'),(3367,'th','th','ไทย'),(3368,'th','tr','Tayca'),(3369,'th','uk','Thai'),(3370,'th','ur','Thai'),(3371,'th','uz','Thai'),(3372,'th','vi','Thai'),(3373,'th','yi','Thai'),(3374,'th','zh-hans','泰语'),(3375,'th','zu','Thai'),(3376,'th','zh-hant','泰語'),(3377,'th','ms','Thai'),(3378,'th','gl','Thai'),(3379,'th','bn','Thai'),(3380,'th','az','Thai'),(3381,'tr','en','Turkish'),(3382,'tr','es','Turco'),(3383,'tr','de','Türkisch'),(3384,'tr','fr','Turc'),(3385,'tr','ar','التركية'),(3386,'tr','bs','Turkish'),(3387,'tr','bg','Турски'),(3388,'tr','ca','Turkish'),(3389,'tr','cs','Turečtina'),(3390,'tr','sk','Turečtina'),(3391,'tr','cy','Turkish'),(3392,'tr','da','Turkish'),(3393,'tr','el','Τουρκικά'),(3394,'tr','eo','Turkish'),(3395,'tr','et','Turkish'),(3396,'tr','eu','Turkish'),(3397,'tr','fa','Turkish'),(3398,'tr','fi','turkki'),(3399,'tr','ga','Turkish'),(3400,'tr','he','תורכית'),(3401,'tr','hi','Turkish'),(3402,'tr','hr','turski'),(3403,'tr','hu','török'),(3404,'tr','hy','Turkish'),(3405,'tr','id','Turkish'),(3406,'tr','is','Turkish'),(3407,'tr','it','Turco'),(3408,'tr','ja','トルコ語'),(3409,'tr','ko','터어키어'),(3410,'tr','ku','Turkish'),(3411,'tr','lv','Turkish'),(3412,'tr','lt','Turkish'),(3413,'tr','mk','Turkish'),(3414,'tr','mt','Turkish'),(3415,'tr','mn','Turkish'),(3416,'tr','ne','Turkish'),(3417,'tr','nl','Turks'),(3418,'tr','no','Turkish'),(3419,'tr','pa','Turkish'),(3420,'tr','pl','turecki'),(3421,'tr','pt-pt','Turco'),(3422,'tr','pt-br','Turco'),(3423,'tr','qu','Turkish'),(3424,'tr','ro','Turcă'),(3425,'tr','ru','Турецкий'),(3426,'tr','sl','Turščina'),(3427,'tr','so','Turkish'),(3428,'tr','sq','Turkish'),(3429,'tr','sr','турски'),(3430,'tr','sv','Turkiska'),(3431,'tr','ta','Turkish'),(3432,'tr','th','ตุรกี'),(3433,'tr','tr','Türkçe'),(3434,'tr','uk','Turkish'),(3435,'tr','ur','Turkish'),(3436,'tr','uz','Turkish'),(3437,'tr','vi','Turkish'),(3438,'tr','yi','Turkish'),(3439,'tr','zh-hans','土耳其语'),(3440,'tr','zu','Turkish'),(3441,'tr','zh-hant','土耳其語'),(3442,'tr','ms','Turkish'),(3443,'tr','gl','Turkish'),(3444,'tr','bn','Turkish'),(3445,'tr','az','Turkish'),(3446,'uk','en','Ukrainian'),(3447,'uk','es','Ucraniano'),(3448,'uk','de','Ukrainisch'),(3449,'uk','fr','Ukrainien'),(3450,'uk','ar','الأوكرانية'),(3451,'uk','bs','Ukrainian'),(3452,'uk','bg','Украински'),(3453,'uk','ca','Ukrainian'),(3454,'uk','cs','Ukrajinský'),(3455,'uk','sk','Ukrajinčina'),(3456,'uk','cy','Ukrainian'),(3457,'uk','da','Ukrainian'),(3458,'uk','el','Ουκρανικά'),(3459,'uk','eo','Ukrainian'),(3460,'uk','et','Ukrainian'),(3461,'uk','eu','Ukrainian'),(3462,'uk','fa','Ukrainian'),(3463,'uk','fi','ukraina'),(3464,'uk','ga','Ukrainian'),(3465,'uk','he','אוקראינית'),(3466,'uk','hi','Ukrainian'),(3467,'uk','hr','ukrajinski'),(3468,'uk','hu','ukrán'),(3469,'uk','hy','Ukrainian'),(3470,'uk','id','Ukrainian'),(3471,'uk','is','Ukrainian'),(3472,'uk','it','Ucraino'),(3473,'uk','ja','ウクライナ語'),(3474,'uk','ko','우크라이나어'),(3475,'uk','ku','Ukrainian'),(3476,'uk','lv','Ukrainian'),(3477,'uk','lt','Ukrainian'),(3478,'uk','mk','Ukrainian'),(3479,'uk','mt','Ukrainian'),(3480,'uk','mn','Ukrainian'),(3481,'uk','ne','Ukrainian'),(3482,'uk','nl','Oekraïens'),(3483,'uk','no','Ukrainsk'),(3484,'uk','pa','Ukrainian'),(3485,'uk','pl','ukraiński'),(3486,'uk','pt-pt','Ucraniano'),(3487,'uk','pt-br','Ucraniano'),(3488,'uk','qu','Ukrainian'),(3489,'uk','ro','Ucrainiană'),(3490,'uk','ru','Украинский'),(3491,'uk','sl','Ukrajinski'),(3492,'uk','so','Ukrainian'),(3493,'uk','sq','Ukrainian'),(3494,'uk','sr','украјински'),(3495,'uk','sv','Ukrainska'),(3496,'uk','ta','Ukrainian'),(3497,'uk','th','ยูเครน'),(3498,'uk','tr','Ukraynaca'),(3499,'uk','uk','Українська'),(3500,'uk','ur','Ukrainian'),(3501,'uk','uz','Ukrainian'),(3502,'uk','vi','Ukrainian'),(3503,'uk','yi','Ukrainian'),(3504,'uk','zh-hans','乌克兰语'),(3505,'uk','zu','Ukrainian'),(3506,'uk','zh-hant','烏克蘭語'),(3507,'uk','ms','Ukrainian'),(3508,'uk','gl','Ukrainian'),(3509,'uk','bn','Ukrainian'),(3510,'uk','az','Ukrainian'),(3511,'ur','en','Urdu'),(3512,'ur','es','Urdu'),(3513,'ur','de','Urdu'),(3514,'ur','fr','Ourdu'),(3515,'ur','ar','الأردية'),(3516,'ur','bs','Urdu'),(3517,'ur','bg','Урду'),(3518,'ur','ca','Urdu'),(3519,'ur','cs','Urdu'),(3520,'ur','sk','Urdština'),(3521,'ur','cy','Urdu'),(3522,'ur','da','Urdu'),(3523,'ur','el','Ούρντου'),(3524,'ur','eo','Urdu'),(3525,'ur','et','Urdu'),(3526,'ur','eu','Urdu'),(3527,'ur','fa','Urdu'),(3528,'ur','fi','urdu'),(3529,'ur','ga','Urdu'),(3530,'ur','he','אורדו'),(3531,'ur','hi','Urdu'),(3532,'ur','hr','urdski'),(3533,'ur','hu','urdu'),(3534,'ur','hy','Urdu'),(3535,'ur','id','Urdu'),(3536,'ur','is','Urdu'),(3537,'ur','it','Urdu'),(3538,'ur','ja','ウルドゥー語'),(3539,'ur','ko','우르두어'),(3540,'ur','ku','Urdu'),(3541,'ur','lv','Urdu'),(3542,'ur','lt','Urdu'),(3543,'ur','mk','Urdu'),(3544,'ur','mt','Urdu'),(3545,'ur','mn','Urdu'),(3546,'ur','ne','Urdu'),(3547,'ur','nl','Urdu'),(3548,'ur','no','Urdu'),(3549,'ur','pa','Urdu'),(3550,'ur','pl','urdu'),(3551,'ur','pt-pt','Urdu'),(3552,'ur','pt-br','Urdu'),(3553,'ur','qu','Urdu'),(3554,'ur','ro','Urdu'),(3555,'ur','ru','Урду'),(3556,'ur','sl','Urdujščina'),(3557,'ur','so','Urdu'),(3558,'ur','sq','Urdu'),(3559,'ur','sr','урду'),(3560,'ur','sv','Urdu'),(3561,'ur','ta','Urdu'),(3562,'ur','th','อุรดู'),(3563,'ur','tr','Urduca'),(3564,'ur','uk','Urdu'),(3565,'ur','ur','اردو '),(3566,'ur','uz','Urdu'),(3567,'ur','vi','Urdu'),(3568,'ur','yi','Urdu'),(3569,'ur','zh-hans','乌尔都语'),(3570,'ur','zu','Urdu'),(3571,'ur','zh-hant','烏爾都語'),(3572,'ur','ms','Urdu'),(3573,'ur','gl','Urdu'),(3574,'ur','bn','Urdu'),(3575,'ur','az','Urdu'),(3576,'uz','en','Uzbek'),(3577,'uz','es','Uzbeko'),(3578,'uz','de','Usbekisch'),(3579,'uz','fr','Ouzbek'),(3580,'uz','ar','الاوزباكية'),(3581,'uz','bs','Uzbek'),(3582,'uz','bg','Узбекски'),(3583,'uz','ca','Uzbek'),(3584,'uz','cs','Uzbek'),(3585,'uz','sk','Uzbekčina'),(3586,'uz','cy','Uzbek'),(3587,'uz','da','Uzbek'),(3588,'uz','el','Ουζμπεκικά'),(3589,'uz','eo','Uzbek'),(3590,'uz','et','Uzbek'),(3591,'uz','eu','Uzbek'),(3592,'uz','fa','Uzbek'),(3593,'uz','fi','uzbekki'),(3594,'uz','ga','Uzbek'),(3595,'uz','he','אוזבקית'),(3596,'uz','hi','Uzbek'),(3597,'uz','hr','uzbečki'),(3598,'uz','hu','üzbég'),(3599,'uz','hy','Uzbek'),(3600,'uz','id','Uzbek'),(3601,'uz','is','Uzbek'),(3602,'uz','it','Uzbeco'),(3603,'uz','ja','ウズベク語'),(3604,'uz','ko','우즈베크어'),(3605,'uz','ku','Uzbek'),(3606,'uz','lv','Uzbek'),(3607,'uz','lt','Uzbek'),(3608,'uz','mk','Uzbek'),(3609,'uz','mt','Uzbek'),(3610,'uz','mn','Uzbek'),(3611,'uz','ne','Uzbek'),(3612,'uz','nl','Oezbeeks'),(3613,'uz','no','Usbekisk'),(3614,'uz','pa','Uzbek'),(3615,'uz','pl','uzbecki'),(3616,'uz','pt-pt','Uzbeque'),(3617,'uz','pt-br','Uzbeque'),(3618,'uz','qu','Uzbek'),(3619,'uz','ro','Uzbecă'),(3620,'uz','ru','Узбекский'),(3621,'uz','sl','Uzbek'),(3622,'uz','so','Uzbek'),(3623,'uz','sq','Uzbek'),(3624,'uz','sr','Узбек'),(3625,'uz','sv','Uzbekiska'),(3626,'uz','ta','Uzbek'),(3627,'uz','th','อุซเบก'),(3628,'uz','tr','Özbekçe'),(3629,'uz','uk','Uzbek'),(3630,'uz','ur','Uzbek'),(3631,'uz','uz','Uzbek'),(3632,'uz','vi','Uzbek'),(3633,'uz','yi','Uzbek'),(3634,'uz','zh-hans','乌兹别克语'),(3635,'uz','zu','Uzbek'),(3636,'uz','zh-hant','烏茲別克語'),(3637,'uz','ms','Uzbek'),(3638,'uz','gl','Uzbek'),(3639,'uz','bn','Uzbek'),(3640,'uz','az','Uzbek'),(3641,'vi','en','Vietnamese'),(3642,'vi','es','Vietnamita'),(3643,'vi','de','Vietnamesisch'),(3644,'vi','fr','Vietnamien'),(3645,'vi','ar','الفيتنامية'),(3646,'vi','bs','Vietnamese'),(3647,'vi','bg','Виетнамски'),(3648,'vi','ca','Vietnamese'),(3649,'vi','cs','Vietnamský'),(3650,'vi','sk','Vietnamčina'),(3651,'vi','cy','Vietnamese'),(3652,'vi','da','Vietnamese'),(3653,'vi','el','Βιετναμέζικα'),(3654,'vi','eo','Vietnamese'),(3655,'vi','et','Vietnamese'),(3656,'vi','eu','Vietnamese'),(3657,'vi','fa','Vietnamese'),(3658,'vi','fi','vietnam'),(3659,'vi','ga','Vietnamese'),(3660,'vi','he','וייטנאמית'),(3661,'vi','hi','Vietnamese'),(3662,'vi','hr','vijetnamski'),(3663,'vi','hu','vietnámi'),(3664,'vi','hy','Vietnamese'),(3665,'vi','id','Vietnamese'),(3666,'vi','is','Vietnamese'),(3667,'vi','it','Vietnamita'),(3668,'vi','ja','ベトナム語'),(3669,'vi','ko','베트남어'),(3670,'vi','ku','Vietnamese'),(3671,'vi','lv','Vietnamese'),(3672,'vi','lt','Vietnamese'),(3673,'vi','mk','Vietnamese'),(3674,'vi','mt','Vietnamese'),(3675,'vi','mn','Vietnamese'),(3676,'vi','ne','Vietnamese'),(3677,'vi','nl','Vietnamees'),(3678,'vi','no','Vietnamesisk'),(3679,'vi','pa','Vietnamese'),(3680,'vi','pl','wietnamski'),(3681,'vi','pt-pt','Vietnamita'),(3682,'vi','pt-br','Vietnamita'),(3683,'vi','qu','Vietnamese'),(3684,'vi','ro','Vietnameză'),(3685,'vi','ru','Вьетнамский'),(3686,'vi','sl','Vietnamščina'),(3687,'vi','so','Vietnamese'),(3688,'vi','sq','Vietnamese'),(3689,'vi','sr','вијетнамски'),(3690,'vi','sv','Vietnamesiska'),(3691,'vi','ta','Vietnamese'),(3692,'vi','th','เวียดนาม'),(3693,'vi','tr','Vietnamca'),(3694,'vi','uk','Vietnamese'),(3695,'vi','ur','Vietnamese'),(3696,'vi','uz','Vietnamese'),(3697,'vi','vi','Tiếng Việt'),(3698,'vi','yi','Vietnamese'),(3699,'vi','zh-hans','越南语'),(3700,'vi','zu','Vietnamese'),(3701,'vi','zh-hant','越南語'),(3702,'vi','ms','Vietnamese'),(3703,'vi','gl','Vietnamese'),(3704,'vi','bn','Vietnamese'),(3705,'vi','az','Vietnamese'),(3706,'yi','en','Yiddish'),(3707,'yi','es','Yidis'),(3708,'yi','de','Jiddisch'),(3709,'yi','fr','Yiddish'),(3710,'yi','ar','اليديشية'),(3711,'yi','bs','Yiddish'),(3712,'yi','bg','Идиш'),(3713,'yi','ca','Yiddish'),(3714,'yi','cs','Jidiš'),(3715,'yi','sk','Jidiš'),(3716,'yi','cy','Yiddish'),(3717,'yi','da','Yiddish'),(3718,'yi','el','Γίντις'),(3719,'yi','eo','Yiddish'),(3720,'yi','et','Yiddish'),(3721,'yi','eu','Yiddish'),(3722,'yi','fa','Yiddish'),(3723,'yi','fi','jiddi'),(3724,'yi','ga','Yiddish'),(3725,'yi','he','יידיש'),(3726,'yi','hi','Yiddish'),(3727,'yi','hr','jidiš'),(3728,'yi','hu','jiddis'),(3729,'yi','hy','Yiddish'),(3730,'yi','id','Yiddish'),(3731,'yi','is','Yiddish'),(3732,'yi','it','Yiddish'),(3733,'yi','ja','イディッシュ語'),(3734,'yi','ko','이디시어'),(3735,'yi','ku','Yiddish'),(3736,'yi','lv','Yiddish'),(3737,'yi','lt','Yiddish'),(3738,'yi','mk','Yiddish'),(3739,'yi','mt','Yiddish'),(3740,'yi','mn','Yiddish'),(3741,'yi','ne','Yiddish'),(3742,'yi','nl','Jiddisch'),(3743,'yi','no','Yiddish'),(3744,'yi','pa','Yiddish'),(3745,'yi','pl','jidysz'),(3746,'yi','pt-pt','Yiddish'),(3747,'yi','pt-br','Yiddish'),(3748,'yi','qu','Yiddish'),(3749,'yi','ro','Idiş'),(3750,'yi','ru','Идиш'),(3751,'yi','sl','Jidiš'),(3752,'yi','so','Yiddish'),(3753,'yi','sq','Yiddish'),(3754,'yi','sr','јидиш'),(3755,'yi','sv','Jiddisch'),(3756,'yi','ta','Yiddish'),(3757,'yi','th','ยิชดิช'),(3758,'yi','tr','Eski İbranice'),(3759,'yi','uk','Yiddish'),(3760,'yi','ur','Yiddish'),(3761,'yi','uz','Yiddish'),(3762,'yi','vi','Yiddish'),(3763,'yi','yi','Yiddish'),(3764,'yi','zh-hans','依地语'),(3765,'yi','zu','Yiddish'),(3766,'yi','zh-hant','依地語'),(3767,'yi','ms','Yiddish'),(3768,'yi','gl','Yiddish'),(3769,'yi','bn','Yiddish'),(3770,'yi','az','Yiddish'),(3771,'zh-hans','en','Chinese (Simplified)'),(3772,'zh-hans','es','Chino simplificado'),(3773,'zh-hans','de','Vereinfachtes Chinesisch'),(3774,'zh-hans','fr','Chinois simplifié'),(3775,'zh-hans','ar','الصينية المبسطة'),(3776,'zh-hans','bs','Chinese (Simplified)'),(3777,'zh-hans','bg','Китайски  (опростен)'),(3778,'zh-hans','ca','Chinese (Simplified)'),(3779,'zh-hans','cs','Čínština ( Zjednodušený )'),(3780,'zh-hans','sk','Zjednodušená Čínština'),(3781,'zh-hans','cy','Chinese (Simplified)'),(3782,'zh-hans','da','Chinese (Simplified)'),(3783,'zh-hans','el','Κινεζικά (Απλοποιημένα)'),(3784,'zh-hans','eo','Chinese (Simplified)'),(3785,'zh-hans','et','Chinese (Simplified)'),(3786,'zh-hans','eu','Chinese (Simplified)'),(3787,'zh-hans','fa','Chinese (Simplified)'),(3788,'zh-hans','fi','kiina'),(3789,'zh-hans','ga','Chinese (Simplified)'),(3790,'zh-hans','he','סינית'),(3791,'zh-hans','hi','Chinese (Simplified)'),(3792,'zh-hans','hr','kineski (pojednostavljeni)'),(3793,'zh-hans','hu','egyszerűsített kínai'),(3794,'zh-hans','hy','Chinese (Simplified)'),(3795,'zh-hans','id','Chinese (Simplified)'),(3796,'zh-hans','is','Chinese (Simplified)'),(3797,'zh-hans','it','Cinese semplificato'),(3798,'zh-hans','ja','簡体中国語'),(3799,'zh-hans','ko','중국어 간체'),(3800,'zh-hans','ku','Chinese (Simplified)'),(3801,'zh-hans','lv','Chinese (Simplified)'),(3802,'zh-hans','lt','Chinese (Simplified)'),(3803,'zh-hans','mk','Chinese (Simplified)'),(3804,'zh-hans','mt','Chinese (Simplified)'),(3805,'zh-hans','mn','Chinese (Simplified)'),(3806,'zh-hans','ne','Chinese (Simplified)'),(3807,'zh-hans','nl','Vereenvoudigd Chinees'),(3808,'zh-hans','no','Kinesisk (forenklet)'),(3809,'zh-hans','pa','Chinese (Simplified)'),(3810,'zh-hans','pl','chiński uproszczony'),(3811,'zh-hans','pt-pt','Chinês (Simplificado)'),(3812,'zh-hans','pt-br','Chinês (Simplificado)'),(3813,'zh-hans','qu','Chinese (Simplified)'),(3814,'zh-hans','ro','Chineza simplificată'),(3815,'zh-hans','ru','Китайский (упрощенный)'),(3816,'zh-hans','sl','Kitajščina (poenostavljena )'),(3817,'zh-hans','so','Chinese (Simplified)'),(3818,'zh-hans','sq','Chinese (Simplified)'),(3819,'zh-hans','sr','Кинески (поједностављени)'),(3820,'zh-hans','sv','Förenklad kinesiska'),(3821,'zh-hans','ta','Chinese (Simplified)'),(3822,'zh-hans','th','จีนประยุกต์'),(3823,'zh-hans','tr','Modern Çince'),(3824,'zh-hans','uk','Chinese (Simplified)'),(3825,'zh-hans','ur','Chinese (Simplified)'),(3826,'zh-hans','uz','Chinese (Simplified)'),(3827,'zh-hans','vi','Chinese (Simplified)'),(3828,'zh-hans','yi','Chinese (Simplified)'),(3829,'zh-hans','zh-hans','简体中文'),(3830,'zh-hans','zu','Chinese (Simplified)'),(3831,'zh-hans','zh-hant','簡體中文'),(3832,'zh-hans','ms','Chinese (Simplified)'),(3833,'zh-hans','gl','Chinese (Simplified)'),(3834,'zh-hans','bn','Chinese (Simplified)'),(3835,'zh-hans','az','Chinese (Simplified)'),(3836,'zu','en','Zulu'),(3837,'zu','es','Zulú'),(3838,'zu','de','Zulu'),(3839,'zu','fr','Zoulou'),(3840,'zu','ar','الزولو'),(3841,'zu','bs','Zulu'),(3842,'zu','bg','Зулу'),(3843,'zu','ca','Zulu'),(3844,'zu','cs','Zulu'),(3845,'zu','sk','Jazyk Zulu'),(3846,'zu','cy','Zulu'),(3847,'zu','da','Zulu'),(3848,'zu','el','Ζουλού'),(3849,'zu','eo','Zulu'),(3850,'zu','et','Zulu'),(3851,'zu','eu','Zulu'),(3852,'zu','fa','Zulu'),(3853,'zu','fi','zulu'),(3854,'zu','ga','Zulu'),(3855,'zu','he','זולו '),(3856,'zu','hi','Zulu'),(3857,'zu','hr','zulu'),(3858,'zu','hu','zulu'),(3859,'zu','hy','Zulu'),(3860,'zu','id','Zulu'),(3861,'zu','is','Zulu'),(3862,'zu','it','Zulu'),(3863,'zu','ja','ズールー語'),(3864,'zu','ko','줄루어'),(3865,'zu','ku','Zulu'),(3866,'zu','lv','Zulu'),(3867,'zu','lt','Zulu'),(3868,'zu','mk','Zulu'),(3869,'zu','mt','Zulu'),(3870,'zu','mn','Zulu'),(3871,'zu','ne','Zulu'),(3872,'zu','nl','Zulu'),(3873,'zu','no','Zulu'),(3874,'zu','pa','Zulu'),(3875,'zu','pl','zuluski'),(3876,'zu','pt-pt','Zulu'),(3877,'zu','pt-br','Zulu'),(3878,'zu','qu','Zulu'),(3879,'zu','ro','Zulu'),(3880,'zu','ru','Зулу'),(3881,'zu','sl','Zulu'),(3882,'zu','so','Zulu'),(3883,'zu','sq','Zulu'),(3884,'zu','sr','зулу'),(3885,'zu','sv','Zulu'),(3886,'zu','ta','Zulu'),(3887,'zu','th','ซูลู'),(3888,'zu','tr','Zulu dili'),(3889,'zu','uk','Zulu'),(3890,'zu','ur','Zulu'),(3891,'zu','uz','Zulu'),(3892,'zu','vi','Zulu'),(3893,'zu','yi','Zulu'),(3894,'zu','zh-hans','祖鲁语'),(3895,'zu','zu','Zulu'),(3896,'zu','zh-hant','祖魯語'),(3897,'zu','ms','Zulu'),(3898,'zu','gl','Zulu'),(3899,'zu','bn','Zulu'),(3900,'zu','az','Zulu'),(3901,'zh-hant','en','Chinese (Traditional)'),(3902,'zh-hant','es','Chino tradicional'),(3903,'zh-hant','de','Traditionelles Chinesisch'),(3904,'zh-hant','fr','Chinois traditionnel'),(3905,'zh-hant','ar','الصينية التقليدية'),(3906,'zh-hant','bs','Chinese (Traditional)'),(3907,'zh-hant','bg','Китайски (традиционен)'),(3908,'zh-hant','ca','Chinese (Traditional)'),(3909,'zh-hant','cs','Čínština (tradiční )'),(3910,'zh-hant','sk','Tradičná Čínština'),(3911,'zh-hant','cy','Chinese (Traditional)'),(3912,'zh-hant','da','Chinese (Traditional)'),(3913,'zh-hant','el','Κινεζικά (Παραδοσιακά)'),(3914,'zh-hant','eo','Chinese (Traditional)'),(3915,'zh-hant','et','Chinese (Traditional)'),(3916,'zh-hant','eu','Chinese (Traditional)'),(3917,'zh-hant','fa','Chinese (Traditional)'),(3918,'zh-hant','fi','perinteinen kiina'),(3919,'zh-hant','ga','Chinese (Traditional)'),(3920,'zh-hant','he','סינית מסורתית'),(3921,'zh-hant','hi','Chinese (Traditional)'),(3922,'zh-hant','hr','kineski (tradicionalni)'),(3923,'zh-hant','hu','hagyományos kínai'),(3924,'zh-hant','hy','Chinese (Traditional)'),(3925,'zh-hant','id','Chinese (Traditional)'),(3926,'zh-hant','is','Chinese (Traditional)'),(3927,'zh-hant','it','Cinese tradizionale'),(3928,'zh-hant','ja','繁体中国語'),(3929,'zh-hant','ko','중국어 번체'),(3930,'zh-hant','ku','Chinese (Traditional)'),(3931,'zh-hant','lv','Chinese (Traditional)'),(3932,'zh-hant','lt','Chinese (Traditional)'),(3933,'zh-hant','mk','Chinese (Traditional)'),(3934,'zh-hant','mt','Chinese (Traditional)'),(3935,'zh-hant','mn','Chinese (Traditional)'),(3936,'zh-hant','ne','Chinese (Traditional)'),(3937,'zh-hant','nl','Traditioneel Chinees'),(3938,'zh-hant','no','Kinesisk (tradisjonell)'),(3939,'zh-hant','pa','Chinese (Traditional)'),(3940,'zh-hant','pl','chiński tradycyjny'),(3941,'zh-hant','pt-pt','Chinês (Tradicional)'),(3942,'zh-hant','pt-br','Chinês (Tradicional)'),(3943,'zh-hant','qu','Chinese (Traditional)'),(3944,'zh-hant','ro','Chineza tradiţională'),(3945,'zh-hant','ru','Китайский (традиционный)'),(3946,'zh-hant','sl','Kitajščina (tradicionalna)'),(3947,'zh-hant','so','Chinese (Traditional)'),(3948,'zh-hant','sq','Chinese (Traditional)'),(3949,'zh-hant','sr','Кинески (традиционални)'),(3950,'zh-hant','sv','Traditionell kinesiska'),(3951,'zh-hant','ta','Chinese (Traditional)'),(3952,'zh-hant','th','จีนดั้งเดิม'),(3953,'zh-hant','tr','Klasik Çince'),(3954,'zh-hant','uk','Chinese (Traditional)'),(3955,'zh-hant','ur','Chinese (Traditional)'),(3956,'zh-hant','uz','Chinese (Traditional)'),(3957,'zh-hant','vi','Chinese (Traditional)'),(3958,'zh-hant','yi','Chinese (Traditional)'),(3959,'zh-hant','zh-hans','繁体中文'),(3960,'zh-hant','zu','Chinese (Traditional)'),(3961,'zh-hant','zh-hant','繁體中文'),(3962,'zh-hant','ms','Chinese (Traditional)'),(3963,'zh-hant','gl','Chinese (Traditional)'),(3964,'zh-hant','bn','Chinese (Traditional)'),(3965,'zh-hant','az','Chinese (Traditional)'),(3966,'ms','en','Malay'),(3967,'ms','es','Malayo'),(3968,'ms','de','Malaiisch'),(3969,'ms','fr','Malay'),(3970,'ms','ar','لغة الملايو'),(3971,'ms','bs','Malay'),(3972,'ms','bg','Малайски'),(3973,'ms','ca','Malay'),(3974,'ms','cs','Malajský'),(3975,'ms','sk','Malay'),(3976,'ms','cy','Malay'),(3977,'ms','da','Malay'),(3978,'ms','el','Malay'),(3979,'ms','eo','Malay'),(3980,'ms','et','Malay'),(3981,'ms','eu','Malay'),(3982,'ms','fa','Malay'),(3983,'ms','fi','Malay'),(3984,'ms','ga','Malay'),(3985,'ms','he','מלאית'),(3986,'ms','hi','Malay'),(3987,'ms','hr','malajski'),(3988,'ms','hu','Malay'),(3989,'ms','hy','Malay'),(3990,'ms','id','Malay'),(3991,'ms','is','Malay'),(3992,'ms','it','Malay'),(3993,'ms','ja','Malay'),(3994,'ms','ko','Malay'),(3995,'ms','ku','Malay'),(3996,'ms','lv','Malay'),(3997,'ms','lt','Malay'),(3998,'ms','mk','Malay'),(3999,'ms','mt','Malay'),(4000,'ms','mn','Malay'),(4001,'ms','ne','Malay'),(4002,'ms','nl','Malay'),(4003,'ms','no','Malay'),(4004,'ms','pa','Malay'),(4005,'ms','pl','Malay'),(4006,'ms','pt-pt','Malaio'),(4007,'ms','pt-br','Malaio'),(4008,'ms','qu','Malay'),(4009,'ms','ro','Malay'),(4010,'ms','ru','Малайский'),(4011,'ms','sl','Malajščina'),(4012,'ms','so','Malay'),(4013,'ms','sq','Malay'),(4014,'ms','sr','малајски'),(4015,'ms','sv','Malay'),(4016,'ms','ta','Malay'),(4017,'ms','th','Malay'),(4018,'ms','tr','Malay'),(4019,'ms','uk','Malay'),(4020,'ms','ur','Malay'),(4021,'ms','uz','Malay'),(4022,'ms','vi','Malay'),(4023,'ms','yi','Malay'),(4024,'ms','zh-hans','Malay'),(4025,'ms','zu','Malay'),(4026,'ms','zh-hant','Malay'),(4027,'ms','ms','Melayu'),(4028,'ms','gl','Malay'),(4029,'ms','bn','Malay'),(4030,'ms','az','Malay'),(4031,'gl','en','Galician'),(4032,'gl','es','Gallego'),(4033,'gl','de','Galicisch'),(4034,'gl','fr','Galicien'),(4035,'gl','ar','Galician'),(4036,'gl','bs','Galician'),(4037,'gl','bg','Galician'),(4038,'gl','ca','Galician'),(4039,'gl','cs','Galician'),(4040,'gl','sk','Galician'),(4041,'gl','cy','Galician'),(4042,'gl','da','Galician'),(4043,'gl','el','Galician'),(4044,'gl','eo','Galician'),(4045,'gl','et','Galician'),(4046,'gl','eu','Galician'),(4047,'gl','fa','Galician'),(4048,'gl','fi','Galician'),(4049,'gl','ga','Galician'),(4050,'gl','he','Galician'),(4051,'gl','hi','Galician'),(4052,'gl','hr','Galician'),(4053,'gl','hu','Galician'),(4054,'gl','hy','Galician'),(4055,'gl','id','Galician'),(4056,'gl','is','Galician'),(4057,'gl','it','Gallego'),(4058,'gl','ja','Galician'),(4059,'gl','ko','Galician'),(4060,'gl','ku','Galician'),(4061,'gl','lv','Galician'),(4062,'gl','lt','Galician'),(4063,'gl','mk','Galician'),(4064,'gl','mt','Galician'),(4065,'gl','mn','Galician'),(4066,'gl','ne','Galician'),(4067,'gl','nl','Galician'),(4068,'gl','no','Galician'),(4069,'gl','pa','Galician'),(4070,'gl','pl','Galician'),(4071,'gl','pt-pt','Galego'),(4072,'gl','pt-br','Galego'),(4073,'gl','qu','Galician'),(4074,'gl','ro','Galician'),(4075,'gl','ru','Галисийский'),(4076,'gl','sl','Galician'),(4077,'gl','so','Galician'),(4078,'gl','sq','Galician'),(4079,'gl','sr','Galician'),(4080,'gl','sv','Galician'),(4081,'gl','ta','Galician'),(4082,'gl','th','Galician'),(4083,'gl','tr','Galician'),(4084,'gl','uk','Galician'),(4085,'gl','ur','Galician'),(4086,'gl','uz','Galician'),(4087,'gl','vi','Galician'),(4088,'gl','yi','Galician'),(4089,'gl','zh-hans','Galician'),(4090,'gl','zu','Galician'),(4091,'gl','zh-hant','Galician'),(4092,'gl','ms','Galician'),(4093,'gl','gl','Galego'),(4094,'gl','bn','Galician'),(4095,'gl','az','Galician'),(4096,'bn','en','Bengali'),(4097,'bn','es','Bengalí'),(4098,'bn','de','Bengalisch'),(4099,'bn','fr','Bengali'),(4100,'bn','ar','Bengali'),(4101,'bn','bs','Bengali'),(4102,'bn','bg','Bengali'),(4103,'bn','ca','Bengali'),(4104,'bn','cs','Bengali'),(4105,'bn','sk','Bengali'),(4106,'bn','cy','Bengali'),(4107,'bn','da','Bengali'),(4108,'bn','el','Bengali'),(4109,'bn','eo','Bengali'),(4110,'bn','et','Bengali'),(4111,'bn','eu','Bengali'),(4112,'bn','fa','Bengali'),(4113,'bn','fi','Bengali'),(4114,'bn','ga','Bengali'),(4115,'bn','he','Bengali'),(4116,'bn','hi','Bengali'),(4117,'bn','hr','Bengali'),(4118,'bn','hu','Bengali'),(4119,'bn','hy','Bengali'),(4120,'bn','id','Bengali'),(4121,'bn','is','Bengali'),(4122,'bn','it','Bengalese'),(4123,'bn','ja','Bengali'),(4124,'bn','ko','Bengali'),(4125,'bn','ku','Bengali'),(4126,'bn','lv','Bengali'),(4127,'bn','lt','Bengali'),(4128,'bn','mk','Bengali'),(4129,'bn','mt','Bengali'),(4130,'bn','mn','Bengali'),(4131,'bn','ne','Bengali'),(4132,'bn','nl','Bengali'),(4133,'bn','no','Bengali'),(4134,'bn','pa','Bengali'),(4135,'bn','pl','Bengali'),(4136,'bn','pt-pt','Bengalês'),(4137,'bn','pt-br','Bengalês'),(4138,'bn','qu','Bengali'),(4139,'bn','ro','Bengali'),(4140,'bn','ru','Бенгальский'),(4141,'bn','sl','Bengali'),(4142,'bn','so','Bengali'),(4143,'bn','sq','Bengali'),(4144,'bn','sr','Bengali'),(4145,'bn','sv','Bengali'),(4146,'bn','ta','Bengali'),(4147,'bn','th','Bengali'),(4148,'bn','tr','Bengali'),(4149,'bn','uk','Bengali'),(4150,'bn','ur','Bengali'),(4151,'bn','uz','Bengali'),(4152,'bn','vi','Bengali'),(4153,'bn','yi','Bengali'),(4154,'bn','zh-hans','Bengali'),(4155,'bn','zu','Bengali'),(4156,'bn','zh-hant','Bengali'),(4157,'bn','ms','Bengali'),(4158,'bn','gl','Bengali'),(4159,'bn','bn','বাংলাদেশ'),(4160,'bn','az','Bengali'),(4161,'az','en','Azerbaijani'),(4162,'az','es','Azerí'),(4163,'az','de','Aserbeidschanisch'),(4164,'az','fr','Azéri'),(4165,'az','ar','الأذربيجانية'),(4166,'az','bs','Azerbaijani'),(4167,'az','bg','Azerbaijani'),(4168,'az','ca','Azerbaijani'),(4169,'az','cs','Azerbaijani'),(4170,'az','sk','Azerbaijani'),(4171,'az','cy','Azerbaijani'),(4172,'az','da','Azerbaijani'),(4173,'az','el','Azerbaijani'),(4174,'az','eo','Azerbaijani'),(4175,'az','et','Azerbaijani'),(4176,'az','eu','Azerbaijani'),(4177,'az','fa','Azerbaijani'),(4178,'az','fi','Azerbaijani'),(4179,'az','ga','Azerbaijani'),(4180,'az','he','אזרביג\'נית'),(4181,'az','hi','Azerbaijani'),(4182,'az','hr','Azerbaijani'),(4183,'az','hu','Azerbaijani'),(4184,'az','hy','Azerbaijani'),(4185,'az','id','Azerbaijani'),(4186,'az','is','Azerbaijani'),(4187,'az','it','Azerbaigiano'),(4188,'az','ja','アゼルバイジャン語'),(4189,'az','ko','Azerbaijani'),(4190,'az','ku','Azerbaijani'),(4191,'az','lv','Azerbaijani'),(4192,'az','lt','Azerbaijani'),(4193,'az','mk','Azerbaijani'),(4194,'az','mt','Azerbaijani'),(4195,'az','mn','Azerbaijani'),(4196,'az','ne','Azerbaijani'),(4197,'az','nl','Azerbaijani'),(4198,'az','no','Azerbaijani'),(4199,'az','pa','Azerbaijani'),(4200,'az','pl','azerski'),(4201,'az','pt-pt','Azerbaijano'),(4202,'az','pt-br','Azerbaijano'),(4203,'az','qu','Azerbaijani'),(4204,'az','ro','Azerbaijani'),(4205,'az','ru','Азербайджанский'),(4206,'az','sl','Azerbaijani'),(4207,'az','so','Azerbaijani'),(4208,'az','sq','Azerbaijani'),(4209,'az','sr','Azerbaijani'),(4210,'az','sv','Azerbaijani'),(4211,'az','ta','Azerbaijani'),(4212,'az','th','Azerbaijani'),(4213,'az','tr','Azerbaijani'),(4214,'az','uk','Azerbaijani'),(4215,'az','ur','Azerbaijani'),(4216,'az','uz','Azerbaijani'),(4217,'az','vi','Azerbaijani'),(4218,'az','yi','Azerbaijani'),(4219,'az','zh-hans','阿塞拜疆语'),(4220,'az','zu','Azerbaijani'),(4221,'az','zh-hant','Azerbaijani'),(4222,'az','ms','Azerbaijani'),(4223,'az','gl','Azerbaijani'),(4224,'az','bn','Azerbaijani'),(4225,'az','az','Azərbaycan');
/*!40000 ALTER TABLE `wp_icl_languages_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_icl_locale_map`
--

DROP TABLE IF EXISTS `wp_icl_locale_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_icl_locale_map` (
  `code` varchar(7) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `locale` varchar(35) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`code`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_icl_locale_map`
--

LOCK TABLES `wp_icl_locale_map` WRITE;
/*!40000 ALTER TABLE `wp_icl_locale_map` DISABLE KEYS */;
INSERT INTO `wp_icl_locale_map` VALUES ('en','en_US'),('sr','sr_RS');
/*!40000 ALTER TABLE `wp_icl_locale_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_icl_message_status`
--

DROP TABLE IF EXISTS `wp_icl_message_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_icl_message_status` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `rid` bigint(20) unsigned NOT NULL,
  `object_id` bigint(20) unsigned NOT NULL,
  `from_language` varchar(10) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `to_language` varchar(10) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `md5` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `object_type` varchar(64) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `status` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rid` (`rid`),
  KEY `object_id` (`object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_icl_message_status`
--

LOCK TABLES `wp_icl_message_status` WRITE;
/*!40000 ALTER TABLE `wp_icl_message_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_icl_message_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_icl_mo_files_domains`
--

DROP TABLE IF EXISTS `wp_icl_mo_files_domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_icl_mo_files_domains` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_path` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `file_path_md5` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `domain` varchar(160) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'not_imported',
  `num_of_strings` int(11) NOT NULL DEFAULT '0',
  `last_modified` int(11) NOT NULL,
  `component_type` enum('plugin','theme','other') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'other',
  `component_id` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `file_path_md5_UNIQUE` (`file_path_md5`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_icl_mo_files_domains`
--

LOCK TABLES `wp_icl_mo_files_domains` WRITE;
/*!40000 ALTER TABLE `wp_icl_mo_files_domains` DISABLE KEYS */;
INSERT INTO `wp_icl_mo_files_domains` VALUES (1,'wp-content\\languages\\sr_RS.mo','aeca0945b581d41800ce872abb2af7a3','default','not_imported',0,1622309347,'other',''),(2,'wp-content\\languages\\admin-sr_RS.mo','4a8052439e777e876f25bf48f5fbc379','default','not_imported',0,1622309347,'other',''),(3,'wp-content\\languages\\themes\\twentytwentyone-sr_RS.mo','e8b7e6f18b115be7a7d7ac8d0d4415fc','twentytwentyone','not_imported',0,1618461433,'theme','twentytwentyone'),(4,'wp-content\\languages\\continents-cities-sr_RS.mo','40e21cdcd3d99a08a074ff14d780e144','continents-cities','not_imported',0,1622309347,'other','');
/*!40000 ALTER TABLE `wp_icl_mo_files_domains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_icl_node`
--

DROP TABLE IF EXISTS `wp_icl_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_icl_node` (
  `nid` bigint(20) NOT NULL,
  `md5` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `links_fixed` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_icl_node`
--

LOCK TABLES `wp_icl_node` WRITE;
/*!40000 ALTER TABLE `wp_icl_node` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_icl_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_icl_reminders`
--

DROP TABLE IF EXISTS `wp_icl_reminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_icl_reminders` (
  `id` bigint(20) NOT NULL,
  `message` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `url` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `can_delete` tinyint(4) NOT NULL,
  `show` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_icl_reminders`
--

LOCK TABLES `wp_icl_reminders` WRITE;
/*!40000 ALTER TABLE `wp_icl_reminders` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_icl_reminders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_icl_string_batches`
--

DROP TABLE IF EXISTS `wp_icl_string_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_icl_string_batches` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `string_id` bigint(20) unsigned NOT NULL,
  `batch_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_icl_string_batches`
--

LOCK TABLES `wp_icl_string_batches` WRITE;
/*!40000 ALTER TABLE `wp_icl_string_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_icl_string_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_icl_string_packages`
--

DROP TABLE IF EXISTS `wp_icl_string_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_icl_string_packages` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `kind_slug` varchar(160) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `kind` varchar(160) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `name` varchar(160) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `title` varchar(160) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `edit_link` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `view_link` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `word_count` varchar(2000) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_icl_string_packages`
--

LOCK TABLES `wp_icl_string_packages` WRITE;
/*!40000 ALTER TABLE `wp_icl_string_packages` DISABLE KEYS */;
INSERT INTO `wp_icl_string_packages` VALUES (1,'gutenberg','Gutenberg','3','Page Builder Page 3','','',3,NULL);
/*!40000 ALTER TABLE `wp_icl_string_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_icl_string_pages`
--

DROP TABLE IF EXISTS `wp_icl_string_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_icl_string_pages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `string_id` bigint(20) unsigned NOT NULL,
  `url_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `string_to_url_id` (`url_id`),
  KEY `string_id` (`string_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_icl_string_pages`
--

LOCK TABLES `wp_icl_string_pages` WRITE;
/*!40000 ALTER TABLE `wp_icl_string_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_icl_string_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_icl_string_positions`
--

DROP TABLE IF EXISTS `wp_icl_string_positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_icl_string_positions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `string_id` bigint(20) NOT NULL,
  `kind` tinyint(4) DEFAULT NULL,
  `position_in_page` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `string_id` (`string_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_icl_string_positions`
--

LOCK TABLES `wp_icl_string_positions` WRITE;
/*!40000 ALTER TABLE `wp_icl_string_positions` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_icl_string_positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_icl_string_status`
--

DROP TABLE IF EXISTS `wp_icl_string_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_icl_string_status` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `rid` bigint(20) NOT NULL,
  `string_translation_id` bigint(20) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `md5` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `string_translation_id` (`string_translation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_icl_string_status`
--

LOCK TABLES `wp_icl_string_status` WRITE;
/*!40000 ALTER TABLE `wp_icl_string_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_icl_string_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_icl_string_translations`
--

DROP TABLE IF EXISTS `wp_icl_string_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_icl_string_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `string_id` bigint(20) unsigned NOT NULL,
  `language` varchar(10) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_520_ci,
  `mo_string` longtext COLLATE utf8mb4_unicode_520_ci,
  `translator_id` bigint(20) unsigned DEFAULT NULL,
  `translation_service` varchar(16) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `batch_id` int(11) NOT NULL DEFAULT '0',
  `translation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `string_language` (`string_id`,`language`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_icl_string_translations`
--

LOCK TABLES `wp_icl_string_translations` WRITE;
/*!40000 ALTER TABLE `wp_icl_string_translations` DISABLE KEYS */;
INSERT INTO `wp_icl_string_translations` VALUES (1,2,'en',10,'',NULL,NULL,'',0,'2021-05-29 17:45:51');
/*!40000 ALTER TABLE `wp_icl_string_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_icl_string_urls`
--

DROP TABLE IF EXISTS `wp_icl_string_urls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_icl_string_urls` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `language` varchar(7) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `string_string_lang_url` (`language`,`url`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_icl_string_urls`
--

LOCK TABLES `wp_icl_string_urls` WRITE;
/*!40000 ALTER TABLE `wp_icl_string_urls` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_icl_string_urls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_icl_strings`
--

DROP TABLE IF EXISTS `wp_icl_strings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_icl_strings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `language` varchar(7) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `context` varchar(160) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `name` varchar(160) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `string_package_id` bigint(20) unsigned DEFAULT NULL,
  `location` bigint(20) unsigned DEFAULT NULL,
  `wrap_tag` varchar(16) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `type` varchar(40) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'LINE',
  `title` varchar(160) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `gettext_context` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `domain_name_context_md5` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `translation_priority` varchar(160) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `word_count` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uc_domain_name_context_md5` (`domain_name_context_md5`),
  KEY `language_context` (`language`,`context`),
  KEY `icl_strings_name` (`name`),
  KEY `icl_strings_translation_priority` (`translation_priority`),
  KEY `context` (`context`),
  KEY `string_package_id` (`string_package_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_icl_strings`
--

LOCK TABLES `wp_icl_strings` WRITE;
/*!40000 ALTER TABLE `wp_icl_strings` DISABLE KEYS */;
INSERT INTO `wp_icl_strings` VALUES (1,'sr','WP','Blog Title','Ivkovic',NULL,NULL,'','LINE',NULL,0,'','5ff0887b4c486c0329311e8d30610d58','optional',NULL),(2,'sr','WP','Tagline','',NULL,NULL,'','LINE',NULL,10,'','6e70f8f3e0f8c134711af40ab6e4931b','optional',NULL),(3,'en','Widgets','widget title - 13348442cc6a27032d2b4aa28b75a5d3','Search',NULL,NULL,'','LINE',NULL,0,'','34e49796de494b93f918284a210a0a28','optional',NULL),(4,'en','Widgets','widget title - 341825a909ae0a19dd9dbea98ef3e021','Recent Posts',NULL,NULL,'','LINE',NULL,0,'','7079da0982f3d98e8a287de7ffc3b2c2','optional',NULL),(5,'en','Widgets','widget title - 69e7df6b9f7404b4007d936978a45c81','Recent Comments',NULL,NULL,'','LINE',NULL,0,'','a48c6eb3c5890b18ba90320a27899305','optional',NULL),(6,'en','Widgets','widget title - 178fde647037235223ac2a188a7106b1','Archives',NULL,NULL,'','LINE',NULL,0,'','478de4f6942954a0e26a7509c7d6152c','optional',NULL),(7,'en','Widgets','widget title - af1b98adf7f686b84cd0b443e022b7a0','Categories',NULL,NULL,'','LINE',NULL,0,'','5977452b184084c8b2c0d046daf75b27','optional',NULL),(8,'en','Widgets','widget title - b6755d218d5f4e1cef9cce9cc39aeda9','Meta',NULL,NULL,'','LINE',NULL,0,'','26a7f7efe61aa93765d79561fb28d76c','optional',NULL),(9,'en','WPML','Text for alternative languages for posts','This post is also available in: %s',NULL,NULL,'','LINE',NULL,0,'','c9203e3110feb389a62b2f341a6c346a','optional',NULL),(10,'en','WP Endpoints','order-pay','order-pay',NULL,NULL,'','LINE',NULL,0,'','8d0ee533eb6eaa9960c52ecb3fc80232','optional',NULL),(11,'en','WP Endpoints','order-received','order-received',NULL,NULL,'','LINE',NULL,0,'','788874ce72f23c1454f440b8d35815b3','optional',NULL),(12,'en','WP Endpoints','orders','orders',NULL,NULL,'','LINE',NULL,0,'','f5f9fc388041e059c8b1f83336b490df','optional',NULL),(13,'en','WP Endpoints','view-order','view-order',NULL,NULL,'','LINE',NULL,0,'','3279ebce985565d6e492128e2981a27f','optional',NULL),(14,'en','WP Endpoints','downloads','downloads',NULL,NULL,'','LINE',NULL,0,'','0a4c47a0b5584af61c4bd049d4094237','optional',NULL),(15,'en','WP Endpoints','edit-account','edit-account',NULL,NULL,'','LINE',NULL,0,'','36476fa1633a9e4b0232405f0d2e4cf2','optional',NULL),(16,'en','WP Endpoints','edit-address','edit-address',NULL,NULL,'','LINE',NULL,0,'','ee95f503da62c65deeb3cea2062457b7','optional',NULL),(17,'en','WP Endpoints','payment-methods','payment-methods',NULL,NULL,'','LINE',NULL,0,'','060b683c986aad1749b3cc6a96cc79c4','optional',NULL),(18,'en','WP Endpoints','lost-password','lost-password',NULL,NULL,'','LINE',NULL,0,'','0e6b21413665a6946ffda25342fb8beb','optional',NULL),(19,'en','WP Endpoints','customer-logout','customer-logout',NULL,NULL,'','LINE',NULL,0,'','63708032f00538fbd9da6f9245ad98be','optional',NULL),(20,'en','WP Endpoints','add-payment-method','add-payment-method',NULL,NULL,'','LINE',NULL,0,'','4a4b86ea8e48687226190a36bb9581b7','optional',NULL),(21,'en','WP Endpoints','delete-payment-method','delete-payment-method',NULL,NULL,'','LINE',NULL,0,'','b24cb5a8ef00d18f0cb571af1194306b','optional',NULL),(22,'en','WP Endpoints','set-default-payment-method','set-default-payment-method',NULL,NULL,'','LINE',NULL,0,'','a0543fd199bc5816586c5a7f2459f655','optional',NULL),(23,'en','WP Endpoints','wc-api','wc-api',NULL,NULL,'','LINE',NULL,0,'','3a448b300c73de9c6696651892b08d2f','optional',NULL),(24,'sr','gutenberg-3','658894c2510ea71cc69e78bc6c20f9ba','Ко смо ми',1,1,'h2','LINE','core/heading',0,'','4adbb47d9bdf5ddb9360fa7b69887d50','optional',NULL),(25,'sr','gutenberg-3','0eb4129b1722e9c629ec225fab2f1d11','<strong class=\"privacy-policy-tutorial\">Предложени текст: </strong>Наша адреса веб места је: http://localhost/ivkovic.',1,2,'','VISUAL','core/paragraph',0,'','bdb9d032f1133760e56049965ecdc024','optional',NULL),(26,'sr','gutenberg-3','cdd07efe40c64d4cea2c1bbc44e49cae','Коментари',1,3,'h2','LINE','core/heading',0,'','f8e13c6c32213703c8fc7892aa4f879e','optional',NULL),(27,'sr','gutenberg-3','420ba2fa287de46e19ac3979d3f05c1a','<strong class=\"privacy-policy-tutorial\">Предложени текст: </strong>Када посетиоци оставе коментаре на веб месту, скупљамо податке приказане у обрасцу за коментаре као и IP адресу посетиоца и ниску user agent његовог прегледача веба за помоћ у откривању непожељног.',1,4,'','VISUAL','core/paragraph',0,'','dda8cb52d3fc5c9403eaccc740ea5d72','optional',NULL),(28,'sr','gutenberg-3','6ae9891cfbf34251369d63f5e9da15cb','Анонимизована ниска направљена од ваше адресе е-поште (такође названа и хеш) може бити достављена услузи Граватар да би се видело да ли је користите. Политика приватности услуге Граватар је доступна овде: https://automattic.com/privacy/. Након одобрења вашег коментара, ваша слика профила је видљива јавности у смислу вашег коментара.',1,5,'','AREA','core/paragraph',0,'','04e6a64990dae4063b2107b51c5dee58','optional',NULL),(29,'sr','gutenberg-3','029e89384914e141070f5f1500bf786a','Садржај',1,6,'h2','LINE','core/heading',0,'','3e180b293c29db9d9524ab34ac5b39b0','optional',NULL),(30,'sr','gutenberg-3','04b8d5f1965f99813d1a15b331b231b5','<strong class=\"privacy-policy-tutorial\">Предложени текст: </strong>Уколико отпремате слике на веб место, требало би да избегавате отпремање слика са угнежђеним подацима локације (EXIF GPS). Посетиоци веб места могу да преузму и извуку податке о локацији са слика са веб места.',1,7,'','VISUAL','core/paragraph',0,'','b94f0651b507769ae34d909c0fe43fcb','optional',NULL),(31,'sr','gutenberg-3','37d912ac18f159db98be9c175e2238aa','Колачићи',1,8,'h2','LINE','core/heading',0,'','9d62d64d256607ae6e382d2010785b53','optional',NULL),(32,'sr','gutenberg-3','de9676284f50dfa6cf8776b3d31e6e6b','<strong class=\"privacy-policy-tutorial\">Предложени текст: </strong>Уколико оставите коментар на нашем веб месту, можете се изузети од снимања свог имена, адресе е-поште и веб места у колачићима. Они су због ваше удобности тако да не морате да поново попуњавате своје детаље када оставите други коментар. Ови колачићи трају годину дана.',1,9,'','VISUAL','core/paragraph',0,'','132f0e2e1a69a5e0863b4fb7deafc51b','optional',NULL),(33,'sr','gutenberg-3','8b42125bd23d7840c6c4fcd0b883fcf3','Уколико посетите нашу страницу за пријављивање, поставићемо привремени колачић за одређивање да ли ваш прегледач веба прихвата колачиће. Овај колачић не садржи личне податке и одбацује се након вашег затварања прегледача веба.',1,10,'','AREA','core/paragraph',0,'','c7215e1f199dcc2f0093f72854d3e6a7','optional',NULL),(34,'sr','gutenberg-3','12802ecc505c2003b20c2ccc39e8e314','Када се пријавите, такође ћемо поставити неколико колачића да бисмо сачували ваше информације пријављивања и ваше изборе приказа екрана. Колачићи пријављивања трају два дана, а колачићи могућности екрана трају годину дана. Уколико изаберете \"Запамти ме\", ваша пријава ће трајати две седмице. Уколико се одјавите са свог налога, колачићи пријављивања биће уклоњени.',1,11,'','AREA','core/paragraph',0,'','0b6377a06a7aec6b8b6b0c91c1f34806','optional',NULL),(35,'sr','gutenberg-3','edd4d283a4647a5f898b8c475f7b0f6b','Када уредите или објавите чланак, додатни колачић ће бити сачуван у вашем прегледачу веба. Овај колачић не укључује личне податке и само одређује ID чланка који уређујете. Истиче након једног дана.',1,12,'','AREA','core/paragraph',0,'','499d5fce0360dd00e4b46dfe9bc01cff','optional',NULL),(36,'sr','gutenberg-3','b734e73af444b344620c314d14f0f6ef','Угнежђени садржај са других веб места',1,13,'h2','LINE','core/heading',0,'','08f73ac37b39f72473f21bce58120c3d','optional',NULL),(37,'sr','gutenberg-3','805c68fba51d262884be05ad4bd751fa','<strong class=\"privacy-policy-tutorial\">Предложени текст: </strong>Чланци на овом веб месту могу да садрже угнежђени садржај (нпр. видео снимке, слике, чланке, итд). Угнежђени садржај са других веб места се понаша на потпуно исти начин као да је ваш посетилац посетио друго веб место.',1,14,'','VISUAL','core/paragraph',0,'','9ea407ff2712eb16c45e2b74dc31d444','optional',NULL),(38,'sr','gutenberg-3','d79c22a39eea4353d83c7d5f830ab9f9','Та веб места могу да прикупе податке о вама, користе колачиће, угнезде додатно праћење од стране треће стране и надгледају вашу интеракцију са тим угнежђеним садржајем, укључујући праћење ваше интеракције са угнежђеним садржајем уколико имате налог и пријављени сте на то веб место.',1,15,'','AREA','core/paragraph',0,'','1d7dfb5608b01636b2a50f010016ff45','optional',NULL),(39,'sr','gutenberg-3','2949e5a79236ba480a229195dbb3959a','Са ким делимо ваше податке',1,16,'h2','LINE','core/heading',0,'','d670ab758942c32d5a8acac6e5709b31','optional',NULL),(40,'sr','gutenberg-3','e4ec95e980ee7845937ad1cc875e2568','<strong class=\"privacy-policy-tutorial\">Предложени текст: </strong>Ако затражите ресетовање лозинке, ваша IP адреса ће бити укључена у е-пошту ресетовања.',1,17,'','VISUAL','core/paragraph',0,'','448d5f3c0c723434187afb99a4d2ccdd','optional',NULL),(41,'sr','gutenberg-3','8e2cecc2b1e9a9f81a51d870442e5ba4','Колико дуго чувамо ваше податке',1,18,'h2','LINE','core/heading',0,'','a3cfa522ac83de17811f25b8e4045787','optional',NULL),(42,'sr','gutenberg-3','4a6f54b0cb72f38432d5529d996bb74a','<strong class=\"privacy-policy-tutorial\">Предложени текст: </strong>Уколико оставите коментар, тај коментар и његови мета подаци се чувају неограничено. Ово је зато да бисмо препознали и аутоматски одобрили све коментаре које уследе умести да их држимо у реду за преглед.',1,19,'','VISUAL','core/paragraph',0,'','51a6712708b8f3f7faf765118a1db6b9','optional',NULL),(43,'sr','gutenberg-3','d98d7dda36b15157b77c04d842ed9d4e','За кориснике који се региструју на наше веб место (уколико их има), такође чувамо личне информације које доставе у свом корисничком профилу. Сви корисници могу да виде, уреде или обришу своје личне податке било када (изузев што не могу да промене своје корисничко име). Управници веб места такође могу да виде и уреде те информације.',1,20,'','AREA','core/paragraph',0,'','323b89f06ca2a0c89870d785bbd6d22e','optional',NULL),(44,'sr','gutenberg-3','29ac9405928cb0efb8f2e63fc079848b','Која права имате у односу на ваше податке',1,21,'h2','LINE','core/heading',0,'','10ba90cb5d356022cc20577e54cc0db2','optional',NULL),(45,'sr','gutenberg-3','5698005a17a17034279dfaedf3b17b91','<strong class=\"privacy-policy-tutorial\">Предложени текст: </strong>Уколико имате налог на овом веб месту, или сте оставили коментаре, можете да захтевате да примите датотеку са извезеним личним подацима које држимо о вама укључујући било које податке које сте нам доставили. Такође можете да захтевате да обришемо било које личне податке које држимо о вама. То не укључује било које податке које смо обавезни да држимо због административних, правних или безбедоносних разлога.',1,22,'','VISUAL','core/paragraph',0,'','a08b5f05471fea584c5e4af54089404a','optional',NULL),(46,'sr','gutenberg-3','2e3fd95b22c8c4da0bdd8478dc7e5075','Где шаљемо ваше податке',1,23,'h2','LINE','core/heading',0,'','8d4f842796761abab71a48f175052578','optional',NULL),(47,'sr','gutenberg-3','cd2eec6d64dbb162051b6deb391759ec','<strong class=\"privacy-policy-tutorial\">Предложени текст: </strong>Коментари посетиоца могу да буду проверени кроз услугу аутоматског препознавања непожељних.',1,24,'','VISUAL','core/paragraph',0,'','eeaf9bd0cd0902ca0644c74d85249cfa','optional',NULL);
/*!40000 ALTER TABLE `wp_icl_strings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_icl_translate`
--

DROP TABLE IF EXISTS `wp_icl_translate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_icl_translate` (
  `tid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `job_id` bigint(20) unsigned NOT NULL,
  `content_id` bigint(20) unsigned NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `field_type` varchar(160) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `field_wrap_tag` varchar(16) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `field_format` varchar(16) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `field_translate` tinyint(4) NOT NULL,
  `field_data` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `field_data_translated` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `field_finished` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_icl_translate`
--

LOCK TABLES `wp_icl_translate` WRITE;
/*!40000 ALTER TABLE `wp_icl_translate` DISABLE KEYS */;
INSERT INTO `wp_icl_translate` VALUES (1,1,0,'2021-05-29 18:41:27','original_id','','',0,'8','8',1),(2,1,0,'2021-05-29 18:41:27','title','','base64',1,'UG/EjWV0bmE=','UG/EjWV0bmE=',1),(3,1,0,'2021-05-29 18:41:27','body','','base64',1,'','',1),(4,1,0,'2021-05-29 18:41:27','excerpt','','base64',1,'','',1),(5,1,0,'2021-05-29 18:41:27','t_4','','base64',1,'T3B0aW9uYWw=','T3B0aW9uYWw=',1),(6,1,0,'2021-05-29 18:41:27','tdesc_4','','base64',1,'','',1);
/*!40000 ALTER TABLE `wp_icl_translate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_icl_translate_job`
--

DROP TABLE IF EXISTS `wp_icl_translate_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_icl_translate_job` (
  `job_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `rid` bigint(20) unsigned NOT NULL,
  `translator_id` int(10) unsigned NOT NULL,
  `translated` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `manager_id` int(10) unsigned NOT NULL,
  `revision` int(10) unsigned DEFAULT NULL,
  `title` varchar(160) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `deadline_date` datetime DEFAULT NULL,
  `completed_date` datetime DEFAULT NULL,
  `editor` varchar(16) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `editor_job_id` bigint(20) unsigned DEFAULT NULL,
  `edit_timestamp` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`job_id`),
  KEY `rid` (`rid`,`translator_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_icl_translate_job`
--

LOCK TABLES `wp_icl_translate_job` WRITE;
/*!40000 ALTER TABLE `wp_icl_translate_job` DISABLE KEYS */;
INSERT INTO `wp_icl_translate_job` VALUES (1,6,3,1,3,NULL,'Početna',NULL,NULL,'wp',NULL,NULL);
/*!40000 ALTER TABLE `wp_icl_translate_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_icl_translation_batches`
--

DROP TABLE IF EXISTS `wp_icl_translation_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_icl_translation_batches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `batch_name` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `tp_id` int(11) DEFAULT NULL,
  `ts_url` text COLLATE utf8mb4_unicode_520_ci,
  `last_update` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_icl_translation_batches`
--

LOCK TABLES `wp_icl_translation_batches` WRITE;
/*!40000 ALTER TABLE `wp_icl_translation_batches` DISABLE KEYS */;
INSERT INTO `wp_icl_translation_batches` VALUES (1,'Manual Translations from May the 29th, 2021',NULL,NULL,'2021-05-29 18:41:27');
/*!40000 ALTER TABLE `wp_icl_translation_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_icl_translation_downloads`
--

DROP TABLE IF EXISTS `wp_icl_translation_downloads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_icl_translation_downloads` (
  `editor_job_id` bigint(20) unsigned NOT NULL,
  `download_url` varchar(2000) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `lock_timestamp` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`editor_job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_icl_translation_downloads`
--

LOCK TABLES `wp_icl_translation_downloads` WRITE;
/*!40000 ALTER TABLE `wp_icl_translation_downloads` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_icl_translation_downloads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_icl_translation_status`
--

DROP TABLE IF EXISTS `wp_icl_translation_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_icl_translation_status` (
  `rid` bigint(20) NOT NULL AUTO_INCREMENT,
  `translation_id` bigint(20) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `translator_id` bigint(20) NOT NULL,
  `needs_update` tinyint(4) NOT NULL,
  `md5` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `translation_service` varchar(16) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `batch_id` int(11) NOT NULL DEFAULT '0',
  `translation_package` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `links_fixed` tinyint(4) NOT NULL DEFAULT '0',
  `_prevstate` longtext COLLATE utf8mb4_unicode_520_ci,
  `uuid` varchar(36) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `tp_id` int(11) DEFAULT NULL,
  `tp_revision` int(11) NOT NULL DEFAULT '1',
  `ts_status` text COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`rid`),
  UNIQUE KEY `translation_id` (`translation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_icl_translation_status`
--

LOCK TABLES `wp_icl_translation_status` WRITE;
/*!40000 ALTER TABLE `wp_icl_translation_status` DISABLE KEYS */;
INSERT INTO `wp_icl_translation_status` VALUES (1,23,9,0,0,'','',0,'','2021-05-26 14:06:42',0,NULL,NULL,NULL,1,NULL),(2,25,9,0,0,'','',0,'','2021-05-26 14:06:44',0,NULL,NULL,NULL,1,NULL),(3,27,9,0,0,'','',0,'','2021-05-29 17:38:45',0,NULL,NULL,NULL,1,NULL),(4,33,9,0,0,'','',0,'','2021-05-29 17:53:22',0,NULL,NULL,NULL,1,NULL),(5,38,9,0,0,'8a71ec3e38f402a1f611a9b6ea2bf7b3','',0,'a:4:{s:3:\"url\";s:34:\"http://localhost/ivkovic?page_id=8\";s:5:\"title\";s:8:\"Početna\";s:8:\"contents\";a:6:{s:11:\"original_id\";a:2:{s:9:\"translate\";i:0;s:4:\"data\";i:8;}s:5:\"title\";a:3:{s:9:\"translate\";i:1;s:4:\"data\";s:12:\"UG/EjWV0bmE=\";s:6:\"format\";s:6:\"base64\";}s:4:\"body\";a:3:{s:9:\"translate\";i:1;s:4:\"data\";s:0:\"\";s:6:\"format\";s:6:\"base64\";}s:7:\"excerpt\";a:3:{s:9:\"translate\";i:1;s:4:\"data\";s:0:\"\";s:6:\"format\";s:6:\"base64\";}s:3:\"t_3\";a:3:{s:9:\"translate\";i:1;s:4:\"data\";s:12:\"T3B0aW9uYWw=\";s:6:\"format\";s:6:\"base64\";}s:7:\"tdesc_3\";a:3:{s:9:\"translate\";i:1;s:4:\"data\";s:0:\"\";s:6:\"format\";s:6:\"base64\";}}s:4:\"type\";s:4:\"post\";}','2021-05-29 18:16:41',1,NULL,NULL,NULL,1,NULL),(6,20,9,3,0,'8a71ec3e38f402a1f611a9b6ea2bf7b3','local',1,'a:4:{s:3:\"url\";s:34:\"http://localhost/ivkovic?page_id=8\";s:5:\"title\";s:8:\"Početna\";s:8:\"contents\";a:6:{s:11:\"original_id\";a:2:{s:9:\"translate\";i:0;s:4:\"data\";i:8;}s:5:\"title\";a:3:{s:9:\"translate\";i:1;s:4:\"data\";s:12:\"UG/EjWV0bmE=\";s:6:\"format\";s:6:\"base64\";}s:4:\"body\";a:3:{s:9:\"translate\";i:1;s:4:\"data\";s:0:\"\";s:6:\"format\";s:6:\"base64\";}s:7:\"excerpt\";a:3:{s:9:\"translate\";i:1;s:4:\"data\";s:0:\"\";s:6:\"format\";s:6:\"base64\";}s:3:\"t_4\";a:3:{s:9:\"translate\";i:1;s:4:\"data\";s:12:\"T3B0aW9uYWw=\";s:6:\"format\";s:6:\"base64\";}s:7:\"tdesc_4\";a:3:{s:9:\"translate\";i:1;s:4:\"data\";s:0:\"\";s:6:\"format\";s:6:\"base64\";}}s:4:\"type\";s:4:\"post\";}','2021-05-29 18:41:27',0,NULL,NULL,NULL,1,NULL),(7,43,9,0,0,'','',0,'','2021-05-29 18:56:32',0,NULL,NULL,NULL,1,NULL),(8,45,9,0,0,'','',0,'','2021-05-29 19:03:11',0,NULL,NULL,NULL,1,NULL),(9,47,9,0,0,'','',0,'','2021-05-29 19:03:14',0,NULL,NULL,NULL,1,NULL),(10,49,9,0,0,'','',0,'','2021-05-29 19:03:17',0,NULL,NULL,NULL,1,NULL),(11,51,9,0,0,'','',0,'','2021-05-29 20:59:54',0,NULL,NULL,NULL,1,NULL),(12,54,9,0,0,'','',0,'','2021-05-29 21:52:56',0,NULL,NULL,NULL,1,NULL),(13,56,9,0,0,'','',0,'','2021-05-29 21:53:01',0,NULL,NULL,NULL,1,NULL),(14,58,9,0,0,'','',0,'','2021-05-29 21:53:05',0,NULL,NULL,NULL,1,NULL),(15,60,9,0,0,'','',0,'','2021-05-29 22:03:38',0,NULL,NULL,NULL,1,NULL),(16,62,9,0,0,'','',0,'','2021-05-30 08:24:34',0,NULL,NULL,NULL,1,NULL),(17,64,9,0,0,'','',0,'','2021-05-30 08:24:37',0,NULL,NULL,NULL,1,NULL),(18,66,9,0,0,'','',0,'','2021-05-30 08:37:21',0,NULL,NULL,NULL,1,NULL),(19,68,9,0,0,'','',0,'','2021-05-30 08:44:43',0,NULL,NULL,NULL,1,NULL),(20,70,9,0,0,'','',0,'','2021-05-30 08:44:46',0,NULL,NULL,NULL,1,NULL),(21,72,9,0,0,'','',0,'','2021-05-30 08:44:49',0,NULL,NULL,NULL,1,NULL),(22,78,9,0,0,'','',0,'','2021-05-30 10:47:18',0,NULL,NULL,NULL,1,NULL),(23,80,9,0,0,'','',0,'','2021-05-30 10:59:48',0,NULL,NULL,NULL,1,NULL),(24,82,9,0,0,'','',0,'','2021-05-30 10:59:50',0,NULL,NULL,NULL,1,NULL),(25,84,9,0,0,'','',0,'','2021-05-30 10:59:53',0,NULL,NULL,NULL,1,NULL),(26,86,9,0,0,'','',0,'','2021-05-30 11:19:25',0,NULL,NULL,NULL,1,NULL),(27,88,9,0,0,'','',0,'','2021-05-30 11:30:30',0,NULL,NULL,NULL,1,NULL),(28,90,9,0,0,'','',0,'','2021-05-30 11:30:50',0,NULL,NULL,NULL,1,NULL),(29,119,9,0,0,'','',0,'','2021-05-30 14:57:18',0,NULL,NULL,NULL,1,NULL);
/*!40000 ALTER TABLE `wp_icl_translation_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_icl_translations`
--

DROP TABLE IF EXISTS `wp_icl_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_icl_translations` (
  `translation_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `element_type` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'post_post',
  `element_id` bigint(20) DEFAULT NULL,
  `trid` bigint(20) NOT NULL,
  `language_code` varchar(7) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `source_language_code` varchar(7) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`translation_id`),
  UNIQUE KEY `trid_lang` (`trid`,`language_code`),
  UNIQUE KEY `el_type_id` (`element_type`,`element_id`),
  KEY `trid` (`trid`),
  KEY `id_type_language` (`element_id`,`element_type`,`language_code`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_icl_translations`
--

LOCK TABLES `wp_icl_translations` WRITE;
/*!40000 ALTER TABLE `wp_icl_translations` DISABLE KEYS */;
INSERT INTO `wp_icl_translations` VALUES (1,'post_page',3,3,'sr',NULL),(8,'tax_category',1,7,'sr',NULL),(9,'comment',1,9,'sr',NULL),(10,'tax_category',2,7,'en','sr'),(12,'tax_translation_priority',3,10,'sr',NULL),(13,'tax_translation_priority',4,10,'en','sr'),(15,'tax_translation_priority',5,11,'sr',NULL),(16,'tax_translation_priority',6,11,'en','sr'),(18,'tax_translation_priority',7,12,'sr',NULL),(19,'tax_translation_priority',8,12,'en','sr'),(20,'post_page',8,13,'sr',NULL),(21,'post_page',10,14,'sr',NULL),(22,'post_attachment',11,15,'sr',NULL),(23,'post_attachment',12,15,'en','sr'),(24,'post_attachment',13,16,'sr',NULL),(25,'post_attachment',14,16,'en','sr'),(26,'post_attachment',17,17,'sr',NULL),(27,'post_attachment',18,17,'en','sr'),(28,'post_page',20,18,'sr',NULL),(30,'post_nav_menu_item',23,20,'sr',NULL),(31,'tax_nav_menu',9,21,'sr',NULL),(32,'post_attachment',26,22,'sr',NULL),(33,'post_attachment',27,22,'en','sr'),(34,'post_page',28,23,'sr',NULL),(35,'post_page',29,24,'sr',NULL),(36,'post_page',30,25,'sr',NULL),(37,'post_page',31,26,'sr',NULL),(38,'post_page',32,13,'en','sr'),(39,'post_page',33,27,'sr',NULL),(40,'post_page',35,28,'sr',NULL),(41,'post_post',41,29,'sr',NULL),(42,'post_attachment',66,30,'sr',NULL),(43,'post_attachment',67,30,'en','sr'),(44,'post_attachment',72,31,'sr',NULL),(45,'post_attachment',73,31,'en','sr'),(46,'post_attachment',74,32,'sr',NULL),(47,'post_attachment',75,32,'en','sr'),(48,'post_attachment',76,33,'sr',NULL),(49,'post_attachment',77,33,'en','sr'),(50,'post_attachment',90,34,'sr',NULL),(51,'post_attachment',91,34,'en','sr'),(52,'post_page',116,35,'sr',NULL),(53,'post_attachment',120,36,'sr',NULL),(54,'post_attachment',121,36,'en','sr'),(55,'post_attachment',122,37,'sr',NULL),(56,'post_attachment',123,37,'en','sr'),(57,'post_attachment',124,38,'sr',NULL),(58,'post_attachment',125,38,'en','sr'),(59,'post_attachment',131,39,'sr',NULL),(60,'post_attachment',132,39,'en','sr'),(61,'post_attachment',143,40,'sr',NULL),(62,'post_attachment',144,40,'en','sr'),(63,'post_attachment',145,41,'sr',NULL),(64,'post_attachment',146,41,'en','sr'),(65,'post_attachment',155,42,'sr',NULL),(66,'post_attachment',156,42,'en','sr'),(67,'post_attachment',160,43,'sr',NULL),(68,'post_attachment',161,43,'en','sr'),(69,'post_attachment',162,44,'sr',NULL),(70,'post_attachment',163,44,'en','sr'),(71,'post_attachment',164,45,'sr',NULL),(72,'post_attachment',165,45,'en','sr'),(73,'post_post',159,46,'sr',NULL),(74,'post_post',167,47,'sr',NULL),(75,'post_post',169,48,'sr',NULL),(76,'post_page',177,49,'sr',NULL),(77,'post_attachment',187,50,'sr',NULL),(78,'post_attachment',188,50,'en','sr'),(79,'post_attachment',197,51,'sr',NULL),(80,'post_attachment',198,51,'en','sr'),(81,'post_attachment',199,52,'sr',NULL),(82,'post_attachment',200,52,'en','sr'),(83,'post_attachment',201,53,'sr',NULL),(84,'post_attachment',202,53,'en','sr'),(85,'post_attachment',214,54,'sr',NULL),(86,'post_attachment',215,54,'en','sr'),(87,'post_attachment',219,55,'sr',NULL),(88,'post_attachment',220,55,'en','sr'),(89,'post_attachment',221,56,'sr',NULL),(90,'post_attachment',222,56,'en','sr'),(91,'tax_nav_menu',30,57,'sr',NULL),(92,'post_nav_menu_item',223,58,'sr',NULL),(94,'package_gutenberg',1,59,'sr',NULL),(95,'post_page',227,60,'sr',NULL),(96,'post_page',229,61,'sr',NULL),(97,'post_page',231,62,'sr',NULL),(98,'post_page',233,63,'sr',NULL),(99,'post_page',235,64,'sr',NULL),(100,'post_nav_menu_item',237,65,'sr',NULL),(101,'post_nav_menu_item',238,66,'sr',NULL),(102,'post_nav_menu_item',239,67,'sr',NULL),(103,'post_nav_menu_item',240,68,'sr',NULL),(104,'post_nav_menu_item',241,69,'sr',NULL),(105,'post_nav_menu_item',242,70,'sr',NULL),(106,'post_nav_menu_item',243,71,'sr',NULL),(107,'post_nav_menu_item',244,72,'sr',NULL),(108,'post_nav_menu_item',245,73,'sr',NULL),(109,'post_nav_menu_item',246,74,'sr',NULL),(110,'post_nav_menu_item',247,75,'sr',NULL),(111,'post_nav_menu_item',248,76,'sr',NULL),(112,'post_nav_menu_item',249,77,'sr',NULL),(113,'post_nav_menu_item',250,78,'sr',NULL),(114,'tax_nav_menu',31,79,'sr',NULL),(115,'post_nav_menu_item',251,80,'sr',NULL),(118,'post_attachment',262,83,'sr',NULL),(119,'post_attachment',263,83,'en','sr'),(120,'post_nav_menu_item',264,84,'sr',NULL),(121,'post_nav_menu_item',265,85,'sr',NULL),(122,'post_nav_menu_item',266,86,'sr',NULL),(123,'post_nav_menu_item',267,87,'sr',NULL),(124,'post_nav_menu_item',268,88,'sr',NULL),(125,'post_nav_menu_item',269,89,'sr',NULL),(126,'post_nav_menu_item',270,90,'sr',NULL),(127,'post_nav_menu_item',271,91,'sr',NULL),(128,'post_nav_menu_item',272,92,'sr',NULL),(129,'post_nav_menu_item',273,93,'sr',NULL),(130,'post_nav_menu_item',274,94,'sr',NULL);
/*!40000 ALTER TABLE `wp_icl_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_links`
--

DROP TABLE IF EXISTS `wp_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_links`
--

LOCK TABLES `wp_links` WRITE;
/*!40000 ALTER TABLE `wp_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_options`
--

DROP TABLE IF EXISTS `wp_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`),
  KEY `autoload` (`autoload`)
) ENGINE=InnoDB AUTO_INCREMENT=2402 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_options`
--

LOCK TABLES `wp_options` WRITE;
/*!40000 ALTER TABLE `wp_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_postmeta`
--

DROP TABLE IF EXISTS `wp_postmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=5471 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_postmeta`
--

LOCK TABLES `wp_postmeta` WRITE;
/*!40000 ALTER TABLE `wp_postmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_postmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_posts`
--

DROP TABLE IF EXISTS `wp_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB AUTO_INCREMENT=293 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_posts`
--

LOCK TABLES `wp_posts` WRITE;
/*!40000 ALTER TABLE `wp_posts` DISABLE KEYS */;
INSERT INTO `wp_posts` VALUES (3,1,'2021-05-20 08:55:08','2021-05-20 06:55:08','<!-- wp:heading -->\r\n<h2>Ко смо ми</h2>\r\n<!-- /wp:heading -->\r\n\r\n<!-- wp:paragraph -->\r\n<p><strong class=\"privacy-policy-tutorial\">Предложени текст: </strong>Наша адреса веб места је: http://localhost/ivkovic.</p>\r\n<!-- /wp:paragraph -->\r\n\r\n<!-- wp:heading -->\r\n<h2>Коментари</h2>\r\n<!-- /wp:heading -->\r\n\r\n<!-- wp:paragraph -->\r\n<p><strong class=\"privacy-policy-tutorial\">Предложени текст: </strong>Када посетиоци оставе коментаре на веб месту, скупљамо податке приказане у обрасцу за коментаре као и IP адресу посетиоца и ниску user agent његовог прегледача веба за помоћ у откривању непожељног.</p>\r\n<!-- /wp:paragraph -->\r\n\r\n<!-- wp:paragraph -->\r\n<p>Анонимизована ниска направљена од ваше адресе е-поште (такође названа и хеш) може бити достављена услузи Граватар да би се видело да ли је користите. Политика приватности услуге Граватар је доступна овде: https://automattic.com/privacy/. Након одобрења вашег коментара, ваша слика профила је видљива јавности у смислу вашег коментара.</p>\r\n<!-- /wp:paragraph -->\r\n\r\n<!-- wp:heading -->\r\n<h2>Садржај</h2>\r\n<!-- /wp:heading -->\r\n\r\n<!-- wp:paragraph -->\r\n<p><strong class=\"privacy-policy-tutorial\">Предложени текст: </strong>Уколико отпремате слике на веб место, требало би да избегавате отпремање слика са угнежђеним подацима локације (EXIF GPS). Посетиоци веб места могу да преузму и извуку податке о локацији са слика са веб места.</p>\r\n<!-- /wp:paragraph -->\r\n\r\n<!-- wp:heading -->\r\n<h2>Колачићи</h2>\r\n<!-- /wp:heading -->\r\n\r\n<!-- wp:paragraph -->\r\n<p><strong class=\"privacy-policy-tutorial\">Предложени текст: </strong>Уколико оставите коментар на нашем веб месту, можете се изузети од снимања свог имена, адресе е-поште и веб места у колачићима. Они су због ваше удобности тако да не морате да поново попуњавате своје детаље када оставите други коментар. Ови колачићи трају годину дана.</p>\r\n<!-- /wp:paragraph -->\r\n\r\n<!-- wp:paragraph -->\r\n<p>Уколико посетите нашу страницу за пријављивање, поставићемо привремени колачић за одређивање да ли ваш прегледач веба прихвата колачиће. Овај колачић не садржи личне податке и одбацује се након вашег затварања прегледача веба.</p>\r\n<!-- /wp:paragraph -->\r\n\r\n<!-- wp:paragraph -->\r\n<p>Када се пријавите, такође ћемо поставити неколико колачића да бисмо сачували ваше информације пријављивања и ваше изборе приказа екрана. Колачићи пријављивања трају два дана, а колачићи могућности екрана трају годину дана. Уколико изаберете \"Запамти ме\", ваша пријава ће трајати две седмице. Уколико се одјавите са свог налога, колачићи пријављивања биће уклоњени.</p>\r\n<!-- /wp:paragraph -->\r\n\r\n<!-- wp:paragraph -->\r\n<p>Када уредите или објавите чланак, додатни колачић ће бити сачуван у вашем прегледачу веба. Овај колачић не укључује личне податке и само одређује ID чланка који уређујете. Истиче након једног дана.</p>\r\n<!-- /wp:paragraph -->\r\n\r\n<!-- wp:heading -->\r\n<h2>Угнежђени садржај са других веб места</h2>\r\n<!-- /wp:heading -->\r\n\r\n<!-- wp:paragraph -->\r\n<p><strong class=\"privacy-policy-tutorial\">Предложени текст: </strong>Чланци на овом веб месту могу да садрже угнежђени садржај (нпр. видео снимке, слике, чланке, итд). Угнежђени садржај са других веб места се понаша на потпуно исти начин као да је ваш посетилац посетио друго веб место.</p>\r\n<!-- /wp:paragraph -->\r\n\r\n<!-- wp:paragraph -->\r\n<p>Та веб места могу да прикупе податке о вама, користе колачиће, угнезде додатно праћење од стране треће стране и надгледају вашу интеракцију са тим угнежђеним садржајем, укључујући праћење ваше интеракције са угнежђеним садржајем уколико имате налог и пријављени сте на то веб место.</p>\r\n<!-- /wp:paragraph -->\r\n\r\n<!-- wp:heading -->\r\n<h2>Са ким делимо ваше податке</h2>\r\n<!-- /wp:heading -->\r\n\r\n<!-- wp:paragraph -->\r\n<p><strong class=\"privacy-policy-tutorial\">Предложени текст: </strong>Ако затражите ресетовање лозинке, ваша IP адреса ће бити укључена у е-пошту ресетовања.</p>\r\n<!-- /wp:paragraph -->\r\n\r\n<!-- wp:heading -->\r\n<h2>Колико дуго чувамо ваше податке</h2>\r\n<!-- /wp:heading -->\r\n\r\n<!-- wp:paragraph -->\r\n<p><strong class=\"privacy-policy-tutorial\">Предложени текст: </strong>Уколико оставите коментар, тај коментар и његови мета подаци се чувају неограничено. Ово је зато да бисмо препознали и аутоматски одобрили све коментаре које уследе умести да их држимо у реду за преглед.</p>\r\n<!-- /wp:paragraph -->\r\n\r\n<!-- wp:paragraph -->\r\n<p>За кориснике који се региструју на наше веб место (уколико их има), такође чувамо личне информације које доставе у свом корисничком профилу. Сви корисници могу да виде, уреде или обришу своје личне податке било када (изузев што не могу да промене своје корисничко име). Управници веб места такође могу да виде и уреде те информације.</p>\r\n<!-- /wp:paragraph -->\r\n\r\n<!-- wp:heading -->\r\n<h2>Која права имате у односу на ваше податке</h2>\r\n<!-- /wp:heading -->\r\n\r\n<!-- wp:paragraph -->\r\n<p><strong class=\"privacy-policy-tutorial\">Предложени текст: </strong>Уколико имате налог на овом веб месту, или сте оставили коментаре, можете да захтевате да примите датотеку са извезеним личним подацима које држимо о вама укључујући било које податке које сте нам доставили. Такође можете да захтевате да обришемо било које личне податке које држимо о вама. То не укључује било које податке које смо обавезни да држимо због административних, правних или безбедоносних разлога.</p>\r\n<!-- /wp:paragraph -->\r\n\r\n<!-- wp:heading -->\r\n<h2>Где шаљемо ваше податке</h2>\r\n<!-- /wp:heading -->\r\n\r\n<!-- wp:paragraph -->\r\n<p><strong class=\"privacy-policy-tutorial\">Предложени текст: </strong>Коментари посетиоца могу да буду проверени кроз услугу аутоматског препознавања непожељних.</p>\r\n<!-- /wp:paragraph -->','Politika Privatnosti','','draft','closed','open','','politika-privatnosti','','','2021-05-30 13:59:28','2021-05-30 11:59:28','',0,'http://localhost/ivkovic/?page_id=3',0,'page','',0),(8,1,'2021-05-20 09:01:26','2021-05-20 07:01:26','','Početna','','publish','closed','closed','','pocetna','','','2021-05-30 17:32:56','2021-05-30 15:32:56','',0,'http://localhost/ivkovic/?page_id=8',0,'page','',0),(9,1,'2021-05-20 09:01:26','2021-05-20 07:01:26','','Početna','','inherit','closed','closed','','8-revision-v1','','','2021-05-20 09:01:26','2021-05-20 07:01:26','',8,'http://localhost/ivkovic/?p=9',0,'revision','',0),(10,1,'2021-05-20 09:10:15','0000-00-00 00:00:00','<strong>Headings</strong>\n<h1>Header one</h1>\n<h2>Header two</h2>\n<h3>Header three</h3>\n<h4>Header four</h4>\n<h5>Header five</h5>\n<h6>Header six</h6>\n<h2>Blockquotes</h2>\nSingle line blockquote:\n<blockquote>Stay hungry. Stay foolish.</blockquote>\nMulti line blockquote with a cite reference:\n<blockquote cite=\"https://developer.mozilla.org/en-US/docs/Web/HTML/Element/blockquote\">The <strong>HTML <code>&lt;blockquote&gt;</code> Element</strong> (or <em>HTML Block Quotation Element</em>) indicates that the enclosed text is an extended quotation. Usually, this is rendered visually by indentation (see <a href=\"https://developer.mozilla.org/en-US/docs/HTML/Element/blockquote#Notes\">Notes</a> for how to change it). A URL for the source of the quotation may be given using the <strong>cite</strong> attribute, while a text representation of the source can be given using the <a title=\"The HTML Citation Element &lt;cite&gt; represents a reference to a creative work. It must include the title of a work or a URL reference, which may be in an abbreviated form according to the conventions used for the addition of citation metadata.\" href=\"https://developer.mozilla.org/en-US/docs/Web/HTML/Element/cite\"><code>&lt;cite&gt;</code></a> element.</blockquote>\n<cite>multiple contributors</cite> - MDN HTML element reference - blockquote\n<h2>Tables</h2>\n<table>\n    <thead>\n    <tr>\n        <th>Employee</th>\n        <th>Salary</th>\n        <th></th>\n    </tr>\n    </thead>\n    <tbody>\n    <tr>\n        <th><a href=\"http://example.org/\">John Doe</a></th>\n        <td>$1</td>\n        <td>Because that\'s all Steve Jobs needed for a salary.</td>\n    </tr>\n    <tr>\n        <th><a href=\"http://example.org/\">Jane Doe</a></th>\n        <td>$100K</td>\n        <td>For all the blogging she does.</td>\n    </tr>\n    <tr>\n        <th><a href=\"http://example.org/\">Fred Bloggs</a></th>\n        <td>$100M</td>\n        <td>Pictures are worth a thousand words, right? So Jane x 1,000.</td>\n    </tr>\n    <tr>\n        <th><a href=\"http://example.org/\">Jane Bloggs</a></th>\n        <td>$100B</td>\n        <td>With hair like that?! Enough said...</td>\n    </tr>\n    </tbody>\n</table>\n<h2>Definition Lists</h2>\n<dl>\n    <dt>Definition List Title</dt>\n    <dd>Definition list division.</dd>\n    <dt>Startup</dt>\n    <dd>A startup company or startup is a company or temporary organization designed to search for a repeatable and scalable business model.</dd>\n    <dt>#dowork</dt>\n    <dd>Coined by Rob Dyrdek and his personal body guard Christopher \"Big Black\" Boykins, \"Do Work\" works as a self motivator, to motivating your friends.</dd>\n    <dt>Do It Live</dt>\n    <dd>I\'ll let Bill O\'Reilly will <a title=\"We\'ll Do It Live\" href=\"https://www.youtube.com/watch?v=O_HyZ5aW76c\">explain</a> this one.</dd>\n</dl>\n<h2>Unordered Lists (Nested)</h2>\n<ul>\n    <li>List item one\n        <ul>\n            <li>List item one\n                <ul>\n                    <li>List item one</li>\n                    <li>List item two</li>\n                    <li>List item three</li>\n                    <li>List item four</li>\n                </ul>\n            </li>\n            <li>List item two</li>\n            <li>List item three</li>\n            <li>List item four</li>\n        </ul>\n    </li>\n    <li>List item two</li>\n    <li>List item three</li>\n    <li>List item four</li>\n</ul>\n<h2>Ordered List (Nested)</h2>\n<ol start=\"8\">\n    <li>List item one -start at 8\n        <ol>\n            <li>List item one\n                <ol reversed=\"reversed\">\n                    <li>List item one -reversed attribute</li>\n                    <li>List item two</li>\n                    <li>List item three</li>\n                    <li>List item four</li>\n                </ol>\n            </li>\n            <li>List item two</li>\n            <li>List item three</li>\n            <li>List item four</li>\n        </ol>\n    </li>\n    <li>List item two</li>\n    <li>List item three</li>\n    <li>List item four</li>\n</ol>\n<h2>HTML Tags</h2>\nThese supported tags come from the WordPress.com code <a title=\"Code\" href=\"https://en.support.wordpress.com/code/\">FAQ</a>.\n\n<strong>Address Tag</strong>\n\n<address>1 Infinite Loop\n    Cupertino, CA 95014\n    United States</address><strong>Anchor Tag (aka. Link)</strong>\n\nThis is an example of a <a title=\"WordPress Foundation\" href=\"https://wordpressfoundation.org/\">link</a>.\n\n<strong>Abbreviation Tag</strong>\n\nThe abbreviation <abbr title=\"Seriously\">srsly</abbr> stands for \"seriously\".\n\n<strong>Acronym Tag (<em>deprecated in HTML5</em>)</strong>\n\nThe acronym <acronym title=\"For The Win\">ftw</acronym> stands for \"for the win\".\n\n<strong>Big Tag</strong> (<em>deprecated in HTML5</em>)\n\nThese tests are a <big>big</big> deal, but this tag is no longer supported in HTML5.\n\n<strong>Cite Tag</strong>\n\n\"Code is poetry.\" --<cite>Automattic</cite>\n\n<strong>Code Tag</strong>\n\nThis tag styles blocks of code.\n<code>.post-title {\n    margin: 0 0 5px;\n    font-weight: bold;\n    font-size: 38px;\n    line-height: 1.2;\n    and here\'s a line of some really, really, really, really long text, just to see how it is handled and to find out how it overflows;\n    }</code>\nYou will learn later on in these tests that word-wrap: break-word;will be your best friend.\n\n<strong>Delete Tag</strong>\n\nThis tag will let you <del cite=\"deleted it\">strike out text</del>, but this tag is <em>recommended</em> supported in HTML5 (use the <code>&lt;s&gt;</code> instead).\n\n<strong>Emphasize Tag</strong>\n\nThe emphasize tag should <em>italicize</em> <i>text</i>.\n\n<strong>Horizontal Rule Tag</strong>\n\n<hr />\n\nThis sentence is following a <code>&lt;hr /&gt;</code> tag.\n\n<strong>Insert Tag</strong>\n\nThis tag should denote <ins cite=\"inserted it\">inserted</ins> text.\n\n<strong>Keyboard Tag</strong>\n\nThis scarcely known tag emulates <kbd>keyboard text</kbd>, which is usually styled like the <code>&lt;code&gt;</code> tag.\n\n<strong>Preformatted Tag</strong>\n\nThis tag is for preserving whitespace as typed, such as in poetry or ASCII art.\n<h2>The Road Not Taken</h2>\n<cite>Robert Frost</cite> Two roads diverged in a yellow wood, And sorry I could not travel both (_/) And be one traveler, long I stood (=\'.\'=) And looked down one as far as I could (\")_(\") To where it bent in the undergrowth; Then took the other, as just as fair, And having perhaps the better claim, |_/| Because it was grassy and wanted wear; / @ @  Though as for that the passing there ( &gt; º &lt; ) Had worn them really about the same, `&gt;&gt;x&lt;&lt;´ / O  And both that morning equally lay In leaves no step had trodden black. Oh, I kept the first for another day! Yet knowing how way leads on to way, I doubted if I should ever come back. I shall be telling this with a sigh Somewhere ages and ages hence: Two roads diverged in a wood, and I— I took the one less traveled by, And that has made all the difference. and here\'s a line of some really, really, really, really long text, just to see how it is handled and to find out how it overflows;\n\n<strong>Quote Tag</strong> for short, inline quotes\n\n<q>Developers, developers, developers...</q> --Steve Ballmer\n\n<strong>Strike Tag</strong> (<em>deprecated in HTML5</em>) and <strong>S Tag</strong>\n\nThis tag shows <span style=\"text-decoration: line-through;\">strike-through</span> <s>text</s>.\n\n<strong>Small Tag</strong>\n\nThis tag shows <small>smaller<small> text.</small></small>\n\n<strong>Strong Tag</strong>\n\nThis tag shows <strong>bold<strong> text.</strong></strong>\n\n<strong>Subscript Tag</strong>\n\nGetting our science styling on with H<sub>2</sub>O, which should push the \"2\" down.\n\n<strong>Superscript Tag</strong>\n\nStill sticking with science and Albert Einstein\'s E = MC<sup>2</sup>, which should lift the 2 up.\n\n<strong>Teletype Tag </strong>(<em>obsolete in HTML5</em>)\n\nThis rarely used tag emulates <tt>teletype text</tt>, which is usually styled like the <code>&lt;code&gt;</code> tag.\n\n<strong>Underline Tag</strong> <em>deprecated in HTML 4, re-introduced in HTML5 with other semantics</em>\n\nThis tag shows <u>underlined text</u>.\n\n<strong>Variable Tag</strong>\n\nThis allows you to denote <var>variables</var>.\n<h3>Default</h3>\nThis is a paragraph. It should not have any alignment of any kind. It should just flow like you would normally expect. Nothing fancy. Just straight up text, free flowing, with love. Completely neutral and not picking a side or sitting on the fence. It just is. It just freaking is. It likes where it is. It does not feel compelled to pick a side. Leave him be. It will just be better that way. Trust me.\n<h3>Left Align</h3>\n<p style=\"text-align: left;\">This is a paragraph. It is left aligned. Because of this, it is a bit more liberal in it\'s views. It\'s favorite color is green. Left align tends to be more eco-friendly, but it provides no concrete evidence that it really is. Even though it likes share the wealth evenly, it leaves the equal distribution up to justified alignment.</p>\n\n<h3>Center Align</h3>\n<p style=\"text-align: center;\">This is a paragraph. It is center aligned. Center is, but nature, a fence sitter. A flip flopper. It has a difficult time making up its mind. It wants to pick a side. Really, it does. It has the best intentions, but it tends to complicate matters more than help. The best you can do is try to win it over and hope for the best. I hear center align does take bribes.</p>\n\n<h3>Right Align</h3>\n<p style=\"text-align: right;\">This is a paragraph. It is right aligned. It is a bit more conservative in it\'s views. It\'s prefers to not be told what to do or how to do it. Right align totally owns a slew of guns and loves to head to the range for some practice. Which is cool and all. I mean, it\'s a pretty good shot from at least four or five football fields away. Dead on. So boss.</p>\n\n<h3>Justify Align</h3>\n<p style=\"text-align: justify;\">This is a paragraph. It is justify aligned. It gets really mad when people associate it with Justin Timberlake. Typically, justified is pretty straight laced. It likes everything to be in it\'s place and not all cattywampus like the rest of the aligns. I am not saying that makes it better than the rest of the aligns, but it does tend to put off more of an elitist attitude.</p>','HTML Markup Test page','','draft','closed','closed','','','','','2021-05-20 09:10:15','0000-00-00 00:00:00','',0,'http://localhost/ivkovic/?page_id=10',0,'page','',0),(11,1,'2021-05-26 16:06:42','2021-05-26 14:06:42','','favicon','','inherit','open','closed','','favicon','','','2021-05-26 16:06:42','2021-05-26 14:06:42','',0,'http://localhost/ivkovic/wp-content/uploads/2021/05/favicon.png',0,'attachment','image/png',0),(12,1,'2021-05-26 16:06:42','2021-05-26 14:06:42','','favicon','','inherit','open','closed','','favicon-2','','','2021-05-26 16:06:42','2021-05-26 14:06:42','',0,'http://localhost/ivkovic/wp-content/uploads/2021/05/favicon.png',0,'attachment','image/png',0),(13,1,'2021-05-26 16:06:43','2021-05-26 14:06:43','http://localhost/ivkovic/wp-content/uploads/2021/05/cropped-favicon.png','cropped-favicon.png','','inherit','open','closed','','cropped-favicon-png','','','2021-05-26 16:06:43','2021-05-26 14:06:43','',0,'http://localhost/ivkovic/wp-content/uploads/2021/05/cropped-favicon.png',0,'attachment','image/png',0),(14,1,'2021-05-26 16:06:43','2021-05-26 14:06:43','http://localhost/ivkovic/wp-content/uploads/2021/05/cropped-favicon.png','cropped-favicon.png','','inherit','open','closed','','cropped-favicon-png-2','','','2021-05-26 16:06:43','2021-05-26 14:06:43','',0,'http://localhost/ivkovic/wp-content/uploads/2021/05/cropped-favicon.png',0,'attachment','image/png',0),(15,1,'2021-05-26 16:06:48','2021-05-26 14:06:48','{\n    \"blogdescription\": {\n        \"value\": \"\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2021-05-26 14:06:48\"\n    },\n    \"site_icon\": {\n        \"value\": 13,\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2021-05-26 14:06:48\"\n    }\n}','','','trash','closed','closed','','0fd6cea7-9b81-4616-9261-0ecd6a4f372b','','','2021-05-26 16:06:48','2021-05-26 14:06:48','',0,'http://localhost/ivkovic/0fd6cea7-9b81-4616-9261-0ecd6a4f372b/',0,'customize_changeset','',0),(16,3,'2021-05-29 19:34:26','0000-00-00 00:00:00','','Automatski nacrt','','auto-draft','open','open','','','','','2021-05-29 19:34:26','0000-00-00 00:00:00','',0,'http://localhost/ivkovic/?p=16',0,'post','',0),(17,3,'2021-05-29 19:38:45','2021-05-29 17:38:45','','61803913','','inherit','open','closed','','61803913','','','2021-05-29 19:38:45','2021-05-29 17:38:45','',0,'http://localhost/ivkovic/wp-content/uploads/2021/05/61803913.svg',0,'attachment','image/svg+xml',0),(18,3,'2021-05-29 19:38:45','2021-05-29 17:38:45','','61803913','','inherit','open','closed','','61803913-2','','','2021-05-29 19:38:45','2021-05-29 17:38:45','',0,'http://localhost/ivkovic/wp-content/uploads/2021/05/61803913.svg',0,'attachment','image/svg+xml',0),(19,3,'2021-05-29 19:44:32','2021-05-29 17:44:32','{\n    \"ivkovic-theme::header_image\": {\n        \"value\": \"http://localhost/ivkovic/wp-content/uploads/2021/05/61803913.svg\",\n        \"type\": \"theme_mod\",\n        \"user_id\": 3,\n        \"date_modified_gmt\": \"2021-05-29 17:38:52\"\n    },\n    \"ivkovic-theme::header_image_data\": {\n        \"value\": {\n            \"url\": \"http://localhost/ivkovic/wp-content/uploads/2021/05/61803913.svg\",\n            \"thumbnail_url\": \"http://localhost/ivkovic/wp-content/uploads/2021/05/61803913.svg\",\n            \"timestamp\": 1622309928923,\n            \"attachment_id\": 17\n        },\n        \"type\": \"theme_mod\",\n        \"user_id\": 3,\n        \"date_modified_gmt\": \"2021-05-29 17:38:52\"\n    },\n    \"blogdescription\": {\n        \"value\": \"\",\n        \"type\": \"option\",\n        \"user_id\": 3,\n        \"date_modified_gmt\": \"2021-05-29 17:44:32\"\n    }\n}','','','trash','closed','closed','','cb39b777-40aa-4381-a942-971cf0cac114','','','2021-05-29 19:44:32','2021-05-29 17:44:32','',0,'http://localhost/ivkovic/?p=19',0,'customize_changeset','',0),(20,3,'2021-05-29 19:42:57','2021-05-29 17:42:57','','O nama','','publish','closed','closed','','o-nama','','','2021-05-29 19:42:57','2021-05-29 17:42:57','',0,'http://localhost/ivkovic/?page_id=20',0,'page','',0),(21,3,'2021-05-29 19:42:57','2021-05-29 17:42:57','','O nama','','inherit','closed','closed','','20-revision-v1','','','2021-05-29 19:42:57','2021-05-29 17:42:57','',20,'http://localhost/ivkovic/?p=21',0,'revision','',0),(23,3,'2021-05-30 14:07:20','2021-05-29 17:44:12',' ','','','publish','closed','closed','','23','','','2021-05-30 14:07:20','2021-05-30 12:07:20','',0,'http://localhost/ivkovic/?p=23',1,'nav_menu_item','',0),(24,3,'2021-05-29 19:45:18','2021-05-29 17:45:18','{\n    \"blogdescription\": {\n        \"value\": \"\",\n        \"type\": \"option\",\n        \"user_id\": 3,\n        \"date_modified_gmt\": \"2021-05-29 17:45:18\"\n    }\n}','','','trash','closed','closed','','291ea2a2-ed4f-434f-be82-09943283ce5c','','','2021-05-29 19:45:18','2021-05-29 17:45:18','',0,'http://localhost/ivkovic/291ea2a2-ed4f-434f-be82-09943283ce5c/',0,'customize_changeset','',0),(25,3,'2021-05-29 19:45:51','2021-05-29 17:45:51','{\n    \"blogdescription\": {\n        \"value\": \"\",\n        \"type\": \"option\",\n        \"user_id\": 3,\n        \"date_modified_gmt\": \"2021-05-29 17:45:49\"\n    }\n}','','','trash','closed','closed','','21066da2-5899-4f46-8d6e-3efc2d575d77','','','2021-05-29 19:45:51','2021-05-29 17:45:51','',0,'http://localhost/ivkovic/?p=25',0,'customize_changeset','',0),(26,3,'2021-05-29 19:53:22','2021-05-29 17:53:22','','woocommerce-placeholder','','inherit','open','closed','','woocommerce-placeholder','','','2021-05-29 19:53:22','2021-05-29 17:53:22','',0,'http://localhost/ivkovic/wp-content/uploads/2021/05/woocommerce-placeholder.png',0,'attachment','image/png',0),(27,3,'2021-05-29 19:53:22','2021-05-29 17:53:22','','woocommerce-placeholder','','inherit','open','closed','','woocommerce-placeholder-2','','','2021-05-29 19:53:22','2021-05-29 17:53:22','',0,'http://localhost/ivkovic/wp-content/uploads/2021/05/woocommerce-placeholder.png',0,'attachment','image/png',0),(28,1,'2021-05-29 19:53:22','2021-05-29 17:53:22','','Shop','','publish','closed','closed','','shop','','','2021-05-29 19:53:22','2021-05-29 17:53:22','',0,'http://localhost/ivkovic/shop/',0,'page','',0),(29,1,'2021-05-29 19:53:22','2021-05-29 17:53:22','<!-- wp:shortcode -->[woocommerce_cart]<!-- /wp:shortcode -->','Cart','','publish','closed','closed','','cart','','','2021-05-29 19:53:22','2021-05-29 17:53:22','',0,'http://localhost/ivkovic/cart/',0,'page','',0),(30,1,'2021-05-29 19:53:22','2021-05-29 17:53:22','<!-- wp:shortcode -->[woocommerce_checkout]<!-- /wp:shortcode -->','Checkout','','publish','closed','closed','','checkout','','','2021-05-29 19:53:22','2021-05-29 17:53:22','',0,'http://localhost/ivkovic/checkout/',0,'page','',0),(31,1,'2021-05-29 19:53:22','2021-05-29 17:53:22','<!-- wp:shortcode -->[woocommerce_my_account]<!-- /wp:shortcode -->','My account','','publish','closed','closed','','my-account','','','2021-05-29 19:53:22','2021-05-29 17:53:22','',0,'http://localhost/ivkovic/my-account/',0,'page','',0),(32,1,'2021-05-20 09:01:26','2021-05-20 07:01:26','','Početna','','publish','closed','closed','','pocetna','','','2021-05-30 17:32:57','2021-05-30 15:32:57','',0,'http://localhost/ivkovic/pocetna/',0,'page','',0),(33,3,'2021-05-29 20:30:18','2021-05-29 18:30:18','','Login','','publish','closed','closed','','login','','','2021-05-29 20:30:18','2021-05-29 18:30:18','',0,'http://localhost/ivkovic/?page_id=33',0,'page','',0),(34,3,'2021-05-29 20:30:18','2021-05-29 18:30:18','','Login','','inherit','closed','closed','','33-revision-v1','','','2021-05-29 20:30:18','2021-05-29 18:30:18','',33,'http://localhost/ivkovic/?p=34',0,'revision','',0),(35,3,'2021-05-29 20:30:31','2021-05-29 18:30:31','','Registracija','','publish','closed','closed','','registracija','','','2021-05-29 20:30:31','2021-05-29 18:30:31','',0,'http://localhost/ivkovic/?page_id=35',0,'page','',0),(36,3,'2021-05-29 20:30:31','2021-05-29 18:30:31','','Registracija','','inherit','closed','closed','','35-revision-v1','','','2021-05-29 20:30:31','2021-05-29 18:30:31','',35,'http://localhost/ivkovic/?p=36',0,'revision','',0),(37,3,'2021-05-29 20:31:26','2021-05-29 18:31:26','a:7:{s:8:\"location\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:12:\"options_page\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:22:\"theme-general-settings\";}}}s:8:\"position\";s:6:\"normal\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";s:0:\"\";s:11:\"description\";s:0:\"\";}','Theme Settings','theme-settings','publish','closed','closed','','group_60b28870de945','','','2021-05-30 17:00:01','2021-05-30 15:00:01','',0,'http://localhost/ivkovic/?post_type=acf-field-group&#038;p=37',0,'acf-field-group','',0),(38,3,'2021-05-29 20:32:40','2021-05-29 18:32:40','a:7:{s:4:\"type\";s:3:\"tab\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"placement\";s:3:\"top\";s:8:\"endpoint\";i:0;}','Pages','pages','publish','closed','closed','','field_60b288808ba13','','','2021-05-29 21:31:14','2021-05-29 19:31:14','',37,'http://localhost/ivkovic/?post_type=acf-field&#038;p=38',4,'acf-field','',0),(39,3,'2021-05-29 20:32:40','2021-05-29 18:32:40','a:11:{s:4:\"type\";s:11:\"post_object\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"post_type\";a:1:{i:0;s:4:\"page\";}s:8:\"taxonomy\";s:0:\"\";s:10:\"allow_null\";i:1;s:8:\"multiple\";i:0;s:13:\"return_format\";s:2:\"id\";s:2:\"ui\";i:1;}','Page Login','page_login','publish','closed','closed','','field_60b2888a8ba14','','','2021-05-29 21:31:14','2021-05-29 19:31:14','',37,'http://localhost/ivkovic/?post_type=acf-field&#038;p=39',5,'acf-field','',0),(40,3,'2021-05-29 20:32:40','2021-05-29 18:32:40','a:11:{s:4:\"type\";s:11:\"post_object\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"post_type\";a:1:{i:0;s:4:\"page\";}s:8:\"taxonomy\";s:0:\"\";s:10:\"allow_null\";i:1;s:8:\"multiple\";i:0;s:13:\"return_format\";s:2:\"id\";s:2:\"ui\";i:1;}','Page Register','page_register','publish','closed','closed','','field_60b2889f8ba15','','','2021-05-29 21:31:14','2021-05-29 19:31:14','',37,'http://localhost/ivkovic/?post_type=acf-field&#038;p=40',6,'acf-field','',0),(41,3,'2021-05-29 20:40:58','2021-05-29 18:40:58','a:7:{s:8:\"location\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:13:\"page_template\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:22:\"templates/flexible.php\";}}}s:8:\"position\";s:6:\"normal\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";a:1:{i:0;s:11:\"the_content\";}s:11:\"description\";s:0:\"\";}','Flexible content','flexible-content','publish','closed','closed','','group_5c794b10b247c','','','2021-05-30 17:16:29','2021-05-30 15:16:29','',0,'http://localhost/ivkovic/?p=41',0,'acf-field-group','',0),(42,3,'2021-05-29 20:40:58','2021-05-29 18:40:58','a:9:{s:4:\"type\";s:16:\"flexible_content\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:7:\"layouts\";a:9:{s:13:\"5c794b612b9a0\";a:6:{s:3:\"key\";s:13:\"5c794b612b9a0\";s:5:\"label\";s:9:\"Home hero\";s:4:\"name\";s:9:\"home_hero\";s:7:\"display\";s:5:\"block\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";}s:20:\"layout_60b2aab646c2a\";a:6:{s:3:\"key\";s:20:\"layout_60b2aab646c2a\";s:5:\"label\";s:12:\"Best sellers\";s:4:\"name\";s:12:\"best_sellers\";s:7:\"display\";s:5:\"block\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";}s:20:\"layout_60b2afe3bba43\";a:6:{s:3:\"key\";s:20:\"layout_60b2afe3bba43\";s:5:\"label\";s:19:\"Featured categories\";s:4:\"name\";s:19:\"featured_categories\";s:7:\"display\";s:5:\"block\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";}s:20:\"layout_60b2b6c307a04\";a:6:{s:3:\"key\";s:20:\"layout_60b2b6c307a04\";s:5:\"label\";s:8:\"Services\";s:4:\"name\";s:8:\"services\";s:7:\"display\";s:5:\"block\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";}s:20:\"layout_60b34a967bf66\";a:6:{s:3:\"key\";s:20:\"layout_60b34a967bf66\";s:5:\"label\";s:8:\"About us\";s:4:\"name\";s:8:\"about_us\";s:7:\"display\";s:5:\"block\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";}s:20:\"layout_60b34e4f3e97c\";a:6:{s:3:\"key\";s:20:\"layout_60b34e4f3e97c\";s:5:\"label\";s:3:\"CTA\";s:4:\"name\";s:3:\"cta\";s:7:\"display\";s:5:\"block\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";}s:20:\"layout_60b3510e500bc\";a:6:{s:3:\"key\";s:20:\"layout_60b3510e500bc\";s:5:\"label\";s:12:\"Latest posts\";s:4:\"name\";s:12:\"latest_posts\";s:7:\"display\";s:5:\"block\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";}s:20:\"layout_60b36c97ba36f\";a:6:{s:3:\"key\";s:20:\"layout_60b36c97ba36f\";s:5:\"label\";s:16:\"Catalogue slider\";s:4:\"name\";s:16:\"catalogue_slider\";s:7:\"display\";s:5:\"block\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";}s:20:\"layout_60b37063a6589\";a:6:{s:3:\"key\";s:20:\"layout_60b37063a6589\";s:5:\"label\";s:12:\"Testimonials\";s:4:\"name\";s:12:\"Testimonials\";s:7:\"display\";s:5:\"block\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";}}s:12:\"button_label\";s:11:\"Add Section\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";}','Content blocks','flexible','publish','closed','closed','','field_5c794b26fdd0b','','','2021-05-30 13:01:13','2021-05-30 11:01:13','',41,'http://localhost/ivkovic/?post_type=acf-field&#038;p=42',0,'acf-field','',0),(43,3,'2021-05-29 20:40:58','2021-05-29 18:40:58','a:9:{s:4:\"type\";s:3:\"tab\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:19:\"wpml_cf_preferences\";i:2;s:9:\"placement\";s:3:\"top\";s:8:\"endpoint\";i:0;s:13:\"parent_layout\";s:13:\"5c794b612b9a0\";}','Content','','publish','closed','closed','','field_5c794ba3fdd0e','','','2021-05-29 20:40:58','2021-05-29 18:40:58','',42,'http://localhost/ivkovic/?post_type=acf-field&p=43',0,'acf-field','',0),(51,3,'2021-05-29 20:40:58','2021-05-29 18:40:58','a:9:{s:4:\"type\";s:3:\"tab\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:19:\"wpml_cf_preferences\";i:2;s:9:\"placement\";s:3:\"top\";s:8:\"endpoint\";i:0;s:13:\"parent_layout\";s:13:\"5c794b612b9a0\";}','Settings','','publish','closed','closed','','field_5c794b75fdd0c','','','2021-05-29 20:46:41','2021-05-29 18:46:41','',42,'http://localhost/ivkovic/?post_type=acf-field&#038;p=51',2,'acf-field','',0),(52,3,'2021-05-29 20:40:58','2021-05-29 18:40:58','a:12:{s:4:\"type\";s:10:\"true_false\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:19:\"wpml_cf_preferences\";i:2;s:7:\"message\";s:0:\"\";s:13:\"default_value\";i:1;s:2:\"ui\";i:1;s:10:\"ui_on_text\";s:0:\"\";s:11:\"ui_off_text\";s:0:\"\";s:13:\"parent_layout\";s:13:\"5c794b612b9a0\";}','Visible','active','publish','closed','closed','','field_5c794b81fdd0d','','','2021-05-29 20:46:41','2021-05-29 18:46:41','',42,'http://localhost/ivkovic/?post_type=acf-field&#038;p=52',3,'acf-field','',0),(53,3,'2021-05-29 20:41:27','2021-05-29 18:41:27','','Početna','','inherit','closed','closed','','32-revision-v1','','','2021-05-29 20:41:27','2021-05-29 18:41:27','',32,'http://localhost/ivkovic/?p=53',0,'revision','',0),(54,3,'2021-05-29 20:46:41','2021-05-29 18:46:41','a:11:{s:4:\"type\";s:8:\"repeater\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:13:\"5c794b612b9a0\";s:9:\"collapsed\";s:0:\"\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:6:\"layout\";s:5:\"block\";s:12:\"button_label\";s:9:\"Add slide\";}','Slides','slides','publish','closed','closed','','field_60b28b42d3275','','','2021-05-29 20:48:33','2021-05-29 18:48:33','',42,'http://localhost/ivkovic/?post_type=acf-field&#038;p=54',1,'acf-field','',0),(55,3,'2021-05-29 20:46:41','2021-05-29 18:46:41','a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}','Title','title','publish','closed','closed','','field_60b28bbdd3276','','','2021-05-29 20:46:41','2021-05-29 18:46:41','',54,'http://localhost/ivkovic/?post_type=acf-field&p=55',0,'acf-field','',0),(56,3,'2021-05-29 20:46:41','2021-05-29 18:46:41','a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}','Below title','below_title','publish','closed','closed','','field_60b28bc4d3277','','','2021-05-29 20:46:41','2021-05-29 18:46:41','',54,'http://localhost/ivkovic/?post_type=acf-field&p=56',1,'acf-field','',0),(57,3,'2021-05-29 20:46:41','2021-05-29 18:46:41','a:10:{s:4:\"type\";s:8:\"textarea\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:2:\"50\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:4:\"rows\";i:4;s:9:\"new_lines\";s:2:\"br\";}','Text','text','publish','closed','closed','','field_60b28bcfd3278','','','2021-05-29 20:48:33','2021-05-29 18:48:33','',54,'http://localhost/ivkovic/?post_type=acf-field&#038;p=57',2,'acf-field','',0),(58,3,'2021-05-29 20:46:41','2021-05-29 18:46:41','a:6:{s:4:\"type\";s:4:\"link\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:5:\"array\";}','Link','link','publish','closed','closed','','field_60b28befd3279','','','2021-05-29 21:21:25','2021-05-29 19:21:25','',54,'http://localhost/ivkovic/?post_type=acf-field&#038;p=58',4,'acf-field','',0),(59,3,'2021-05-29 20:47:05','2021-05-29 18:47:05','','Početna','','inherit','closed','closed','','8-revision-v1','','','2021-05-29 20:47:05','2021-05-29 18:47:05','',8,'http://localhost/ivkovic/?p=59',0,'revision','',0),(60,3,'2021-05-29 20:47:05','2021-05-29 18:47:05','','Početna','','inherit','closed','closed','','32-revision-v1','','','2021-05-29 20:47:05','2021-05-29 18:47:05','',32,'http://localhost/ivkovic/?p=60',0,'revision','',0),(61,3,'2021-05-29 20:48:33','2021-05-29 18:48:33','a:15:{s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:2:\"50\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:5:\"array\";s:12:\"preview_size\";s:6:\"medium\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";}','Image','image','publish','closed','closed','','field_60b28c53d682f','','','2021-05-29 21:11:10','2021-05-29 19:11:10','',54,'http://localhost/ivkovic/?post_type=acf-field&#038;p=61',3,'acf-field','',0),(62,3,'2021-05-29 20:48:35','2021-05-29 18:48:35','','Početna','','inherit','closed','closed','','8-revision-v1','','','2021-05-29 20:48:35','2021-05-29 18:48:35','',8,'http://localhost/ivkovic/?p=62',0,'revision','',0),(63,3,'2021-05-29 20:48:36','2021-05-29 18:48:36','','Početna','','inherit','closed','closed','','32-revision-v1','','','2021-05-29 20:48:36','2021-05-29 18:48:36','',32,'http://localhost/ivkovic/?p=63',0,'revision','',0),(64,3,'2021-05-29 20:56:17','2021-05-29 18:56:17','','Početna','','inherit','closed','closed','','8-revision-v1','','','2021-05-29 20:56:17','2021-05-29 18:56:17','',8,'http://localhost/ivkovic/?p=64',0,'revision','',0),(65,3,'2021-05-29 20:56:17','2021-05-29 18:56:17','','Početna','','inherit','closed','closed','','32-revision-v1','','','2021-05-29 20:56:17','2021-05-29 18:56:17','',32,'http://localhost/ivkovic/?p=65',0,'revision','',0),(66,3,'2021-05-29 20:56:32','2021-05-29 18:56:32','','Rectangle 170','','inherit','open','closed','','rectangle-170','','','2021-05-29 20:56:32','2021-05-29 18:56:32','',8,'http://localhost/ivkovic/wp-content/uploads/2021/05/Rectangle-170.jpg',0,'attachment','image/jpeg',0),(67,3,'2021-05-29 20:56:32','2021-05-29 18:56:32','','Rectangle 170','','inherit','open','closed','','rectangle-170-2','','','2021-05-29 20:56:32','2021-05-29 18:56:32','',32,'http://localhost/ivkovic/wp-content/uploads/2021/05/Rectangle-170.jpg',0,'attachment','image/jpeg',0),(68,3,'2021-05-29 20:56:59','2021-05-29 18:56:59','','Početna','','inherit','closed','closed','','8-revision-v1','','','2021-05-29 20:56:59','2021-05-29 18:56:59','',8,'http://localhost/ivkovic/?p=68',0,'revision','',0),(69,3,'2021-05-29 20:56:59','2021-05-29 18:56:59','','Početna','','inherit','closed','closed','','32-revision-v1','','','2021-05-29 20:56:59','2021-05-29 18:56:59','',32,'http://localhost/ivkovic/?p=69',0,'revision','',0),(70,3,'2021-05-29 20:59:59','2021-05-29 18:59:59','','Početna','','inherit','closed','closed','','8-revision-v1','','','2021-05-29 20:59:59','2021-05-29 18:59:59','',8,'http://localhost/ivkovic/?p=70',0,'revision','',0),(71,3,'2021-05-29 20:59:59','2021-05-29 18:59:59','','Početna','','inherit','closed','closed','','32-revision-v1','','','2021-05-29 20:59:59','2021-05-29 18:59:59','',32,'http://localhost/ivkovic/?p=71',0,'revision','',0),(72,3,'2021-05-29 21:03:11','2021-05-29 19:03:11','','Rectangle 467','','inherit','open','closed','','rectangle-467','','','2021-05-29 21:03:11','2021-05-29 19:03:11','',8,'http://localhost/ivkovic/wp-content/uploads/2021/05/Rectangle-467.jpg',0,'attachment','image/jpeg',0),(73,3,'2021-05-29 21:03:11','2021-05-29 19:03:11','','Rectangle 467','','inherit','open','closed','','rectangle-467-2','','','2021-05-29 21:03:11','2021-05-29 19:03:11','',32,'http://localhost/ivkovic/wp-content/uploads/2021/05/Rectangle-467.jpg',0,'attachment','image/jpeg',0),(74,3,'2021-05-29 21:03:14','2021-05-29 19:03:14','','Rectangle 467 (2)','','inherit','open','closed','','rectangle-467-2','','','2021-05-29 21:03:14','2021-05-29 19:03:14','',8,'http://localhost/ivkovic/wp-content/uploads/2021/05/Rectangle-467-2.jpg',0,'attachment','image/jpeg',0),(75,3,'2021-05-29 21:03:14','2021-05-29 19:03:14','','Rectangle 467 (2)','','inherit','open','closed','','rectangle-467-2-2','','','2021-05-29 21:03:14','2021-05-29 19:03:14','',32,'http://localhost/ivkovic/wp-content/uploads/2021/05/Rectangle-467-2.jpg',0,'attachment','image/jpeg',0),(76,3,'2021-05-29 21:03:17','2021-05-29 19:03:17','','Rectangle 467 (1)','','inherit','open','closed','','rectangle-467-1','','','2021-05-29 21:03:17','2021-05-29 19:03:17','',8,'http://localhost/ivkovic/wp-content/uploads/2021/05/Rectangle-467-1.jpg',0,'attachment','image/jpeg',0),(77,3,'2021-05-29 21:03:17','2021-05-29 19:03:17','','Rectangle 467 (1)','','inherit','open','closed','','rectangle-467-1-2','','','2021-05-29 21:03:17','2021-05-29 19:03:17','',32,'http://localhost/ivkovic/wp-content/uploads/2021/05/Rectangle-467-1.jpg',0,'attachment','image/jpeg',0),(78,3,'2021-05-29 21:04:09','2021-05-29 19:04:09','','Početna','','inherit','closed','closed','','8-revision-v1','','','2021-05-29 21:04:09','2021-05-29 19:04:09','',8,'http://localhost/ivkovic/?p=78',0,'revision','',0),(79,3,'2021-05-29 21:04:09','2021-05-29 19:04:09','','Početna','','inherit','closed','closed','','32-revision-v1','','','2021-05-29 21:04:09','2021-05-29 19:04:09','',32,'http://localhost/ivkovic/?p=79',0,'revision','',0),(80,3,'2021-05-29 21:31:14','2021-05-29 19:31:14','a:7:{s:4:\"type\";s:3:\"tab\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"placement\";s:3:\"top\";s:8:\"endpoint\";i:0;}','General','general','publish','closed','closed','','field_60b2965a2019e','','','2021-05-29 21:31:14','2021-05-29 19:31:14','',37,'http://localhost/ivkovic/?post_type=acf-field&p=80',0,'acf-field','',0),(81,3,'2021-05-29 21:31:14','2021-05-29 19:31:14','a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}','Address','address','publish','closed','closed','','field_60b296652019f','','','2021-05-29 21:31:14','2021-05-29 19:31:14','',37,'http://localhost/ivkovic/?post_type=acf-field&p=81',1,'acf-field','',0),(82,3,'2021-05-29 21:31:14','2021-05-29 19:31:14','a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}','Phone','phone','publish','closed','closed','','field_60b2966e201a0','','','2021-05-29 21:31:14','2021-05-29 19:31:14','',37,'http://localhost/ivkovic/?post_type=acf-field&p=82',2,'acf-field','',0),(83,3,'2021-05-29 21:31:14','2021-05-29 19:31:14','a:9:{s:4:\"type\";s:5:\"email\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Email','email','publish','closed','closed','','field_60b29675201a1','','','2021-05-29 21:31:14','2021-05-29 19:31:14','',37,'http://localhost/ivkovic/?post_type=acf-field&p=83',3,'acf-field','',0),(84,3,'2021-05-29 21:48:38','2021-05-29 19:48:38','{\n    \"ivkovic-theme::social_customizer_fb_url\": {\n        \"value\": \"#\",\n        \"type\": \"theme_mod\",\n        \"user_id\": 3,\n        \"date_modified_gmt\": \"2021-05-29 19:48:13\"\n    },\n    \"ivkovic-theme::social_customizer_tw_url\": {\n        \"value\": \"#\",\n        \"type\": \"theme_mod\",\n        \"user_id\": 3,\n        \"date_modified_gmt\": \"2021-05-29 19:48:38\"\n    },\n    \"ivkovic-theme::social_customizer_g_url\": {\n        \"value\": \"\",\n        \"type\": \"theme_mod\",\n        \"user_id\": 3,\n        \"date_modified_gmt\": \"2021-05-29 19:48:38\"\n    },\n    \"ivkovic-theme::social_customizer_instagram_url\": {\n        \"value\": \"#\",\n        \"type\": \"theme_mod\",\n        \"user_id\": 3,\n        \"date_modified_gmt\": \"2021-05-29 19:48:38\"\n    },\n    \"ivkovic-theme::social_customizer_lni_url\": {\n        \"value\": \"\",\n        \"type\": \"theme_mod\",\n        \"user_id\": 3,\n        \"date_modified_gmt\": \"2021-05-29 19:48:38\"\n    },\n    \"ivkovic-theme::social_customizer_youtube_url\": {\n        \"value\": \"\",\n        \"type\": \"theme_mod\",\n        \"user_id\": 3,\n        \"date_modified_gmt\": \"2021-05-29 19:48:38\"\n    },\n    \"ivkovic-theme::social_customizer_pinterest_url\": {\n        \"value\": \"\",\n        \"type\": \"theme_mod\",\n        \"user_id\": 3,\n        \"date_modified_gmt\": \"2021-05-29 19:48:38\"\n    }\n}','','','trash','closed','closed','','9e8491d9-0dff-4b61-92ee-d476e6fadcbd','','','2021-05-29 21:48:38','2021-05-29 19:48:38','',0,'http://localhost/ivkovic/?p=84',0,'customize_changeset','',0),(85,3,'2021-05-29 22:58:17','2021-05-29 20:58:17','a:8:{s:4:\"type\";s:3:\"tab\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_60b2aab646c2a\";s:9:\"placement\";s:3:\"top\";s:8:\"endpoint\";i:0;}','Content','','publish','closed','closed','','field_60b2aab646c2b','','','2021-05-29 22:58:17','2021-05-29 20:58:17','',42,'http://localhost/ivkovic/?post_type=acf-field&p=85',0,'acf-field','',0),(86,3,'2021-05-29 22:58:17','2021-05-29 20:58:17','a:13:{s:4:\"type\";s:12:\"relationship\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_60b2aab646c2a\";s:9:\"post_type\";a:1:{i:0;s:7:\"product\";}s:8:\"taxonomy\";s:0:\"\";s:7:\"filters\";a:1:{i:0;s:6:\"search\";}s:8:\"elements\";s:0:\"\";s:3:\"min\";s:0:\"\";s:3:\"max\";i:6;s:13:\"return_format\";s:6:\"object\";}','Products','products','publish','closed','closed','','field_60b2aac846c34','','','2021-05-29 23:27:20','2021-05-29 21:27:20','',42,'http://localhost/ivkovic/?post_type=acf-field&#038;p=86',2,'acf-field','',0),(87,3,'2021-05-29 22:58:17','2021-05-29 20:58:17','a:8:{s:4:\"type\";s:3:\"tab\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_60b2aab646c2a\";s:9:\"placement\";s:3:\"top\";s:8:\"endpoint\";i:0;}','Settings','','publish','closed','closed','','field_60b2aab646c32','','','2021-05-29 23:27:20','2021-05-29 21:27:20','',42,'http://localhost/ivkovic/?post_type=acf-field&#038;p=87',3,'acf-field','',0),(88,3,'2021-05-29 22:58:17','2021-05-29 20:58:17','a:11:{s:4:\"type\";s:10:\"true_false\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_60b2aab646c2a\";s:7:\"message\";s:0:\"\";s:13:\"default_value\";i:1;s:2:\"ui\";i:1;s:10:\"ui_on_text\";s:0:\"\";s:11:\"ui_off_text\";s:0:\"\";}','Visible','active','publish','closed','closed','','field_60b2aab646c33','','','2021-05-29 23:27:20','2021-05-29 21:27:20','',42,'http://localhost/ivkovic/?post_type=acf-field&#038;p=88',4,'acf-field','',0),(89,3,'2021-05-29 22:58:51','2021-05-29 20:58:51','','Back Pack','','publish','open','closed','','back-pack','','','2021-05-30 17:10:27','2021-05-30 15:10:27','',0,'http://localhost/ivkovic/?post_type=product&#038;p=89',0,'product','',0),(90,3,'2021-05-29 22:59:54','2021-05-29 20:59:54','','Rectangle 538','','inherit','open','closed','','rectangle-538','','','2021-05-29 22:59:54','2021-05-29 20:59:54','',89,'http://localhost/ivkovic/wp-content/uploads/2021/05/Rectangle-538.png',0,'attachment','image/png',0),(91,3,'2021-05-29 22:59:54','2021-05-29 20:59:54','','Rectangle 538','','inherit','open','closed','','rectangle-538-2','','','2021-05-29 22:59:54','2021-05-29 20:59:54','',89,'http://localhost/ivkovic/wp-content/uploads/2021/05/Rectangle-538.png',0,'attachment','image/png',0),(92,3,'2021-05-29 23:07:18','2021-05-29 21:07:18','','Početna','','inherit','closed','closed','','8-revision-v1','','','2021-05-29 23:07:18','2021-05-29 21:07:18','',8,'http://localhost/ivkovic/?p=92',0,'revision','',0),(93,3,'2021-05-29 23:07:19','2021-05-29 21:07:19','','Početna','','inherit','closed','closed','','32-revision-v1','','','2021-05-29 23:07:19','2021-05-29 21:07:19','',32,'http://localhost/ivkovic/?p=93',0,'revision','',0),(94,3,'2021-05-29 23:07:28','2021-05-29 21:07:28','','Početna','','inherit','closed','closed','','8-revision-v1','','','2021-05-29 23:07:28','2021-05-29 21:07:28','',8,'http://localhost/ivkovic/?p=94',0,'revision','',0),(95,3,'2021-05-29 23:07:28','2021-05-29 21:07:28','','Početna','','inherit','closed','closed','','32-revision-v1','','','2021-05-29 23:07:28','2021-05-29 21:07:28','',32,'http://localhost/ivkovic/?p=95',0,'revision','',0),(96,3,'2021-05-29 23:21:54','2021-05-29 21:21:54','a:8:{s:4:\"type\";s:3:\"tab\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_60b2afe3bba43\";s:9:\"placement\";s:3:\"top\";s:8:\"endpoint\";i:0;}','Content','','publish','closed','closed','','field_60b2afe3bba44','','','2021-05-29 23:21:54','2021-05-29 21:21:54','',42,'http://localhost/ivkovic/?post_type=acf-field&p=96',0,'acf-field','',0),(97,3,'2021-05-29 23:21:54','2021-05-29 21:21:54','a:14:{s:4:\"type\";s:8:\"taxonomy\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_60b2afe3bba43\";s:8:\"taxonomy\";s:11:\"product_cat\";s:10:\"field_type\";s:12:\"multi_select\";s:10:\"allow_null\";i:0;s:8:\"add_term\";i:0;s:10:\"save_terms\";i:0;s:10:\"load_terms\";i:0;s:13:\"return_format\";s:2:\"id\";s:8:\"multiple\";i:0;}','Categories','categories','publish','closed','closed','','field_60b2afe3bba45','','','2021-05-29 23:27:20','2021-05-29 21:27:20','',42,'http://localhost/ivkovic/?post_type=acf-field&#038;p=97',2,'acf-field','',0),(98,3,'2021-05-29 23:21:54','2021-05-29 21:21:54','a:8:{s:4:\"type\";s:3:\"tab\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_60b2afe3bba43\";s:9:\"placement\";s:3:\"top\";s:8:\"endpoint\";i:0;}','Settings','','publish','closed','closed','','field_60b2afe3bba46','','','2021-05-30 17:16:00','2021-05-30 15:16:00','',42,'http://localhost/ivkovic/?post_type=acf-field&#038;p=98',4,'acf-field','',0),(99,3,'2021-05-29 23:21:54','2021-05-29 21:21:54','a:11:{s:4:\"type\";s:10:\"true_false\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_60b2afe3bba43\";s:7:\"message\";s:0:\"\";s:13:\"default_value\";i:1;s:2:\"ui\";i:1;s:10:\"ui_on_text\";s:0:\"\";s:11:\"ui_off_text\";s:0:\"\";}','Visible','active','publish','closed','closed','','field_60b2afe3bba47','','','2021-05-30 17:16:00','2021-05-30 15:16:00','',42,'http://localhost/ivkovic/?post_type=acf-field&#038;p=99',5,'acf-field','',0),(100,3,'2021-05-29 23:25:51','2021-05-29 21:25:51','','Početna','','inherit','closed','closed','','8-revision-v1','','','2021-05-29 23:25:51','2021-05-29 21:25:51','',8,'http://localhost/ivkovic/?p=100',0,'revision','',0),(101,3,'2021-05-29 23:25:52','2021-05-29 21:25:52','','Početna','','inherit','closed','closed','','32-revision-v1','','','2021-05-29 23:25:52','2021-05-29 21:25:52','',32,'http://localhost/ivkovic/?p=101',0,'revision','',0),(102,3,'2021-05-29 23:27:20','2021-05-29 21:27:20','a:11:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_60b2aab646c2a\";s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}','Title','title','publish','closed','closed','','field_60b2b1a417ac1','','','2021-05-29 23:27:20','2021-05-29 21:27:20','',42,'http://localhost/ivkovic/?post_type=acf-field&p=102',1,'acf-field','',0),(103,3,'2021-05-29 23:27:20','2021-05-29 21:27:20','a:11:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_60b2afe3bba43\";s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}','Title','title','publish','closed','closed','','field_60b2b1ad17ac2','','','2021-05-29 23:27:20','2021-05-29 21:27:20','',42,'http://localhost/ivkovic/?post_type=acf-field&p=103',1,'acf-field','',0),(104,3,'2021-05-29 23:28:53','2021-05-29 21:28:53','','Početna','','inherit','closed','closed','','8-revision-v1','','','2021-05-29 23:28:53','2021-05-29 21:28:53','',8,'http://localhost/ivkovic/?p=104',0,'revision','',0),(105,3,'2021-05-29 23:28:53','2021-05-29 21:28:53','','Početna','','inherit','closed','closed','','32-revision-v1','','','2021-05-29 23:28:53','2021-05-29 21:28:53','',32,'http://localhost/ivkovic/?p=105',0,'revision','',0),(106,3,'2021-05-29 23:31:27','2021-05-29 21:31:27','','Početna','','inherit','closed','closed','','8-revision-v1','','','2021-05-29 23:31:27','2021-05-29 21:31:27','',8,'http://localhost/ivkovic/?p=106',0,'revision','',0),(107,3,'2021-05-29 23:31:28','2021-05-29 21:31:28','','Početna','','inherit','closed','closed','','32-revision-v1','','','2021-05-29 23:31:28','2021-05-29 21:31:28','',32,'http://localhost/ivkovic/?p=107',0,'revision','',0),(108,3,'2021-05-29 23:50:12','2021-05-29 21:50:12','a:8:{s:4:\"type\";s:3:\"tab\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_60b2b6c307a04\";s:9:\"placement\";s:3:\"top\";s:8:\"endpoint\";i:0;}','Content','','publish','closed','closed','','field_60b2b6c307a05','','','2021-05-29 23:50:12','2021-05-29 21:50:12','',42,'http://localhost/ivkovic/?post_type=acf-field&p=108',0,'acf-field','',0),(109,3,'2021-05-29 23:50:12','2021-05-29 21:50:12','a:11:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:2:\"80\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_60b2b6c307a04\";s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}','Title','title','publish','closed','closed','','field_60b2b6c307a06','','','2021-05-30 00:03:20','2021-05-29 22:03:20','',42,'http://localhost/ivkovic/?post_type=acf-field&#038;p=109',1,'acf-field','',0),(110,3,'2021-05-29 23:50:12','2021-05-29 21:50:12','a:11:{s:4:\"type\";s:8:\"repeater\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_60b2b6c307a04\";s:9:\"collapsed\";s:0:\"\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:6:\"layout\";s:5:\"block\";s:12:\"button_label\";s:8:\"Add item\";}','Items','items','publish','closed','closed','','field_60b2b6cf07a0a','','','2021-05-30 00:02:47','2021-05-29 22:02:47','',42,'http://localhost/ivkovic/?post_type=acf-field&#038;p=110',3,'acf-field','',0),(111,3,'2021-05-29 23:50:12','2021-05-29 21:50:12','a:15:{s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:2:\"id\";s:12:\"preview_size\";s:6:\"medium\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";}','Image','image','publish','closed','closed','','field_60b2b6e407a0b','','','2021-05-29 23:50:12','2021-05-29 21:50:12','',110,'http://localhost/ivkovic/?post_type=acf-field&p=111',0,'acf-field','',0),(112,3,'2021-05-29 23:50:12','2021-05-29 21:50:12','a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}','Title','title','publish','closed','closed','','field_60b2b6f107a0c','','','2021-05-29 23:50:12','2021-05-29 21:50:12','',110,'http://localhost/ivkovic/?post_type=acf-field&p=112',1,'acf-field','',0),(113,3,'2021-05-29 23:50:12','2021-05-29 21:50:12','a:7:{s:4:\"type\";s:4:\"link\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_60b2b6c307a04\";s:13:\"return_format\";s:5:\"array\";}','Link','link','publish','closed','closed','','field_60b2b70707a0d','','','2021-05-30 00:02:47','2021-05-29 22:02:47','',42,'http://localhost/ivkovic/?post_type=acf-field&#038;p=113',4,'acf-field','',0),(114,3,'2021-05-29 23:50:12','2021-05-29 21:50:12','a:8:{s:4:\"type\";s:3:\"tab\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_60b2b6c307a04\";s:9:\"placement\";s:3:\"top\";s:8:\"endpoint\";i:0;}','Settings','','publish','closed','closed','','field_60b2b6c307a08','','','2021-05-30 00:02:47','2021-05-29 22:02:47','',42,'http://localhost/ivkovic/?post_type=acf-field&#038;p=114',5,'acf-field','',0),(115,3,'2021-05-29 23:50:12','2021-05-29 21:50:12','a:11:{s:4:\"type\";s:10:\"true_false\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_60b2b6c307a04\";s:7:\"message\";s:0:\"\";s:13:\"default_value\";i:1;s:2:\"ui\";i:1;s:10:\"ui_on_text\";s:0:\"\";s:11:\"ui_off_text\";s:0:\"\";}','Visible','active','publish','closed','closed','','field_60b2b6c307a09','','','2021-05-30 00:02:47','2021-05-29 22:02:47','',42,'http://localhost/ivkovic/?post_type=acf-field&#038;p=115',6,'acf-field','',0),(116,3,'2021-05-29 23:52:03','2021-05-29 21:52:03','','Usluge','','publish','closed','closed','','usluge','','','2021-05-29 23:52:03','2021-05-29 21:52:03','',0,'http://localhost/ivkovic/?page_id=116',0,'page','',0),(117,3,'2021-05-29 23:52:03','2021-05-29 21:52:03','','Usluge','','inherit','closed','closed','','116-revision-v1','','','2021-05-29 23:52:03','2021-05-29 21:52:03','',116,'http://localhost/ivkovic/?p=117',0,'revision','',0),(118,3,'2021-05-29 23:52:28','2021-05-29 21:52:28','','Početna','','inherit','closed','closed','','8-revision-v1','','','2021-05-29 23:52:28','2021-05-29 21:52:28','',8,'http://localhost/ivkovic/?p=118',0,'revision','',0),(119,3,'2021-05-29 23:52:29','2021-05-29 21:52:29','','Početna','','inherit','closed','closed','','32-revision-v1','','','2021-05-29 23:52:29','2021-05-29 21:52:29','',32,'http://localhost/ivkovic/?p=119',0,'revision','',0),(120,3,'2021-05-29 23:52:56','2021-05-29 21:52:56','','Rectangle 51','','inherit','open','closed','','rectangle-51','','','2021-05-29 23:52:56','2021-05-29 21:52:56','',8,'http://localhost/ivkovic/wp-content/uploads/2021/05/Rectangle-51.jpg',0,'attachment','image/jpeg',0),(121,3,'2021-05-29 23:52:56','2021-05-29 21:52:56','','Rectangle 51','','inherit','open','closed','','rectangle-51-2','','','2021-05-29 23:52:56','2021-05-29 21:52:56','',32,'http://localhost/ivkovic/wp-content/uploads/2021/05/Rectangle-51.jpg',0,'attachment','image/jpeg',0),(122,3,'2021-05-29 23:53:01','2021-05-29 21:53:01','','Rectangle 53','','inherit','open','closed','','rectangle-53','','','2021-05-29 23:53:01','2021-05-29 21:53:01','',8,'http://localhost/ivkovic/wp-content/uploads/2021/05/Rectangle-53.jpg',0,'attachment','image/jpeg',0),(123,3,'2021-05-29 23:53:01','2021-05-29 21:53:01','','Rectangle 53','','inherit','open','closed','','rectangle-53-2','','','2021-05-29 23:53:01','2021-05-29 21:53:01','',32,'http://localhost/ivkovic/wp-content/uploads/2021/05/Rectangle-53.jpg',0,'attachment','image/jpeg',0),(124,3,'2021-05-29 23:53:05','2021-05-29 21:53:05','','Rectangle 53 (1)','','inherit','open','closed','','rectangle-53-1','','','2021-05-29 23:53:05','2021-05-29 21:53:05','',8,'http://localhost/ivkovic/wp-content/uploads/2021/05/Rectangle-53-1.jpg',0,'attachment','image/jpeg',0),(125,3,'2021-05-29 23:53:05','2021-05-29 21:53:05','','Rectangle 53 (1)','','inherit','open','closed','','rectangle-53-1-2','','','2021-05-29 23:53:05','2021-05-29 21:53:05','',32,'http://localhost/ivkovic/wp-content/uploads/2021/05/Rectangle-53-1.jpg',0,'attachment','image/jpeg',0),(126,3,'2021-05-29 23:53:47','2021-05-29 21:53:47','','Početna','','inherit','closed','closed','','8-revision-v1','','','2021-05-29 23:53:47','2021-05-29 21:53:47','',8,'http://localhost/ivkovic/?p=126',0,'revision','',0),(127,3,'2021-05-29 23:53:47','2021-05-29 21:53:47','','Početna','','inherit','closed','closed','','32-revision-v1','','','2021-05-29 23:53:47','2021-05-29 21:53:47','',32,'http://localhost/ivkovic/?p=127',0,'revision','',0),(128,3,'2021-05-30 00:00:36','2021-05-29 22:00:36','','Početna','','inherit','closed','closed','','8-revision-v1','','','2021-05-30 00:00:36','2021-05-29 22:00:36','',8,'http://localhost/ivkovic/?p=128',0,'revision','',0),(129,3,'2021-05-30 00:00:36','2021-05-29 22:00:36','','Početna','','inherit','closed','closed','','32-revision-v1','','','2021-05-30 00:00:36','2021-05-29 22:00:36','',32,'http://localhost/ivkovic/?p=129',0,'revision','',0),(130,3,'2021-05-30 00:02:47','2021-05-29 22:02:47','a:16:{s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:2:\"20\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_60b2b6c307a04\";s:13:\"return_format\";s:5:\"array\";s:12:\"preview_size\";s:6:\"medium\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";}','Image','image','publish','closed','closed','','field_60b2b9f453ec3','','','2021-05-30 00:03:20','2021-05-29 22:03:20','',42,'http://localhost/ivkovic/?post_type=acf-field&#038;p=130',2,'acf-field','',0),(131,3,'2021-05-30 00:03:38','2021-05-29 22:03:38','','Rectangle 164','','inherit','open','closed','','rectangle-164','','','2021-05-30 00:03:38','2021-05-29 22:03:38','',8,'http://localhost/ivkovic/wp-content/uploads/2021/05/Rectangle-164.jpg',0,'attachment','image/jpeg',0),(132,3,'2021-05-30 00:03:38','2021-05-29 22:03:38','','Rectangle 164','','inherit','open','closed','','rectangle-164-2','','','2021-05-30 00:03:38','2021-05-29 22:03:38','',32,'http://localhost/ivkovic/wp-content/uploads/2021/05/Rectangle-164.jpg',0,'attachment','image/jpeg',0),(133,3,'2021-05-30 00:03:44','2021-05-29 22:03:44','','Početna','','inherit','closed','closed','','8-revision-v1','','','2021-05-30 00:03:44','2021-05-29 22:03:44','',8,'http://localhost/ivkovic/?p=133',0,'revision','',0),(134,3,'2021-05-30 00:03:45','2021-05-29 22:03:45','','Početna','','inherit','closed','closed','','32-revision-v1','','','2021-05-30 00:03:45','2021-05-29 22:03:45','',32,'http://localhost/ivkovic/?p=134',0,'revision','',0),(135,3,'2021-05-30 10:22:14','2021-05-30 08:22:14','a:8:{s:4:\"type\";s:3:\"tab\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_60b34a967bf66\";s:9:\"placement\";s:3:\"top\";s:8:\"endpoint\";i:0;}','Content','','publish','closed','closed','','field_60b34a967bf67','','','2021-05-30 10:22:14','2021-05-30 08:22:14','',42,'http://localhost/ivkovic/?post_type=acf-field&p=135',0,'acf-field','',0),(136,3,'2021-05-30 10:22:14','2021-05-30 08:22:14','a:11:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_60b34a967bf66\";s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}','Title','title','publish','closed','closed','','field_60b34a967bf68','','','2021-05-30 10:22:14','2021-05-30 08:22:14','',42,'http://localhost/ivkovic/?post_type=acf-field&p=136',1,'acf-field','',0),(137,3,'2021-05-30 10:22:14','2021-05-30 08:22:14','a:11:{s:4:\"type\";s:7:\"wysiwyg\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_60b34a967bf66\";s:13:\"default_value\";s:0:\"\";s:4:\"tabs\";s:3:\"all\";s:7:\"toolbar\";s:5:\"basic\";s:12:\"media_upload\";i:0;s:5:\"delay\";i:0;}','Text','text','publish','closed','closed','','field_60b34b0c7bf71','','','2021-05-30 10:22:14','2021-05-30 08:22:14','',42,'http://localhost/ivkovic/?post_type=acf-field&p=137',2,'acf-field','',0),(138,3,'2021-05-30 10:22:14','2021-05-30 08:22:14','a:7:{s:4:\"type\";s:4:\"link\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_60b34a967bf66\";s:13:\"return_format\";s:5:\"array\";}','Link','link','publish','closed','closed','','field_60b34a967bf6d','','','2021-05-30 10:22:14','2021-05-30 08:22:14','',42,'http://localhost/ivkovic/?post_type=acf-field&p=138',3,'acf-field','',0),(139,3,'2021-05-30 10:22:14','2021-05-30 08:22:14','a:16:{s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:2:\"50\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_60b34a967bf66\";s:13:\"return_format\";s:2:\"id\";s:12:\"preview_size\";s:6:\"medium\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";}','Background','background','publish','closed','closed','','field_60b34af57bf70','','','2021-05-30 10:22:14','2021-05-30 08:22:14','',42,'http://localhost/ivkovic/?post_type=acf-field&p=139',4,'acf-field','',0),(140,3,'2021-05-30 10:22:14','2021-05-30 08:22:14','a:16:{s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:2:\"50\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_60b34a967bf66\";s:13:\"return_format\";s:5:\"array\";s:12:\"preview_size\";s:6:\"medium\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";}','Image','image','publish','closed','closed','','field_60b34a967bf69','','','2021-05-30 10:22:14','2021-05-30 08:22:14','',42,'http://localhost/ivkovic/?post_type=acf-field&p=140',5,'acf-field','',0),(141,3,'2021-05-30 10:22:14','2021-05-30 08:22:14','a:8:{s:4:\"type\";s:3:\"tab\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_60b34a967bf66\";s:9:\"placement\";s:3:\"top\";s:8:\"endpoint\";i:0;}','Settings','','publish','closed','closed','','field_60b34a967bf6e','','','2021-05-30 10:22:14','2021-05-30 08:22:14','',42,'http://localhost/ivkovic/?post_type=acf-field&p=141',6,'acf-field','',0),(142,3,'2021-05-30 10:22:14','2021-05-30 08:22:14','a:11:{s:4:\"type\";s:10:\"true_false\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_60b34a967bf66\";s:7:\"message\";s:0:\"\";s:13:\"default_value\";i:1;s:2:\"ui\";i:1;s:10:\"ui_on_text\";s:0:\"\";s:11:\"ui_off_text\";s:0:\"\";}','Visible','active','publish','closed','closed','','field_60b34a967bf6f','','','2021-05-30 10:22:14','2021-05-30 08:22:14','',42,'http://localhost/ivkovic/?post_type=acf-field&p=142',7,'acf-field','',0),(143,3,'2021-05-30 10:24:34','2021-05-30 08:24:34','','Rectangle 165','','inherit','open','closed','','rectangle-165','','','2021-05-30 10:24:34','2021-05-30 08:24:34','',8,'http://localhost/ivkovic/wp-content/uploads/2021/05/Rectangle-165.jpg',0,'attachment','image/jpeg',0),(144,3,'2021-05-30 10:24:34','2021-05-30 08:24:34','','Rectangle 165','','inherit','open','closed','','rectangle-165-2','','','2021-05-30 10:24:34','2021-05-30 08:24:34','',32,'http://localhost/ivkovic/wp-content/uploads/2021/05/Rectangle-165.jpg',0,'attachment','image/jpeg',0),(145,3,'2021-05-30 10:24:37','2021-05-30 08:24:37','','Rectangle 60','','inherit','open','closed','','rectangle-60','','','2021-05-30 10:24:37','2021-05-30 08:24:37','',8,'http://localhost/ivkovic/wp-content/uploads/2021/05/Rectangle-60.jpg',0,'attachment','image/jpeg',0),(146,3,'2021-05-30 10:24:37','2021-05-30 08:24:37','','Rectangle 60','','inherit','open','closed','','rectangle-60-2','','','2021-05-30 10:24:37','2021-05-30 08:24:37','',32,'http://localhost/ivkovic/wp-content/uploads/2021/05/Rectangle-60.jpg',0,'attachment','image/jpeg',0),(147,3,'2021-05-30 10:24:47','2021-05-30 08:24:47','','Početna','','inherit','closed','closed','','8-revision-v1','','','2021-05-30 10:24:47','2021-05-30 08:24:47','',8,'http://localhost/ivkovic/?p=147',0,'revision','',0),(148,3,'2021-05-30 10:24:48','2021-05-30 08:24:48','','Početna','','inherit','closed','closed','','32-revision-v1','','','2021-05-30 10:24:48','2021-05-30 08:24:48','',32,'http://localhost/ivkovic/?p=148',0,'revision','',0),(149,3,'2021-05-30 10:36:53','2021-05-30 08:36:53','a:8:{s:4:\"type\";s:3:\"tab\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_60b34e4f3e97c\";s:9:\"placement\";s:3:\"top\";s:8:\"endpoint\";i:0;}','Content','','publish','closed','closed','','field_60b34e4f3e97d','','','2021-05-30 10:36:53','2021-05-30 08:36:53','',42,'http://localhost/ivkovic/?post_type=acf-field&p=149',0,'acf-field','',0),(150,3,'2021-05-30 10:36:53','2021-05-30 08:36:53','a:11:{s:4:\"type\";s:7:\"wysiwyg\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:2:\"60\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_60b34e4f3e97c\";s:13:\"default_value\";s:0:\"\";s:4:\"tabs\";s:3:\"all\";s:7:\"toolbar\";s:5:\"basic\";s:12:\"media_upload\";i:0;s:5:\"delay\";i:0;}','Text','text','publish','closed','closed','','field_60b34e4f3e97f','','','2021-05-30 10:36:53','2021-05-30 08:36:53','',42,'http://localhost/ivkovic/?post_type=acf-field&p=150',1,'acf-field','',0),(151,3,'2021-05-30 10:36:53','2021-05-30 08:36:53','a:16:{s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:2:\"40\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_60b34e4f3e97c\";s:13:\"return_format\";s:2:\"id\";s:12:\"preview_size\";s:6:\"medium\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";}','Background','background','publish','closed','closed','','field_60b34e4f3e981','','','2021-05-30 10:36:53','2021-05-30 08:36:53','',42,'http://localhost/ivkovic/?post_type=acf-field&p=151',2,'acf-field','',0),(152,3,'2021-05-30 10:36:53','2021-05-30 08:36:53','a:7:{s:4:\"type\";s:4:\"link\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_60b34e4f3e97c\";s:13:\"return_format\";s:5:\"array\";}','Link','link','publish','closed','closed','','field_60b34e4f3e980','','','2021-05-30 10:36:53','2021-05-30 08:36:53','',42,'http://localhost/ivkovic/?post_type=acf-field&p=152',3,'acf-field','',0),(153,3,'2021-05-30 10:36:53','2021-05-30 08:36:53','a:8:{s:4:\"type\";s:3:\"tab\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_60b34e4f3e97c\";s:9:\"placement\";s:3:\"top\";s:8:\"endpoint\";i:0;}','Settings','','publish','closed','closed','','field_60b34e4f3e983','','','2021-05-30 10:36:53','2021-05-30 08:36:53','',42,'http://localhost/ivkovic/?post_type=acf-field&p=153',4,'acf-field','',0),(154,3,'2021-05-30 10:36:53','2021-05-30 08:36:53','a:11:{s:4:\"type\";s:10:\"true_false\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_60b34e4f3e97c\";s:7:\"message\";s:0:\"\";s:13:\"default_value\";i:1;s:2:\"ui\";i:1;s:10:\"ui_on_text\";s:0:\"\";s:11:\"ui_off_text\";s:0:\"\";}','Visible','active','publish','closed','closed','','field_60b34e4f3e984','','','2021-05-30 10:36:53','2021-05-30 08:36:53','',42,'http://localhost/ivkovic/?post_type=acf-field&p=154',5,'acf-field','',0),(155,3,'2021-05-30 10:37:21','2021-05-30 08:37:21','','WSH_2724 1','','inherit','open','closed','','wsh_2724-1','','','2021-05-30 10:37:21','2021-05-30 08:37:21','',8,'http://localhost/ivkovic/wp-content/uploads/2021/05/WSH_2724-1.png',0,'attachment','image/png',0),(156,3,'2021-05-30 10:37:21','2021-05-30 08:37:21','','WSH_2724 1','','inherit','open','closed','','wsh_2724-1-2','','','2021-05-30 10:37:21','2021-05-30 08:37:21','',32,'http://localhost/ivkovic/wp-content/uploads/2021/05/WSH_2724-1.png',0,'attachment','image/png',0),(157,3,'2021-05-30 10:37:47','2021-05-30 08:37:47','','Početna','','inherit','closed','closed','','8-revision-v1','','','2021-05-30 10:37:47','2021-05-30 08:37:47','',8,'http://localhost/ivkovic/?p=157',0,'revision','',0),(158,3,'2021-05-30 10:37:48','2021-05-30 08:37:48','','Početna','','inherit','closed','closed','','32-revision-v1','','','2021-05-30 10:37:48','2021-05-30 08:37:48','',32,'http://localhost/ivkovic/?p=158',0,'revision','',0),(159,3,'2021-05-30 10:45:08','2021-05-30 08:45:08','','Lorem Ipsum Dolor sit amet','','publish','open','open','','lorem-ipsum-dolor-sit-amet','','','2021-05-30 10:45:54','2021-05-30 08:45:54','',0,'http://localhost/ivkovic/?p=159',0,'post','',0),(160,3,'2021-05-30 10:44:43','2021-05-30 08:44:43','','Rectangle 464','','inherit','open','closed','','rectangle-464','','','2021-05-30 10:44:43','2021-05-30 08:44:43','',159,'http://localhost/ivkovic/wp-content/uploads/2021/05/Rectangle-464.jpg',0,'attachment','image/jpeg',0),(161,3,'2021-05-30 10:44:43','2021-05-30 08:44:43','','Rectangle 464','','inherit','open','closed','','rectangle-464-2','','','2021-05-30 10:44:43','2021-05-30 08:44:43','',0,'http://localhost/ivkovic/wp-content/uploads/2021/05/Rectangle-464.jpg',0,'attachment','image/jpeg',0),(162,3,'2021-05-30 10:44:46','2021-05-30 08:44:46','','Rectangle 462','','inherit','open','closed','','rectangle-462','','','2021-05-30 10:44:46','2021-05-30 08:44:46','',159,'http://localhost/ivkovic/wp-content/uploads/2021/05/Rectangle-462.jpg',0,'attachment','image/jpeg',0),(163,3,'2021-05-30 10:44:46','2021-05-30 08:44:46','','Rectangle 462','','inherit','open','closed','','rectangle-462-2','','','2021-05-30 10:44:46','2021-05-30 08:44:46','',0,'http://localhost/ivkovic/wp-content/uploads/2021/05/Rectangle-462.jpg',0,'attachment','image/jpeg',0),(164,3,'2021-05-30 10:44:49','2021-05-30 08:44:49','','Rectangle 135','','inherit','open','closed','','rectangle-135','','','2021-05-30 10:44:49','2021-05-30 08:44:49','',159,'http://localhost/ivkovic/wp-content/uploads/2021/05/Rectangle-135.jpg',0,'attachment','image/jpeg',0),(165,3,'2021-05-30 10:44:49','2021-05-30 08:44:49','','Rectangle 135','','inherit','open','closed','','rectangle-135-2','','','2021-05-30 10:44:49','2021-05-30 08:44:49','',0,'http://localhost/ivkovic/wp-content/uploads/2021/05/Rectangle-135.jpg',0,'attachment','image/jpeg',0),(166,3,'2021-05-30 10:45:08','2021-05-30 08:45:08','','Lorem Ipsum  Dolor sit amet','','inherit','closed','closed','','159-revision-v1','','','2021-05-30 10:45:08','2021-05-30 08:45:08','',159,'http://localhost/ivkovic/?p=166',0,'revision','',0),(167,3,'2021-05-30 10:45:28','2021-05-30 08:45:28','','Lorem Ipsum Dolor sit amet','','publish','open','open','','lorem-ipsum-dolor-sit-amet-2','','','2021-05-30 10:55:05','2021-05-30 08:55:05','',0,'http://localhost/ivkovic/?p=167',0,'post','',0),(168,3,'2021-05-30 10:45:28','2021-05-30 08:45:28','','Lorem Ipsum Dolor sit amet','','inherit','closed','closed','','167-revision-v1','','','2021-05-30 10:45:28','2021-05-30 08:45:28','',167,'http://localhost/ivkovic/?p=168',0,'revision','',0),(169,3,'2021-05-30 10:45:44','2021-05-30 08:45:44','','Lorem Ipsum Dolor sit amet','','publish','open','open','','lorem-ipsum-dolor-sit-amet-3','','','2021-05-30 10:45:44','2021-05-30 08:45:44','',0,'http://localhost/ivkovic/?p=169',0,'post','',0),(170,3,'2021-05-30 10:45:44','2021-05-30 08:45:44','','Lorem Ipsum Dolor sit amet','','inherit','closed','closed','','169-revision-v1','','','2021-05-30 10:45:44','2021-05-30 08:45:44','',169,'http://localhost/ivkovic/?p=170',0,'revision','',0),(171,3,'2021-05-30 10:47:50','2021-05-30 08:47:50','a:8:{s:4:\"type\";s:3:\"tab\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_60b3510e500bc\";s:9:\"placement\";s:3:\"top\";s:8:\"endpoint\";i:0;}','Content','','publish','closed','closed','','field_60b3510e500bd','','','2021-05-30 10:47:50','2021-05-30 08:47:50','',42,'http://localhost/ivkovic/?post_type=acf-field&p=171',0,'acf-field','',0),(172,3,'2021-05-30 10:47:50','2021-05-30 08:47:50','a:11:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_60b3510e500bc\";s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}','Title','title','publish','closed','closed','','field_60b3510e500be','','','2021-05-30 10:47:50','2021-05-30 08:47:50','',42,'http://localhost/ivkovic/?post_type=acf-field&p=172',1,'acf-field','',0),(173,3,'2021-05-30 10:47:50','2021-05-30 08:47:50','a:8:{s:4:\"type\";s:3:\"tab\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_60b3510e500bc\";s:9:\"placement\";s:3:\"top\";s:8:\"endpoint\";i:0;}','Settings','','publish','closed','closed','','field_60b3510e500c1','','','2021-05-30 10:47:50','2021-05-30 08:47:50','',42,'http://localhost/ivkovic/?post_type=acf-field&p=173',2,'acf-field','',0),(174,3,'2021-05-30 10:47:50','2021-05-30 08:47:50','a:11:{s:4:\"type\";s:10:\"true_false\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_60b3510e500bc\";s:7:\"message\";s:0:\"\";s:13:\"default_value\";i:1;s:2:\"ui\";i:1;s:10:\"ui_on_text\";s:0:\"\";s:11:\"ui_off_text\";s:0:\"\";}','Visible','active','publish','closed','closed','','field_60b3510e500c2','','','2021-05-30 10:47:50','2021-05-30 08:47:50','',42,'http://localhost/ivkovic/?post_type=acf-field&p=174',3,'acf-field','',0),(175,3,'2021-05-30 10:48:04','2021-05-30 08:48:04','','Početna','','inherit','closed','closed','','8-revision-v1','','','2021-05-30 10:48:04','2021-05-30 08:48:04','',8,'http://localhost/ivkovic/?p=175',0,'revision','',0),(176,3,'2021-05-30 10:48:05','2021-05-30 08:48:05','','Početna','','inherit','closed','closed','','32-revision-v1','','','2021-05-30 10:48:05','2021-05-30 08:48:05','',32,'http://localhost/ivkovic/?p=176',0,'revision','',0),(177,3,'2021-05-30 12:40:36','2021-05-30 10:40:36','','Novosti','','publish','closed','closed','','novosti','','','2021-05-30 12:40:36','2021-05-30 10:40:36','',0,'http://localhost/ivkovic/?page_id=177',0,'page','',0),(178,3,'2021-05-30 12:40:36','2021-05-30 10:40:36','','Novosti','','inherit','closed','closed','','177-revision-v1','','','2021-05-30 12:40:36','2021-05-30 10:40:36','',177,'http://localhost/ivkovic/?p=178',0,'revision','',0),(179,3,'2021-05-30 12:45:29','2021-05-30 10:45:29','a:8:{s:4:\"type\";s:3:\"tab\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_60b36c97ba36f\";s:9:\"placement\";s:3:\"top\";s:8:\"endpoint\";i:0;}','Content','','publish','closed','closed','','field_60b36c97ba370','','','2021-05-30 12:45:29','2021-05-30 10:45:29','',42,'http://localhost/ivkovic/?post_type=acf-field&p=179',0,'acf-field','',0),(180,3,'2021-05-30 12:45:29','2021-05-30 10:45:29','a:11:{s:4:\"type\";s:8:\"repeater\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_60b36c97ba36f\";s:9:\"collapsed\";s:0:\"\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:6:\"layout\";s:5:\"block\";s:12:\"button_label\";s:9:\"Add slide\";}','Slides','slides','publish','closed','closed','','field_60b36c97ba371','','','2021-05-30 12:45:29','2021-05-30 10:45:29','',42,'http://localhost/ivkovic/?post_type=acf-field&p=180',1,'acf-field','',0),(181,3,'2021-05-30 12:45:29','2021-05-30 10:45:29','a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}','Title','title','publish','closed','closed','','field_60b36c97ba372','','','2021-05-30 12:45:29','2021-05-30 10:45:29','',180,'http://localhost/ivkovic/?post_type=acf-field&p=181',0,'acf-field','',0),(182,3,'2021-05-30 12:45:29','2021-05-30 10:45:29','a:10:{s:4:\"type\";s:8:\"textarea\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:2:\"50\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:4:\"rows\";i:4;s:9:\"new_lines\";s:2:\"br\";}','Text','text','publish','closed','closed','','field_60b36c97ba374','','','2021-05-30 12:45:29','2021-05-30 10:45:29','',180,'http://localhost/ivkovic/?post_type=acf-field&p=182',1,'acf-field','',0),(183,3,'2021-05-30 12:45:29','2021-05-30 10:45:29','a:15:{s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:2:\"50\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:5:\"array\";s:12:\"preview_size\";s:6:\"medium\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";}','Image','image','publish','closed','closed','','field_60b36c97ba375','','','2021-05-30 12:45:29','2021-05-30 10:45:29','',180,'http://localhost/ivkovic/?post_type=acf-field&p=183',2,'acf-field','',0),(184,3,'2021-05-30 12:45:29','2021-05-30 10:45:29','a:6:{s:4:\"type\";s:4:\"link\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:5:\"array\";}','Link','link','publish','closed','closed','','field_60b36c97ba376','','','2021-05-30 12:45:29','2021-05-30 10:45:29','',180,'http://localhost/ivkovic/?post_type=acf-field&p=184',3,'acf-field','',0),(185,3,'2021-05-30 12:45:29','2021-05-30 10:45:29','a:8:{s:4:\"type\";s:3:\"tab\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_60b36c97ba36f\";s:9:\"placement\";s:3:\"top\";s:8:\"endpoint\";i:0;}','Settings','','publish','closed','closed','','field_60b36c97ba377','','','2021-05-30 12:45:29','2021-05-30 10:45:29','',42,'http://localhost/ivkovic/?post_type=acf-field&p=185',2,'acf-field','',0),(186,3,'2021-05-30 12:45:29','2021-05-30 10:45:29','a:11:{s:4:\"type\";s:10:\"true_false\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_60b36c97ba36f\";s:7:\"message\";s:0:\"\";s:13:\"default_value\";i:1;s:2:\"ui\";i:1;s:10:\"ui_on_text\";s:0:\"\";s:11:\"ui_off_text\";s:0:\"\";}','Visible','active','publish','closed','closed','','field_60b36c97ba378','','','2021-05-30 12:45:29','2021-05-30 10:45:29','',42,'http://localhost/ivkovic/?post_type=acf-field&p=186',3,'acf-field','',0),(187,3,'2021-05-30 12:47:17','2021-05-30 10:47:17','','Rectangle 115','','inherit','open','closed','','rectangle-115','','','2021-05-30 12:47:17','2021-05-30 10:47:17','',8,'http://localhost/ivkovic/wp-content/uploads/2021/05/Rectangle-115.jpg',0,'attachment','image/jpeg',0),(188,3,'2021-05-30 12:47:17','2021-05-30 10:47:17','','Rectangle 115','','inherit','open','closed','','rectangle-115-2','','','2021-05-30 12:47:17','2021-05-30 10:47:17','',32,'http://localhost/ivkovic/wp-content/uploads/2021/05/Rectangle-115.jpg',0,'attachment','image/jpeg',0),(189,3,'2021-05-30 12:47:37','2021-05-30 10:47:37','','Početna','','inherit','closed','closed','','8-revision-v1','','','2021-05-30 12:47:37','2021-05-30 10:47:37','',8,'http://localhost/ivkovic/?p=189',0,'revision','',0),(190,3,'2021-05-30 12:47:38','2021-05-30 10:47:38','','Početna','','inherit','closed','closed','','32-revision-v1','','','2021-05-30 12:47:38','2021-05-30 10:47:38','',32,'http://localhost/ivkovic/?p=190',0,'revision','',0),(191,3,'2021-05-30 12:56:42','2021-05-30 10:56:42','a:7:{s:4:\"type\";s:3:\"tab\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"placement\";s:3:\"top\";s:8:\"endpoint\";i:0;}','Testimonials','testimonials','publish','closed','closed','','field_60b36e791068f','','','2021-05-30 15:28:31','2021-05-30 13:28:31','',37,'http://localhost/ivkovic/?post_type=acf-field&#038;p=191',9,'acf-field','',0),(192,3,'2021-05-30 12:56:42','2021-05-30 10:56:42','a:10:{s:4:\"type\";s:8:\"repeater\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"collapsed\";s:0:\"\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:6:\"layout\";s:5:\"block\";s:12:\"button_label\";s:15:\"Add testimonial\";}','Testimonials','testimonials','publish','closed','closed','','field_60b36ef210690','','','2021-05-30 15:28:31','2021-05-30 13:28:31','',37,'http://localhost/ivkovic/?post_type=acf-field&#038;p=192',10,'acf-field','',0),(193,3,'2021-05-30 12:56:42','2021-05-30 10:56:42','a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:2:\"40\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}','Author','author','publish','closed','closed','','field_60b36f1e10691','','','2021-05-30 12:59:17','2021-05-30 10:59:17','',192,'http://localhost/ivkovic/?post_type=acf-field&#038;p=193',1,'acf-field','',0),(194,3,'2021-05-30 12:56:42','2021-05-30 10:56:42','a:15:{s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:2:\"40\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:2:\"id\";s:12:\"preview_size\";s:6:\"medium\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";}','Author photo','author_photo','publish','closed','closed','','field_60b36f2710692','','','2021-05-30 13:05:53','2021-05-30 11:05:53','',192,'http://localhost/ivkovic/?post_type=acf-field&#038;p=194',0,'acf-field','',0),(195,3,'2021-05-30 12:56:42','2021-05-30 10:56:42','a:12:{s:4:\"type\";s:6:\"number\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:2:\"20\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";i:5;s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:3:\"min\";i:1;s:3:\"max\";i:5;s:4:\"step\";i:1;}','Stars','stars','publish','closed','closed','','field_60b36f3810693','','','2021-05-30 12:58:13','2021-05-30 10:58:13','',192,'http://localhost/ivkovic/?post_type=acf-field&#038;p=195',2,'acf-field','',0),(196,3,'2021-05-30 12:58:13','2021-05-30 10:58:13','a:10:{s:4:\"type\";s:8:\"textarea\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:4:\"rows\";s:0:\"\";s:9:\"new_lines\";s:0:\"\";}','Text','text','publish','closed','closed','','field_60b36fb5b536d','','','2021-05-30 12:58:13','2021-05-30 10:58:13','',192,'http://localhost/ivkovic/?post_type=acf-field&p=196',3,'acf-field','',0),(197,3,'2021-05-30 12:59:48','2021-05-30 10:59:48','','Ellipse 13','','inherit','open','closed','','ellipse-13','','','2021-05-30 12:59:48','2021-05-30 10:59:48','',0,'http://localhost/ivkovic/wp-content/uploads/2021/05/Ellipse-13.png',0,'attachment','image/png',0),(198,3,'2021-05-30 12:59:48','2021-05-30 10:59:48','','Ellipse 13','','inherit','open','closed','','ellipse-13-2','','','2021-05-30 12:59:48','2021-05-30 10:59:48','',0,'http://localhost/ivkovic/wp-content/uploads/2021/05/Ellipse-13.png',0,'attachment','image/png',0),(199,3,'2021-05-30 12:59:50','2021-05-30 10:59:50','','Ellipse 15','','inherit','open','closed','','ellipse-15','','','2021-05-30 12:59:50','2021-05-30 10:59:50','',0,'http://localhost/ivkovic/wp-content/uploads/2021/05/Ellipse-15.png',0,'attachment','image/png',0),(200,3,'2021-05-30 12:59:50','2021-05-30 10:59:50','','Ellipse 15','','inherit','open','closed','','ellipse-15-2','','','2021-05-30 12:59:50','2021-05-30 10:59:50','',0,'http://localhost/ivkovic/wp-content/uploads/2021/05/Ellipse-15.png',0,'attachment','image/png',0),(201,3,'2021-05-30 12:59:53','2021-05-30 10:59:53','','Ellipse 14','','inherit','open','closed','','ellipse-14','','','2021-05-30 12:59:53','2021-05-30 10:59:53','',0,'http://localhost/ivkovic/wp-content/uploads/2021/05/Ellipse-14.png',0,'attachment','image/png',0),(202,3,'2021-05-30 12:59:53','2021-05-30 10:59:53','','Ellipse 14','','inherit','open','closed','','ellipse-14-2','','','2021-05-30 12:59:53','2021-05-30 10:59:53','',0,'http://localhost/ivkovic/wp-content/uploads/2021/05/Ellipse-14.png',0,'attachment','image/png',0),(203,3,'2021-05-30 13:01:13','2021-05-30 11:01:13','a:8:{s:4:\"type\";s:3:\"tab\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_60b37063a6589\";s:9:\"placement\";s:3:\"top\";s:8:\"endpoint\";i:0;}','Content','','publish','closed','closed','','field_60b37063a658a','','','2021-05-30 13:01:13','2021-05-30 11:01:13','',42,'http://localhost/ivkovic/?post_type=acf-field&p=203',0,'acf-field','',0),(204,3,'2021-05-30 13:01:13','2021-05-30 11:01:13','a:11:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_60b37063a6589\";s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}','Title','title','publish','closed','closed','','field_60b37063a658b','','','2021-05-30 13:01:13','2021-05-30 11:01:13','',42,'http://localhost/ivkovic/?post_type=acf-field&p=204',1,'acf-field','',0),(205,3,'2021-05-30 13:01:13','2021-05-30 11:01:13','a:8:{s:4:\"type\";s:3:\"tab\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_60b37063a6589\";s:9:\"placement\";s:3:\"top\";s:8:\"endpoint\";i:0;}','Settings','','publish','closed','closed','','field_60b37063a6590','','','2021-05-30 13:01:13','2021-05-30 11:01:13','',42,'http://localhost/ivkovic/?post_type=acf-field&p=205',2,'acf-field','',0),(206,3,'2021-05-30 13:01:13','2021-05-30 11:01:13','a:11:{s:4:\"type\";s:10:\"true_false\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_60b37063a6589\";s:7:\"message\";s:0:\"\";s:13:\"default_value\";i:1;s:2:\"ui\";i:1;s:10:\"ui_on_text\";s:0:\"\";s:11:\"ui_off_text\";s:0:\"\";}','Visible','active','publish','closed','closed','','field_60b37063a6591','','','2021-05-30 13:01:13','2021-05-30 11:01:13','',42,'http://localhost/ivkovic/?post_type=acf-field&p=206',3,'acf-field','',0),(207,3,'2021-05-30 13:01:29','2021-05-30 11:01:29','','Početna','','inherit','closed','closed','','8-revision-v1','','','2021-05-30 13:01:29','2021-05-30 11:01:29','',8,'http://localhost/ivkovic/?p=207',0,'revision','',0),(208,3,'2021-05-30 13:01:30','2021-05-30 11:01:30','','Početna','','inherit','closed','closed','','32-revision-v1','','','2021-05-30 13:01:30','2021-05-30 11:01:30','',32,'http://localhost/ivkovic/?p=208',0,'revision','',0),(209,3,'2021-05-30 13:14:34','2021-05-30 11:14:34','a:7:{s:4:\"type\";s:3:\"tab\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"placement\";s:3:\"top\";s:8:\"endpoint\";i:0;}','Newsletter CTA','newsletter','publish','closed','closed','','field_60b373314c1b0','','','2021-05-30 15:28:31','2021-05-30 13:28:31','',37,'http://localhost/ivkovic/?post_type=acf-field&#038;p=209',11,'acf-field','',0),(210,3,'2021-05-30 13:14:34','2021-05-30 11:14:34','a:15:{s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:2:\"20\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:5:\"array\";s:12:\"preview_size\";s:6:\"medium\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";}','Image','newsletter_cta_image','publish','closed','closed','','field_60b373404c1b1','','','2021-05-30 15:28:31','2021-05-30 13:28:31','',37,'http://localhost/ivkovic/?post_type=acf-field&#038;p=210',12,'acf-field','',0),(211,3,'2021-05-30 13:14:34','2021-05-30 11:14:34','a:10:{s:4:\"type\";s:7:\"wysiwyg\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:2:\"40\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:4:\"tabs\";s:3:\"all\";s:7:\"toolbar\";s:5:\"basic\";s:12:\"media_upload\";i:0;s:5:\"delay\";i:0;}','Text','newsletter_cta_text','publish','closed','closed','','field_60b3735d4c1b2','','','2021-05-30 15:28:31','2021-05-30 13:28:31','',37,'http://localhost/ivkovic/?post_type=acf-field&#038;p=211',13,'acf-field','',0),(212,3,'2021-05-30 13:14:34','2021-05-30 11:14:34','a:10:{s:4:\"type\";s:7:\"wysiwyg\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:2:\"40\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:4:\"tabs\";s:3:\"all\";s:7:\"toolbar\";s:5:\"basic\";s:12:\"media_upload\";i:0;s:5:\"delay\";i:0;}','Form','newsletter_cta_form','publish','closed','closed','','field_60b3737a4c1b3','','','2021-05-30 15:28:31','2021-05-30 13:28:31','',37,'http://localhost/ivkovic/?post_type=acf-field&#038;p=212',14,'acf-field','',0),(213,3,'2021-05-30 13:17:36','2021-05-30 11:17:36','[email* your-email  placeholder \"Email\"] [submit \"Prijavi se\"]\n1\n[_site_title] \"[your-subject]\"\n[_site_title] <sasa.maravic@gmail.com>\n[_site_admin_email]\nFrom: [your-name] <[your-email]>\r\nSubject: [your-subject]\r\n\r\nMessage Body:\r\n[your-message]\r\n\r\n-- \r\nThis e-mail was sent from a contact form on [_site_title] ([_site_url])\nReply-To: [your-email]\n\n\n\n\n[_site_title] \"[your-subject]\"\n[_site_title] <sasa.maravic@gmail.com>\n[your-email]\nMessage Body:\r\n[your-message]\r\n\r\n-- \r\nThis e-mail was sent from a contact form on [_site_title] ([_site_url])\nReply-To: [_site_admin_email]\n\n\n\nThank you for your message. It has been sent.\nThere was an error trying to send your message. Please try again later.\nOne or more fields have an error. Please check and try again.\nThere was an error trying to send your message. Please try again later.\nYou must accept the terms and conditions before sending your message.\nThe field is required.\nThe field is too long.\nThe field is too short.\nThere was an unknown error uploading the file.\nYou are not allowed to upload files of this type.\nThe file is too big.\nThere was an error uploading the file.\nThe date format is incorrect.\nThe date is before the earliest one allowed.\nThe date is after the latest one allowed.\nThe number format is invalid.\nThe number is smaller than the minimum allowed.\nThe number is larger than the maximum allowed.\nThe answer to the quiz is incorrect.\nThe e-mail address entered is invalid.\nThe URL is invalid.\nThe telephone number is invalid.','Newsletter','','publish','closed','closed','','newsletter','','','2021-05-30 13:26:37','2021-05-30 11:26:37','',0,'http://localhost/ivkovic/?post_type=wpcf7_contact_form&#038;p=213',0,'wpcf7_contact_form','',0),(214,3,'2021-05-30 13:19:25','2021-05-30 11:19:25','','61803914','','inherit','open','closed','','61803914','','','2021-05-30 13:19:25','2021-05-30 11:19:25','',0,'http://localhost/ivkovic/wp-content/uploads/2021/05/61803914.svg',0,'attachment','image/svg+xml',0),(215,3,'2021-05-30 13:19:25','2021-05-30 11:19:25','','61803914','','inherit','open','closed','','61803914-2','','','2021-05-30 13:19:25','2021-05-30 11:19:25','',0,'http://localhost/ivkovic/wp-content/uploads/2021/05/61803914.svg',0,'attachment','image/svg+xml',0),(216,3,'2021-05-30 13:28:58','2021-05-30 11:28:58','a:7:{s:4:\"type\";s:3:\"tab\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"placement\";s:3:\"top\";s:8:\"endpoint\";i:0;}','Footer','footer','publish','closed','closed','','field_60b376c90be1c','','','2021-05-30 15:28:31','2021-05-30 13:28:31','',37,'http://localhost/ivkovic/?post_type=acf-field&#038;p=216',15,'acf-field','',0),(217,3,'2021-05-30 13:28:58','2021-05-30 11:28:58','a:15:{s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:2:\"50\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:5:\"array\";s:12:\"preview_size\";s:6:\"medium\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";}','Footer logo','footer_logo','publish','closed','closed','','field_60b376d60be1d','','','2021-05-30 15:28:31','2021-05-30 13:28:31','',37,'http://localhost/ivkovic/?post_type=acf-field&#038;p=217',16,'acf-field','',0),(218,3,'2021-05-30 13:28:58','2021-05-30 11:28:58','a:15:{s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:2:\"50\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:2:\"id\";s:12:\"preview_size\";s:6:\"medium\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";}','Footer background','footer_background','publish','closed','closed','','field_60b376eb0be1e','','','2021-05-30 15:28:31','2021-05-30 13:28:31','',37,'http://localhost/ivkovic/?post_type=acf-field&#038;p=218',17,'acf-field','',0),(219,3,'2021-05-30 13:30:30','2021-05-30 11:30:30','','Layer x0020 1','','inherit','open','closed','','layer-x0020-1','','','2021-05-30 13:30:30','2021-05-30 11:30:30','',0,'http://localhost/ivkovic/wp-content/uploads/2021/05/Layer-x0020-1.svg',0,'attachment','image/svg+xml',0),(220,3,'2021-05-30 13:30:30','2021-05-30 11:30:30','','Layer x0020 1','','inherit','open','closed','','layer-x0020-1-2','','','2021-05-30 13:30:30','2021-05-30 11:30:30','',0,'http://localhost/ivkovic/wp-content/uploads/2021/05/Layer-x0020-1.svg',0,'attachment','image/svg+xml',0),(221,3,'2021-05-30 13:30:50','2021-05-30 11:30:50','','Rectangle 86','','inherit','open','closed','','rectangle-86','','','2021-05-30 13:30:50','2021-05-30 11:30:50','',0,'http://localhost/ivkovic/wp-content/uploads/2021/05/Rectangle-86.png',0,'attachment','image/png',0),(222,3,'2021-05-30 13:30:50','2021-05-30 11:30:50','','Rectangle 86','','inherit','open','closed','','rectangle-86-2','','','2021-05-30 13:30:50','2021-05-30 11:30:50','',0,'http://localhost/ivkovic/wp-content/uploads/2021/05/Rectangle-86.png',0,'attachment','image/png',0),(223,3,'2021-05-30 14:10:14','2021-05-30 11:50:10',' ','','','publish','closed','closed','','223','','','2021-05-30 14:10:14','2021-05-30 12:10:14','',0,'http://localhost/ivkovic/?p=223',1,'nav_menu_item','',0),(224,3,'2021-05-30 13:56:08','2021-05-30 11:56:08','a:11:{s:4:\"type\";s:11:\"post_object\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"post_type\";a:1:{i:0;s:4:\"page\";}s:8:\"taxonomy\";s:0:\"\";s:10:\"allow_null\";i:1;s:8:\"multiple\";i:0;s:13:\"return_format\";s:2:\"id\";s:2:\"ui\";i:1;}','Page Privacy Policy','page_privacy_policy','publish','closed','closed','','field_60b37d4b548c0','','','2021-05-30 13:56:08','2021-05-30 11:56:08','',37,'http://localhost/ivkovic/?post_type=acf-field&p=224',7,'acf-field','',0),(225,3,'2021-05-30 13:59:28','2021-05-30 11:59:28','<!-- wp:heading -->\r\n<h2>Ко смо ми</h2>\r\n<!-- /wp:heading -->\r\n\r\n<!-- wp:paragraph -->\r\n<p><strong class=\"privacy-policy-tutorial\">Предложени текст: </strong>Наша адреса веб места је: http://localhost/ivkovic.</p>\r\n<!-- /wp:paragraph -->\r\n\r\n<!-- wp:heading -->\r\n<h2>Коментари</h2>\r\n<!-- /wp:heading -->\r\n\r\n<!-- wp:paragraph -->\r\n<p><strong class=\"privacy-policy-tutorial\">Предложени текст: </strong>Када посетиоци оставе коментаре на веб месту, скупљамо податке приказане у обрасцу за коментаре као и IP адресу посетиоца и ниску user agent његовог прегледача веба за помоћ у откривању непожељног.</p>\r\n<!-- /wp:paragraph -->\r\n\r\n<!-- wp:paragraph -->\r\n<p>Анонимизована ниска направљена од ваше адресе е-поште (такође названа и хеш) може бити достављена услузи Граватар да би се видело да ли је користите. Политика приватности услуге Граватар је доступна овде: https://automattic.com/privacy/. Након одобрења вашег коментара, ваша слика профила је видљива јавности у смислу вашег коментара.</p>\r\n<!-- /wp:paragraph -->\r\n\r\n<!-- wp:heading -->\r\n<h2>Садржај</h2>\r\n<!-- /wp:heading -->\r\n\r\n<!-- wp:paragraph -->\r\n<p><strong class=\"privacy-policy-tutorial\">Предложени текст: </strong>Уколико отпремате слике на веб место, требало би да избегавате отпремање слика са угнежђеним подацима локације (EXIF GPS). Посетиоци веб места могу да преузму и извуку податке о локацији са слика са веб места.</p>\r\n<!-- /wp:paragraph -->\r\n\r\n<!-- wp:heading -->\r\n<h2>Колачићи</h2>\r\n<!-- /wp:heading -->\r\n\r\n<!-- wp:paragraph -->\r\n<p><strong class=\"privacy-policy-tutorial\">Предложени текст: </strong>Уколико оставите коментар на нашем веб месту, можете се изузети од снимања свог имена, адресе е-поште и веб места у колачићима. Они су због ваше удобности тако да не морате да поново попуњавате своје детаље када оставите други коментар. Ови колачићи трају годину дана.</p>\r\n<!-- /wp:paragraph -->\r\n\r\n<!-- wp:paragraph -->\r\n<p>Уколико посетите нашу страницу за пријављивање, поставићемо привремени колачић за одређивање да ли ваш прегледач веба прихвата колачиће. Овај колачић не садржи личне податке и одбацује се након вашег затварања прегледача веба.</p>\r\n<!-- /wp:paragraph -->\r\n\r\n<!-- wp:paragraph -->\r\n<p>Када се пријавите, такође ћемо поставити неколико колачића да бисмо сачували ваше информације пријављивања и ваше изборе приказа екрана. Колачићи пријављивања трају два дана, а колачићи могућности екрана трају годину дана. Уколико изаберете \"Запамти ме\", ваша пријава ће трајати две седмице. Уколико се одјавите са свог налога, колачићи пријављивања биће уклоњени.</p>\r\n<!-- /wp:paragraph -->\r\n\r\n<!-- wp:paragraph -->\r\n<p>Када уредите или објавите чланак, додатни колачић ће бити сачуван у вашем прегледачу веба. Овај колачић не укључује личне податке и само одређује ID чланка који уређујете. Истиче након једног дана.</p>\r\n<!-- /wp:paragraph -->\r\n\r\n<!-- wp:heading -->\r\n<h2>Угнежђени садржај са других веб места</h2>\r\n<!-- /wp:heading -->\r\n\r\n<!-- wp:paragraph -->\r\n<p><strong class=\"privacy-policy-tutorial\">Предложени текст: </strong>Чланци на овом веб месту могу да садрже угнежђени садржај (нпр. видео снимке, слике, чланке, итд). Угнежђени садржај са других веб места се понаша на потпуно исти начин као да је ваш посетилац посетио друго веб место.</p>\r\n<!-- /wp:paragraph -->\r\n\r\n<!-- wp:paragraph -->\r\n<p>Та веб места могу да прикупе податке о вама, користе колачиће, угнезде додатно праћење од стране треће стране и надгледају вашу интеракцију са тим угнежђеним садржајем, укључујући праћење ваше интеракције са угнежђеним садржајем уколико имате налог и пријављени сте на то веб место.</p>\r\n<!-- /wp:paragraph -->\r\n\r\n<!-- wp:heading -->\r\n<h2>Са ким делимо ваше податке</h2>\r\n<!-- /wp:heading -->\r\n\r\n<!-- wp:paragraph -->\r\n<p><strong class=\"privacy-policy-tutorial\">Предложени текст: </strong>Ако затражите ресетовање лозинке, ваша IP адреса ће бити укључена у е-пошту ресетовања.</p>\r\n<!-- /wp:paragraph -->\r\n\r\n<!-- wp:heading -->\r\n<h2>Колико дуго чувамо ваше податке</h2>\r\n<!-- /wp:heading -->\r\n\r\n<!-- wp:paragraph -->\r\n<p><strong class=\"privacy-policy-tutorial\">Предложени текст: </strong>Уколико оставите коментар, тај коментар и његови мета подаци се чувају неограничено. Ово је зато да бисмо препознали и аутоматски одобрили све коментаре које уследе умести да их држимо у реду за преглед.</p>\r\n<!-- /wp:paragraph -->\r\n\r\n<!-- wp:paragraph -->\r\n<p>За кориснике који се региструју на наше веб место (уколико их има), такође чувамо личне информације које доставе у свом корисничком профилу. Сви корисници могу да виде, уреде или обришу своје личне податке било када (изузев што не могу да промене своје корисничко име). Управници веб места такође могу да виде и уреде те информације.</p>\r\n<!-- /wp:paragraph -->\r\n\r\n<!-- wp:heading -->\r\n<h2>Која права имате у односу на ваше податке</h2>\r\n<!-- /wp:heading -->\r\n\r\n<!-- wp:paragraph -->\r\n<p><strong class=\"privacy-policy-tutorial\">Предложени текст: </strong>Уколико имате налог на овом веб месту, или сте оставили коментаре, можете да захтевате да примите датотеку са извезеним личним подацима које држимо о вама укључујући било које податке које сте нам доставили. Такође можете да захтевате да обришемо било које личне податке које држимо о вама. То не укључује било које податке које смо обавезни да држимо због административних, правних или безбедоносних разлога.</p>\r\n<!-- /wp:paragraph -->\r\n\r\n<!-- wp:heading -->\r\n<h2>Где шаљемо ваше податке</h2>\r\n<!-- /wp:heading -->\r\n\r\n<!-- wp:paragraph -->\r\n<p><strong class=\"privacy-policy-tutorial\">Предложени текст: </strong>Коментари посетиоца могу да буду проверени кроз услугу аутоматског препознавања непожељних.</p>\r\n<!-- /wp:paragraph -->','Politika Privatnosti','','inherit','closed','closed','','3-revision-v1','','','2021-05-30 13:59:28','2021-05-30 11:59:28','',3,'http://localhost/ivkovic/?p=225',0,'revision','',0),(226,3,'2021-05-30 14:01:23','2021-05-30 12:01:23','{\n    \"ivkovic-theme::footer_customizer_text\": {\n        \"value\": \"Atelje i knjigoveznica IVKOVI\\u0106<br>Sva prava zadr\\u017eana. \\u00a9 2021\",\n        \"type\": \"theme_mod\",\n        \"user_id\": 3,\n        \"date_modified_gmt\": \"2021-05-30 12:01:23\"\n    }\n}','','','trash','closed','closed','','1f23b2e8-c19b-4a84-a596-1c2c0720e9ad','','','2021-05-30 14:01:23','2021-05-30 12:01:23','',0,'http://localhost/ivkovic/1f23b2e8-c19b-4a84-a596-1c2c0720e9ad/',0,'customize_changeset','',0),(227,3,'2021-05-30 14:04:58','2021-05-30 12:04:58','','E-Shop','','publish','closed','closed','','e-shop','','','2021-05-30 14:04:58','2021-05-30 12:04:58','',0,'http://localhost/ivkovic/?page_id=227',0,'page','',0),(228,3,'2021-05-30 14:04:58','2021-05-30 12:04:58','','E-Shop','','inherit','closed','closed','','227-revision-v1','','','2021-05-30 14:04:58','2021-05-30 12:04:58','',227,'http://localhost/ivkovic/?p=228',0,'revision','',0),(229,3,'2021-05-30 14:05:36','2021-05-30 12:05:36','','Proizvodi','','publish','closed','closed','','proizvodi','','','2021-05-30 14:05:36','2021-05-30 12:05:36','',0,'http://localhost/ivkovic/?page_id=229',0,'page','',0),(230,3,'2021-05-30 14:05:36','2021-05-30 12:05:36','','Proizvodi','','inherit','closed','closed','','229-revision-v1','','','2021-05-30 14:05:36','2021-05-30 12:05:36','',229,'http://localhost/ivkovic/?p=230',0,'revision','',0),(231,3,'2021-05-30 14:05:57','2021-05-30 12:05:57','','Katalozi','','publish','closed','closed','','katalozi','','','2021-05-30 14:05:57','2021-05-30 12:05:57','',0,'http://localhost/ivkovic/?page_id=231',0,'page','',0),(232,3,'2021-05-30 14:05:57','2021-05-30 12:05:57','','Katalozi','','inherit','closed','closed','','231-revision-v1','','','2021-05-30 14:05:57','2021-05-30 12:05:57','',231,'http://localhost/ivkovic/?p=232',0,'revision','',0),(233,3,'2021-05-30 14:06:12','2021-05-30 12:06:12','','Zaposlenje','','publish','closed','closed','','zaposlenje','','','2021-05-30 14:06:12','2021-05-30 12:06:12','',0,'http://localhost/ivkovic/?page_id=233',0,'page','',0),(234,3,'2021-05-30 14:06:12','2021-05-30 12:06:12','','Zaposlenje','','inherit','closed','closed','','233-revision-v1','','','2021-05-30 14:06:12','2021-05-30 12:06:12','',233,'http://localhost/ivkovic/?p=234',0,'revision','',0),(235,3,'2021-05-30 14:06:22','2021-05-30 12:06:22','','Kontakt','','publish','closed','closed','','kontakt','','','2021-05-30 14:06:22','2021-05-30 12:06:22','',0,'http://localhost/ivkovic/?page_id=235',0,'page','',0),(236,3,'2021-05-30 14:06:22','2021-05-30 12:06:22','','Kontakt','','inherit','closed','closed','','235-revision-v1','','','2021-05-30 14:06:22','2021-05-30 12:06:22','',235,'http://localhost/ivkovic/?p=236',0,'revision','',0),(237,3,'2021-05-30 14:07:20','2021-05-30 12:07:20',' ','','','publish','closed','closed','','237','','','2021-05-30 14:07:20','2021-05-30 12:07:20','',0,'http://localhost/ivkovic/?p=237',2,'nav_menu_item','',0),(238,3,'2021-05-30 14:07:20','2021-05-30 12:07:20',' ','','','publish','closed','closed','','238','','','2021-05-30 14:07:20','2021-05-30 12:07:20','',0,'http://localhost/ivkovic/?p=238',3,'nav_menu_item','',0),(239,3,'2021-05-30 14:07:20','2021-05-30 12:07:20',' ','','','publish','closed','closed','','239','','','2021-05-30 14:07:20','2021-05-30 12:07:20','',0,'http://localhost/ivkovic/?p=239',4,'nav_menu_item','',0),(240,3,'2021-05-30 14:07:20','2021-05-30 12:07:20',' ','','','publish','closed','closed','','240','','','2021-05-30 14:07:20','2021-05-30 12:07:20','',0,'http://localhost/ivkovic/?p=240',5,'nav_menu_item','',0),(241,3,'2021-05-30 14:07:20','2021-05-30 12:07:20',' ','','','publish','closed','closed','','241','','','2021-05-30 14:07:20','2021-05-30 12:07:20','',0,'http://localhost/ivkovic/?p=241',6,'nav_menu_item','',0),(242,3,'2021-05-30 14:07:20','2021-05-30 12:07:20',' ','','','publish','closed','closed','','242','','','2021-05-30 14:07:20','2021-05-30 12:07:20','',0,'http://localhost/ivkovic/?p=242',7,'nav_menu_item','',0),(243,3,'2021-05-30 14:07:20','2021-05-30 12:07:20',' ','','','publish','closed','closed','','243','','','2021-05-30 14:07:20','2021-05-30 12:07:20','',0,'http://localhost/ivkovic/?p=243',8,'nav_menu_item','',0),(244,3,'2021-05-30 14:10:14','2021-05-30 12:09:24',' ','','','publish','closed','closed','','244','','','2021-05-30 14:10:14','2021-05-30 12:10:14','',0,'http://localhost/ivkovic/?p=244',2,'nav_menu_item','',0),(245,3,'2021-05-30 14:10:14','2021-05-30 12:09:24',' ','','','publish','closed','closed','','245','','','2021-05-30 14:10:14','2021-05-30 12:10:14','',0,'http://localhost/ivkovic/?p=245',3,'nav_menu_item','',0),(246,3,'2021-05-30 14:10:14','2021-05-30 12:09:24',' ','','','publish','closed','closed','','246','','','2021-05-30 14:10:14','2021-05-30 12:10:14','',0,'http://localhost/ivkovic/?p=246',4,'nav_menu_item','',0),(247,3,'2021-05-30 14:10:14','2021-05-30 12:10:14',' ','','','publish','closed','closed','','247','','','2021-05-30 14:10:14','2021-05-30 12:10:14','',0,'http://localhost/ivkovic/?p=247',5,'nav_menu_item','',0),(248,3,'2021-05-30 14:10:14','2021-05-30 12:10:14',' ','','','publish','closed','closed','','248','','','2021-05-30 14:10:14','2021-05-30 12:10:14','',0,'http://localhost/ivkovic/?p=248',6,'nav_menu_item','',0),(249,3,'2021-05-30 14:10:14','2021-05-30 12:10:14',' ','','','publish','closed','closed','','249','','','2021-05-30 14:10:14','2021-05-30 12:10:14','',0,'http://localhost/ivkovic/?p=249',7,'nav_menu_item','',0),(250,3,'2021-05-30 14:10:14','2021-05-30 12:10:14',' ','','','publish','closed','closed','','250','','','2021-05-30 14:10:14','2021-05-30 12:10:14','',0,'http://localhost/ivkovic/?p=250',8,'nav_menu_item','',0),(251,3,'2021-05-30 17:06:35','2021-05-30 12:12:05',' ','','','publish','closed','closed','','251','','','2021-05-30 17:06:35','2021-05-30 15:06:35','',0,'http://localhost/ivkovic/?p=251',1,'nav_menu_item','',0),(252,3,'2021-05-30 15:25:50','2021-05-30 13:25:50','','Back Pack','','publish','open','closed','','back-pack-2','','','2021-05-30 17:09:16','2021-05-30 15:09:16','',0,'http://localhost/ivkovic/?post_type=product&#038;p=252',0,'product','',0),(255,3,'2021-05-30 15:28:31','2021-05-30 13:28:31','a:11:{s:4:\"type\";s:11:\"post_object\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"post_type\";a:1:{i:0;s:4:\"page\";}s:8:\"taxonomy\";s:0:\"\";s:10:\"allow_null\";i:1;s:8:\"multiple\";i:0;s:13:\"return_format\";s:2:\"id\";s:2:\"ui\";i:1;}','Page E-Shop','page_e-shop','publish','closed','closed','','field_60b392f209d62','','','2021-05-30 15:28:31','2021-05-30 13:28:31','',37,'http://localhost/ivkovic/?post_type=acf-field&p=255',8,'acf-field','',0),(256,3,'2021-05-30 16:56:41','2021-05-30 14:56:41','a:7:{s:4:\"type\";s:3:\"tab\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"placement\";s:3:\"top\";s:8:\"endpoint\";i:0;}','Mega Menu','mega_menu','publish','closed','closed','','field_60b3a70e7ef88','','','2021-05-30 16:56:41','2021-05-30 14:56:41','',37,'http://localhost/ivkovic/?post_type=acf-field&p=256',18,'acf-field','',0),(257,3,'2021-05-30 16:56:41','2021-05-30 14:56:41','a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}','Mega Menu Above discount','mega_menu_above_discount','publish','closed','closed','','field_60b3a7807ef8c','','','2021-05-30 16:56:41','2021-05-30 14:56:41','',37,'http://localhost/ivkovic/?post_type=acf-field&p=257',19,'acf-field','',0),(258,3,'2021-05-30 16:56:41','2021-05-30 14:56:41','a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}','Mega Menu Discount','mega_menu_discount','publish','closed','closed','','field_60b3a7947ef8d','','','2021-05-30 16:56:41','2021-05-30 14:56:41','',37,'http://localhost/ivkovic/?post_type=acf-field&p=258',20,'acf-field','',0),(259,3,'2021-05-30 16:56:41','2021-05-30 14:56:41','a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}','Mega Menu Below discount','mega_menu_below_discount','publish','closed','closed','','field_60b3a79c7ef8e','','','2021-05-30 16:56:41','2021-05-30 14:56:41','',37,'http://localhost/ivkovic/?post_type=acf-field&p=259',21,'acf-field','',0),(260,3,'2021-05-30 16:56:41','2021-05-30 14:56:41','a:15:{s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:2:\"50\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:2:\"id\";s:12:\"preview_size\";s:6:\"medium\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";}','Mega Menu Image','mega_menu_copy','publish','closed','closed','','field_60b3a7597ef89','','','2021-05-30 17:00:01','2021-05-30 15:00:01','',37,'http://localhost/ivkovic/?post_type=acf-field&#038;p=260',22,'acf-field','',0),(261,3,'2021-05-30 16:56:41','2021-05-30 14:56:41','a:15:{s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:2:\"50\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:5:\"array\";s:12:\"preview_size\";s:6:\"medium\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";}','Mega Menu Logo','mega_menu_logo','publish','closed','closed','','field_60b3a7657ef8a','','','2021-05-30 16:56:41','2021-05-30 14:56:41','',37,'http://localhost/ivkovic/?post_type=acf-field&p=261',23,'acf-field','',0),(262,3,'2021-05-30 16:57:18','2021-05-30 14:57:18','','Rectangle 157','','inherit','open','closed','','rectangle-157','','','2021-05-30 16:57:18','2021-05-30 14:57:18','',0,'http://localhost/ivkovic/wp-content/uploads/2021/05/Rectangle-157.jpg',0,'attachment','image/jpeg',0),(263,3,'2021-05-30 16:57:18','2021-05-30 14:57:18','','Rectangle 157','','inherit','open','closed','','rectangle-157-2','','','2021-05-30 16:57:18','2021-05-30 14:57:18','',0,'http://localhost/ivkovic/wp-content/uploads/2021/05/Rectangle-157.jpg',0,'attachment','image/jpeg',0),(264,3,'2021-05-30 17:06:35','2021-05-30 15:06:35','','Dizzy','','publish','closed','closed','','dizzy','','','2021-05-30 17:06:35','2021-05-30 15:06:35','',0,'http://localhost/ivkovic/?p=264',2,'nav_menu_item','',0),(265,3,'2021-05-30 17:06:35','2021-05-30 15:06:35','','Pismo novčanik sa čipom','','publish','closed','closed','','pismo-novcanik-sa-cipom','','','2021-05-30 17:06:35','2021-05-30 15:06:35','',0,'http://localhost/ivkovic/?p=265',3,'nav_menu_item','',0),(266,3,'2021-05-30 17:06:35','2021-05-30 15:06:35','','Magični novčanik','','publish','closed','closed','','magicni-novcanik','','','2021-05-30 17:06:35','2021-05-30 15:06:35','',0,'http://localhost/ivkovic/?p=266',4,'nav_menu_item','',0),(267,3,'2021-05-30 17:06:35','2021-05-30 15:06:35','','Elegant Bag','','publish','closed','closed','','elegant-bag','','','2021-05-30 17:06:35','2021-05-30 15:06:35','',0,'http://localhost/ivkovic/?p=267',5,'nav_menu_item','',0),(268,3,'2021-05-30 17:06:35','2021-05-30 15:06:35','','Nova kolekcija','','publish','closed','closed','','nova-kolekcija','','','2021-05-30 17:06:35','2021-05-30 15:06:35','',0,'http://localhost/ivkovic/?p=268',6,'nav_menu_item','',0),(269,3,'2021-05-30 17:06:35','2021-05-30 15:06:35','','Lorem Ipsum','','publish','closed','closed','','lorem-ipsum','','','2021-05-30 17:06:35','2021-05-30 15:06:35','',0,'http://localhost/ivkovic/?p=269',7,'nav_menu_item','',0),(270,3,'2021-05-30 17:06:35','2021-05-30 15:06:35','','Lorem Ipsum','','publish','closed','closed','','lorem-ipsum-2','','','2021-05-30 17:06:35','2021-05-30 15:06:35','',0,'http://localhost/ivkovic/?p=270',8,'nav_menu_item','',0),(271,3,'2021-05-30 17:06:35','2021-05-30 15:06:35','','Lorem Ipsum','','publish','closed','closed','','lorem-ipsum-3','','','2021-05-30 17:06:35','2021-05-30 15:06:35','',0,'http://localhost/ivkovic/?p=271',9,'nav_menu_item','',0),(272,3,'2021-05-30 17:06:35','2021-05-30 15:06:35','','Lorem Ipsum','','publish','closed','closed','','lorem-ipsum-4','','','2021-05-30 17:06:35','2021-05-30 15:06:35','',0,'http://localhost/ivkovic/?p=272',10,'nav_menu_item','',0),(273,3,'2021-05-30 17:06:35','2021-05-30 15:06:35','','Lorem Ipsum','','publish','closed','closed','','lorem-ipsum-5','','','2021-05-30 17:06:35','2021-05-30 15:06:35','',0,'http://localhost/ivkovic/?p=273',11,'nav_menu_item','',0),(274,3,'2021-05-30 17:06:35','2021-05-30 15:06:35','','Lorem Ipsum','','publish','closed','closed','','lorem-ipsum-6','','','2021-05-30 17:06:35','2021-05-30 15:06:35','',0,'http://localhost/ivkovic/?p=274',12,'nav_menu_item','',0),(275,3,'2021-05-30 17:09:26','2021-05-30 15:09:26','','Back Pack (Copy)','','publish','open','closed','','back-pack-copy','','','2021-05-30 17:09:31','2021-05-30 15:09:31','',0,'http://localhost/ivkovic/?post_type=product&#038;p=275',0,'product','',0),(276,3,'2021-05-30 17:09:39','2021-05-30 15:09:39','','Back Pack (Copy)','','publish','open','closed','','back-pack-copy-2','','','2021-05-30 17:09:45','2021-05-30 15:09:45','',0,'http://localhost/ivkovic/?post_type=product&#038;p=276',0,'product','',0),(277,3,'2021-05-30 17:10:02','2021-05-30 15:10:02','','Back Pack (Copy)','','publish','open','closed','','back-pack-copy-3','','','2021-05-30 17:10:08','2021-05-30 15:10:08','',0,'http://localhost/ivkovic/?post_type=product&#038;p=277',0,'product','',0),(278,3,'2021-05-30 17:10:16','2021-05-30 15:10:16','','Back Pack (Copy)','','publish','open','closed','','back-pack-copy-4','','','2021-05-30 17:10:21','2021-05-30 15:10:21','',0,'http://localhost/ivkovic/?post_type=product&#038;p=278',0,'product','',0),(279,3,'2021-05-30 17:10:56','2021-05-30 15:10:56','','Početna','','inherit','closed','closed','','8-revision-v1','','','2021-05-30 17:10:56','2021-05-30 15:10:56','',8,'http://localhost/ivkovic/?p=279',0,'revision','',0),(280,3,'2021-05-30 17:10:56','2021-05-30 15:10:56','','Početna','','inherit','closed','closed','','32-revision-v1','','','2021-05-30 17:10:56','2021-05-30 15:10:56','',32,'http://localhost/ivkovic/?p=280',0,'revision','',0),(281,3,'2021-05-30 17:12:44','2021-05-30 15:12:44','','Početna','','inherit','closed','closed','','8-revision-v1','','','2021-05-30 17:12:44','2021-05-30 15:12:44','',8,'http://localhost/ivkovic/?p=281',0,'revision','',0),(282,3,'2021-05-30 17:12:44','2021-05-30 15:12:44','','Početna','','inherit','closed','closed','','32-revision-v1','','','2021-05-30 17:12:44','2021-05-30 15:12:44','',32,'http://localhost/ivkovic/?p=282',0,'revision','',0),(283,3,'2021-05-30 17:15:38','2021-05-30 15:15:38','a:11:{s:4:\"type\";s:8:\"repeater\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_60b2afe3bba43\";s:9:\"collapsed\";s:0:\"\";s:3:\"min\";s:0:\"\";s:3:\"max\";i:4;s:6:\"layout\";s:5:\"block\";s:12:\"button_label\";s:7:\"Add box\";}','Boxes','boxes','publish','closed','closed','','field_60b3aba5361c8','','','2021-05-30 17:16:00','2021-05-30 15:16:00','',42,'http://localhost/ivkovic/?post_type=acf-field&#038;p=283',3,'acf-field','',0),(284,3,'2021-05-30 17:15:38','2021-05-30 15:15:38','a:6:{s:4:\"type\";s:4:\"link\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:5:\"array\";}','Link','link','publish','closed','closed','','field_60b3abde361ca','','','2021-05-30 17:16:29','2021-05-30 15:16:29','',283,'http://localhost/ivkovic/?post_type=acf-field&#038;p=284',0,'acf-field','',0),(285,3,'2021-05-30 17:15:38','2021-05-30 15:15:38','a:10:{s:4:\"type\";s:8:\"repeater\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"collapsed\";s:0:\"\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:6:\"layout\";s:5:\"block\";s:12:\"button_label\";s:11:\"Add subitem\";}','Subitems','subitems','publish','closed','closed','','field_60b3abf7361cb','','','2021-05-30 17:15:38','2021-05-30 15:15:38','',283,'http://localhost/ivkovic/?post_type=acf-field&p=285',1,'acf-field','',0),(286,3,'2021-05-30 17:15:38','2021-05-30 15:15:38','a:6:{s:4:\"type\";s:4:\"link\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:5:\"array\";}','Link','link','publish','closed','closed','','field_60b3ac0f361cc','','','2021-05-30 17:15:38','2021-05-30 15:15:38','',285,'http://localhost/ivkovic/?post_type=acf-field&p=286',0,'acf-field','',0),(287,3,'2021-05-30 17:16:37','2021-05-30 15:16:37','','Početna','','inherit','closed','closed','','8-revision-v1','','','2021-05-30 17:16:37','2021-05-30 15:16:37','',8,'http://localhost/ivkovic/?p=287',0,'revision','',0),(288,3,'2021-05-30 17:16:38','2021-05-30 15:16:38','','Početna','','inherit','closed','closed','','32-revision-v1','','','2021-05-30 17:16:38','2021-05-30 15:16:38','',32,'http://localhost/ivkovic/?p=288',0,'revision','',0),(289,3,'2021-05-30 17:19:49','2021-05-30 15:19:49','','Početna','','inherit','closed','closed','','8-revision-v1','','','2021-05-30 17:19:49','2021-05-30 15:19:49','',8,'http://localhost/ivkovic/?p=289',0,'revision','',0),(290,3,'2021-05-30 17:19:50','2021-05-30 15:19:50','','Početna','','inherit','closed','closed','','32-revision-v1','','','2021-05-30 17:19:50','2021-05-30 15:19:50','',32,'http://localhost/ivkovic/?p=290',0,'revision','',0),(291,3,'2021-05-30 17:32:56','2021-05-30 15:32:56','','Početna','','inherit','closed','closed','','8-revision-v1','','','2021-05-30 17:32:56','2021-05-30 15:32:56','',8,'http://localhost/ivkovic/?p=291',0,'revision','',0),(292,3,'2021-05-30 17:32:57','2021-05-30 15:32:57','','Početna','','inherit','closed','closed','','32-revision-v1','','','2021-05-30 17:32:57','2021-05-30 15:32:57','',32,'http://localhost/ivkovic/?p=292',0,'revision','',0);
/*!40000 ALTER TABLE `wp_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_term_relationships`
--

DROP TABLE IF EXISTS `wp_term_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_term_relationships`
--

LOCK TABLES `wp_term_relationships` WRITE;
/*!40000 ALTER TABLE `wp_term_relationships` DISABLE KEYS */;
INSERT INTO `wp_term_relationships` VALUES (3,3,0),(8,3,0),(20,3,0),(23,9,0),(28,3,0),(29,3,0),(30,3,0),(31,3,0),(32,4,0),(33,3,0),(35,3,0),(41,1,0),(41,3,0),(89,10,0),(89,28,0),(89,29,0),(89,32,0),(89,33,0),(89,34,0),(89,35,0),(89,36,0),(89,37,0),(89,38,0),(89,39,0),(89,40,0),(89,41,0),(89,42,0),(89,43,0),(89,44,0),(89,45,0),(89,46,0),(89,47,0),(89,48,0),(89,49,0),(89,50,0),(89,51,0),(89,52,0),(89,53,0),(89,54,0),(89,55,0),(89,56,0),(89,57,0),(89,58,0),(89,59,0),(89,60,0),(89,61,0),(116,3,0),(159,1,0),(159,3,0),(167,1,0),(167,3,0),(169,1,0),(169,3,0),(177,3,0),(223,30,0),(227,3,0),(229,3,0),(231,3,0),(233,3,0),(235,3,0),(237,9,0),(238,9,0),(239,9,0),(240,9,0),(241,9,0),(242,9,0),(243,9,0),(244,30,0),(245,30,0),(246,30,0),(247,30,0),(248,30,0),(249,30,0),(250,30,0),(251,31,0),(252,10,0),(252,28,0),(252,29,0),(252,36,0),(264,31,0),(265,31,0),(266,31,0),(267,31,0),(268,31,0),(269,31,0),(270,31,0),(271,31,0),(272,31,0),(273,31,0),(274,31,0),(275,10,0),(275,28,0),(275,29,0),(275,36,0),(276,10,0),(276,28,0),(276,29,0),(276,36,0),(277,10,0),(277,28,0),(277,29,0),(277,36,0),(278,10,0),(278,28,0),(278,29,0),(278,36,0);
/*!40000 ALTER TABLE `wp_term_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_term_taxonomy`
--

DROP TABLE IF EXISTS `wp_term_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_term_taxonomy`
--

LOCK TABLES `wp_term_taxonomy` WRITE;
/*!40000 ALTER TABLE `wp_term_taxonomy` DISABLE KEYS */;
INSERT INTO `wp_term_taxonomy` VALUES (1,1,'category','',0,3),(2,2,'category','',0,0),(3,3,'translation_priority','',0,18),(4,4,'translation_priority','',0,1),(5,5,'translation_priority','',0,0),(6,6,'translation_priority','',0,0),(7,7,'translation_priority','',0,0),(8,8,'translation_priority','',0,0),(9,9,'nav_menu','',0,8),(10,10,'product_type','',0,6),(11,11,'product_type','',0,0),(12,12,'product_type','',0,0),(13,13,'product_type','',0,0),(14,14,'product_visibility','',0,0),(15,15,'product_visibility','',0,0),(16,16,'product_visibility','',0,0),(17,17,'product_visibility','',0,0),(18,18,'product_visibility','',0,0),(19,19,'product_visibility','',0,0),(20,20,'product_visibility','',0,0),(21,21,'product_visibility','',0,0),(22,22,'product_visibility','',0,0),(23,23,'product_cat','',0,0),(28,28,'pa_gender','',0,6),(29,29,'pa_gender','',0,6),(30,30,'nav_menu','',0,8),(31,31,'nav_menu','',0,12),(32,32,'product_cat','',0,1),(33,33,'product_cat','',0,1),(34,34,'product_cat','',0,1),(35,35,'product_cat','',0,1),(36,36,'product_cat','',0,6),(37,37,'product_cat','',32,1),(38,38,'product_cat','',32,1),(39,39,'product_cat','',32,1),(40,40,'product_cat','',32,1),(41,41,'product_cat','',33,1),(42,42,'product_cat','',33,1),(43,43,'product_cat','',33,1),(44,44,'product_cat','',33,1),(45,45,'product_cat','',34,1),(46,46,'product_cat','',34,1),(47,47,'product_cat','',34,1),(48,48,'product_cat','',34,1),(49,49,'product_cat','',34,1),(50,50,'product_cat','',34,1),(51,51,'product_cat','',34,1),(52,52,'product_cat','',34,1),(53,53,'product_cat','',34,1),(54,54,'product_cat','',34,1),(55,55,'product_cat','',34,1),(56,56,'product_cat','',34,1),(57,57,'product_cat','',34,1),(58,58,'product_cat','',35,1),(59,59,'product_cat','',35,1),(60,60,'product_cat','',36,1),(61,61,'product_cat','',36,1);
/*!40000 ALTER TABLE `wp_term_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_termmeta`
--

DROP TABLE IF EXISTS `wp_termmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_termmeta`
--

LOCK TABLES `wp_termmeta` WRITE;
/*!40000 ALTER TABLE `wp_termmeta` DISABLE KEYS */;
INSERT INTO `wp_termmeta` VALUES (1,23,'product_count_product_cat','0'),(14,28,'order_pa_gender','0'),(15,29,'order_pa_gender','0'),(20,32,'order','0'),(21,32,'display_type',''),(22,32,'thumbnail_id','0'),(23,33,'order','0'),(24,33,'display_type',''),(25,33,'thumbnail_id','0'),(26,34,'order','0'),(27,34,'display_type',''),(28,34,'thumbnail_id','0'),(29,35,'order','0'),(30,35,'display_type',''),(31,35,'thumbnail_id','0'),(32,36,'order','0'),(33,36,'display_type',''),(34,36,'thumbnail_id','0'),(35,37,'order','0'),(36,37,'display_type',''),(37,37,'thumbnail_id','0'),(38,38,'order','0'),(39,38,'display_type',''),(40,38,'thumbnail_id','0'),(41,39,'order','0'),(42,39,'display_type',''),(43,39,'thumbnail_id','0'),(44,40,'order','0'),(45,40,'display_type',''),(46,40,'thumbnail_id','0'),(47,41,'order','0'),(48,41,'display_type',''),(49,41,'thumbnail_id','0'),(50,42,'order','0'),(51,42,'display_type',''),(52,42,'thumbnail_id','0'),(53,43,'order','0'),(54,43,'display_type',''),(55,43,'thumbnail_id','0'),(56,44,'order','0'),(57,44,'display_type',''),(58,44,'thumbnail_id','0'),(59,45,'order','0'),(60,45,'display_type',''),(61,45,'thumbnail_id','0'),(62,46,'order','0'),(63,46,'display_type',''),(64,46,'thumbnail_id','0'),(65,47,'order','0'),(66,47,'display_type',''),(67,47,'thumbnail_id','0'),(68,48,'order','0'),(69,48,'display_type',''),(70,48,'thumbnail_id','0'),(71,49,'order','0'),(72,49,'display_type',''),(73,49,'thumbnail_id','0'),(74,50,'order','0'),(75,50,'display_type',''),(76,50,'thumbnail_id','0'),(77,51,'order','0'),(78,51,'display_type',''),(79,51,'thumbnail_id','0'),(80,52,'order','0'),(81,52,'display_type',''),(82,52,'thumbnail_id','0'),(83,53,'order','0'),(84,53,'display_type',''),(85,53,'thumbnail_id','0'),(86,54,'order','0'),(87,54,'display_type',''),(88,54,'thumbnail_id','0'),(89,55,'order','0'),(90,55,'display_type',''),(91,55,'thumbnail_id','0'),(92,56,'order','0'),(93,56,'display_type',''),(94,56,'thumbnail_id','0'),(95,57,'order','0'),(96,57,'display_type',''),(97,57,'thumbnail_id','0'),(98,58,'order','0'),(99,58,'display_type',''),(100,58,'thumbnail_id','0'),(101,59,'order','0'),(102,59,'display_type',''),(103,59,'thumbnail_id','0'),(104,60,'order','0'),(105,60,'display_type',''),(106,60,'thumbnail_id','0'),(107,61,'order','0'),(108,61,'display_type',''),(109,61,'thumbnail_id','0'),(110,36,'product_count_product_cat','6'),(111,35,'product_count_product_cat','1'),(112,58,'product_count_product_cat','1'),(113,59,'product_count_product_cat','1'),(114,34,'product_count_product_cat','1'),(115,52,'product_count_product_cat','1'),(116,49,'product_count_product_cat','1'),(117,47,'product_count_product_cat','1'),(118,50,'product_count_product_cat','1'),(119,54,'product_count_product_cat','1'),(120,51,'product_count_product_cat','1'),(121,48,'product_count_product_cat','1'),(122,57,'product_count_product_cat','1'),(123,45,'product_count_product_cat','1'),(124,53,'product_count_product_cat','1'),(125,56,'product_count_product_cat','1'),(126,55,'product_count_product_cat','1'),(127,46,'product_count_product_cat','1'),(128,32,'product_count_product_cat','1'),(129,38,'product_count_product_cat','1'),(130,37,'product_count_product_cat','1'),(131,40,'product_count_product_cat','1'),(132,39,'product_count_product_cat','1'),(133,60,'product_count_product_cat','1'),(134,61,'product_count_product_cat','1'),(135,33,'product_count_product_cat','1'),(136,42,'product_count_product_cat','1'),(137,41,'product_count_product_cat','1'),(138,44,'product_count_product_cat','1'),(139,43,'product_count_product_cat','1');
/*!40000 ALTER TABLE `wp_termmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_terms`
--

DROP TABLE IF EXISTS `wp_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_terms`
--

LOCK TABLES `wp_terms` WRITE;
/*!40000 ALTER TABLE `wp_terms` DISABLE KEYS */;
INSERT INTO `wp_terms` VALUES (1,'Uncategorized @sr','uncategorized-sr',0),(2,'Uncategorized','uncategorized',0),(3,'Optional','optional',0),(4,'Optional','optional-en',0),(5,'Required','required',0),(6,'Required','required-en',0),(7,'Not needed','not-needed',0),(8,'Not needed','not-needed-en',0),(9,'Header Menu','header-menu',0),(10,'simple','simple',0),(11,'grouped','grouped',0),(12,'variable','variable',0),(13,'external','external',0),(14,'exclude-from-search','exclude-from-search',0),(15,'exclude-from-catalog','exclude-from-catalog',0),(16,'featured','featured',0),(17,'outofstock','outofstock',0),(18,'rated-1','rated-1',0),(19,'rated-2','rated-2',0),(20,'rated-3','rated-3',0),(21,'rated-4','rated-4',0),(22,'rated-5','rated-5',0),(23,'Uncategorized','uncategorized',0),(28,'Ženski','zenski',0),(29,'Muški','muski',0),(30,'Footer Menu','footer-menu',0),(31,'Mega Menu Products','mega-menu-products',0),(32,'MUŠKA KOŽNA GALANTERIJA','muska-kozna-galanterija',0),(33,'ŽENSKA KOŽNA GALANTERIJA','zenska-kozna-galanterija',0),(34,'LUKSUZNI KOŽNI POVEZ','luksuzni-kozni-povez',0),(35,'KNJIGOVEZAČKI KOMERCIJALNI PROGRAM','knjigovezacki-komercijalni-program',0),(36,'RONCATO','roncato',0),(37,'Novčanici i futrole','novcanici-i-futrole',0),(38,'Kaiševi','kaisevi',0),(39,'Torbe','torbe',0),(40,'Ostala galanterija','ostala-galanterija',0),(41,'Novčanici i futrole','novcanici-i-futrole-2',0),(42,'Kaiševi','kaisevi-2',0),(43,'Torbe','torbe-2',0),(44,'Ostala galanterija','ostala-galanterija-2',0),(45,'Sveto pismo','sveto-pismo',0),(46,'Unikatno sveto pismo','unikatno-sveto-pismo',0),(47,'Jevanđelje','jevandelje',0),(48,'Kožni povez za crkvu','kozni-povez-za-crkvu',0),(49,'Foto albumi','foto-albumi',0),(50,'Knjige utisaka','knjige-utisaka',0),(51,'Kožni povez izdatih knjiga','kozni-povez-izdatih-knjiga',0),(52,'Dnevnik','dnevnik',0),(53,'Umetnički povez','umetnicki-povez',0),(54,'Korice za povelje i ugovore - Koža','korice-za-povelje-i-ugovore-koza',0),(55,'Unikatne kutije','unikatne-kutije',0),(56,'Umetnost','umetnost',0),(57,'Rotary','rotary',0),(58,'Kancelarijski materijal','kancelarijski-materijal',0),(59,'Opreme za hotele i restorane','opreme-za-hotele-i-restorane',0),(60,'Koferi','koferi',0),(61,'Novčanici','novcanici',0);
/*!40000 ALTER TABLE `wp_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_usermeta`
--

DROP TABLE IF EXISTS `wp_usermeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_usermeta`
--

LOCK TABLES `wp_usermeta` WRITE;
/*!40000 ALTER TABLE `wp_usermeta` DISABLE KEYS */;
INSERT INTO `wp_usermeta` VALUES (1,1,'nickname','Coa'),(2,1,'first_name',''),(3,1,'last_name',''),(4,1,'description',''),(5,1,'rich_editing','true'),(6,1,'syntax_highlighting','true'),(7,1,'comment_shortcuts','false'),(8,1,'admin_color','fresh'),(9,1,'use_ssl','0'),(10,1,'show_admin_bar_front','true'),(11,1,'locale','en_US'),(12,1,'wp_capabilities','a:17:{s:13:\"administrator\";b:1;s:34:\"wpml_manage_translation_management\";b:1;s:21:\"wpml_manage_languages\";b:1;s:41:\"wpml_manage_theme_and_plugin_localization\";b:1;s:19:\"wpml_manage_support\";b:1;s:36:\"wpml_manage_woocommerce_multilingual\";b:1;s:37:\"wpml_operate_woocommerce_multilingual\";b:1;s:29:\"wpml_manage_media_translation\";b:1;s:22:\"wpml_manage_navigation\";b:1;s:24:\"wpml_manage_sticky_links\";b:1;s:30:\"wpml_manage_string_translation\";b:1;s:33:\"wpml_manage_translation_analytics\";b:1;s:25:\"wpml_manage_wp_menus_sync\";b:1;s:32:\"wpml_manage_taxonomy_translation\";b:1;s:27:\"wpml_manage_troubleshooting\";b:1;s:31:\"wpml_manage_translation_options\";b:1;s:19:\"manage_translations\";b:1;}'),(13,1,'wp_user_level','10'),(14,1,'dismissed_wp_pointers',''),(15,1,'show_welcome_panel','0'),(16,1,'session_tokens','a:1:{s:64:\"7e903636732f68a3f6b9d989b5ebc99534d0c3e90796ffe87647cdb8abb51074\";a:4:{s:10:\"expiration\";i:1622209884;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0\";s:5:\"login\";i:1622037084;}}'),(17,1,'wp_dashboard_quick_press_last_post_id','4'),(18,1,'icl_admin_language_migrated_to_wp47','1'),(19,1,'icl_admin_language','en'),(20,1,'icl_show_hidden_languages','0'),(21,1,'icl_admin_language_for_edit','0'),(22,1,'wpml_block_new_email_notifications','0'),(23,2,'nickname','bu_user'),(24,2,'first_name','Aleksandar'),(25,2,'last_name','Simovic'),(26,2,'description',''),(27,2,'rich_editing','true'),(28,2,'syntax_highlighting','true'),(29,2,'comment_shortcuts','false'),(30,2,'admin_color','fresh'),(31,2,'use_ssl','0'),(32,2,'show_admin_bar_front','true'),(33,2,'locale','en_US'),(34,2,'wp_capabilities','a:2:{s:13:\"administrator\";b:1;s:19:\"manage_translations\";b:1;}'),(35,2,'wp_user_level','10'),(36,2,'dismissed_wp_pointers',''),(37,1,'wp_user-settings','libraryContent=browse&editor=tinymce&posts_list_mode=list&mfold=o&hidetb=0'),(38,1,'wp_user-settings-time','1622037081'),(39,1,'community-events-location','a:1:{s:2:\"ip\";s:9:\"127.0.0.0\";}'),(40,3,'nickname','vlada'),(41,3,'first_name',''),(42,3,'last_name',''),(43,3,'description',''),(44,3,'rich_editing','true'),(45,3,'syntax_highlighting','true'),(46,3,'comment_shortcuts','false'),(47,3,'admin_color','fresh'),(48,3,'use_ssl','0'),(49,3,'show_admin_bar_front','true'),(50,3,'locale','en_US'),(51,3,'wp_capabilities','a:2:{s:13:\"administrator\";b:1;s:9:\"translate\";b:1;}'),(52,3,'wp_user_level','10'),(53,3,'session_tokens','a:1:{s:64:\"97079140bd1bee17885ff32f433086c9a74985514332643b9e4fd122186c619d\";a:4:{s:10:\"expiration\";i:1623519263;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:114:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36\";s:5:\"login\";i:1622309663;}}'),(54,3,'icl_admin_language_migrated_to_wp47','1'),(55,3,'wp_dashboard_quick_press_last_post_id','16'),(56,3,'icl_admin_language','en'),(57,3,'icl_show_hidden_languages','0'),(58,3,'icl_admin_language_for_edit','0'),(59,3,'wpml_block_new_email_notifications','0'),(60,3,'wp_user-settings','libraryContent=browse'),(61,3,'wp_user-settings-time','1622310163'),(62,3,'managenav-menuscolumnshidden','a:5:{i:0;s:11:\"link-target\";i:1;s:11:\"css-classes\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";i:4;s:15:\"title-attribute\";}'),(63,3,'metaboxhidden_nav-menus','a:2:{i:0;s:12:\"add-post_tag\";i:1;s:15:\"add-post_format\";}'),(64,3,'wp_nav_menu_recently_edited','9'),(65,3,'_woocommerce_tracks_anon_id','woo:LMZfDwBJTBptVzZxkT4NX0oK'),(66,3,'last_update','1622310835'),(67,3,'woocommerce_admin_activity_panel_inbox_last_read','1622310833032'),(68,3,'wc_last_active','1622332800'),(69,3,'wp_language_pairs','a:1:{s:2:\"sr\";a:1:{s:2:\"sr\";i:1;}}'),(70,3,'_order_count','0'),(71,3,'closedpostboxes_post','a:0:{}'),(72,3,'metaboxhidden_post','a:7:{i:0;s:9:\"formatdiv\";i:1;s:16:\"tagsdiv-post_tag\";i:2;s:11:\"postexcerpt\";i:3;s:13:\"trackbacksdiv\";i:4;s:16:\"commentstatusdiv\";i:5;s:7:\"slugdiv\";i:6;s:9:\"authordiv\";}'),(73,3,'nav_menu_recently_edited','31');
/*!40000 ALTER TABLE `wp_usermeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_users`
--

DROP TABLE IF EXISTS `wp_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_users`
--

LOCK TABLES `wp_users` WRITE;
/*!40000 ALTER TABLE `wp_users` DISABLE KEYS */;
INSERT INTO `wp_users` VALUES (1,'Coa','$P$BM53el.DfRf3YVL8M/bbZR4jw97U.g0','coa','sasa.maravic@gmail.com','http://localhost/ivkovic','2021-05-20 06:55:08','',0,'Coa'),(2,'bu_user','$P$Biv.faV3DZjOX/PjZgqeO6wfPTyBG2/','bu_user','dev.simovic@gmail.com','','2021-05-20 07:25:26','',0,'Aleksandar Simovic'),(3,'vlada','$P$BVe6luSxHviojVtAB6OwLrC/F7goP./','vlada','vladimir.seder995@gmail.com','','2021-05-29 17:34:06','',0,'vlada');
/*!40000 ALTER TABLE `wp_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_wc_admin_note_actions`
--

DROP TABLE IF EXISTS `wp_wc_admin_note_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_wc_admin_note_actions` (
  `action_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `note_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `query` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `is_primary` tinyint(1) NOT NULL DEFAULT '0',
  `actioned_text` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`action_id`),
  KEY `note_id` (`note_id`)
) ENGINE=InnoDB AUTO_INCREMENT=346 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_admin_note_actions`
--

LOCK TABLES `wp_wc_admin_note_actions` WRITE;
/*!40000 ALTER TABLE `wp_wc_admin_note_actions` DISABLE KEYS */;
INSERT INTO `wp_wc_admin_note_actions` VALUES (20,19,'yes-please','Yes please!','https://woocommerce.us8.list-manage.com/subscribe/post?u=2c1434dc56f9506bf3c3ecd21&amp;id=13860df971&amp;SIGNUPPAGE=plugin','actioned',0,''),(21,20,'connect','Connect','?page=wc-addons&section=helper','unactioned',0,''),(79,21,'learn-more','Learn more','https://docs.woocommerce.com/document/variable-product/?utm_source=inbox','actioned',0,''),(327,1,'open_wc_paypal_payments_product_page','Learn more','https://woocommerce.com/products/woocommerce-paypal-payments/','actioned',1,''),(328,2,'upgrade_now_facebook_pixel_api','Upgrade now','plugin-install.php?tab=plugin-information&plugin=&section=changelog','actioned',1,''),(329,3,'learn_more_facebook_ec','Learn more','https://woocommerce.com/products/facebook/','unactioned',1,''),(330,4,'set-up-concierge','Schedule free session','https://wordpress.com/me/concierge','actioned',1,''),(331,5,'learn-more','Learn more','https://docs.woocommerce.com/document/woocommerce-shipping-and-tax/?utm_source=inbox','unactioned',1,''),(332,6,'learn-more-ecomm-unique-shopping-experience','Learn more','https://docs.woocommerce.com/document/product-add-ons/?utm_source=inbox','actioned',1,''),(333,7,'watch-the-webinar','Watch the webinar','https://youtu.be/V_2XtCOyZ7o','actioned',1,''),(334,8,'learn-more','Learn more','https://woocommerce.com/posts/ecommerce-shipping-solutions-guide/?utm_source=inbox','actioned',1,''),(335,9,'boost-sales-marketing-guide','See marketing guide','https://developer.apple.com/apple-pay/marketing/?utm_source=inbox&utm_campaign=square-boost-sales','actioned',1,''),(336,10,'grow-your-business-marketing-guide','See marketing guide','https://developer.apple.com/apple-pay/marketing/?utm_source=inbox&utm_campaign=square-grow-your-business','actioned',1,''),(337,11,'add-apple-pay','Add Apple Pay','/admin.php?page=wc-settings&tab=checkout&section=woocommerce_payments','actioned',1,''),(338,11,'learn-more','Learn more','https://docs.woocommerce.com/document/payments/apple-pay/?utm_source=inbox&utm_medium=product&utm_campaign=wcpay_applepay','actioned',1,''),(339,12,'boost-sales-marketing-guide','See marketing guide','https://developer.apple.com/apple-pay/marketing/?utm_source=inbox&utm_campaign=wcpay-boost-sales','actioned',1,''),(340,13,'grow-your-business-marketing-guide','See marketing guide','https://developer.apple.com/apple-pay/marketing/?utm_source=inbox&utm_campaign=wcpay-grow-your-business','actioned',1,''),(341,14,'optimizing-the-checkout-flow','Learn more','https://woocommerce.com/posts/optimizing-woocommerce-checkout?utm_source=inbox','actioned',1,''),(342,15,'learn-more','Learn more','https://woocommerce.com/posts/first-things-customize-woocommerce/?utm_source=inbox','unactioned',1,''),(343,16,'qualitative-feedback-from-new-users','Share feedback','https://automattic.survey.fm/wc-pay-new','actioned',1,''),(344,17,'share-feedback','Share feedback','http://automattic.survey.fm/paypal-feedback','unactioned',1,''),(345,18,'learn-more','Learn about Instant Deposits eligibility','https://docs.woocommerce.com/document/payments/instant-deposits/?utm_source=inbox&utm_medium=product&utm_campaign=wcpay_instant_deposits','actioned',1,'');
/*!40000 ALTER TABLE `wp_wc_admin_note_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_wc_admin_notes`
--

DROP TABLE IF EXISTS `wp_wc_admin_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_wc_admin_notes` (
  `note_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `locale` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `title` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `content_data` longtext COLLATE utf8mb4_unicode_520_ci,
  `status` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `source` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_reminder` datetime DEFAULT NULL,
  `is_snoozable` tinyint(1) NOT NULL DEFAULT '0',
  `layout` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `image` varchar(200) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `icon` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'info',
  PRIMARY KEY (`note_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_admin_notes`
--

LOCK TABLES `wp_wc_admin_notes` WRITE;
/*!40000 ALTER TABLE `wp_wc_admin_notes` DISABLE KEYS */;
INSERT INTO `wp_wc_admin_notes` VALUES (1,'paypal_ppcp_gtm_2021','marketing','en_US','Offer more options with the new PayPal','Get the latest PayPal extension for a full suite of payment methods with extensive currency and country coverage.','{}','pending','woocommerce.com','2021-05-28 07:53:28',NULL,0,'plain','',0,'info'),(2,'facebook_pixel_api_2021','marketing','en_US','Improve the performance of your Facebook ads','Enable Facebook Pixel and Conversions API through the latest version of Facebook for WooCommerce for improved measurement and ad targeting capabilities.','{}','pending','woocommerce.com','2021-05-28 07:53:28',NULL,0,'plain','',0,'info'),(3,'facebook_ec_2021','marketing','en_US','Sync your product catalog with Facebook to help boost sales','A single click adds all products to your Facebook Business Page shop. Product changes are automatically synced, with the flexibility to control which products are listed.','{}','pending','woocommerce.com','2021-05-28 07:53:28',NULL,0,'plain','',0,'info'),(4,'ecomm-need-help-setting-up-your-store','info','en_US','Need help setting up your Store?','Schedule a free 30-min <a href=\"https://wordpress.com/support/concierge-support/\">quick start session</a> and get help from our specialists. We’re happy to walk through setup steps, show you around the WordPress.com dashboard, troubleshoot any issues you may have, and help you the find the features you need to accomplish your goals for your site.','{}','pending','woocommerce.com','2021-05-28 07:53:28',NULL,0,'plain','',0,'info'),(5,'woocommerce-services','info','en_US','WooCommerce Shipping & Tax','WooCommerce Shipping &amp; Tax helps get your store “ready to sell” as quickly as possible. You create your products. We take care of tax calculation, payment processing, and shipping label printing! Learn more about the extension that you just installed.','{}','pending','woocommerce.com','2021-05-28 07:53:28',NULL,0,'plain','',0,'info'),(6,'ecomm-unique-shopping-experience','info','en_US','For a shopping experience as unique as your customers','Product Add-Ons allow your customers to personalize products while they’re shopping on your online store. No more follow-up email requests—customers get what they want, before they’re done checking out. Learn more about this extension that comes included in your plan.','{}','pending','woocommerce.com','2021-05-28 07:53:28',NULL,0,'plain','',0,'info'),(7,'wc-admin-getting-started-in-ecommerce','info','en_US','Getting Started in eCommerce - webinar','We want to make eCommerce and this process of getting started as easy as possible for you. Watch this webinar to get tips on how to have our store up and running in a breeze.','{}','pending','woocommerce.com','2021-05-28 07:53:28',NULL,0,'plain','',0,'info'),(8,'your-first-product','info','en_US','Your first product','That\'s huge! You\'re well on your way to building a successful online store — now it’s time to think about how you\'ll fulfill your orders.<br /><br />Read our shipping guide to learn best practices and options for putting together your shipping strategy. And for WooCommerce stores in the United States, you can print discounted shipping labels via USPS with <a href=\"https://href.li/?https://woocommerce.com/shipping\" target=\"_blank\">WooCommerce Shipping</a>.','{}','pending','woocommerce.com','2021-05-28 07:53:28',NULL,0,'plain','',0,'info'),(9,'wc-square-apple-pay-boost-sales','marketing','en_US','Boost sales with Apple Pay','Now that you accept Apple Pay® with Square you can increase conversion rates by letting your customers know that Apple Pay® is available. Here’s a marketing guide to help you get started.','{}','pending','woocommerce.com','2021-05-28 07:53:28',NULL,0,'plain','',0,'info'),(10,'wc-square-apple-pay-grow-your-business','marketing','en_US','Grow your business with Square and Apple Pay ','Now more than ever, shoppers want a fast, simple, and secure online checkout experience. Increase conversion rates by letting your customers know that you now accept Apple Pay®.','{}','pending','woocommerce.com','2021-05-28 07:53:28',NULL,0,'plain','',0,'info'),(11,'wcpay-apple-pay-is-now-available','marketing','en_US','Apple Pay is now available with WooCommerce Payments!','Increase your conversion rate by offering a fast and secure checkout with <a href=\"https://woocommerce.com/apple-pay/?utm_source=inbox&amp;utm_medium=product&amp;utm_campaign=wcpay_applepay\" target=\"_blank\">Apple Pay</a>®. It’s free to get started with <a href=\"https://woocommerce.com/payments/?utm_source=inbox&amp;utm_medium=product&amp;utm_campaign=wcpay_applepay\" target=\"_blank\">WooCommerce Payments</a>.','{}','pending','woocommerce.com','2021-05-28 07:53:28',NULL,0,'plain','',0,'info'),(12,'wcpay-apple-pay-boost-sales','marketing','en_US','Boost sales with Apple Pay','Now that you accept Apple Pay® with WooCommerce Payments you can increase conversion rates by letting your customers know that Apple Pay® is available. Here’s a marketing guide to help you get started.','{}','pending','woocommerce.com','2021-05-28 07:53:28',NULL,0,'plain','',0,'info'),(13,'wcpay-apple-pay-grow-your-business','marketing','en_US','Grow your business with WooCommerce Payments and Apple Pay','Now more than ever, shoppers want a fast, simple, and secure online checkout experience. Increase conversion rates by letting your customers know that you now accept Apple Pay®.','{}','pending','woocommerce.com','2021-05-28 07:53:28',NULL,0,'plain','',0,'info'),(14,'wc-admin-optimizing-the-checkout-flow','info','en_US','Optimizing the checkout flow','It\'s crucial to get your store\'s checkout as smooth as possible to avoid losing sales. Let\'s take a look at how you can optimize the checkout experience for your shoppers.','{}','pending','woocommerce.com','2021-05-28 07:53:28',NULL,0,'plain','',0,'info'),(15,'wc-admin-first-five-things-to-customize','info','en_US','The first 5 things to customize in your store','Deciding what to start with first is tricky. To help you properly prioritize, we\'ve put together this short list of the first few things you should customize in WooCommerce.','{}','pending','woocommerce.com','2021-05-28 07:53:28',NULL,0,'plain','',0,'info'),(16,'wc-payments-qualitative-feedback','info','en_US','WooCommerce Payments setup - let us know what you think','Congrats on enabling WooCommerce Payments for your store. Please share your feedback in this 2 minute survey to help us improve the setup process.','{}','pending','woocommerce.com','2021-05-28 07:53:28',NULL,0,'plain','',0,'info'),(17,'share-your-feedback-on-paypal','info','en_US','Share your feedback on PayPal','Share your feedback in this 2 minute survey about how we can make the process of accepting payments more useful for your store.','{}','pending','woocommerce.com','2021-05-28 07:53:28',NULL,0,'plain','',0,'info'),(18,'wcpay_instant_deposits_gtm_2021','marketing','en_US','Get paid within minutes – Instant Deposits for WooCommerce Payments','Stay flexible with immediate access to your funds when you need them – including nights, weekends, and holidays. With <a href=\"https://woocommerce.com/products/woocommerce-payments/?utm_source=inbox&amp;utm_medium=product&amp;utm_campaign=wcpay_instant_deposits\">WooCommerce Payments\'</a> new Instant Deposits feature, you’re able to transfer your earnings to a debit card within minutes.','{}','pending','woocommerce.com','2021-05-28 07:53:28',NULL,0,'plain','',0,'info'),(19,'wc-admin-onboarding-email-marketing','info','en_US','Sign up for tips, product updates, and inspiration','We\'re here for you - get tips, product updates and inspiration straight to your email box','{}','unactioned','woocommerce-admin','2021-05-29 17:53:29',NULL,0,'plain','',0,'info'),(20,'wc-admin-wc-helper-connection','info','en_US','Connect to WooCommerce.com','Connect to get important product notifications and updates.','{}','unactioned','woocommerce-admin','2021-05-29 17:53:29',NULL,0,'plain','',0,'info'),(21,'wc-admin-learn-more-about-variable-products','info','en_US','Learn more about variable products','Variable products are a powerful product type that lets you offer a set of variations on a product, with control over prices, stock, image and more for each variation. They can be used for a product like a shirt, where you can offer a large, medium and small and in different colors.','{}','unactioned','woocommerce-admin','2021-05-29 20:58:51',NULL,0,'plain','',0,'info');
/*!40000 ALTER TABLE `wp_wc_admin_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_wc_category_lookup`
--

DROP TABLE IF EXISTS `wp_wc_category_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_wc_category_lookup` (
  `category_tree_id` bigint(20) unsigned NOT NULL,
  `category_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`category_tree_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_category_lookup`
--

LOCK TABLES `wp_wc_category_lookup` WRITE;
/*!40000 ALTER TABLE `wp_wc_category_lookup` DISABLE KEYS */;
INSERT INTO `wp_wc_category_lookup` VALUES (23,23);
/*!40000 ALTER TABLE `wp_wc_category_lookup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_wc_customer_lookup`
--

DROP TABLE IF EXISTS `wp_wc_customer_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_wc_customer_lookup` (
  `customer_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `username` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `first_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `date_last_active` timestamp NULL DEFAULT NULL,
  `date_registered` timestamp NULL DEFAULT NULL,
  `country` char(2) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `postcode` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `city` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `state` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_customer_lookup`
--

LOCK TABLES `wp_wc_customer_lookup` WRITE;
/*!40000 ALTER TABLE `wp_wc_customer_lookup` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_wc_customer_lookup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_wc_download_log`
--

DROP TABLE IF EXISTS `wp_wc_download_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_wc_download_log` (
  `download_log_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` datetime NOT NULL,
  `permission_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `user_ip_address` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT '',
  PRIMARY KEY (`download_log_id`),
  KEY `permission_id` (`permission_id`),
  KEY `timestamp` (`timestamp`),
  CONSTRAINT `fk_wp_wc_download_log_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `wp_woocommerce_downloadable_product_permissions` (`permission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_download_log`
--

LOCK TABLES `wp_wc_download_log` WRITE;
/*!40000 ALTER TABLE `wp_wc_download_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_wc_download_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_wc_order_coupon_lookup`
--

DROP TABLE IF EXISTS `wp_wc_order_coupon_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_wc_order_coupon_lookup` (
  `order_id` bigint(20) unsigned NOT NULL,
  `coupon_id` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `discount_amount` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`,`coupon_id`),
  KEY `coupon_id` (`coupon_id`),
  KEY `date_created` (`date_created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_order_coupon_lookup`
--

LOCK TABLES `wp_wc_order_coupon_lookup` WRITE;
/*!40000 ALTER TABLE `wp_wc_order_coupon_lookup` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_wc_order_coupon_lookup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_wc_order_product_lookup`
--

DROP TABLE IF EXISTS `wp_wc_order_product_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_wc_order_product_lookup` (
  `order_item_id` bigint(20) unsigned NOT NULL,
  `order_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `variation_id` bigint(20) unsigned NOT NULL,
  `customer_id` bigint(20) unsigned DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `product_qty` int(11) NOT NULL,
  `product_net_revenue` double NOT NULL DEFAULT '0',
  `product_gross_revenue` double NOT NULL DEFAULT '0',
  `coupon_amount` double NOT NULL DEFAULT '0',
  `tax_amount` double NOT NULL DEFAULT '0',
  `shipping_amount` double NOT NULL DEFAULT '0',
  `shipping_tax_amount` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_item_id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  KEY `customer_id` (`customer_id`),
  KEY `date_created` (`date_created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_order_product_lookup`
--

LOCK TABLES `wp_wc_order_product_lookup` WRITE;
/*!40000 ALTER TABLE `wp_wc_order_product_lookup` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_wc_order_product_lookup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_wc_order_stats`
--

DROP TABLE IF EXISTS `wp_wc_order_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_wc_order_stats` (
  `order_id` bigint(20) unsigned NOT NULL,
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_created_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `num_items_sold` int(11) NOT NULL DEFAULT '0',
  `total_sales` double NOT NULL DEFAULT '0',
  `tax_total` double NOT NULL DEFAULT '0',
  `shipping_total` double NOT NULL DEFAULT '0',
  `net_total` double NOT NULL DEFAULT '0',
  `returning_customer` tinyint(1) DEFAULT NULL,
  `status` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `customer_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `date_created` (`date_created`),
  KEY `customer_id` (`customer_id`),
  KEY `status` (`status`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_order_stats`
--

LOCK TABLES `wp_wc_order_stats` WRITE;
/*!40000 ALTER TABLE `wp_wc_order_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_wc_order_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_wc_order_tax_lookup`
--

DROP TABLE IF EXISTS `wp_wc_order_tax_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_wc_order_tax_lookup` (
  `order_id` bigint(20) unsigned NOT NULL,
  `tax_rate_id` bigint(20) unsigned NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `shipping_tax` double NOT NULL DEFAULT '0',
  `order_tax` double NOT NULL DEFAULT '0',
  `total_tax` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`,`tax_rate_id`),
  KEY `tax_rate_id` (`tax_rate_id`),
  KEY `date_created` (`date_created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_order_tax_lookup`
--

LOCK TABLES `wp_wc_order_tax_lookup` WRITE;
/*!40000 ALTER TABLE `wp_wc_order_tax_lookup` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_wc_order_tax_lookup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_wc_product_meta_lookup`
--

DROP TABLE IF EXISTS `wp_wc_product_meta_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_wc_product_meta_lookup` (
  `product_id` bigint(20) NOT NULL,
  `sku` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT '',
  `virtual` tinyint(1) DEFAULT '0',
  `downloadable` tinyint(1) DEFAULT '0',
  `min_price` decimal(19,4) DEFAULT NULL,
  `max_price` decimal(19,4) DEFAULT NULL,
  `onsale` tinyint(1) DEFAULT '0',
  `stock_quantity` double DEFAULT NULL,
  `stock_status` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT 'instock',
  `rating_count` bigint(20) DEFAULT '0',
  `average_rating` decimal(3,2) DEFAULT '0.00',
  `total_sales` bigint(20) DEFAULT '0',
  `tax_status` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT 'taxable',
  `tax_class` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT '',
  PRIMARY KEY (`product_id`),
  KEY `virtual` (`virtual`),
  KEY `downloadable` (`downloadable`),
  KEY `stock_status` (`stock_status`),
  KEY `stock_quantity` (`stock_quantity`),
  KEY `onsale` (`onsale`),
  KEY `min_max_price` (`min_price`,`max_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_product_meta_lookup`
--

LOCK TABLES `wp_wc_product_meta_lookup` WRITE;
/*!40000 ALTER TABLE `wp_wc_product_meta_lookup` DISABLE KEYS */;
INSERT INTO `wp_wc_product_meta_lookup` VALUES (89,'',0,0,0.0000,0.0000,0,NULL,'instock',0,0.00,0,'taxable',''),(252,'',0,0,0.0000,0.0000,0,NULL,'instock',0,0.00,0,'taxable',''),(275,'',0,0,0.0000,0.0000,0,NULL,'instock',0,0.00,0,'taxable',''),(276,'',0,0,0.0000,0.0000,0,NULL,'instock',0,0.00,0,'taxable',''),(277,'',0,0,0.0000,0.0000,0,NULL,'instock',0,0.00,0,'taxable',''),(278,'',0,0,0.0000,0.0000,0,NULL,'instock',0,0.00,0,'taxable','');
/*!40000 ALTER TABLE `wp_wc_product_meta_lookup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_wc_reserved_stock`
--

DROP TABLE IF EXISTS `wp_wc_reserved_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_wc_reserved_stock` (
  `order_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `stock_quantity` double NOT NULL DEFAULT '0',
  `timestamp` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `expires` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`order_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_reserved_stock`
--

LOCK TABLES `wp_wc_reserved_stock` WRITE;
/*!40000 ALTER TABLE `wp_wc_reserved_stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_wc_reserved_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_wc_tax_rate_classes`
--

DROP TABLE IF EXISTS `wp_wc_tax_rate_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_wc_tax_rate_classes` (
  `tax_rate_class_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`tax_rate_class_id`),
  UNIQUE KEY `slug` (`slug`(191))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_tax_rate_classes`
--

LOCK TABLES `wp_wc_tax_rate_classes` WRITE;
/*!40000 ALTER TABLE `wp_wc_tax_rate_classes` DISABLE KEYS */;
INSERT INTO `wp_wc_tax_rate_classes` VALUES (1,'Reduced rate','reduced-rate'),(2,'Zero rate','zero-rate');
/*!40000 ALTER TABLE `wp_wc_tax_rate_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_wc_webhooks`
--

DROP TABLE IF EXISTS `wp_wc_webhooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_wc_webhooks` (
  `webhook_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `delivery_url` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `secret` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `topic` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_created_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `api_version` smallint(4) NOT NULL,
  `failure_count` smallint(10) NOT NULL DEFAULT '0',
  `pending_delivery` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`webhook_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_webhooks`
--

LOCK TABLES `wp_wc_webhooks` WRITE;
/*!40000 ALTER TABLE `wp_wc_webhooks` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_wc_webhooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_woocommerce_api_keys`
--

DROP TABLE IF EXISTS `wp_woocommerce_api_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_woocommerce_api_keys` (
  `key_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `description` varchar(200) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `permissions` varchar(10) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `consumer_key` char(64) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `consumer_secret` char(43) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `nonces` longtext COLLATE utf8mb4_unicode_520_ci,
  `truncated_key` char(7) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `last_access` datetime DEFAULT NULL,
  PRIMARY KEY (`key_id`),
  KEY `consumer_key` (`consumer_key`),
  KEY `consumer_secret` (`consumer_secret`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_api_keys`
--

LOCK TABLES `wp_woocommerce_api_keys` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_api_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_woocommerce_api_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_woocommerce_attribute_taxonomies`
--

DROP TABLE IF EXISTS `wp_woocommerce_attribute_taxonomies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_woocommerce_attribute_taxonomies` (
  `attribute_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `attribute_label` varchar(200) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `attribute_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `attribute_orderby` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `attribute_public` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`attribute_id`),
  KEY `attribute_name` (`attribute_name`(20))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_attribute_taxonomies`
--

LOCK TABLES `wp_woocommerce_attribute_taxonomies` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_attribute_taxonomies` DISABLE KEYS */;
INSERT INTO `wp_woocommerce_attribute_taxonomies` VALUES (1,'gender','Gender','select','menu_order',0);
/*!40000 ALTER TABLE `wp_woocommerce_attribute_taxonomies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_woocommerce_downloadable_product_permissions`
--

DROP TABLE IF EXISTS `wp_woocommerce_downloadable_product_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_woocommerce_downloadable_product_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `download_id` varchar(36) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `order_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `order_key` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `user_email` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `downloads_remaining` varchar(9) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `access_granted` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access_expires` datetime DEFAULT NULL,
  `download_count` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`permission_id`),
  KEY `download_order_key_product` (`product_id`,`order_id`,`order_key`(16),`download_id`),
  KEY `download_order_product` (`download_id`,`order_id`,`product_id`),
  KEY `order_id` (`order_id`),
  KEY `user_order_remaining_expires` (`user_id`,`order_id`,`downloads_remaining`,`access_expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_downloadable_product_permissions`
--

LOCK TABLES `wp_woocommerce_downloadable_product_permissions` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_downloadable_product_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_woocommerce_downloadable_product_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_woocommerce_log`
--

DROP TABLE IF EXISTS `wp_woocommerce_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_woocommerce_log` (
  `log_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` datetime NOT NULL,
  `level` smallint(4) NOT NULL,
  `source` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `context` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`log_id`),
  KEY `level` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_log`
--

LOCK TABLES `wp_woocommerce_log` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_woocommerce_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_woocommerce_order_itemmeta`
--

DROP TABLE IF EXISTS `wp_woocommerce_order_itemmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_woocommerce_order_itemmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_item_id` bigint(20) unsigned NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `order_item_id` (`order_item_id`),
  KEY `meta_key` (`meta_key`(32))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_order_itemmeta`
--

LOCK TABLES `wp_woocommerce_order_itemmeta` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_order_itemmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_woocommerce_order_itemmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_woocommerce_order_items`
--

DROP TABLE IF EXISTS `wp_woocommerce_order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_woocommerce_order_items` (
  `order_item_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_item_name` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `order_item_type` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `order_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_order_items`
--

LOCK TABLES `wp_woocommerce_order_items` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_woocommerce_order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_woocommerce_payment_tokenmeta`
--

DROP TABLE IF EXISTS `wp_woocommerce_payment_tokenmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_woocommerce_payment_tokenmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `payment_token_id` bigint(20) unsigned NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `payment_token_id` (`payment_token_id`),
  KEY `meta_key` (`meta_key`(32))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_payment_tokenmeta`
--

LOCK TABLES `wp_woocommerce_payment_tokenmeta` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_payment_tokenmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_woocommerce_payment_tokenmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_woocommerce_payment_tokens`
--

DROP TABLE IF EXISTS `wp_woocommerce_payment_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_woocommerce_payment_tokens` (
  `token_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gateway_id` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `token` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `type` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`token_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_payment_tokens`
--

LOCK TABLES `wp_woocommerce_payment_tokens` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_payment_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_woocommerce_payment_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_woocommerce_sessions`
--

DROP TABLE IF EXISTS `wp_woocommerce_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_woocommerce_sessions` (
  `session_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `session_key` char(32) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `session_value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `session_expiry` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`session_id`),
  UNIQUE KEY `session_key` (`session_key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_sessions`
--

LOCK TABLES `wp_woocommerce_sessions` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_sessions` DISABLE KEYS */;
INSERT INTO `wp_woocommerce_sessions` VALUES (1,'3','a:7:{s:4:\"cart\";s:6:\"a:0:{}\";s:11:\"cart_totals\";s:367:\"a:15:{s:8:\"subtotal\";i:0;s:12:\"subtotal_tax\";i:0;s:14:\"shipping_total\";i:0;s:12:\"shipping_tax\";i:0;s:14:\"shipping_taxes\";a:0:{}s:14:\"discount_total\";i:0;s:12:\"discount_tax\";i:0;s:19:\"cart_contents_total\";i:0;s:17:\"cart_contents_tax\";i:0;s:19:\"cart_contents_taxes\";a:0:{}s:9:\"fee_total\";i:0;s:7:\"fee_tax\";i:0;s:9:\"fee_taxes\";a:0:{}s:5:\"total\";i:0;s:9:\"total_tax\";i:0;}\";s:15:\"applied_coupons\";s:6:\"a:0:{}\";s:22:\"coupon_discount_totals\";s:6:\"a:0:{}\";s:26:\"coupon_discount_tax_totals\";s:6:\"a:0:{}\";s:21:\"removed_cart_contents\";s:6:\"a:0:{}\";s:8:\"customer\";s:745:\"a:26:{s:2:\"id\";s:1:\"3\";s:13:\"date_modified\";s:25:\"2021-05-29T19:53:55+02:00\";s:8:\"postcode\";s:0:\"\";s:4:\"city\";s:0:\"\";s:9:\"address_1\";s:0:\"\";s:7:\"address\";s:0:\"\";s:9:\"address_2\";s:0:\"\";s:5:\"state\";s:2:\"CA\";s:7:\"country\";s:2:\"US\";s:17:\"shipping_postcode\";s:0:\"\";s:13:\"shipping_city\";s:0:\"\";s:18:\"shipping_address_1\";s:0:\"\";s:16:\"shipping_address\";s:0:\"\";s:18:\"shipping_address_2\";s:0:\"\";s:14:\"shipping_state\";s:2:\"CA\";s:16:\"shipping_country\";s:2:\"US\";s:13:\"is_vat_exempt\";s:0:\"\";s:19:\"calculated_shipping\";s:0:\"\";s:10:\"first_name\";s:0:\"\";s:9:\"last_name\";s:0:\"\";s:7:\"company\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:5:\"email\";s:27:\"vladimir.seder995@gmail.com\";s:19:\"shipping_first_name\";s:0:\"\";s:18:\"shipping_last_name\";s:0:\"\";s:16:\"shipping_company\";s:0:\"\";}\";}',1622483643);
/*!40000 ALTER TABLE `wp_woocommerce_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_woocommerce_shipping_zone_locations`
--

DROP TABLE IF EXISTS `wp_woocommerce_shipping_zone_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_woocommerce_shipping_zone_locations` (
  `location_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `zone_id` bigint(20) unsigned NOT NULL,
  `location_code` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `location_type` varchar(40) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`location_id`),
  KEY `location_id` (`location_id`),
  KEY `location_type_code` (`location_type`(10),`location_code`(20))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_shipping_zone_locations`
--

LOCK TABLES `wp_woocommerce_shipping_zone_locations` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_shipping_zone_locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_woocommerce_shipping_zone_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_woocommerce_shipping_zone_methods`
--

DROP TABLE IF EXISTS `wp_woocommerce_shipping_zone_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_woocommerce_shipping_zone_methods` (
  `zone_id` bigint(20) unsigned NOT NULL,
  `instance_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `method_id` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `method_order` bigint(20) unsigned NOT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`instance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_shipping_zone_methods`
--

LOCK TABLES `wp_woocommerce_shipping_zone_methods` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_shipping_zone_methods` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_woocommerce_shipping_zone_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_woocommerce_shipping_zones`
--

DROP TABLE IF EXISTS `wp_woocommerce_shipping_zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_woocommerce_shipping_zones` (
  `zone_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `zone_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `zone_order` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`zone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_shipping_zones`
--

LOCK TABLES `wp_woocommerce_shipping_zones` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_shipping_zones` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_woocommerce_shipping_zones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_woocommerce_tax_rate_locations`
--

DROP TABLE IF EXISTS `wp_woocommerce_tax_rate_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_woocommerce_tax_rate_locations` (
  `location_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `location_code` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `tax_rate_id` bigint(20) unsigned NOT NULL,
  `location_type` varchar(40) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`location_id`),
  KEY `tax_rate_id` (`tax_rate_id`),
  KEY `location_type_code` (`location_type`(10),`location_code`(20))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_tax_rate_locations`
--

LOCK TABLES `wp_woocommerce_tax_rate_locations` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_tax_rate_locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_woocommerce_tax_rate_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_woocommerce_tax_rates`
--

DROP TABLE IF EXISTS `wp_woocommerce_tax_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_woocommerce_tax_rates` (
  `tax_rate_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tax_rate_country` varchar(2) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `tax_rate_state` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `tax_rate` varchar(8) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `tax_rate_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `tax_rate_priority` bigint(20) unsigned NOT NULL,
  `tax_rate_compound` int(1) NOT NULL DEFAULT '0',
  `tax_rate_shipping` int(1) NOT NULL DEFAULT '1',
  `tax_rate_order` bigint(20) unsigned NOT NULL,
  `tax_rate_class` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`tax_rate_id`),
  KEY `tax_rate_country` (`tax_rate_country`),
  KEY `tax_rate_state` (`tax_rate_state`(2)),
  KEY `tax_rate_class` (`tax_rate_class`(10)),
  KEY `tax_rate_priority` (`tax_rate_priority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_tax_rates`
--

LOCK TABLES `wp_woocommerce_tax_rates` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_tax_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_woocommerce_tax_rates` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-30 17:39:15