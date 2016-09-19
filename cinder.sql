-- MySQL dump 10.13  Distrib 5.5.52, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: cinder
-- ------------------------------------------------------
-- Server version	5.5.52-0ubuntu0.12.04.1

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
-- Table structure for table `backups`
--

DROP TABLE IF EXISTS `backups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backups` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `id` varchar(36) NOT NULL,
  `volume_id` varchar(36) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `project_id` varchar(255) DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  `availability_zone` varchar(255) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `display_description` varchar(255) DEFAULT NULL,
  `container` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `fail_reason` varchar(255) DEFAULT NULL,
  `service_metadata` varchar(255) DEFAULT NULL,
  `service` varchar(255) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `object_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backups`
--

LOCK TABLES `backups` WRITE;
/*!40000 ALTER TABLE `backups` DISABLE KEYS */;
/*!40000 ALTER TABLE `backups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encryption`
--

DROP TABLE IF EXISTS `encryption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `encryption` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `cipher` varchar(255) DEFAULT NULL,
  `control_location` varchar(255) NOT NULL,
  `key_size` int(11) DEFAULT NULL,
  `provider` varchar(255) NOT NULL,
  `volume_type_id` varchar(36) NOT NULL,
  PRIMARY KEY (`volume_type_id`),
  CONSTRAINT `encryption_ibfk_1` FOREIGN KEY (`volume_type_id`) REFERENCES `volume_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encryption`
--

LOCK TABLES `encryption` WRITE;
/*!40000 ALTER TABLE `encryption` DISABLE KEYS */;
/*!40000 ALTER TABLE `encryption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iscsi_targets`
--

DROP TABLE IF EXISTS `iscsi_targets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iscsi_targets` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target_num` int(11) DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  `volume_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `volume_id` (`volume_id`),
  CONSTRAINT `iscsi_targets_ibfk_1` FOREIGN KEY (`volume_id`) REFERENCES `volumes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iscsi_targets`
--

LOCK TABLES `iscsi_targets` WRITE;
/*!40000 ALTER TABLE `iscsi_targets` DISABLE KEYS */;
/*!40000 ALTER TABLE `iscsi_targets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrate_version`
--

DROP TABLE IF EXISTS `migrate_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrate_version` (
  `repository_id` varchar(250) NOT NULL,
  `repository_path` mediumtext,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`repository_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrate_version`
--

LOCK TABLES `migrate_version` WRITE;
/*!40000 ALTER TABLE `migrate_version` DISABLE KEYS */;
INSERT INTO `migrate_version` VALUES ('cinder','/usr/lib/python2.7/dist-packages/cinder/db/sqlalchemy/migrate_repo',22);
/*!40000 ALTER TABLE `migrate_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quality_of_service_specs`
--

DROP TABLE IF EXISTS `quality_of_service_specs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quality_of_service_specs` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `id` varchar(36) NOT NULL,
  `specs_id` varchar(36) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `specs_id` (`specs_id`),
  CONSTRAINT `quality_of_service_specs_ibfk_1` FOREIGN KEY (`specs_id`) REFERENCES `quality_of_service_specs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quality_of_service_specs`
--

LOCK TABLES `quality_of_service_specs` WRITE;
/*!40000 ALTER TABLE `quality_of_service_specs` DISABLE KEYS */;
/*!40000 ALTER TABLE `quality_of_service_specs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quota_classes`
--

DROP TABLE IF EXISTS `quota_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quota_classes` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) DEFAULT NULL,
  `resource` varchar(255) DEFAULT NULL,
  `hard_limit` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_quota_classes_class_name` (`class_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quota_classes`
--

LOCK TABLES `quota_classes` WRITE;
/*!40000 ALTER TABLE `quota_classes` DISABLE KEYS */;
INSERT INTO `quota_classes` VALUES ('2016-09-19 17:20:44',NULL,NULL,0,1,'default','volumes',10),('2016-09-19 17:20:44',NULL,NULL,0,2,'default','snapshots',10),('2016-09-19 17:20:44',NULL,NULL,0,3,'default','gigabytes',1000);
/*!40000 ALTER TABLE `quota_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quota_usages`
--

DROP TABLE IF EXISTS `quota_usages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quota_usages` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` varchar(255) DEFAULT NULL,
  `resource` varchar(255) DEFAULT NULL,
  `in_use` int(11) NOT NULL,
  `reserved` int(11) NOT NULL,
  `until_refresh` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_quota_usages_project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quota_usages`
--

LOCK TABLES `quota_usages` WRITE;
/*!40000 ALTER TABLE `quota_usages` DISABLE KEYS */;
INSERT INTO `quota_usages` VALUES ('2016-09-19 17:21:41','2016-09-19 17:31:21',NULL,0,1,'f80746e75ae748c28b0faaca963c33e3','gigabytes',1,0,NULL),('2016-09-19 17:21:41','2016-09-19 17:31:21',NULL,0,2,'f80746e75ae748c28b0faaca963c33e3','volumes',1,0,NULL),('2016-09-19 17:22:10','2016-09-19 17:27:36',NULL,0,3,'ca216ae7b5534e7ebbed3cf2d5077189','gigabytes',1,0,NULL),('2016-09-19 17:22:10','2016-09-19 17:27:36',NULL,0,4,'ca216ae7b5534e7ebbed3cf2d5077189','volumes',1,0,NULL);
/*!40000 ALTER TABLE `quota_usages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quotas`
--

DROP TABLE IF EXISTS `quotas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quotas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `project_id` varchar(255) DEFAULT NULL,
  `resource` varchar(255) NOT NULL,
  `hard_limit` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quotas`
--

LOCK TABLES `quotas` WRITE;
/*!40000 ALTER TABLE `quotas` DISABLE KEYS */;
/*!40000 ALTER TABLE `quotas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservations`
--

DROP TABLE IF EXISTS `reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservations` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `usage_id` int(11) NOT NULL,
  `project_id` varchar(255) DEFAULT NULL,
  `resource` varchar(255) DEFAULT NULL,
  `delta` int(11) NOT NULL,
  `expire` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usage_id` (`usage_id`),
  KEY `ix_reservations_project_id` (`project_id`),
  KEY `reservations_deleted_expire_idx` (`deleted`,`expire`),
  CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`usage_id`) REFERENCES `quota_usages` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservations`
--

LOCK TABLES `reservations` WRITE;
/*!40000 ALTER TABLE `reservations` DISABLE KEYS */;
INSERT INTO `reservations` VALUES ('2016-09-19 17:21:41','2016-09-19 17:21:41','2016-09-19 17:21:41',1,1,'bac3cee4-d54e-4c40-a3ba-b847cb006eed',1,'f80746e75ae748c28b0faaca963c33e3','gigabytes',1,'2016-09-20 17:21:41'),('2016-09-19 17:21:41','2016-09-19 17:21:41','2016-09-19 17:21:41',1,2,'a66a1b2d-4b87-43b3-b8ce-61c1ae9c0158',2,'f80746e75ae748c28b0faaca963c33e3','volumes',1,'2016-09-20 17:21:41'),('2016-09-19 17:22:10','2016-09-19 17:22:10','2016-09-19 17:22:10',1,3,'06a2a6d6-fecb-4a95-9ddd-123722c14f50',3,'ca216ae7b5534e7ebbed3cf2d5077189','gigabytes',1,'2016-09-20 17:22:10'),('2016-09-19 17:22:10','2016-09-19 17:22:10','2016-09-19 17:22:10',1,4,'8759ad36-10dc-4f6d-936c-da4591405d12',4,'ca216ae7b5534e7ebbed3cf2d5077189','volumes',1,'2016-09-20 17:22:10'),('2016-09-19 17:23:54','2016-09-19 17:23:54','2016-09-19 17:23:54',1,5,'f7bca4e8-7030-498f-839c-a73a6cf50a3a',3,'ca216ae7b5534e7ebbed3cf2d5077189','gigabytes',-1,'2016-09-20 17:23:54'),('2016-09-19 17:23:54','2016-09-19 17:23:54','2016-09-19 17:23:54',1,6,'602e7859-bd46-42ff-9fc2-54229eb406c5',4,'ca216ae7b5534e7ebbed3cf2d5077189','volumes',-1,'2016-09-20 17:23:54'),('2016-09-19 17:24:01','2016-09-19 17:24:01','2016-09-19 17:24:01',1,7,'4dcc135f-413b-48e8-bfe2-cc1c414c61bf',1,'f80746e75ae748c28b0faaca963c33e3','gigabytes',-1,'2016-09-20 17:24:01'),('2016-09-19 17:24:01','2016-09-19 17:24:01','2016-09-19 17:24:01',1,8,'bd7a0686-f856-4365-8c9e-04a8c5155cf0',2,'f80746e75ae748c28b0faaca963c33e3','volumes',-1,'2016-09-20 17:24:01'),('2016-09-19 17:24:08','2016-09-19 17:24:08','2016-09-19 17:24:08',1,9,'b994f44f-2963-4180-b9ca-77ec2d8345ba',3,'ca216ae7b5534e7ebbed3cf2d5077189','gigabytes',1,'2016-09-20 17:24:08'),('2016-09-19 17:24:08','2016-09-19 17:24:08','2016-09-19 17:24:08',1,10,'a0f99907-bfc1-4752-a997-84597749c9bd',4,'ca216ae7b5534e7ebbed3cf2d5077189','volumes',1,'2016-09-20 17:24:08'),('2016-09-19 17:26:43','2016-09-19 17:26:43','2016-09-19 17:26:43',1,11,'47714551-c8f7-4d51-9d03-131cd5478f71',3,'ca216ae7b5534e7ebbed3cf2d5077189','gigabytes',-1,'2016-09-20 17:26:43'),('2016-09-19 17:26:43','2016-09-19 17:26:43','2016-09-19 17:26:43',1,12,'91d3d32d-02a8-48f0-aa18-60e36bb0c9d3',4,'ca216ae7b5534e7ebbed3cf2d5077189','volumes',-1,'2016-09-20 17:26:43'),('2016-09-19 17:26:47','2016-09-19 17:26:47','2016-09-19 17:26:47',1,13,'261a798e-eaf9-47fd-a7ef-819de4307e2c',3,'ca216ae7b5534e7ebbed3cf2d5077189','gigabytes',1,'2016-09-20 17:26:47'),('2016-09-19 17:26:47','2016-09-19 17:26:47','2016-09-19 17:26:47',1,14,'f8146edf-ec92-4569-9ece-bbf6f9a18545',4,'ca216ae7b5534e7ebbed3cf2d5077189','volumes',1,'2016-09-20 17:26:47'),('2016-09-19 17:27:25','2016-09-19 17:27:26','2016-09-19 17:27:26',1,15,'c2e788fb-f6b8-453f-8770-b7a1a0327e38',3,'ca216ae7b5534e7ebbed3cf2d5077189','gigabytes',1,'2016-09-20 17:27:25'),('2016-09-19 17:27:25','2016-09-19 17:27:26','2016-09-19 17:27:26',1,16,'728d39c0-58ab-406a-98ad-e55a25e4c5fd',4,'ca216ae7b5534e7ebbed3cf2d5077189','volumes',1,'2016-09-20 17:27:25'),('2016-09-19 17:27:36','2016-09-19 17:27:36','2016-09-19 17:27:36',1,17,'e3699510-4d04-408a-83a5-4c159241d74f',3,'ca216ae7b5534e7ebbed3cf2d5077189','gigabytes',-1,'2016-09-20 17:27:36'),('2016-09-19 17:27:36','2016-09-19 17:27:36','2016-09-19 17:27:36',1,18,'2edb8118-8d51-4161-9180-55a53ea10f5f',4,'ca216ae7b5534e7ebbed3cf2d5077189','volumes',-1,'2016-09-20 17:27:36'),('2016-09-19 17:27:54','2016-09-19 17:27:54','2016-09-19 17:27:54',1,19,'77577ab1-519d-4058-ab5b-8bdb2570f436',1,'f80746e75ae748c28b0faaca963c33e3','gigabytes',1,'2016-09-20 17:27:53'),('2016-09-19 17:27:54','2016-09-19 17:27:54','2016-09-19 17:27:54',1,20,'2556e5ec-dc35-42be-99c5-285aa7d8e2a1',2,'f80746e75ae748c28b0faaca963c33e3','volumes',1,'2016-09-20 17:27:53'),('2016-09-19 17:31:06','2016-09-19 17:31:06','2016-09-19 17:31:06',1,21,'7b0ebe7e-4286-4b80-a422-c6ab9279e940',1,'f80746e75ae748c28b0faaca963c33e3','gigabytes',-1,'2016-09-20 17:31:06'),('2016-09-19 17:31:06','2016-09-19 17:31:06','2016-09-19 17:31:06',1,22,'090f90e3-dbe4-41b6-8894-2d43b7624ae3',2,'f80746e75ae748c28b0faaca963c33e3','volumes',-1,'2016-09-20 17:31:06'),('2016-09-19 17:31:21','2016-09-19 17:31:21','2016-09-19 17:31:21',1,23,'ea2df620-1997-4880-a4cb-0654f0db6e5f',1,'f80746e75ae748c28b0faaca963c33e3','gigabytes',1,'2016-09-20 17:31:21'),('2016-09-19 17:31:21','2016-09-19 17:31:21','2016-09-19 17:31:21',1,24,'628ee35d-76ab-4e12-99d5-bf7960ca847c',2,'f80746e75ae748c28b0faaca963c33e3','volumes',1,'2016-09-20 17:31:21');
/*!40000 ALTER TABLE `reservations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `host` varchar(255) DEFAULT NULL,
  `binary` varchar(255) DEFAULT NULL,
  `topic` varchar(255) DEFAULT NULL,
  `report_count` int(11) NOT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  `availability_zone` varchar(255) DEFAULT NULL,
  `disabled_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES ('2016-09-19 17:22:38','2016-09-19 17:37:32',NULL,0,1,'vagrant-ubuntu-precise-64','cinder-volume','cinder-volume',89,0,'nova',NULL),('2016-09-19 17:22:43','2016-09-19 17:37:33',NULL,0,2,'vagrant-ubuntu-precise-64','cinder-scheduler','cinder-scheduler',89,0,'nova',NULL);
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snapshot_metadata`
--

DROP TABLE IF EXISTS `snapshot_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snapshot_metadata` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `snapshot_id` varchar(36) NOT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `snapshot_id` (`snapshot_id`),
  CONSTRAINT `snapshot_metadata_ibfk_1` FOREIGN KEY (`snapshot_id`) REFERENCES `snapshots` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snapshot_metadata`
--

LOCK TABLES `snapshot_metadata` WRITE;
/*!40000 ALTER TABLE `snapshot_metadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `snapshot_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snapshots`
--

DROP TABLE IF EXISTS `snapshots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snapshots` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `id` varchar(36) NOT NULL,
  `volume_id` varchar(36) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `project_id` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `progress` varchar(255) DEFAULT NULL,
  `volume_size` int(11) DEFAULT NULL,
  `scheduled_at` datetime DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `display_description` varchar(255) DEFAULT NULL,
  `provider_location` varchar(255) DEFAULT NULL,
  `encryption_key_id` varchar(36) DEFAULT NULL,
  `volume_type_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `snapshots_volume_id_fkey` (`volume_id`),
  CONSTRAINT `snapshots_volume_id_fkey` FOREIGN KEY (`volume_id`) REFERENCES `volumes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snapshots`
--

LOCK TABLES `snapshots` WRITE;
/*!40000 ALTER TABLE `snapshots` DISABLE KEYS */;
/*!40000 ALTER TABLE `snapshots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transfers`
--

DROP TABLE IF EXISTS `transfers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transfers` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `id` varchar(36) NOT NULL,
  `volume_id` varchar(36) NOT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `crypt_hash` varchar(255) DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `volume_id` (`volume_id`),
  CONSTRAINT `transfers_ibfk_1` FOREIGN KEY (`volume_id`) REFERENCES `volumes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transfers`
--

LOCK TABLES `transfers` WRITE;
/*!40000 ALTER TABLE `transfers` DISABLE KEYS */;
/*!40000 ALTER TABLE `transfers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volume_admin_metadata`
--

DROP TABLE IF EXISTS `volume_admin_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volume_admin_metadata` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `volume_id` varchar(36) NOT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `volume_id` (`volume_id`),
  CONSTRAINT `volume_admin_metadata_ibfk_1` FOREIGN KEY (`volume_id`) REFERENCES `volumes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volume_admin_metadata`
--

LOCK TABLES `volume_admin_metadata` WRITE;
/*!40000 ALTER TABLE `volume_admin_metadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `volume_admin_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volume_glance_metadata`
--

DROP TABLE IF EXISTS `volume_glance_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volume_glance_metadata` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `volume_id` varchar(36) DEFAULT NULL,
  `snapshot_id` varchar(36) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` text,
  PRIMARY KEY (`id`),
  KEY `volume_id` (`volume_id`),
  KEY `snapshot_id` (`snapshot_id`),
  CONSTRAINT `volume_glance_metadata_ibfk_1` FOREIGN KEY (`volume_id`) REFERENCES `volumes` (`id`),
  CONSTRAINT `volume_glance_metadata_ibfk_2` FOREIGN KEY (`snapshot_id`) REFERENCES `snapshots` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volume_glance_metadata`
--

LOCK TABLES `volume_glance_metadata` WRITE;
/*!40000 ALTER TABLE `volume_glance_metadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `volume_glance_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volume_metadata`
--

DROP TABLE IF EXISTS `volume_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volume_metadata` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `volume_id` varchar(36) NOT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `volume_id` (`volume_id`),
  CONSTRAINT `volume_metadata_ibfk_1` FOREIGN KEY (`volume_id`) REFERENCES `volumes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volume_metadata`
--

LOCK TABLES `volume_metadata` WRITE;
/*!40000 ALTER TABLE `volume_metadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `volume_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volume_type_extra_specs`
--

DROP TABLE IF EXISTS `volume_type_extra_specs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volume_type_extra_specs` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `volume_type_id` varchar(36) NOT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `volume_type_extra_specs_ibfk_1` (`volume_type_id`),
  CONSTRAINT `volume_type_extra_specs_ibfk_1` FOREIGN KEY (`volume_type_id`) REFERENCES `volume_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volume_type_extra_specs`
--

LOCK TABLES `volume_type_extra_specs` WRITE;
/*!40000 ALTER TABLE `volume_type_extra_specs` DISABLE KEYS */;
/*!40000 ALTER TABLE `volume_type_extra_specs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volume_types`
--

DROP TABLE IF EXISTS `volume_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volume_types` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `id` varchar(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `qos_specs_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `qos_specs_id` (`qos_specs_id`),
  CONSTRAINT `volume_types_ibfk_1` FOREIGN KEY (`qos_specs_id`) REFERENCES `quality_of_service_specs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volume_types`
--

LOCK TABLES `volume_types` WRITE;
/*!40000 ALTER TABLE `volume_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `volume_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumes` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `id` varchar(36) NOT NULL,
  `ec2_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `project_id` varchar(255) DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `availability_zone` varchar(255) DEFAULT NULL,
  `instance_uuid` varchar(36) DEFAULT NULL,
  `mountpoint` varchar(255) DEFAULT NULL,
  `attach_time` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `attach_status` varchar(255) DEFAULT NULL,
  `scheduled_at` datetime DEFAULT NULL,
  `launched_at` datetime DEFAULT NULL,
  `terminated_at` datetime DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `display_description` varchar(255) DEFAULT NULL,
  `provider_location` varchar(256) DEFAULT NULL,
  `provider_auth` varchar(256) DEFAULT NULL,
  `snapshot_id` varchar(36) DEFAULT NULL,
  `volume_type_id` varchar(36) DEFAULT NULL,
  `source_volid` varchar(36) DEFAULT NULL,
  `bootable` tinyint(1) DEFAULT NULL,
  `attached_host` varchar(255) DEFAULT NULL,
  `provider_geometry` varchar(255) DEFAULT NULL,
  `_name_id` varchar(36) DEFAULT NULL,
  `encryption_key_id` varchar(36) DEFAULT NULL,
  `migration_status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
INSERT INTO `volumes` VALUES ('2016-09-19 17:27:54','2016-09-19 17:31:06','2016-09-19 17:31:06',1,'12c9e6cd-a5e2-43a8-b7ca-1ed13cad7f0f',NULL,'3688a6a60b0d49a38d15db3079765e1b','f80746e75ae748c28b0faaca963c33e3','vagrant-ubuntu-precise-64',1,'nova',NULL,NULL,NULL,'deleted','detached','2016-09-19 17:27:54',NULL,'2016-09-19 17:31:06','demo-1g',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),('2016-09-19 17:22:10',NULL,'2016-09-19 17:23:54',1,'34f3dff8-92b7-4085-8e30-c342cfabf712',NULL,'126bc9abd49d496ab45f349ecd783330','ca216ae7b5534e7ebbed3cf2d5077189',NULL,1,'nova',NULL,NULL,NULL,'deleted','detached',NULL,NULL,NULL,'admin-1g',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),('2016-09-19 17:27:25','2016-09-19 17:27:26',NULL,0,'7007592f-4766-4b06-a34b-f42eedb7f9d7',NULL,'126bc9abd49d496ab45f349ecd783330','ca216ae7b5534e7ebbed3cf2d5077189','vagrant-ubuntu-precise-64',1,'nova',NULL,NULL,NULL,'available','detached','2016-09-19 17:27:26','2016-09-19 17:27:26',NULL,'admin-1g',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),('2016-09-19 17:21:41',NULL,'2016-09-19 17:24:01',1,'77684586-ad0f-4c42-90c4-dd1e35f22ae8',NULL,'3688a6a60b0d49a38d15db3079765e1b','f80746e75ae748c28b0faaca963c33e3',NULL,1,'nova',NULL,NULL,NULL,'deleted','detached',NULL,NULL,NULL,'demo-1g',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),('2016-09-19 17:26:47','2016-09-19 17:26:47','2016-09-19 17:27:36',1,'7ea55a70-14bf-40f1-9f2c-9abefa25bd3f',NULL,'126bc9abd49d496ab45f349ecd783330','ca216ae7b5534e7ebbed3cf2d5077189',NULL,1,'nova',NULL,NULL,NULL,'deleted','detached',NULL,NULL,NULL,'admin-1g',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),('2016-09-19 17:24:08','2016-09-19 17:24:08','2016-09-19 17:26:43',1,'f449902b-9f32-483c-83f1-3efbd9f07303',NULL,'126bc9abd49d496ab45f349ecd783330','ca216ae7b5534e7ebbed3cf2d5077189',NULL,1,'nova',NULL,NULL,NULL,'deleted','detached',NULL,NULL,NULL,'admin-1g',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),('2016-09-19 17:31:21','2016-09-19 17:31:21',NULL,0,'f71149c3-44c0-47f0-8c64-6dcedf753bd6',NULL,'3688a6a60b0d49a38d15db3079765e1b','f80746e75ae748c28b0faaca963c33e3','vagrant-ubuntu-precise-64',1,'nova',NULL,NULL,NULL,'available','detached','2016-09-19 17:31:21','2016-09-19 17:31:21',NULL,'demo-1g',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-19 17:37:36
