-- MySQL dump 10.13  Distrib 5.5.52, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: keystone
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
-- Table structure for table `assignment`
--

DROP TABLE IF EXISTS `assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assignment` (
  `type` enum('UserProject','GroupProject','UserDomain','GroupDomain') NOT NULL,
  `actor_id` varchar(64) NOT NULL,
  `target_id` varchar(64) NOT NULL,
  `role_id` varchar(64) NOT NULL,
  `inherited` tinyint(1) NOT NULL,
  PRIMARY KEY (`type`,`actor_id`,`target_id`,`role_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `assignment_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment`
--

LOCK TABLES `assignment` WRITE;
/*!40000 ALTER TABLE `assignment` DISABLE KEYS */;
INSERT INTO `assignment` VALUES ('UserProject','28d16fa0461d4a7dbfea238e70534460','62c092ccba1c49d7b7a239d08c5ce0c2','9fe2ff9ee4384b1894a90878d3e92bab',0),('UserProject','7ddaf5f867ea42c5be60d6fb59d00144','e1b16b13a68a462abdbcc8dbc53c518c','280d416875ef40a4bc9928e56f519b79',0),('UserProject','ac42fa83e52947fe8a827bdd0e4ec89b','df6e891fad5b4acd9e67759e5db5b027','280d416875ef40a4bc9928e56f519b79',0);
/*!40000 ALTER TABLE `assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credential`
--

DROP TABLE IF EXISTS `credential`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credential` (
  `id` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `project_id` varchar(64) DEFAULT NULL,
  `blob` text NOT NULL,
  `type` varchar(255) NOT NULL,
  `extra` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credential`
--

LOCK TABLES `credential` WRITE;
/*!40000 ALTER TABLE `credential` DISABLE KEYS */;
/*!40000 ALTER TABLE `credential` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `domain`
--

DROP TABLE IF EXISTS `domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domain` (
  `id` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `extra` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domain`
--

LOCK TABLES `domain` WRITE;
/*!40000 ALTER TABLE `domain` DISABLE KEYS */;
INSERT INTO `domain` VALUES ('default','Default',1,'{\"description\": \"Owns users and tenants (i.e. projects) available on Identity API v2.\"}');
/*!40000 ALTER TABLE `domain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endpoint`
--

DROP TABLE IF EXISTS `endpoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `endpoint` (
  `id` varchar(64) NOT NULL,
  `legacy_endpoint_id` varchar(64) DEFAULT NULL,
  `interface` varchar(8) NOT NULL,
  `region` varchar(255) DEFAULT NULL,
  `service_id` varchar(64) NOT NULL,
  `url` text NOT NULL,
  `extra` text,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `endpoint_service_id_fkey` (`service_id`),
  CONSTRAINT `endpoint_service_id_fkey` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endpoint`
--

LOCK TABLES `endpoint` WRITE;
/*!40000 ALTER TABLE `endpoint` DISABLE KEYS */;
INSERT INTO `endpoint` VALUES ('302e1e0314bd41bcaef39d820082ad94','b4f640258a4a4f518db8a62fc9924e12','internal','regionOne','8950c0ca328044bfb897f38a914afcaf','http://localhost:8776/v1/%(tenant_id)s','{}',1),('743028cfed5a47799e1f620c145520cd','b4f640258a4a4f518db8a62fc9924e12','public','regionOne','8950c0ca328044bfb897f38a914afcaf','http://localhost:8776/v1/%(tenant_id)s','{}',1),('74d49f267788433abed047749a03140f','b4f640258a4a4f518db8a62fc9924e12','admin','regionOne','8950c0ca328044bfb897f38a914afcaf','http://localhost:8776/v1/%(tenant_id)s','{}',1),('758e577e3bde4ac3a8b408e9cc626646','eca84b42ec2d4476a724e2f559ad3dcb','admin','regionOne','ca0e764cce0c4ac699e5b3fb154d5a50','http://localhost:8776/v2/%(tenant_id)s','{}',1),('8c272b1faa2b48ce9c5f28258488c5b1','b41b443758c041ccbb0baac460164782','internal','regionOne','7e241f1cd9aa4eb09af20aa5cf0cf32d','http://localhost:5000/v2.0','{}',1),('bb1f1f5e0f334e30b86b51906431a5ff','eca84b42ec2d4476a724e2f559ad3dcb','internal','regionOne','ca0e764cce0c4ac699e5b3fb154d5a50','http://localhost:8776/v2/%(tenant_id)s','{}',1),('be0fd498bb9b4fe398cc21e743ba5a32','b41b443758c041ccbb0baac460164782','public','regionOne','7e241f1cd9aa4eb09af20aa5cf0cf32d','http://localhost:5000/v2.0','{}',1),('f27ee26d15434b3094abea90e7657fbf','eca84b42ec2d4476a724e2f559ad3dcb','public','regionOne','ca0e764cce0c4ac699e5b3fb154d5a50','http://localhost:8776/v2/%(tenant_id)s','{}',1),('f408684e4ba4424ab7832c4e6c04b393','b41b443758c041ccbb0baac460164782','admin','regionOne','7e241f1cd9aa4eb09af20aa5cf0cf32d','http://localhost:35357/v2.0','{}',1);
/*!40000 ALTER TABLE `endpoint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group` (
  `id` varchar(64) NOT NULL,
  `domain_id` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` text,
  `extra` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `domain_id` (`domain_id`,`name`),
  CONSTRAINT `group_ibfk_1` FOREIGN KEY (`domain_id`) REFERENCES `domain` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrate_version`
--

DROP TABLE IF EXISTS `migrate_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrate_version` (
  `repository_id` varchar(250) NOT NULL,
  `repository_path` text,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`repository_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrate_version`
--

LOCK TABLES `migrate_version` WRITE;
/*!40000 ALTER TABLE `migrate_version` DISABLE KEYS */;
INSERT INTO `migrate_version` VALUES ('keystone','/usr/lib/python2.7/dist-packages/keystone/common/sql/migrate_repo',44);
/*!40000 ALTER TABLE `migrate_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `policy`
--

DROP TABLE IF EXISTS `policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `policy` (
  `id` varchar(64) NOT NULL,
  `type` varchar(255) NOT NULL,
  `blob` text NOT NULL,
  `extra` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `policy`
--

LOCK TABLES `policy` WRITE;
/*!40000 ALTER TABLE `policy` DISABLE KEYS */;
/*!40000 ALTER TABLE `policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `id` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `extra` text,
  `description` text,
  `enabled` tinyint(1) DEFAULT NULL,
  `domain_id` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `domain_id` (`domain_id`,`name`),
  CONSTRAINT `project_ibfk_1` FOREIGN KEY (`domain_id`) REFERENCES `domain` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES ('62c092ccba1c49d7b7a239d08c5ce0c2','demo','{}','Demo Tenant',1,'default'),('df6e891fad5b4acd9e67759e5db5b027','admin','{}',NULL,1,'default'),('e1b16b13a68a462abdbcc8dbc53c518c','service','{}','Service Tenant',1,'default');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region` (
  `id` varchar(64) NOT NULL,
  `description` varchar(255) NOT NULL,
  `parent_region_id` varchar(64) DEFAULT NULL,
  `extra` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` varchar(64) NOT NULL,
  `name` varchar(255) NOT NULL,
  `extra` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES ('280d416875ef40a4bc9928e56f519b79','admin','{}'),('9fe2ff9ee4384b1894a90878d3e92bab','_member_','{\"enabled\": \"True\", \"description\": \"Default role for project membership\"}');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service` (
  `id` varchar(64) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `extra` mediumtext,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` VALUES ('7e241f1cd9aa4eb09af20aa5cf0cf32d','identity','{\"name\": \"keystone\", \"description\": \"OpenStack Identity\"}',1),('8950c0ca328044bfb897f38a914afcaf','volume','{\"name\": \"cinder\", \"description\": \"OpenStack Block Storage\"}',1),('ca0e764cce0c4ac699e5b3fb154d5a50','volumev2','{\"name\": \"cinderv2\", \"description\": \"OpenStack Block Storage\"}',1);
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `token` (
  `id` varchar(64) NOT NULL,
  `expires` datetime DEFAULT NULL,
  `extra` mediumtext,
  `valid` tinyint(1) NOT NULL,
  `trust_id` varchar(64) DEFAULT NULL,
  `user_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_token_expires` (`expires`),
  KEY `ix_token_expires_valid` (`expires`,`valid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` VALUES ('094fab24fddc1074f7a2d33011e71eff','2016-09-19 20:44:03','{\"bind\": null, \"token_data\": {\"access\": {\"token\": {\"issued_at\": \"2016-09-19T19:44:03.894908\", \"expires\": \"2016-09-19T20:44:03Z\", \"id\": \"MIIHjgYJKoZIhvcNAQcCoIIHfzCCB3sCAQExCTAHBgUrDgMCGjCCBeQGCSqGSIb3DQEHAaCCBdUEggXReyJhY2Nlc3MiOiB7InRva2VuIjogeyJpc3N1ZWRfYXQiOiAiMjAxNi0wOS0xOVQxOTo0NDowMy44OTQ5MDgiLCAiZXhwaXJlcyI6ICIyMDE2LTA5LTE5VDIwOjQ0OjAzWiIsICJpZCI6ICJwbGFjZWhvbGRlciIsICJ0ZW5hbnQiOiB7ImRlc2NyaXB0aW9uIjogIkRlbW8gVGVuYW50IiwgImVuYWJsZWQiOiB0cnVlLCAiaWQiOiAiNjJjMDkyY2NiYTFjNDlkN2I3YTIzOWQwOGM1Y2UwYzIiLCAibmFtZSI6ICJkZW1vIn19LCAic2VydmljZUNhdGFsb2ciOiBbeyJlbmRwb2ludHMiOiBbeyJhZG1pblVSTCI6ICJodHRwOi8vbG9jYWxob3N0Ojg3NzYvdjEvNjJjMDkyY2NiYTFjNDlkN2I3YTIzOWQwOGM1Y2UwYzIiLCAicmVnaW9uIjogInJlZ2lvbk9uZSIsICJpbnRlcm5hbFVSTCI6ICJodHRwOi8vbG9jYWxob3N0Ojg3NzYvdjEvNjJjMDkyY2NiYTFjNDlkN2I3YTIzOWQwOGM1Y2UwYzIiLCAiaWQiOiAiMzAyZTFlMDMxNGJkNDFiY2FlZjM5ZDgyMDA4MmFkOTQiLCAicHVibGljVVJMIjogImh0dHA6Ly9sb2NhbGhvc3Q6ODc3Ni92MS82MmMwOTJjY2JhMWM0OWQ3YjdhMjM5ZDA4YzVjZTBjMiJ9XSwgImVuZHBvaW50c19saW5rcyI6IFtdLCAidHlwZSI6ICJ2b2x1bWUiLCAibmFtZSI6ICJjaW5kZXIifSwgeyJlbmRwb2ludHMiOiBbeyJhZG1pblVSTCI6ICJodHRwOi8vbG9jYWxob3N0Ojg3NzYvdjIvNjJjMDkyY2NiYTFjNDlkN2I3YTIzOWQwOGM1Y2UwYzIiLCAicmVnaW9uIjogInJlZ2lvbk9uZSIsICJpbnRlcm5hbFVSTCI6ICJodHRwOi8vbG9jYWxob3N0Ojg3NzYvdjIvNjJjMDkyY2NiYTFjNDlkN2I3YTIzOWQwOGM1Y2UwYzIiLCAiaWQiOiAiNzU4ZTU3N2UzYmRlNGFjM2E4YjQwOGU5Y2M2MjY2NDYiLCAicHVibGljVVJMIjogImh0dHA6Ly9sb2NhbGhvc3Q6ODc3Ni92Mi82MmMwOTJjY2JhMWM0OWQ3YjdhMjM5ZDA4YzVjZTBjMiJ9XSwgImVuZHBvaW50c19saW5rcyI6IFtdLCAidHlwZSI6ICJ2b2x1bWV2MiIsICJuYW1lIjogImNpbmRlcnYyIn0sIHsiZW5kcG9pbnRzIjogW3siYWRtaW5VUkwiOiAiaHR0cDovL2xvY2FsaG9zdDozNTM1Ny92Mi4wIiwgInJlZ2lvbiI6ICJyZWdpb25PbmUiLCAiaW50ZXJuYWxVUkwiOiAiaHR0cDovL2xvY2FsaG9zdDo1MDAwL3YyLjAiLCAiaWQiOiAiOGMyNzJiMWZhYTJiNDhjZTljNWYyODI1ODQ4OGM1YjEiLCAicHVibGljVVJMIjogImh0dHA6Ly9sb2NhbGhvc3Q6NTAwMC92Mi4wIn1dLCAiZW5kcG9pbnRzX2xpbmtzIjogW10sICJ0eXBlIjogImlkZW50aXR5IiwgIm5hbWUiOiAia2V5c3RvbmUifV0sICJ1c2VyIjogeyJ1c2VybmFtZSI6ICJkZW1vIiwgInJvbGVzX2xpbmtzIjogW10sICJpZCI6ICIyOGQxNmZhMDQ2MWQ0YTdkYmZlYTIzOGU3MDUzNDQ2MCIsICJyb2xlcyI6IFt7Im5hbWUiOiAiX21lbWJlcl8ifV0sICJuYW1lIjogImRlbW8ifSwgIm1ldGFkYXRhIjogeyJpc19hZG1pbiI6IDAsICJyb2xlcyI6IFsiOWZlMmZmOWVlNDM4NGIxODk0YTkwODc4ZDNlOTJiYWIiXX19fTGCAYEwggF9AgEBMFwwVzELMAkGA1UEBhMCVVMxDjAMBgNVBAgMBVVuc2V0MQ4wDAYDVQQHDAVVbnNldDEOMAwGA1UECgwFVW5zZXQxGDAWBgNVBAMMD3d3dy5leGFtcGxlLmNvbQIBATAHBgUrDgMCGjANBgkqhkiG9w0BAQEFAASCAQAEckxhi75az0NDCqBoGG40otWHzCjaRVs6g3LGmLwzD7MNicCyG0Fq9USDvrJBkS7WHooKqDEgQ+OQrFCO0ITmtSDMb1q2AenkzlzoccEUryAflCW0-bFMkgVV3vCA+aNI5HMPwrbOyADN6bzaOBJKx9bbQb4DepW23vjGJ8TaU01vdjzoX+KjZHfiyKc4Lg7gG5eFsc8Lg4BP7575iTAzQ8QrlkLeNGQAbq8pASTjJxgAjQ2Da1UGRd7iSGJk9TKYknDTyuByh5F2vzYcld1GdJniH1d8FFp0tpeO7eghwiz4t5E-ORrXf2Y7ix2K0uAA19GAXFs8qqAc1XfqU1ac\", \"tenant\": {\"id\": \"62c092ccba1c49d7b7a239d08c5ce0c2\", \"enabled\": true, \"description\": \"Demo Tenant\", \"name\": \"demo\"}}, \"serviceCatalog\": [{\"endpoints\": [{\"adminURL\": \"http://localhost:8776/v1/62c092ccba1c49d7b7a239d08c5ce0c2\", \"region\": \"regionOne\", \"id\": \"302e1e0314bd41bcaef39d820082ad94\", \"internalURL\": \"http://localhost:8776/v1/62c092ccba1c49d7b7a239d08c5ce0c2\", \"publicURL\": \"http://localhost:8776/v1/62c092ccba1c49d7b7a239d08c5ce0c2\"}], \"endpoints_links\": [], \"type\": \"volume\", \"name\": \"cinder\"}, {\"endpoints\": [{\"adminURL\": \"http://localhost:8776/v2/62c092ccba1c49d7b7a239d08c5ce0c2\", \"region\": \"regionOne\", \"id\": \"758e577e3bde4ac3a8b408e9cc626646\", \"internalURL\": \"http://localhost:8776/v2/62c092ccba1c49d7b7a239d08c5ce0c2\", \"publicURL\": \"http://localhost:8776/v2/62c092ccba1c49d7b7a239d08c5ce0c2\"}], \"endpoints_links\": [], \"type\": \"volumev2\", \"name\": \"cinderv2\"}, {\"endpoints\": [{\"adminURL\": \"http://localhost:35357/v2.0\", \"region\": \"regionOne\", \"id\": \"8c272b1faa2b48ce9c5f28258488c5b1\", \"internalURL\": \"http://localhost:5000/v2.0\", \"publicURL\": \"http://localhost:5000/v2.0\"}], \"endpoints_links\": [], \"type\": \"identity\", \"name\": \"keystone\"}], \"user\": {\"username\": \"demo\", \"roles_links\": [], \"id\": \"28d16fa0461d4a7dbfea238e70534460\", \"roles\": [{\"name\": \"_member_\"}], \"name\": \"demo\"}, \"metadata\": {\"is_admin\": 0, \"roles\": [\"9fe2ff9ee4384b1894a90878d3e92bab\"]}}}, \"user\": {\"username\": \"demo\", \"name\": \"demo\", \"enabled\": true, \"id\": \"28d16fa0461d4a7dbfea238e70534460\", \"tenantId\": \"62c092ccba1c49d7b7a239d08c5ce0c2\", \"email\": \"alop@localhost\"}, \"key\": \"MIIHjgYJKoZIhvcNAQcCoIIHfzCCB3sCAQExCTAHBgUrDgMCGjCCBeQGCSqGSIb3DQEHAaCCBdUEggXReyJhY2Nlc3MiOiB7InRva2VuIjogeyJpc3N1ZWRfYXQiOiAiMjAxNi0wOS0xOVQxOTo0NDowMy44OTQ5MDgiLCAiZXhwaXJlcyI6ICIyMDE2LTA5LTE5VDIwOjQ0OjAzWiIsICJpZCI6ICJwbGFjZWhvbGRlciIsICJ0ZW5hbnQiOiB7ImRlc2NyaXB0aW9uIjogIkRlbW8gVGVuYW50IiwgImVuYWJsZWQiOiB0cnVlLCAiaWQiOiAiNjJjMDkyY2NiYTFjNDlkN2I3YTIzOWQwOGM1Y2UwYzIiLCAibmFtZSI6ICJkZW1vIn19LCAic2VydmljZUNhdGFsb2ciOiBbeyJlbmRwb2ludHMiOiBbeyJhZG1pblVSTCI6ICJodHRwOi8vbG9jYWxob3N0Ojg3NzYvdjEvNjJjMDkyY2NiYTFjNDlkN2I3YTIzOWQwOGM1Y2UwYzIiLCAicmVnaW9uIjogInJlZ2lvbk9uZSIsICJpbnRlcm5hbFVSTCI6ICJodHRwOi8vbG9jYWxob3N0Ojg3NzYvdjEvNjJjMDkyY2NiYTFjNDlkN2I3YTIzOWQwOGM1Y2UwYzIiLCAiaWQiOiAiMzAyZTFlMDMxNGJkNDFiY2FlZjM5ZDgyMDA4MmFkOTQiLCAicHVibGljVVJMIjogImh0dHA6Ly9sb2NhbGhvc3Q6ODc3Ni92MS82MmMwOTJjY2JhMWM0OWQ3YjdhMjM5ZDA4YzVjZTBjMiJ9XSwgImVuZHBvaW50c19saW5rcyI6IFtdLCAidHlwZSI6ICJ2b2x1bWUiLCAibmFtZSI6ICJjaW5kZXIifSwgeyJlbmRwb2ludHMiOiBbeyJhZG1pblVSTCI6ICJodHRwOi8vbG9jYWxob3N0Ojg3NzYvdjIvNjJjMDkyY2NiYTFjNDlkN2I3YTIzOWQwOGM1Y2UwYzIiLCAicmVnaW9uIjogInJlZ2lvbk9uZSIsICJpbnRlcm5hbFVSTCI6ICJodHRwOi8vbG9jYWxob3N0Ojg3NzYvdjIvNjJjMDkyY2NiYTFjNDlkN2I3YTIzOWQwOGM1Y2UwYzIiLCAiaWQiOiAiNzU4ZTU3N2UzYmRlNGFjM2E4YjQwOGU5Y2M2MjY2NDYiLCAicHVibGljVVJMIjogImh0dHA6Ly9sb2NhbGhvc3Q6ODc3Ni92Mi82MmMwOTJjY2JhMWM0OWQ3YjdhMjM5ZDA4YzVjZTBjMiJ9XSwgImVuZHBvaW50c19saW5rcyI6IFtdLCAidHlwZSI6ICJ2b2x1bWV2MiIsICJuYW1lIjogImNpbmRlcnYyIn0sIHsiZW5kcG9pbnRzIjogW3siYWRtaW5VUkwiOiAiaHR0cDovL2xvY2FsaG9zdDozNTM1Ny92Mi4wIiwgInJlZ2lvbiI6ICJyZWdpb25PbmUiLCAiaW50ZXJuYWxVUkwiOiAiaHR0cDovL2xvY2FsaG9zdDo1MDAwL3YyLjAiLCAiaWQiOiAiOGMyNzJiMWZhYTJiNDhjZTljNWYyODI1ODQ4OGM1YjEiLCAicHVibGljVVJMIjogImh0dHA6Ly9sb2NhbGhvc3Q6NTAwMC92Mi4wIn1dLCAiZW5kcG9pbnRzX2xpbmtzIjogW10sICJ0eXBlIjogImlkZW50aXR5IiwgIm5hbWUiOiAia2V5c3RvbmUifV0sICJ1c2VyIjogeyJ1c2VybmFtZSI6ICJkZW1vIiwgInJvbGVzX2xpbmtzIjogW10sICJpZCI6ICIyOGQxNmZhMDQ2MWQ0YTdkYmZlYTIzOGU3MDUzNDQ2MCIsICJyb2xlcyI6IFt7Im5hbWUiOiAiX21lbWJlcl8ifV0sICJuYW1lIjogImRlbW8ifSwgIm1ldGFkYXRhIjogeyJpc19hZG1pbiI6IDAsICJyb2xlcyI6IFsiOWZlMmZmOWVlNDM4NGIxODk0YTkwODc4ZDNlOTJiYWIiXX19fTGCAYEwggF9AgEBMFwwVzELMAkGA1UEBhMCVVMxDjAMBgNVBAgMBVVuc2V0MQ4wDAYDVQQHDAVVbnNldDEOMAwGA1UECgwFVW5zZXQxGDAWBgNVBAMMD3d3dy5leGFtcGxlLmNvbQIBATAHBgUrDgMCGjANBgkqhkiG9w0BAQEFAASCAQAEckxhi75az0NDCqBoGG40otWHzCjaRVs6g3LGmLwzD7MNicCyG0Fq9USDvrJBkS7WHooKqDEgQ+OQrFCO0ITmtSDMb1q2AenkzlzoccEUryAflCW0-bFMkgVV3vCA+aNI5HMPwrbOyADN6bzaOBJKx9bbQb4DepW23vjGJ8TaU01vdjzoX+KjZHfiyKc4Lg7gG5eFsc8Lg4BP7575iTAzQ8QrlkLeNGQAbq8pASTjJxgAjQ2Da1UGRd7iSGJk9TKYknDTyuByh5F2vzYcld1GdJniH1d8FFp0tpeO7eghwiz4t5E-ORrXf2Y7ix2K0uAA19GAXFs8qqAc1XfqU1ac\", \"token_version\": \"v2.0\", \"tenant\": {\"id\": \"62c092ccba1c49d7b7a239d08c5ce0c2\", \"enabled\": true, \"description\": \"Demo Tenant\", \"name\": \"demo\"}, \"metadata\": {\"roles\": [\"9fe2ff9ee4384b1894a90878d3e92bab\"]}}',1,NULL,'28d16fa0461d4a7dbfea238e70534460'),('0cb80c79c28b49473eec12ca0f37432d','2016-09-19 20:43:58','{\"bind\": null, \"token_data\": {\"access\": {\"token\": {\"issued_at\": \"2016-09-19T19:43:58.374257\", \"expires\": \"2016-09-19T20:43:58Z\", \"id\": \"MIIHjgYJKoZIhvcNAQcCoIIHfzCCB3sCAQExCTAHBgUrDgMCGjCCBeQGCSqGSIb3DQEHAaCCBdUEggXReyJhY2Nlc3MiOiB7InRva2VuIjogeyJpc3N1ZWRfYXQiOiAiMjAxNi0wOS0xOVQxOTo0Mzo1OC4zNzQyNTciLCAiZXhwaXJlcyI6ICIyMDE2LTA5LTE5VDIwOjQzOjU4WiIsICJpZCI6ICJwbGFjZWhvbGRlciIsICJ0ZW5hbnQiOiB7ImRlc2NyaXB0aW9uIjogIkRlbW8gVGVuYW50IiwgImVuYWJsZWQiOiB0cnVlLCAiaWQiOiAiNjJjMDkyY2NiYTFjNDlkN2I3YTIzOWQwOGM1Y2UwYzIiLCAibmFtZSI6ICJkZW1vIn19LCAic2VydmljZUNhdGFsb2ciOiBbeyJlbmRwb2ludHMiOiBbeyJhZG1pblVSTCI6ICJodHRwOi8vbG9jYWxob3N0Ojg3NzYvdjEvNjJjMDkyY2NiYTFjNDlkN2I3YTIzOWQwOGM1Y2UwYzIiLCAicmVnaW9uIjogInJlZ2lvbk9uZSIsICJpbnRlcm5hbFVSTCI6ICJodHRwOi8vbG9jYWxob3N0Ojg3NzYvdjEvNjJjMDkyY2NiYTFjNDlkN2I3YTIzOWQwOGM1Y2UwYzIiLCAiaWQiOiAiMzAyZTFlMDMxNGJkNDFiY2FlZjM5ZDgyMDA4MmFkOTQiLCAicHVibGljVVJMIjogImh0dHA6Ly9sb2NhbGhvc3Q6ODc3Ni92MS82MmMwOTJjY2JhMWM0OWQ3YjdhMjM5ZDA4YzVjZTBjMiJ9XSwgImVuZHBvaW50c19saW5rcyI6IFtdLCAidHlwZSI6ICJ2b2x1bWUiLCAibmFtZSI6ICJjaW5kZXIifSwgeyJlbmRwb2ludHMiOiBbeyJhZG1pblVSTCI6ICJodHRwOi8vbG9jYWxob3N0Ojg3NzYvdjIvNjJjMDkyY2NiYTFjNDlkN2I3YTIzOWQwOGM1Y2UwYzIiLCAicmVnaW9uIjogInJlZ2lvbk9uZSIsICJpbnRlcm5hbFVSTCI6ICJodHRwOi8vbG9jYWxob3N0Ojg3NzYvdjIvNjJjMDkyY2NiYTFjNDlkN2I3YTIzOWQwOGM1Y2UwYzIiLCAiaWQiOiAiNzU4ZTU3N2UzYmRlNGFjM2E4YjQwOGU5Y2M2MjY2NDYiLCAicHVibGljVVJMIjogImh0dHA6Ly9sb2NhbGhvc3Q6ODc3Ni92Mi82MmMwOTJjY2JhMWM0OWQ3YjdhMjM5ZDA4YzVjZTBjMiJ9XSwgImVuZHBvaW50c19saW5rcyI6IFtdLCAidHlwZSI6ICJ2b2x1bWV2MiIsICJuYW1lIjogImNpbmRlcnYyIn0sIHsiZW5kcG9pbnRzIjogW3siYWRtaW5VUkwiOiAiaHR0cDovL2xvY2FsaG9zdDozNTM1Ny92Mi4wIiwgInJlZ2lvbiI6ICJyZWdpb25PbmUiLCAiaW50ZXJuYWxVUkwiOiAiaHR0cDovL2xvY2FsaG9zdDo1MDAwL3YyLjAiLCAiaWQiOiAiOGMyNzJiMWZhYTJiNDhjZTljNWYyODI1ODQ4OGM1YjEiLCAicHVibGljVVJMIjogImh0dHA6Ly9sb2NhbGhvc3Q6NTAwMC92Mi4wIn1dLCAiZW5kcG9pbnRzX2xpbmtzIjogW10sICJ0eXBlIjogImlkZW50aXR5IiwgIm5hbWUiOiAia2V5c3RvbmUifV0sICJ1c2VyIjogeyJ1c2VybmFtZSI6ICJkZW1vIiwgInJvbGVzX2xpbmtzIjogW10sICJpZCI6ICIyOGQxNmZhMDQ2MWQ0YTdkYmZlYTIzOGU3MDUzNDQ2MCIsICJyb2xlcyI6IFt7Im5hbWUiOiAiX21lbWJlcl8ifV0sICJuYW1lIjogImRlbW8ifSwgIm1ldGFkYXRhIjogeyJpc19hZG1pbiI6IDAsICJyb2xlcyI6IFsiOWZlMmZmOWVlNDM4NGIxODk0YTkwODc4ZDNlOTJiYWIiXX19fTGCAYEwggF9AgEBMFwwVzELMAkGA1UEBhMCVVMxDjAMBgNVBAgMBVVuc2V0MQ4wDAYDVQQHDAVVbnNldDEOMAwGA1UECgwFVW5zZXQxGDAWBgNVBAMMD3d3dy5leGFtcGxlLmNvbQIBATAHBgUrDgMCGjANBgkqhkiG9w0BAQEFAASCAQDSa6-uswucfCB4aLa4hFSw9t4a465mjRf37PgYZw8drhu3Wwcl1c6a+o36eOyoi2kA1k1ea7xsheej129X76lHMYzE-Rxu5l5QZs+C0IoCKP7PUepHy2ELeeNSfYfrMn8RK7tjg248roxkedPp89MJbcIx1qqX0bQ2YNfadkZsVmXEYmctWe64xeVYBDn5GSRXRX7xHOFhTM60rL+xBKSzA+--4IDxlMnIFQGh2+GiV5Nio5Y7joA7WoitO2frsKLU90yK1xOhYcxBSbibv3+5Tq-Wy7WWo-3xonLXrT4a0di0o72wNM7httkZ7MjB62ByJqXmoGZgbwsqUHxLneWR\", \"tenant\": {\"id\": \"62c092ccba1c49d7b7a239d08c5ce0c2\", \"enabled\": true, \"description\": \"Demo Tenant\", \"name\": \"demo\"}}, \"serviceCatalog\": [{\"endpoints\": [{\"adminURL\": \"http://localhost:8776/v1/62c092ccba1c49d7b7a239d08c5ce0c2\", \"region\": \"regionOne\", \"id\": \"302e1e0314bd41bcaef39d820082ad94\", \"internalURL\": \"http://localhost:8776/v1/62c092ccba1c49d7b7a239d08c5ce0c2\", \"publicURL\": \"http://localhost:8776/v1/62c092ccba1c49d7b7a239d08c5ce0c2\"}], \"endpoints_links\": [], \"type\": \"volume\", \"name\": \"cinder\"}, {\"endpoints\": [{\"adminURL\": \"http://localhost:8776/v2/62c092ccba1c49d7b7a239d08c5ce0c2\", \"region\": \"regionOne\", \"id\": \"758e577e3bde4ac3a8b408e9cc626646\", \"internalURL\": \"http://localhost:8776/v2/62c092ccba1c49d7b7a239d08c5ce0c2\", \"publicURL\": \"http://localhost:8776/v2/62c092ccba1c49d7b7a239d08c5ce0c2\"}], \"endpoints_links\": [], \"type\": \"volumev2\", \"name\": \"cinderv2\"}, {\"endpoints\": [{\"adminURL\": \"http://localhost:35357/v2.0\", \"region\": \"regionOne\", \"id\": \"8c272b1faa2b48ce9c5f28258488c5b1\", \"internalURL\": \"http://localhost:5000/v2.0\", \"publicURL\": \"http://localhost:5000/v2.0\"}], \"endpoints_links\": [], \"type\": \"identity\", \"name\": \"keystone\"}], \"user\": {\"username\": \"demo\", \"roles_links\": [], \"id\": \"28d16fa0461d4a7dbfea238e70534460\", \"roles\": [{\"name\": \"_member_\"}], \"name\": \"demo\"}, \"metadata\": {\"is_admin\": 0, \"roles\": [\"9fe2ff9ee4384b1894a90878d3e92bab\"]}}}, \"user\": {\"username\": \"demo\", \"name\": \"demo\", \"enabled\": true, \"id\": \"28d16fa0461d4a7dbfea238e70534460\", \"tenantId\": \"62c092ccba1c49d7b7a239d08c5ce0c2\", \"email\": \"alop@localhost\"}, \"key\": \"MIIHjgYJKoZIhvcNAQcCoIIHfzCCB3sCAQExCTAHBgUrDgMCGjCCBeQGCSqGSIb3DQEHAaCCBdUEggXReyJhY2Nlc3MiOiB7InRva2VuIjogeyJpc3N1ZWRfYXQiOiAiMjAxNi0wOS0xOVQxOTo0Mzo1OC4zNzQyNTciLCAiZXhwaXJlcyI6ICIyMDE2LTA5LTE5VDIwOjQzOjU4WiIsICJpZCI6ICJwbGFjZWhvbGRlciIsICJ0ZW5hbnQiOiB7ImRlc2NyaXB0aW9uIjogIkRlbW8gVGVuYW50IiwgImVuYWJsZWQiOiB0cnVlLCAiaWQiOiAiNjJjMDkyY2NiYTFjNDlkN2I3YTIzOWQwOGM1Y2UwYzIiLCAibmFtZSI6ICJkZW1vIn19LCAic2VydmljZUNhdGFsb2ciOiBbeyJlbmRwb2ludHMiOiBbeyJhZG1pblVSTCI6ICJodHRwOi8vbG9jYWxob3N0Ojg3NzYvdjEvNjJjMDkyY2NiYTFjNDlkN2I3YTIzOWQwOGM1Y2UwYzIiLCAicmVnaW9uIjogInJlZ2lvbk9uZSIsICJpbnRlcm5hbFVSTCI6ICJodHRwOi8vbG9jYWxob3N0Ojg3NzYvdjEvNjJjMDkyY2NiYTFjNDlkN2I3YTIzOWQwOGM1Y2UwYzIiLCAiaWQiOiAiMzAyZTFlMDMxNGJkNDFiY2FlZjM5ZDgyMDA4MmFkOTQiLCAicHVibGljVVJMIjogImh0dHA6Ly9sb2NhbGhvc3Q6ODc3Ni92MS82MmMwOTJjY2JhMWM0OWQ3YjdhMjM5ZDA4YzVjZTBjMiJ9XSwgImVuZHBvaW50c19saW5rcyI6IFtdLCAidHlwZSI6ICJ2b2x1bWUiLCAibmFtZSI6ICJjaW5kZXIifSwgeyJlbmRwb2ludHMiOiBbeyJhZG1pblVSTCI6ICJodHRwOi8vbG9jYWxob3N0Ojg3NzYvdjIvNjJjMDkyY2NiYTFjNDlkN2I3YTIzOWQwOGM1Y2UwYzIiLCAicmVnaW9uIjogInJlZ2lvbk9uZSIsICJpbnRlcm5hbFVSTCI6ICJodHRwOi8vbG9jYWxob3N0Ojg3NzYvdjIvNjJjMDkyY2NiYTFjNDlkN2I3YTIzOWQwOGM1Y2UwYzIiLCAiaWQiOiAiNzU4ZTU3N2UzYmRlNGFjM2E4YjQwOGU5Y2M2MjY2NDYiLCAicHVibGljVVJMIjogImh0dHA6Ly9sb2NhbGhvc3Q6ODc3Ni92Mi82MmMwOTJjY2JhMWM0OWQ3YjdhMjM5ZDA4YzVjZTBjMiJ9XSwgImVuZHBvaW50c19saW5rcyI6IFtdLCAidHlwZSI6ICJ2b2x1bWV2MiIsICJuYW1lIjogImNpbmRlcnYyIn0sIHsiZW5kcG9pbnRzIjogW3siYWRtaW5VUkwiOiAiaHR0cDovL2xvY2FsaG9zdDozNTM1Ny92Mi4wIiwgInJlZ2lvbiI6ICJyZWdpb25PbmUiLCAiaW50ZXJuYWxVUkwiOiAiaHR0cDovL2xvY2FsaG9zdDo1MDAwL3YyLjAiLCAiaWQiOiAiOGMyNzJiMWZhYTJiNDhjZTljNWYyODI1ODQ4OGM1YjEiLCAicHVibGljVVJMIjogImh0dHA6Ly9sb2NhbGhvc3Q6NTAwMC92Mi4wIn1dLCAiZW5kcG9pbnRzX2xpbmtzIjogW10sICJ0eXBlIjogImlkZW50aXR5IiwgIm5hbWUiOiAia2V5c3RvbmUifV0sICJ1c2VyIjogeyJ1c2VybmFtZSI6ICJkZW1vIiwgInJvbGVzX2xpbmtzIjogW10sICJpZCI6ICIyOGQxNmZhMDQ2MWQ0YTdkYmZlYTIzOGU3MDUzNDQ2MCIsICJyb2xlcyI6IFt7Im5hbWUiOiAiX21lbWJlcl8ifV0sICJuYW1lIjogImRlbW8ifSwgIm1ldGFkYXRhIjogeyJpc19hZG1pbiI6IDAsICJyb2xlcyI6IFsiOWZlMmZmOWVlNDM4NGIxODk0YTkwODc4ZDNlOTJiYWIiXX19fTGCAYEwggF9AgEBMFwwVzELMAkGA1UEBhMCVVMxDjAMBgNVBAgMBVVuc2V0MQ4wDAYDVQQHDAVVbnNldDEOMAwGA1UECgwFVW5zZXQxGDAWBgNVBAMMD3d3dy5leGFtcGxlLmNvbQIBATAHBgUrDgMCGjANBgkqhkiG9w0BAQEFAASCAQDSa6-uswucfCB4aLa4hFSw9t4a465mjRf37PgYZw8drhu3Wwcl1c6a+o36eOyoi2kA1k1ea7xsheej129X76lHMYzE-Rxu5l5QZs+C0IoCKP7PUepHy2ELeeNSfYfrMn8RK7tjg248roxkedPp89MJbcIx1qqX0bQ2YNfadkZsVmXEYmctWe64xeVYBDn5GSRXRX7xHOFhTM60rL+xBKSzA+--4IDxlMnIFQGh2+GiV5Nio5Y7joA7WoitO2frsKLU90yK1xOhYcxBSbibv3+5Tq-Wy7WWo-3xonLXrT4a0di0o72wNM7httkZ7MjB62ByJqXmoGZgbwsqUHxLneWR\", \"token_version\": \"v2.0\", \"tenant\": {\"id\": \"62c092ccba1c49d7b7a239d08c5ce0c2\", \"enabled\": true, \"description\": \"Demo Tenant\", \"name\": \"demo\"}, \"metadata\": {\"roles\": [\"9fe2ff9ee4384b1894a90878d3e92bab\"]}}',1,NULL,'28d16fa0461d4a7dbfea238e70534460'),('3632422714ba40c1341f103cfb1dbfa0','2016-09-19 20:43:39','{\"bind\": null, \"token_data\": {\"access\": {\"token\": {\"issued_at\": \"2016-09-19T19:43:39.965847\", \"expires\": \"2016-09-19T20:43:39Z\", \"id\": \"MIIHlQYJKoZIhvcNAQcCoIIHhjCCB4ICAQExCTAHBgUrDgMCGjCCBesGCSqGSIb3DQEHAaCCBdwEggXYeyJhY2Nlc3MiOiB7InRva2VuIjogeyJpc3N1ZWRfYXQiOiAiMjAxNi0wOS0xOVQxOTo0MzozOS45NjU4NDciLCAiZXhwaXJlcyI6ICIyMDE2LTA5LTE5VDIwOjQzOjM5WiIsICJpZCI6ICJwbGFjZWhvbGRlciIsICJ0ZW5hbnQiOiB7ImRlc2NyaXB0aW9uIjogIlNlcnZpY2UgVGVuYW50IiwgImVuYWJsZWQiOiB0cnVlLCAiaWQiOiAiZTFiMTZiMTNhNjhhNDYyYWJkYmNjOGRiYzUzYzUxOGMiLCAibmFtZSI6ICJzZXJ2aWNlIn19LCAic2VydmljZUNhdGFsb2ciOiBbeyJlbmRwb2ludHMiOiBbeyJhZG1pblVSTCI6ICJodHRwOi8vbG9jYWxob3N0Ojg3NzYvdjEvZTFiMTZiMTNhNjhhNDYyYWJkYmNjOGRiYzUzYzUxOGMiLCAicmVnaW9uIjogInJlZ2lvbk9uZSIsICJpbnRlcm5hbFVSTCI6ICJodHRwOi8vbG9jYWxob3N0Ojg3NzYvdjEvZTFiMTZiMTNhNjhhNDYyYWJkYmNjOGRiYzUzYzUxOGMiLCAiaWQiOiAiMzAyZTFlMDMxNGJkNDFiY2FlZjM5ZDgyMDA4MmFkOTQiLCAicHVibGljVVJMIjogImh0dHA6Ly9sb2NhbGhvc3Q6ODc3Ni92MS9lMWIxNmIxM2E2OGE0NjJhYmRiY2M4ZGJjNTNjNTE4YyJ9XSwgImVuZHBvaW50c19saW5rcyI6IFtdLCAidHlwZSI6ICJ2b2x1bWUiLCAibmFtZSI6ICJjaW5kZXIifSwgeyJlbmRwb2ludHMiOiBbeyJhZG1pblVSTCI6ICJodHRwOi8vbG9jYWxob3N0Ojg3NzYvdjIvZTFiMTZiMTNhNjhhNDYyYWJkYmNjOGRiYzUzYzUxOGMiLCAicmVnaW9uIjogInJlZ2lvbk9uZSIsICJpbnRlcm5hbFVSTCI6ICJodHRwOi8vbG9jYWxob3N0Ojg3NzYvdjIvZTFiMTZiMTNhNjhhNDYyYWJkYmNjOGRiYzUzYzUxOGMiLCAiaWQiOiAiNzU4ZTU3N2UzYmRlNGFjM2E4YjQwOGU5Y2M2MjY2NDYiLCAicHVibGljVVJMIjogImh0dHA6Ly9sb2NhbGhvc3Q6ODc3Ni92Mi9lMWIxNmIxM2E2OGE0NjJhYmRiY2M4ZGJjNTNjNTE4YyJ9XSwgImVuZHBvaW50c19saW5rcyI6IFtdLCAidHlwZSI6ICJ2b2x1bWV2MiIsICJuYW1lIjogImNpbmRlcnYyIn0sIHsiZW5kcG9pbnRzIjogW3siYWRtaW5VUkwiOiAiaHR0cDovL2xvY2FsaG9zdDozNTM1Ny92Mi4wIiwgInJlZ2lvbiI6ICJyZWdpb25PbmUiLCAiaW50ZXJuYWxVUkwiOiAiaHR0cDovL2xvY2FsaG9zdDo1MDAwL3YyLjAiLCAiaWQiOiAiOGMyNzJiMWZhYTJiNDhjZTljNWYyODI1ODQ4OGM1YjEiLCAicHVibGljVVJMIjogImh0dHA6Ly9sb2NhbGhvc3Q6NTAwMC92Mi4wIn1dLCAiZW5kcG9pbnRzX2xpbmtzIjogW10sICJ0eXBlIjogImlkZW50aXR5IiwgIm5hbWUiOiAia2V5c3RvbmUifV0sICJ1c2VyIjogeyJ1c2VybmFtZSI6ICJjaW5kZXIiLCAicm9sZXNfbGlua3MiOiBbXSwgImlkIjogIjdkZGFmNWY4NjdlYTQyYzViZTYwZDZmYjU5ZDAwMTQ0IiwgInJvbGVzIjogW3sibmFtZSI6ICJhZG1pbiJ9XSwgIm5hbWUiOiAiY2luZGVyIn0sICJtZXRhZGF0YSI6IHsiaXNfYWRtaW4iOiAwLCAicm9sZXMiOiBbIjI4MGQ0MTY4NzVlZjQwYTRiYzk5MjhlNTZmNTE5Yjc5Il19fX0xggGBMIIBfQIBATBcMFcxCzAJBgNVBAYTAlVTMQ4wDAYDVQQIDAVVbnNldDEOMAwGA1UEBwwFVW5zZXQxDjAMBgNVBAoMBVVuc2V0MRgwFgYDVQQDDA93d3cuZXhhbXBsZS5jb20CAQEwBwYFKw4DAhowDQYJKoZIhvcNAQEBBQAEggEAxPodLT4vh2whMdxWlAOe4jwWXNS+dSSUbYGODC2yBCgp4HTqX+XO30Nzbfr6LNxCiSpyfZkawf5AqgHGnjAOVoz7Bf3SGr+tJxN6PvpTDVFBF7NLMs-NpGCwEU0l0MQPvA0J0QQY5N39rG-lWEmR+Q2GZlF8BoOt9BL1GasD8pK3EUDgiUwb2aoRkvF9Q6aL4Y9rg2qrNE92h2VxBzB4+jyEufHocZChsZBBFeFJ07SS5MNnTN+XpGmn4QsO3ZCYuqqX7FuLfWdra4VnQona2CWHeXiQ2x+ymMLvSK10DB6RGWt5zUAEa51mjTNGn4b6IURBaiK38UK4V8eLyALBsQ==\", \"tenant\": {\"id\": \"e1b16b13a68a462abdbcc8dbc53c518c\", \"enabled\": true, \"description\": \"Service Tenant\", \"name\": \"service\"}}, \"serviceCatalog\": [{\"endpoints\": [{\"adminURL\": \"http://localhost:8776/v1/e1b16b13a68a462abdbcc8dbc53c518c\", \"region\": \"regionOne\", \"id\": \"302e1e0314bd41bcaef39d820082ad94\", \"internalURL\": \"http://localhost:8776/v1/e1b16b13a68a462abdbcc8dbc53c518c\", \"publicURL\": \"http://localhost:8776/v1/e1b16b13a68a462abdbcc8dbc53c518c\"}], \"endpoints_links\": [], \"type\": \"volume\", \"name\": \"cinder\"}, {\"endpoints\": [{\"adminURL\": \"http://localhost:8776/v2/e1b16b13a68a462abdbcc8dbc53c518c\", \"region\": \"regionOne\", \"id\": \"758e577e3bde4ac3a8b408e9cc626646\", \"internalURL\": \"http://localhost:8776/v2/e1b16b13a68a462abdbcc8dbc53c518c\", \"publicURL\": \"http://localhost:8776/v2/e1b16b13a68a462abdbcc8dbc53c518c\"}], \"endpoints_links\": [], \"type\": \"volumev2\", \"name\": \"cinderv2\"}, {\"endpoints\": [{\"adminURL\": \"http://localhost:35357/v2.0\", \"region\": \"regionOne\", \"id\": \"8c272b1faa2b48ce9c5f28258488c5b1\", \"internalURL\": \"http://localhost:5000/v2.0\", \"publicURL\": \"http://localhost:5000/v2.0\"}], \"endpoints_links\": [], \"type\": \"identity\", \"name\": \"keystone\"}], \"user\": {\"username\": \"cinder\", \"roles_links\": [], \"id\": \"7ddaf5f867ea42c5be60d6fb59d00144\", \"roles\": [{\"name\": \"admin\"}], \"name\": \"cinder\"}, \"metadata\": {\"is_admin\": 0, \"roles\": [\"280d416875ef40a4bc9928e56f519b79\"]}}}, \"user\": {\"username\": \"cinder\", \"email\": null, \"enabled\": true, \"id\": \"7ddaf5f867ea42c5be60d6fb59d00144\", \"name\": \"cinder\"}, \"key\": \"MIIHlQYJKoZIhvcNAQcCoIIHhjCCB4ICAQExCTAHBgUrDgMCGjCCBesGCSqGSIb3DQEHAaCCBdwEggXYeyJhY2Nlc3MiOiB7InRva2VuIjogeyJpc3N1ZWRfYXQiOiAiMjAxNi0wOS0xOVQxOTo0MzozOS45NjU4NDciLCAiZXhwaXJlcyI6ICIyMDE2LTA5LTE5VDIwOjQzOjM5WiIsICJpZCI6ICJwbGFjZWhvbGRlciIsICJ0ZW5hbnQiOiB7ImRlc2NyaXB0aW9uIjogIlNlcnZpY2UgVGVuYW50IiwgImVuYWJsZWQiOiB0cnVlLCAiaWQiOiAiZTFiMTZiMTNhNjhhNDYyYWJkYmNjOGRiYzUzYzUxOGMiLCAibmFtZSI6ICJzZXJ2aWNlIn19LCAic2VydmljZUNhdGFsb2ciOiBbeyJlbmRwb2ludHMiOiBbeyJhZG1pblVSTCI6ICJodHRwOi8vbG9jYWxob3N0Ojg3NzYvdjEvZTFiMTZiMTNhNjhhNDYyYWJkYmNjOGRiYzUzYzUxOGMiLCAicmVnaW9uIjogInJlZ2lvbk9uZSIsICJpbnRlcm5hbFVSTCI6ICJodHRwOi8vbG9jYWxob3N0Ojg3NzYvdjEvZTFiMTZiMTNhNjhhNDYyYWJkYmNjOGRiYzUzYzUxOGMiLCAiaWQiOiAiMzAyZTFlMDMxNGJkNDFiY2FlZjM5ZDgyMDA4MmFkOTQiLCAicHVibGljVVJMIjogImh0dHA6Ly9sb2NhbGhvc3Q6ODc3Ni92MS9lMWIxNmIxM2E2OGE0NjJhYmRiY2M4ZGJjNTNjNTE4YyJ9XSwgImVuZHBvaW50c19saW5rcyI6IFtdLCAidHlwZSI6ICJ2b2x1bWUiLCAibmFtZSI6ICJjaW5kZXIifSwgeyJlbmRwb2ludHMiOiBbeyJhZG1pblVSTCI6ICJodHRwOi8vbG9jYWxob3N0Ojg3NzYvdjIvZTFiMTZiMTNhNjhhNDYyYWJkYmNjOGRiYzUzYzUxOGMiLCAicmVnaW9uIjogInJlZ2lvbk9uZSIsICJpbnRlcm5hbFVSTCI6ICJodHRwOi8vbG9jYWxob3N0Ojg3NzYvdjIvZTFiMTZiMTNhNjhhNDYyYWJkYmNjOGRiYzUzYzUxOGMiLCAiaWQiOiAiNzU4ZTU3N2UzYmRlNGFjM2E4YjQwOGU5Y2M2MjY2NDYiLCAicHVibGljVVJMIjogImh0dHA6Ly9sb2NhbGhvc3Q6ODc3Ni92Mi9lMWIxNmIxM2E2OGE0NjJhYmRiY2M4ZGJjNTNjNTE4YyJ9XSwgImVuZHBvaW50c19saW5rcyI6IFtdLCAidHlwZSI6ICJ2b2x1bWV2MiIsICJuYW1lIjogImNpbmRlcnYyIn0sIHsiZW5kcG9pbnRzIjogW3siYWRtaW5VUkwiOiAiaHR0cDovL2xvY2FsaG9zdDozNTM1Ny92Mi4wIiwgInJlZ2lvbiI6ICJyZWdpb25PbmUiLCAiaW50ZXJuYWxVUkwiOiAiaHR0cDovL2xvY2FsaG9zdDo1MDAwL3YyLjAiLCAiaWQiOiAiOGMyNzJiMWZhYTJiNDhjZTljNWYyODI1ODQ4OGM1YjEiLCAicHVibGljVVJMIjogImh0dHA6Ly9sb2NhbGhvc3Q6NTAwMC92Mi4wIn1dLCAiZW5kcG9pbnRzX2xpbmtzIjogW10sICJ0eXBlIjogImlkZW50aXR5IiwgIm5hbWUiOiAia2V5c3RvbmUifV0sICJ1c2VyIjogeyJ1c2VybmFtZSI6ICJjaW5kZXIiLCAicm9sZXNfbGlua3MiOiBbXSwgImlkIjogIjdkZGFmNWY4NjdlYTQyYzViZTYwZDZmYjU5ZDAwMTQ0IiwgInJvbGVzIjogW3sibmFtZSI6ICJhZG1pbiJ9XSwgIm5hbWUiOiAiY2luZGVyIn0sICJtZXRhZGF0YSI6IHsiaXNfYWRtaW4iOiAwLCAicm9sZXMiOiBbIjI4MGQ0MTY4NzVlZjQwYTRiYzk5MjhlNTZmNTE5Yjc5Il19fX0xggGBMIIBfQIBATBcMFcxCzAJBgNVBAYTAlVTMQ4wDAYDVQQIDAVVbnNldDEOMAwGA1UEBwwFVW5zZXQxDjAMBgNVBAoMBVVuc2V0MRgwFgYDVQQDDA93d3cuZXhhbXBsZS5jb20CAQEwBwYFKw4DAhowDQYJKoZIhvcNAQEBBQAEggEAxPodLT4vh2whMdxWlAOe4jwWXNS+dSSUbYGODC2yBCgp4HTqX+XO30Nzbfr6LNxCiSpyfZkawf5AqgHGnjAOVoz7Bf3SGr+tJxN6PvpTDVFBF7NLMs-NpGCwEU0l0MQPvA0J0QQY5N39rG-lWEmR+Q2GZlF8BoOt9BL1GasD8pK3EUDgiUwb2aoRkvF9Q6aL4Y9rg2qrNE92h2VxBzB4+jyEufHocZChsZBBFeFJ07SS5MNnTN+XpGmn4QsO3ZCYuqqX7FuLfWdra4VnQona2CWHeXiQ2x+ymMLvSK10DB6RGWt5zUAEa51mjTNGn4b6IURBaiK38UK4V8eLyALBsQ==\", \"token_version\": \"v2.0\", \"tenant\": {\"id\": \"e1b16b13a68a462abdbcc8dbc53c518c\", \"enabled\": true, \"description\": \"Service Tenant\", \"name\": \"service\"}, \"metadata\": {\"roles\": [\"280d416875ef40a4bc9928e56f519b79\"]}}',1,NULL,'7ddaf5f867ea42c5be60d6fb59d00144'),('4f9678e74fe0b122441ccd9c8d78bcfb','2016-09-19 20:44:07','{\"bind\": null, \"token_data\": {\"access\": {\"token\": {\"issued_at\": \"2016-09-19T19:44:07.870919\", \"expires\": \"2016-09-19T20:44:07Z\", \"id\": \"MIIHjgYJKoZIhvcNAQcCoIIHfzCCB3sCAQExCTAHBgUrDgMCGjCCBeQGCSqGSIb3DQEHAaCCBdUEggXReyJhY2Nlc3MiOiB7InRva2VuIjogeyJpc3N1ZWRfYXQiOiAiMjAxNi0wOS0xOVQxOTo0NDowNy44NzA5MTkiLCAiZXhwaXJlcyI6ICIyMDE2LTA5LTE5VDIwOjQ0OjA3WiIsICJpZCI6ICJwbGFjZWhvbGRlciIsICJ0ZW5hbnQiOiB7ImRlc2NyaXB0aW9uIjogIkRlbW8gVGVuYW50IiwgImVuYWJsZWQiOiB0cnVlLCAiaWQiOiAiNjJjMDkyY2NiYTFjNDlkN2I3YTIzOWQwOGM1Y2UwYzIiLCAibmFtZSI6ICJkZW1vIn19LCAic2VydmljZUNhdGFsb2ciOiBbeyJlbmRwb2ludHMiOiBbeyJhZG1pblVSTCI6ICJodHRwOi8vbG9jYWxob3N0Ojg3NzYvdjEvNjJjMDkyY2NiYTFjNDlkN2I3YTIzOWQwOGM1Y2UwYzIiLCAicmVnaW9uIjogInJlZ2lvbk9uZSIsICJpbnRlcm5hbFVSTCI6ICJodHRwOi8vbG9jYWxob3N0Ojg3NzYvdjEvNjJjMDkyY2NiYTFjNDlkN2I3YTIzOWQwOGM1Y2UwYzIiLCAiaWQiOiAiMzAyZTFlMDMxNGJkNDFiY2FlZjM5ZDgyMDA4MmFkOTQiLCAicHVibGljVVJMIjogImh0dHA6Ly9sb2NhbGhvc3Q6ODc3Ni92MS82MmMwOTJjY2JhMWM0OWQ3YjdhMjM5ZDA4YzVjZTBjMiJ9XSwgImVuZHBvaW50c19saW5rcyI6IFtdLCAidHlwZSI6ICJ2b2x1bWUiLCAibmFtZSI6ICJjaW5kZXIifSwgeyJlbmRwb2ludHMiOiBbeyJhZG1pblVSTCI6ICJodHRwOi8vbG9jYWxob3N0Ojg3NzYvdjIvNjJjMDkyY2NiYTFjNDlkN2I3YTIzOWQwOGM1Y2UwYzIiLCAicmVnaW9uIjogInJlZ2lvbk9uZSIsICJpbnRlcm5hbFVSTCI6ICJodHRwOi8vbG9jYWxob3N0Ojg3NzYvdjIvNjJjMDkyY2NiYTFjNDlkN2I3YTIzOWQwOGM1Y2UwYzIiLCAiaWQiOiAiNzU4ZTU3N2UzYmRlNGFjM2E4YjQwOGU5Y2M2MjY2NDYiLCAicHVibGljVVJMIjogImh0dHA6Ly9sb2NhbGhvc3Q6ODc3Ni92Mi82MmMwOTJjY2JhMWM0OWQ3YjdhMjM5ZDA4YzVjZTBjMiJ9XSwgImVuZHBvaW50c19saW5rcyI6IFtdLCAidHlwZSI6ICJ2b2x1bWV2MiIsICJuYW1lIjogImNpbmRlcnYyIn0sIHsiZW5kcG9pbnRzIjogW3siYWRtaW5VUkwiOiAiaHR0cDovL2xvY2FsaG9zdDozNTM1Ny92Mi4wIiwgInJlZ2lvbiI6ICJyZWdpb25PbmUiLCAiaW50ZXJuYWxVUkwiOiAiaHR0cDovL2xvY2FsaG9zdDo1MDAwL3YyLjAiLCAiaWQiOiAiOGMyNzJiMWZhYTJiNDhjZTljNWYyODI1ODQ4OGM1YjEiLCAicHVibGljVVJMIjogImh0dHA6Ly9sb2NhbGhvc3Q6NTAwMC92Mi4wIn1dLCAiZW5kcG9pbnRzX2xpbmtzIjogW10sICJ0eXBlIjogImlkZW50aXR5IiwgIm5hbWUiOiAia2V5c3RvbmUifV0sICJ1c2VyIjogeyJ1c2VybmFtZSI6ICJkZW1vIiwgInJvbGVzX2xpbmtzIjogW10sICJpZCI6ICIyOGQxNmZhMDQ2MWQ0YTdkYmZlYTIzOGU3MDUzNDQ2MCIsICJyb2xlcyI6IFt7Im5hbWUiOiAiX21lbWJlcl8ifV0sICJuYW1lIjogImRlbW8ifSwgIm1ldGFkYXRhIjogeyJpc19hZG1pbiI6IDAsICJyb2xlcyI6IFsiOWZlMmZmOWVlNDM4NGIxODk0YTkwODc4ZDNlOTJiYWIiXX19fTGCAYEwggF9AgEBMFwwVzELMAkGA1UEBhMCVVMxDjAMBgNVBAgMBVVuc2V0MQ4wDAYDVQQHDAVVbnNldDEOMAwGA1UECgwFVW5zZXQxGDAWBgNVBAMMD3d3dy5leGFtcGxlLmNvbQIBATAHBgUrDgMCGjANBgkqhkiG9w0BAQEFAASCAQC951jKOLWJg1yPGMKNaU3zMbPN-UZ20zyhTc7AMinAShKwEGma5ErMDCz1IR2yHKnCIPO5wIPLPrVaanptVD9Wc7Y236MvjVsceID3KGQNuNAKwx0Y7YUjx1Dn-r7gTsq+cmJWxZkXLKP8zhysRbsBQML3VN9sWiISPjea5f0-qEKiXErWGcBq609cX4AHkzNvIi-coFQA2l4jvNnd7O-AOR+-5mSOJ1g0Q8DxY5weOEU8JBZFyLCO7NvSMohUsKTu9bZa4e43fewZ5OOFArSCdXWhkXH8U31m1fstHp3adrAFcLsSrc5bmv3n8e-1A1HGlZiE8QbdWPoztliuhZTM\", \"tenant\": {\"id\": \"62c092ccba1c49d7b7a239d08c5ce0c2\", \"enabled\": true, \"description\": \"Demo Tenant\", \"name\": \"demo\"}}, \"serviceCatalog\": [{\"endpoints\": [{\"adminURL\": \"http://localhost:8776/v1/62c092ccba1c49d7b7a239d08c5ce0c2\", \"region\": \"regionOne\", \"id\": \"302e1e0314bd41bcaef39d820082ad94\", \"internalURL\": \"http://localhost:8776/v1/62c092ccba1c49d7b7a239d08c5ce0c2\", \"publicURL\": \"http://localhost:8776/v1/62c092ccba1c49d7b7a239d08c5ce0c2\"}], \"endpoints_links\": [], \"type\": \"volume\", \"name\": \"cinder\"}, {\"endpoints\": [{\"adminURL\": \"http://localhost:8776/v2/62c092ccba1c49d7b7a239d08c5ce0c2\", \"region\": \"regionOne\", \"id\": \"758e577e3bde4ac3a8b408e9cc626646\", \"internalURL\": \"http://localhost:8776/v2/62c092ccba1c49d7b7a239d08c5ce0c2\", \"publicURL\": \"http://localhost:8776/v2/62c092ccba1c49d7b7a239d08c5ce0c2\"}], \"endpoints_links\": [], \"type\": \"volumev2\", \"name\": \"cinderv2\"}, {\"endpoints\": [{\"adminURL\": \"http://localhost:35357/v2.0\", \"region\": \"regionOne\", \"id\": \"8c272b1faa2b48ce9c5f28258488c5b1\", \"internalURL\": \"http://localhost:5000/v2.0\", \"publicURL\": \"http://localhost:5000/v2.0\"}], \"endpoints_links\": [], \"type\": \"identity\", \"name\": \"keystone\"}], \"user\": {\"username\": \"demo\", \"roles_links\": [], \"id\": \"28d16fa0461d4a7dbfea238e70534460\", \"roles\": [{\"name\": \"_member_\"}], \"name\": \"demo\"}, \"metadata\": {\"is_admin\": 0, \"roles\": [\"9fe2ff9ee4384b1894a90878d3e92bab\"]}}}, \"user\": {\"username\": \"demo\", \"name\": \"demo\", \"enabled\": true, \"id\": \"28d16fa0461d4a7dbfea238e70534460\", \"tenantId\": \"62c092ccba1c49d7b7a239d08c5ce0c2\", \"email\": \"alop@localhost\"}, \"key\": \"MIIHjgYJKoZIhvcNAQcCoIIHfzCCB3sCAQExCTAHBgUrDgMCGjCCBeQGCSqGSIb3DQEHAaCCBdUEggXReyJhY2Nlc3MiOiB7InRva2VuIjogeyJpc3N1ZWRfYXQiOiAiMjAxNi0wOS0xOVQxOTo0NDowNy44NzA5MTkiLCAiZXhwaXJlcyI6ICIyMDE2LTA5LTE5VDIwOjQ0OjA3WiIsICJpZCI6ICJwbGFjZWhvbGRlciIsICJ0ZW5hbnQiOiB7ImRlc2NyaXB0aW9uIjogIkRlbW8gVGVuYW50IiwgImVuYWJsZWQiOiB0cnVlLCAiaWQiOiAiNjJjMDkyY2NiYTFjNDlkN2I3YTIzOWQwOGM1Y2UwYzIiLCAibmFtZSI6ICJkZW1vIn19LCAic2VydmljZUNhdGFsb2ciOiBbeyJlbmRwb2ludHMiOiBbeyJhZG1pblVSTCI6ICJodHRwOi8vbG9jYWxob3N0Ojg3NzYvdjEvNjJjMDkyY2NiYTFjNDlkN2I3YTIzOWQwOGM1Y2UwYzIiLCAicmVnaW9uIjogInJlZ2lvbk9uZSIsICJpbnRlcm5hbFVSTCI6ICJodHRwOi8vbG9jYWxob3N0Ojg3NzYvdjEvNjJjMDkyY2NiYTFjNDlkN2I3YTIzOWQwOGM1Y2UwYzIiLCAiaWQiOiAiMzAyZTFlMDMxNGJkNDFiY2FlZjM5ZDgyMDA4MmFkOTQiLCAicHVibGljVVJMIjogImh0dHA6Ly9sb2NhbGhvc3Q6ODc3Ni92MS82MmMwOTJjY2JhMWM0OWQ3YjdhMjM5ZDA4YzVjZTBjMiJ9XSwgImVuZHBvaW50c19saW5rcyI6IFtdLCAidHlwZSI6ICJ2b2x1bWUiLCAibmFtZSI6ICJjaW5kZXIifSwgeyJlbmRwb2ludHMiOiBbeyJhZG1pblVSTCI6ICJodHRwOi8vbG9jYWxob3N0Ojg3NzYvdjIvNjJjMDkyY2NiYTFjNDlkN2I3YTIzOWQwOGM1Y2UwYzIiLCAicmVnaW9uIjogInJlZ2lvbk9uZSIsICJpbnRlcm5hbFVSTCI6ICJodHRwOi8vbG9jYWxob3N0Ojg3NzYvdjIvNjJjMDkyY2NiYTFjNDlkN2I3YTIzOWQwOGM1Y2UwYzIiLCAiaWQiOiAiNzU4ZTU3N2UzYmRlNGFjM2E4YjQwOGU5Y2M2MjY2NDYiLCAicHVibGljVVJMIjogImh0dHA6Ly9sb2NhbGhvc3Q6ODc3Ni92Mi82MmMwOTJjY2JhMWM0OWQ3YjdhMjM5ZDA4YzVjZTBjMiJ9XSwgImVuZHBvaW50c19saW5rcyI6IFtdLCAidHlwZSI6ICJ2b2x1bWV2MiIsICJuYW1lIjogImNpbmRlcnYyIn0sIHsiZW5kcG9pbnRzIjogW3siYWRtaW5VUkwiOiAiaHR0cDovL2xvY2FsaG9zdDozNTM1Ny92Mi4wIiwgInJlZ2lvbiI6ICJyZWdpb25PbmUiLCAiaW50ZXJuYWxVUkwiOiAiaHR0cDovL2xvY2FsaG9zdDo1MDAwL3YyLjAiLCAiaWQiOiAiOGMyNzJiMWZhYTJiNDhjZTljNWYyODI1ODQ4OGM1YjEiLCAicHVibGljVVJMIjogImh0dHA6Ly9sb2NhbGhvc3Q6NTAwMC92Mi4wIn1dLCAiZW5kcG9pbnRzX2xpbmtzIjogW10sICJ0eXBlIjogImlkZW50aXR5IiwgIm5hbWUiOiAia2V5c3RvbmUifV0sICJ1c2VyIjogeyJ1c2VybmFtZSI6ICJkZW1vIiwgInJvbGVzX2xpbmtzIjogW10sICJpZCI6ICIyOGQxNmZhMDQ2MWQ0YTdkYmZlYTIzOGU3MDUzNDQ2MCIsICJyb2xlcyI6IFt7Im5hbWUiOiAiX21lbWJlcl8ifV0sICJuYW1lIjogImRlbW8ifSwgIm1ldGFkYXRhIjogeyJpc19hZG1pbiI6IDAsICJyb2xlcyI6IFsiOWZlMmZmOWVlNDM4NGIxODk0YTkwODc4ZDNlOTJiYWIiXX19fTGCAYEwggF9AgEBMFwwVzELMAkGA1UEBhMCVVMxDjAMBgNVBAgMBVVuc2V0MQ4wDAYDVQQHDAVVbnNldDEOMAwGA1UECgwFVW5zZXQxGDAWBgNVBAMMD3d3dy5leGFtcGxlLmNvbQIBATAHBgUrDgMCGjANBgkqhkiG9w0BAQEFAASCAQC951jKOLWJg1yPGMKNaU3zMbPN-UZ20zyhTc7AMinAShKwEGma5ErMDCz1IR2yHKnCIPO5wIPLPrVaanptVD9Wc7Y236MvjVsceID3KGQNuNAKwx0Y7YUjx1Dn-r7gTsq+cmJWxZkXLKP8zhysRbsBQML3VN9sWiISPjea5f0-qEKiXErWGcBq609cX4AHkzNvIi-coFQA2l4jvNnd7O-AOR+-5mSOJ1g0Q8DxY5weOEU8JBZFyLCO7NvSMohUsKTu9bZa4e43fewZ5OOFArSCdXWhkXH8U31m1fstHp3adrAFcLsSrc5bmv3n8e-1A1HGlZiE8QbdWPoztliuhZTM\", \"token_version\": \"v2.0\", \"tenant\": {\"id\": \"62c092ccba1c49d7b7a239d08c5ce0c2\", \"enabled\": true, \"description\": \"Demo Tenant\", \"name\": \"demo\"}, \"metadata\": {\"roles\": [\"9fe2ff9ee4384b1894a90878d3e92bab\"]}}',1,NULL,'28d16fa0461d4a7dbfea238e70534460'),('6de7f9a00b3ee3215bf76744dbe57da2','2016-09-19 20:43:49','{\"bind\": null, \"token_data\": {\"access\": {\"token\": {\"issued_at\": \"2016-09-19T19:43:49.822751\", \"expires\": \"2016-09-19T20:43:49Z\", \"id\": \"MIIHhQYJKoZIhvcNAQcCoIIHdjCCB3ICAQExCTAHBgUrDgMCGjCCBdsGCSqGSIb3DQEHAaCCBcwEggXIeyJhY2Nlc3MiOiB7InRva2VuIjogeyJpc3N1ZWRfYXQiOiAiMjAxNi0wOS0xOVQxOTo0Mzo0OS44MjI3NTEiLCAiZXhwaXJlcyI6ICIyMDE2LTA5LTE5VDIwOjQzOjQ5WiIsICJpZCI6ICJwbGFjZWhvbGRlciIsICJ0ZW5hbnQiOiB7ImRlc2NyaXB0aW9uIjogbnVsbCwgImVuYWJsZWQiOiB0cnVlLCAiaWQiOiAiZGY2ZTg5MWZhZDViNGFjZDllNjc3NTllNWRiNWIwMjciLCAibmFtZSI6ICJhZG1pbiJ9fSwgInNlcnZpY2VDYXRhbG9nIjogW3siZW5kcG9pbnRzIjogW3siYWRtaW5VUkwiOiAiaHR0cDovL2xvY2FsaG9zdDo4Nzc2L3YxL2RmNmU4OTFmYWQ1YjRhY2Q5ZTY3NzU5ZTVkYjViMDI3IiwgInJlZ2lvbiI6ICJyZWdpb25PbmUiLCAiaW50ZXJuYWxVUkwiOiAiaHR0cDovL2xvY2FsaG9zdDo4Nzc2L3YxL2RmNmU4OTFmYWQ1YjRhY2Q5ZTY3NzU5ZTVkYjViMDI3IiwgImlkIjogIjMwMmUxZTAzMTRiZDQxYmNhZWYzOWQ4MjAwODJhZDk0IiwgInB1YmxpY1VSTCI6ICJodHRwOi8vbG9jYWxob3N0Ojg3NzYvdjEvZGY2ZTg5MWZhZDViNGFjZDllNjc3NTllNWRiNWIwMjcifV0sICJlbmRwb2ludHNfbGlua3MiOiBbXSwgInR5cGUiOiAidm9sdW1lIiwgIm5hbWUiOiAiY2luZGVyIn0sIHsiZW5kcG9pbnRzIjogW3siYWRtaW5VUkwiOiAiaHR0cDovL2xvY2FsaG9zdDo4Nzc2L3YyL2RmNmU4OTFmYWQ1YjRhY2Q5ZTY3NzU5ZTVkYjViMDI3IiwgInJlZ2lvbiI6ICJyZWdpb25PbmUiLCAiaW50ZXJuYWxVUkwiOiAiaHR0cDovL2xvY2FsaG9zdDo4Nzc2L3YyL2RmNmU4OTFmYWQ1YjRhY2Q5ZTY3NzU5ZTVkYjViMDI3IiwgImlkIjogIjc1OGU1NzdlM2JkZTRhYzNhOGI0MDhlOWNjNjI2NjQ2IiwgInB1YmxpY1VSTCI6ICJodHRwOi8vbG9jYWxob3N0Ojg3NzYvdjIvZGY2ZTg5MWZhZDViNGFjZDllNjc3NTllNWRiNWIwMjcifV0sICJlbmRwb2ludHNfbGlua3MiOiBbXSwgInR5cGUiOiAidm9sdW1ldjIiLCAibmFtZSI6ICJjaW5kZXJ2MiJ9LCB7ImVuZHBvaW50cyI6IFt7ImFkbWluVVJMIjogImh0dHA6Ly9sb2NhbGhvc3Q6MzUzNTcvdjIuMCIsICJyZWdpb24iOiAicmVnaW9uT25lIiwgImludGVybmFsVVJMIjogImh0dHA6Ly9sb2NhbGhvc3Q6NTAwMC92Mi4wIiwgImlkIjogIjhjMjcyYjFmYWEyYjQ4Y2U5YzVmMjgyNTg0ODhjNWIxIiwgInB1YmxpY1VSTCI6ICJodHRwOi8vbG9jYWxob3N0OjUwMDAvdjIuMCJ9XSwgImVuZHBvaW50c19saW5rcyI6IFtdLCAidHlwZSI6ICJpZGVudGl0eSIsICJuYW1lIjogImtleXN0b25lIn1dLCAidXNlciI6IHsidXNlcm5hbWUiOiAiYWRtaW4iLCAicm9sZXNfbGlua3MiOiBbXSwgImlkIjogImFjNDJmYTgzZTUyOTQ3ZmU4YTgyN2JkZDBlNGVjODliIiwgInJvbGVzIjogW3sibmFtZSI6ICJhZG1pbiJ9XSwgIm5hbWUiOiAiYWRtaW4ifSwgIm1ldGFkYXRhIjogeyJpc19hZG1pbiI6IDAsICJyb2xlcyI6IFsiMjgwZDQxNjg3NWVmNDBhNGJjOTkyOGU1NmY1MTliNzkiXX19fTGCAYEwggF9AgEBMFwwVzELMAkGA1UEBhMCVVMxDjAMBgNVBAgMBVVuc2V0MQ4wDAYDVQQHDAVVbnNldDEOMAwGA1UECgwFVW5zZXQxGDAWBgNVBAMMD3d3dy5leGFtcGxlLmNvbQIBATAHBgUrDgMCGjANBgkqhkiG9w0BAQEFAASCAQBEYIX-jmueuwNdMrVCpLaUYc5Tl-ZH7vSISv+A62d31eXaZNBjIlQkVexwki4gRsWSRSRjd3zi4NPOk06mui4Xk7VIOvenS59FQ88yqMhQxMqgWFgGEuy6Sw+kyhSG9wImavdWHTFI4NVCwAQDHAoEytoYaLq3Enp8TIKqWFXRaEBzOLUUzgMUG4zdo6yuVmH+rp4PHckqQPa7zYGdQDu787rwYbGVTMzMnePWlEYRuM42wdcqmTyCUKvvxBynd2LgMb5nLaBu-1KPG2O0fAyeDCS971rMqRWniRDAuIaGI4WbqtUBwdbNuRqPfOLvIEEtXmRjR54tNzNbvZusya8X\", \"tenant\": {\"id\": \"df6e891fad5b4acd9e67759e5db5b027\", \"enabled\": true, \"description\": null, \"name\": \"admin\"}}, \"serviceCatalog\": [{\"endpoints\": [{\"adminURL\": \"http://localhost:8776/v1/df6e891fad5b4acd9e67759e5db5b027\", \"region\": \"regionOne\", \"id\": \"302e1e0314bd41bcaef39d820082ad94\", \"internalURL\": \"http://localhost:8776/v1/df6e891fad5b4acd9e67759e5db5b027\", \"publicURL\": \"http://localhost:8776/v1/df6e891fad5b4acd9e67759e5db5b027\"}], \"endpoints_links\": [], \"type\": \"volume\", \"name\": \"cinder\"}, {\"endpoints\": [{\"adminURL\": \"http://localhost:8776/v2/df6e891fad5b4acd9e67759e5db5b027\", \"region\": \"regionOne\", \"id\": \"758e577e3bde4ac3a8b408e9cc626646\", \"internalURL\": \"http://localhost:8776/v2/df6e891fad5b4acd9e67759e5db5b027\", \"publicURL\": \"http://localhost:8776/v2/df6e891fad5b4acd9e67759e5db5b027\"}], \"endpoints_links\": [], \"type\": \"volumev2\", \"name\": \"cinderv2\"}, {\"endpoints\": [{\"adminURL\": \"http://localhost:35357/v2.0\", \"region\": \"regionOne\", \"id\": \"8c272b1faa2b48ce9c5f28258488c5b1\", \"internalURL\": \"http://localhost:5000/v2.0\", \"publicURL\": \"http://localhost:5000/v2.0\"}], \"endpoints_links\": [], \"type\": \"identity\", \"name\": \"keystone\"}], \"user\": {\"username\": \"admin\", \"roles_links\": [], \"id\": \"ac42fa83e52947fe8a827bdd0e4ec89b\", \"roles\": [{\"name\": \"admin\"}], \"name\": \"admin\"}, \"metadata\": {\"is_admin\": 0, \"roles\": [\"280d416875ef40a4bc9928e56f519b79\"]}}}, \"user\": {\"username\": \"admin\", \"email\": \"alop@localhost\", \"enabled\": true, \"id\": \"ac42fa83e52947fe8a827bdd0e4ec89b\", \"name\": \"admin\"}, \"key\": \"MIIHhQYJKoZIhvcNAQcCoIIHdjCCB3ICAQExCTAHBgUrDgMCGjCCBdsGCSqGSIb3DQEHAaCCBcwEggXIeyJhY2Nlc3MiOiB7InRva2VuIjogeyJpc3N1ZWRfYXQiOiAiMjAxNi0wOS0xOVQxOTo0Mzo0OS44MjI3NTEiLCAiZXhwaXJlcyI6ICIyMDE2LTA5LTE5VDIwOjQzOjQ5WiIsICJpZCI6ICJwbGFjZWhvbGRlciIsICJ0ZW5hbnQiOiB7ImRlc2NyaXB0aW9uIjogbnVsbCwgImVuYWJsZWQiOiB0cnVlLCAiaWQiOiAiZGY2ZTg5MWZhZDViNGFjZDllNjc3NTllNWRiNWIwMjciLCAibmFtZSI6ICJhZG1pbiJ9fSwgInNlcnZpY2VDYXRhbG9nIjogW3siZW5kcG9pbnRzIjogW3siYWRtaW5VUkwiOiAiaHR0cDovL2xvY2FsaG9zdDo4Nzc2L3YxL2RmNmU4OTFmYWQ1YjRhY2Q5ZTY3NzU5ZTVkYjViMDI3IiwgInJlZ2lvbiI6ICJyZWdpb25PbmUiLCAiaW50ZXJuYWxVUkwiOiAiaHR0cDovL2xvY2FsaG9zdDo4Nzc2L3YxL2RmNmU4OTFmYWQ1YjRhY2Q5ZTY3NzU5ZTVkYjViMDI3IiwgImlkIjogIjMwMmUxZTAzMTRiZDQxYmNhZWYzOWQ4MjAwODJhZDk0IiwgInB1YmxpY1VSTCI6ICJodHRwOi8vbG9jYWxob3N0Ojg3NzYvdjEvZGY2ZTg5MWZhZDViNGFjZDllNjc3NTllNWRiNWIwMjcifV0sICJlbmRwb2ludHNfbGlua3MiOiBbXSwgInR5cGUiOiAidm9sdW1lIiwgIm5hbWUiOiAiY2luZGVyIn0sIHsiZW5kcG9pbnRzIjogW3siYWRtaW5VUkwiOiAiaHR0cDovL2xvY2FsaG9zdDo4Nzc2L3YyL2RmNmU4OTFmYWQ1YjRhY2Q5ZTY3NzU5ZTVkYjViMDI3IiwgInJlZ2lvbiI6ICJyZWdpb25PbmUiLCAiaW50ZXJuYWxVUkwiOiAiaHR0cDovL2xvY2FsaG9zdDo4Nzc2L3YyL2RmNmU4OTFmYWQ1YjRhY2Q5ZTY3NzU5ZTVkYjViMDI3IiwgImlkIjogIjc1OGU1NzdlM2JkZTRhYzNhOGI0MDhlOWNjNjI2NjQ2IiwgInB1YmxpY1VSTCI6ICJodHRwOi8vbG9jYWxob3N0Ojg3NzYvdjIvZGY2ZTg5MWZhZDViNGFjZDllNjc3NTllNWRiNWIwMjcifV0sICJlbmRwb2ludHNfbGlua3MiOiBbXSwgInR5cGUiOiAidm9sdW1ldjIiLCAibmFtZSI6ICJjaW5kZXJ2MiJ9LCB7ImVuZHBvaW50cyI6IFt7ImFkbWluVVJMIjogImh0dHA6Ly9sb2NhbGhvc3Q6MzUzNTcvdjIuMCIsICJyZWdpb24iOiAicmVnaW9uT25lIiwgImludGVybmFsVVJMIjogImh0dHA6Ly9sb2NhbGhvc3Q6NTAwMC92Mi4wIiwgImlkIjogIjhjMjcyYjFmYWEyYjQ4Y2U5YzVmMjgyNTg0ODhjNWIxIiwgInB1YmxpY1VSTCI6ICJodHRwOi8vbG9jYWxob3N0OjUwMDAvdjIuMCJ9XSwgImVuZHBvaW50c19saW5rcyI6IFtdLCAidHlwZSI6ICJpZGVudGl0eSIsICJuYW1lIjogImtleXN0b25lIn1dLCAidXNlciI6IHsidXNlcm5hbWUiOiAiYWRtaW4iLCAicm9sZXNfbGlua3MiOiBbXSwgImlkIjogImFjNDJmYTgzZTUyOTQ3ZmU4YTgyN2JkZDBlNGVjODliIiwgInJvbGVzIjogW3sibmFtZSI6ICJhZG1pbiJ9XSwgIm5hbWUiOiAiYWRtaW4ifSwgIm1ldGFkYXRhIjogeyJpc19hZG1pbiI6IDAsICJyb2xlcyI6IFsiMjgwZDQxNjg3NWVmNDBhNGJjOTkyOGU1NmY1MTliNzkiXX19fTGCAYEwggF9AgEBMFwwVzELMAkGA1UEBhMCVVMxDjAMBgNVBAgMBVVuc2V0MQ4wDAYDVQQHDAVVbnNldDEOMAwGA1UECgwFVW5zZXQxGDAWBgNVBAMMD3d3dy5leGFtcGxlLmNvbQIBATAHBgUrDgMCGjANBgkqhkiG9w0BAQEFAASCAQBEYIX-jmueuwNdMrVCpLaUYc5Tl-ZH7vSISv+A62d31eXaZNBjIlQkVexwki4gRsWSRSRjd3zi4NPOk06mui4Xk7VIOvenS59FQ88yqMhQxMqgWFgGEuy6Sw+kyhSG9wImavdWHTFI4NVCwAQDHAoEytoYaLq3Enp8TIKqWFXRaEBzOLUUzgMUG4zdo6yuVmH+rp4PHckqQPa7zYGdQDu787rwYbGVTMzMnePWlEYRuM42wdcqmTyCUKvvxBynd2LgMb5nLaBu-1KPG2O0fAyeDCS971rMqRWniRDAuIaGI4WbqtUBwdbNuRqPfOLvIEEtXmRjR54tNzNbvZusya8X\", \"token_version\": \"v2.0\", \"tenant\": {\"id\": \"df6e891fad5b4acd9e67759e5db5b027\", \"enabled\": true, \"description\": null, \"name\": \"admin\"}, \"metadata\": {\"roles\": [\"280d416875ef40a4bc9928e56f519b79\"]}}',1,NULL,'ac42fa83e52947fe8a827bdd0e4ec89b'),('bd05b15dd83fc25968ed5632715d5337','2016-09-19 20:43:52','{\"bind\": null, \"token_data\": {\"access\": {\"token\": {\"issued_at\": \"2016-09-19T19:43:52.258410\", \"expires\": \"2016-09-19T20:43:52Z\", \"id\": \"MIIHhQYJKoZIhvcNAQcCoIIHdjCCB3ICAQExCTAHBgUrDgMCGjCCBdsGCSqGSIb3DQEHAaCCBcwEggXIeyJhY2Nlc3MiOiB7InRva2VuIjogeyJpc3N1ZWRfYXQiOiAiMjAxNi0wOS0xOVQxOTo0Mzo1Mi4yNTg0MTAiLCAiZXhwaXJlcyI6ICIyMDE2LTA5LTE5VDIwOjQzOjUyWiIsICJpZCI6ICJwbGFjZWhvbGRlciIsICJ0ZW5hbnQiOiB7ImRlc2NyaXB0aW9uIjogbnVsbCwgImVuYWJsZWQiOiB0cnVlLCAiaWQiOiAiZGY2ZTg5MWZhZDViNGFjZDllNjc3NTllNWRiNWIwMjciLCAibmFtZSI6ICJhZG1pbiJ9fSwgInNlcnZpY2VDYXRhbG9nIjogW3siZW5kcG9pbnRzIjogW3siYWRtaW5VUkwiOiAiaHR0cDovL2xvY2FsaG9zdDo4Nzc2L3YxL2RmNmU4OTFmYWQ1YjRhY2Q5ZTY3NzU5ZTVkYjViMDI3IiwgInJlZ2lvbiI6ICJyZWdpb25PbmUiLCAiaW50ZXJuYWxVUkwiOiAiaHR0cDovL2xvY2FsaG9zdDo4Nzc2L3YxL2RmNmU4OTFmYWQ1YjRhY2Q5ZTY3NzU5ZTVkYjViMDI3IiwgImlkIjogIjMwMmUxZTAzMTRiZDQxYmNhZWYzOWQ4MjAwODJhZDk0IiwgInB1YmxpY1VSTCI6ICJodHRwOi8vbG9jYWxob3N0Ojg3NzYvdjEvZGY2ZTg5MWZhZDViNGFjZDllNjc3NTllNWRiNWIwMjcifV0sICJlbmRwb2ludHNfbGlua3MiOiBbXSwgInR5cGUiOiAidm9sdW1lIiwgIm5hbWUiOiAiY2luZGVyIn0sIHsiZW5kcG9pbnRzIjogW3siYWRtaW5VUkwiOiAiaHR0cDovL2xvY2FsaG9zdDo4Nzc2L3YyL2RmNmU4OTFmYWQ1YjRhY2Q5ZTY3NzU5ZTVkYjViMDI3IiwgInJlZ2lvbiI6ICJyZWdpb25PbmUiLCAiaW50ZXJuYWxVUkwiOiAiaHR0cDovL2xvY2FsaG9zdDo4Nzc2L3YyL2RmNmU4OTFmYWQ1YjRhY2Q5ZTY3NzU5ZTVkYjViMDI3IiwgImlkIjogIjc1OGU1NzdlM2JkZTRhYzNhOGI0MDhlOWNjNjI2NjQ2IiwgInB1YmxpY1VSTCI6ICJodHRwOi8vbG9jYWxob3N0Ojg3NzYvdjIvZGY2ZTg5MWZhZDViNGFjZDllNjc3NTllNWRiNWIwMjcifV0sICJlbmRwb2ludHNfbGlua3MiOiBbXSwgInR5cGUiOiAidm9sdW1ldjIiLCAibmFtZSI6ICJjaW5kZXJ2MiJ9LCB7ImVuZHBvaW50cyI6IFt7ImFkbWluVVJMIjogImh0dHA6Ly9sb2NhbGhvc3Q6MzUzNTcvdjIuMCIsICJyZWdpb24iOiAicmVnaW9uT25lIiwgImludGVybmFsVVJMIjogImh0dHA6Ly9sb2NhbGhvc3Q6NTAwMC92Mi4wIiwgImlkIjogIjhjMjcyYjFmYWEyYjQ4Y2U5YzVmMjgyNTg0ODhjNWIxIiwgInB1YmxpY1VSTCI6ICJodHRwOi8vbG9jYWxob3N0OjUwMDAvdjIuMCJ9XSwgImVuZHBvaW50c19saW5rcyI6IFtdLCAidHlwZSI6ICJpZGVudGl0eSIsICJuYW1lIjogImtleXN0b25lIn1dLCAidXNlciI6IHsidXNlcm5hbWUiOiAiYWRtaW4iLCAicm9sZXNfbGlua3MiOiBbXSwgImlkIjogImFjNDJmYTgzZTUyOTQ3ZmU4YTgyN2JkZDBlNGVjODliIiwgInJvbGVzIjogW3sibmFtZSI6ICJhZG1pbiJ9XSwgIm5hbWUiOiAiYWRtaW4ifSwgIm1ldGFkYXRhIjogeyJpc19hZG1pbiI6IDAsICJyb2xlcyI6IFsiMjgwZDQxNjg3NWVmNDBhNGJjOTkyOGU1NmY1MTliNzkiXX19fTGCAYEwggF9AgEBMFwwVzELMAkGA1UEBhMCVVMxDjAMBgNVBAgMBVVuc2V0MQ4wDAYDVQQHDAVVbnNldDEOMAwGA1UECgwFVW5zZXQxGDAWBgNVBAMMD3d3dy5leGFtcGxlLmNvbQIBATAHBgUrDgMCGjANBgkqhkiG9w0BAQEFAASCAQA+dnbcGNK8xyCch3RS-BdoXUrQHyG9MwR8FKyb8ABcOgq6rNv+Tn3j7g8Iy4CRzQw7-NxqwiG3jOcpcqIuRE40n1+Nhl0r6HMBje-1hShdzZGSGQSLBjpYZaZnm5sx+YmKaQqz1VprfKpTiIdp-1xabfQYUCBCcr5eewb3VUXQOfpXRgXaGU6ZdUo6UpIB4gg9qwzpIILQd3WWkSiCY9bS2HvjSMkg2AnYcuSXqBi+D4iSW+U8T7xSZ1CtUtwloZ7nZbFC+5fp0G5gTMBXvbhhzDmgysTu8U4qKEbErAlcGeodlPvBI17UGoJ0Z64Q7WYbW+eOaHhAZ0+EHkmViBJV\", \"tenant\": {\"id\": \"df6e891fad5b4acd9e67759e5db5b027\", \"enabled\": true, \"description\": null, \"name\": \"admin\"}}, \"serviceCatalog\": [{\"endpoints\": [{\"adminURL\": \"http://localhost:8776/v1/df6e891fad5b4acd9e67759e5db5b027\", \"region\": \"regionOne\", \"id\": \"302e1e0314bd41bcaef39d820082ad94\", \"internalURL\": \"http://localhost:8776/v1/df6e891fad5b4acd9e67759e5db5b027\", \"publicURL\": \"http://localhost:8776/v1/df6e891fad5b4acd9e67759e5db5b027\"}], \"endpoints_links\": [], \"type\": \"volume\", \"name\": \"cinder\"}, {\"endpoints\": [{\"adminURL\": \"http://localhost:8776/v2/df6e891fad5b4acd9e67759e5db5b027\", \"region\": \"regionOne\", \"id\": \"758e577e3bde4ac3a8b408e9cc626646\", \"internalURL\": \"http://localhost:8776/v2/df6e891fad5b4acd9e67759e5db5b027\", \"publicURL\": \"http://localhost:8776/v2/df6e891fad5b4acd9e67759e5db5b027\"}], \"endpoints_links\": [], \"type\": \"volumev2\", \"name\": \"cinderv2\"}, {\"endpoints\": [{\"adminURL\": \"http://localhost:35357/v2.0\", \"region\": \"regionOne\", \"id\": \"8c272b1faa2b48ce9c5f28258488c5b1\", \"internalURL\": \"http://localhost:5000/v2.0\", \"publicURL\": \"http://localhost:5000/v2.0\"}], \"endpoints_links\": [], \"type\": \"identity\", \"name\": \"keystone\"}], \"user\": {\"username\": \"admin\", \"roles_links\": [], \"id\": \"ac42fa83e52947fe8a827bdd0e4ec89b\", \"roles\": [{\"name\": \"admin\"}], \"name\": \"admin\"}, \"metadata\": {\"is_admin\": 0, \"roles\": [\"280d416875ef40a4bc9928e56f519b79\"]}}}, \"user\": {\"username\": \"admin\", \"email\": \"alop@localhost\", \"enabled\": true, \"id\": \"ac42fa83e52947fe8a827bdd0e4ec89b\", \"name\": \"admin\"}, \"key\": \"MIIHhQYJKoZIhvcNAQcCoIIHdjCCB3ICAQExCTAHBgUrDgMCGjCCBdsGCSqGSIb3DQEHAaCCBcwEggXIeyJhY2Nlc3MiOiB7InRva2VuIjogeyJpc3N1ZWRfYXQiOiAiMjAxNi0wOS0xOVQxOTo0Mzo1Mi4yNTg0MTAiLCAiZXhwaXJlcyI6ICIyMDE2LTA5LTE5VDIwOjQzOjUyWiIsICJpZCI6ICJwbGFjZWhvbGRlciIsICJ0ZW5hbnQiOiB7ImRlc2NyaXB0aW9uIjogbnVsbCwgImVuYWJsZWQiOiB0cnVlLCAiaWQiOiAiZGY2ZTg5MWZhZDViNGFjZDllNjc3NTllNWRiNWIwMjciLCAibmFtZSI6ICJhZG1pbiJ9fSwgInNlcnZpY2VDYXRhbG9nIjogW3siZW5kcG9pbnRzIjogW3siYWRtaW5VUkwiOiAiaHR0cDovL2xvY2FsaG9zdDo4Nzc2L3YxL2RmNmU4OTFmYWQ1YjRhY2Q5ZTY3NzU5ZTVkYjViMDI3IiwgInJlZ2lvbiI6ICJyZWdpb25PbmUiLCAiaW50ZXJuYWxVUkwiOiAiaHR0cDovL2xvY2FsaG9zdDo4Nzc2L3YxL2RmNmU4OTFmYWQ1YjRhY2Q5ZTY3NzU5ZTVkYjViMDI3IiwgImlkIjogIjMwMmUxZTAzMTRiZDQxYmNhZWYzOWQ4MjAwODJhZDk0IiwgInB1YmxpY1VSTCI6ICJodHRwOi8vbG9jYWxob3N0Ojg3NzYvdjEvZGY2ZTg5MWZhZDViNGFjZDllNjc3NTllNWRiNWIwMjcifV0sICJlbmRwb2ludHNfbGlua3MiOiBbXSwgInR5cGUiOiAidm9sdW1lIiwgIm5hbWUiOiAiY2luZGVyIn0sIHsiZW5kcG9pbnRzIjogW3siYWRtaW5VUkwiOiAiaHR0cDovL2xvY2FsaG9zdDo4Nzc2L3YyL2RmNmU4OTFmYWQ1YjRhY2Q5ZTY3NzU5ZTVkYjViMDI3IiwgInJlZ2lvbiI6ICJyZWdpb25PbmUiLCAiaW50ZXJuYWxVUkwiOiAiaHR0cDovL2xvY2FsaG9zdDo4Nzc2L3YyL2RmNmU4OTFmYWQ1YjRhY2Q5ZTY3NzU5ZTVkYjViMDI3IiwgImlkIjogIjc1OGU1NzdlM2JkZTRhYzNhOGI0MDhlOWNjNjI2NjQ2IiwgInB1YmxpY1VSTCI6ICJodHRwOi8vbG9jYWxob3N0Ojg3NzYvdjIvZGY2ZTg5MWZhZDViNGFjZDllNjc3NTllNWRiNWIwMjcifV0sICJlbmRwb2ludHNfbGlua3MiOiBbXSwgInR5cGUiOiAidm9sdW1ldjIiLCAibmFtZSI6ICJjaW5kZXJ2MiJ9LCB7ImVuZHBvaW50cyI6IFt7ImFkbWluVVJMIjogImh0dHA6Ly9sb2NhbGhvc3Q6MzUzNTcvdjIuMCIsICJyZWdpb24iOiAicmVnaW9uT25lIiwgImludGVybmFsVVJMIjogImh0dHA6Ly9sb2NhbGhvc3Q6NTAwMC92Mi4wIiwgImlkIjogIjhjMjcyYjFmYWEyYjQ4Y2U5YzVmMjgyNTg0ODhjNWIxIiwgInB1YmxpY1VSTCI6ICJodHRwOi8vbG9jYWxob3N0OjUwMDAvdjIuMCJ9XSwgImVuZHBvaW50c19saW5rcyI6IFtdLCAidHlwZSI6ICJpZGVudGl0eSIsICJuYW1lIjogImtleXN0b25lIn1dLCAidXNlciI6IHsidXNlcm5hbWUiOiAiYWRtaW4iLCAicm9sZXNfbGlua3MiOiBbXSwgImlkIjogImFjNDJmYTgzZTUyOTQ3ZmU4YTgyN2JkZDBlNGVjODliIiwgInJvbGVzIjogW3sibmFtZSI6ICJhZG1pbiJ9XSwgIm5hbWUiOiAiYWRtaW4ifSwgIm1ldGFkYXRhIjogeyJpc19hZG1pbiI6IDAsICJyb2xlcyI6IFsiMjgwZDQxNjg3NWVmNDBhNGJjOTkyOGU1NmY1MTliNzkiXX19fTGCAYEwggF9AgEBMFwwVzELMAkGA1UEBhMCVVMxDjAMBgNVBAgMBVVuc2V0MQ4wDAYDVQQHDAVVbnNldDEOMAwGA1UECgwFVW5zZXQxGDAWBgNVBAMMD3d3dy5leGFtcGxlLmNvbQIBATAHBgUrDgMCGjANBgkqhkiG9w0BAQEFAASCAQA+dnbcGNK8xyCch3RS-BdoXUrQHyG9MwR8FKyb8ABcOgq6rNv+Tn3j7g8Iy4CRzQw7-NxqwiG3jOcpcqIuRE40n1+Nhl0r6HMBje-1hShdzZGSGQSLBjpYZaZnm5sx+YmKaQqz1VprfKpTiIdp-1xabfQYUCBCcr5eewb3VUXQOfpXRgXaGU6ZdUo6UpIB4gg9qwzpIILQd3WWkSiCY9bS2HvjSMkg2AnYcuSXqBi+D4iSW+U8T7xSZ1CtUtwloZ7nZbFC+5fp0G5gTMBXvbhhzDmgysTu8U4qKEbErAlcGeodlPvBI17UGoJ0Z64Q7WYbW+eOaHhAZ0+EHkmViBJV\", \"token_version\": \"v2.0\", \"tenant\": {\"id\": \"df6e891fad5b4acd9e67759e5db5b027\", \"enabled\": true, \"description\": null, \"name\": \"admin\"}, \"metadata\": {\"roles\": [\"280d416875ef40a4bc9928e56f519b79\"]}}',1,NULL,'ac42fa83e52947fe8a827bdd0e4ec89b'),('d3c4b2609c654bd954ce8502a8359a9e','2016-09-19 20:43:39','{\"bind\": null, \"token_data\": {\"access\": {\"token\": {\"issued_at\": \"2016-09-19T19:43:39.817650\", \"expires\": \"2016-09-19T20:43:39Z\", \"id\": \"MIIHhQYJKoZIhvcNAQcCoIIHdjCCB3ICAQExCTAHBgUrDgMCGjCCBdsGCSqGSIb3DQEHAaCCBcwEggXIeyJhY2Nlc3MiOiB7InRva2VuIjogeyJpc3N1ZWRfYXQiOiAiMjAxNi0wOS0xOVQxOTo0MzozOS44MTc2NTAiLCAiZXhwaXJlcyI6ICIyMDE2LTA5LTE5VDIwOjQzOjM5WiIsICJpZCI6ICJwbGFjZWhvbGRlciIsICJ0ZW5hbnQiOiB7ImRlc2NyaXB0aW9uIjogbnVsbCwgImVuYWJsZWQiOiB0cnVlLCAiaWQiOiAiZGY2ZTg5MWZhZDViNGFjZDllNjc3NTllNWRiNWIwMjciLCAibmFtZSI6ICJhZG1pbiJ9fSwgInNlcnZpY2VDYXRhbG9nIjogW3siZW5kcG9pbnRzIjogW3siYWRtaW5VUkwiOiAiaHR0cDovL2xvY2FsaG9zdDo4Nzc2L3YxL2RmNmU4OTFmYWQ1YjRhY2Q5ZTY3NzU5ZTVkYjViMDI3IiwgInJlZ2lvbiI6ICJyZWdpb25PbmUiLCAiaW50ZXJuYWxVUkwiOiAiaHR0cDovL2xvY2FsaG9zdDo4Nzc2L3YxL2RmNmU4OTFmYWQ1YjRhY2Q5ZTY3NzU5ZTVkYjViMDI3IiwgImlkIjogIjMwMmUxZTAzMTRiZDQxYmNhZWYzOWQ4MjAwODJhZDk0IiwgInB1YmxpY1VSTCI6ICJodHRwOi8vbG9jYWxob3N0Ojg3NzYvdjEvZGY2ZTg5MWZhZDViNGFjZDllNjc3NTllNWRiNWIwMjcifV0sICJlbmRwb2ludHNfbGlua3MiOiBbXSwgInR5cGUiOiAidm9sdW1lIiwgIm5hbWUiOiAiY2luZGVyIn0sIHsiZW5kcG9pbnRzIjogW3siYWRtaW5VUkwiOiAiaHR0cDovL2xvY2FsaG9zdDo4Nzc2L3YyL2RmNmU4OTFmYWQ1YjRhY2Q5ZTY3NzU5ZTVkYjViMDI3IiwgInJlZ2lvbiI6ICJyZWdpb25PbmUiLCAiaW50ZXJuYWxVUkwiOiAiaHR0cDovL2xvY2FsaG9zdDo4Nzc2L3YyL2RmNmU4OTFmYWQ1YjRhY2Q5ZTY3NzU5ZTVkYjViMDI3IiwgImlkIjogIjc1OGU1NzdlM2JkZTRhYzNhOGI0MDhlOWNjNjI2NjQ2IiwgInB1YmxpY1VSTCI6ICJodHRwOi8vbG9jYWxob3N0Ojg3NzYvdjIvZGY2ZTg5MWZhZDViNGFjZDllNjc3NTllNWRiNWIwMjcifV0sICJlbmRwb2ludHNfbGlua3MiOiBbXSwgInR5cGUiOiAidm9sdW1ldjIiLCAibmFtZSI6ICJjaW5kZXJ2MiJ9LCB7ImVuZHBvaW50cyI6IFt7ImFkbWluVVJMIjogImh0dHA6Ly9sb2NhbGhvc3Q6MzUzNTcvdjIuMCIsICJyZWdpb24iOiAicmVnaW9uT25lIiwgImludGVybmFsVVJMIjogImh0dHA6Ly9sb2NhbGhvc3Q6NTAwMC92Mi4wIiwgImlkIjogIjhjMjcyYjFmYWEyYjQ4Y2U5YzVmMjgyNTg0ODhjNWIxIiwgInB1YmxpY1VSTCI6ICJodHRwOi8vbG9jYWxob3N0OjUwMDAvdjIuMCJ9XSwgImVuZHBvaW50c19saW5rcyI6IFtdLCAidHlwZSI6ICJpZGVudGl0eSIsICJuYW1lIjogImtleXN0b25lIn1dLCAidXNlciI6IHsidXNlcm5hbWUiOiAiYWRtaW4iLCAicm9sZXNfbGlua3MiOiBbXSwgImlkIjogImFjNDJmYTgzZTUyOTQ3ZmU4YTgyN2JkZDBlNGVjODliIiwgInJvbGVzIjogW3sibmFtZSI6ICJhZG1pbiJ9XSwgIm5hbWUiOiAiYWRtaW4ifSwgIm1ldGFkYXRhIjogeyJpc19hZG1pbiI6IDAsICJyb2xlcyI6IFsiMjgwZDQxNjg3NWVmNDBhNGJjOTkyOGU1NmY1MTliNzkiXX19fTGCAYEwggF9AgEBMFwwVzELMAkGA1UEBhMCVVMxDjAMBgNVBAgMBVVuc2V0MQ4wDAYDVQQHDAVVbnNldDEOMAwGA1UECgwFVW5zZXQxGDAWBgNVBAMMD3d3dy5leGFtcGxlLmNvbQIBATAHBgUrDgMCGjANBgkqhkiG9w0BAQEFAASCAQBBEmaNydoZAj0IbW0wkRxx7qPiJEH4cGMdcPhJbhVieojE9ioAYh0gs4QQIqCoNDbnLy+uIlMrIYH+8kal501BtoMZsRxxxguFtnqrSXd2PCHI6Y+J8j254sUHDnQjGm0wUVa4DJG2Wa8E0jR6esNqTKmFKGBA0mMJWUZxuXXHe5Fy7UBaXKYfN3PGN+mI9kZG1x3eD8SK0dD5ZYXbNhW6zjDDzU+Po53RwaokpmmsP7hQPdpRCUKQB2jDRcgbfSEEZ6YsS4US8lh487Ov3wj4aYWxQyKauSg6bASz05nq0OJmu0qD2XFnMNf0LTLqv1UJ9sD9m+rs2CcO72tNtLCR\", \"tenant\": {\"id\": \"df6e891fad5b4acd9e67759e5db5b027\", \"enabled\": true, \"description\": null, \"name\": \"admin\"}}, \"serviceCatalog\": [{\"endpoints\": [{\"adminURL\": \"http://localhost:8776/v1/df6e891fad5b4acd9e67759e5db5b027\", \"region\": \"regionOne\", \"id\": \"302e1e0314bd41bcaef39d820082ad94\", \"internalURL\": \"http://localhost:8776/v1/df6e891fad5b4acd9e67759e5db5b027\", \"publicURL\": \"http://localhost:8776/v1/df6e891fad5b4acd9e67759e5db5b027\"}], \"endpoints_links\": [], \"type\": \"volume\", \"name\": \"cinder\"}, {\"endpoints\": [{\"adminURL\": \"http://localhost:8776/v2/df6e891fad5b4acd9e67759e5db5b027\", \"region\": \"regionOne\", \"id\": \"758e577e3bde4ac3a8b408e9cc626646\", \"internalURL\": \"http://localhost:8776/v2/df6e891fad5b4acd9e67759e5db5b027\", \"publicURL\": \"http://localhost:8776/v2/df6e891fad5b4acd9e67759e5db5b027\"}], \"endpoints_links\": [], \"type\": \"volumev2\", \"name\": \"cinderv2\"}, {\"endpoints\": [{\"adminURL\": \"http://localhost:35357/v2.0\", \"region\": \"regionOne\", \"id\": \"8c272b1faa2b48ce9c5f28258488c5b1\", \"internalURL\": \"http://localhost:5000/v2.0\", \"publicURL\": \"http://localhost:5000/v2.0\"}], \"endpoints_links\": [], \"type\": \"identity\", \"name\": \"keystone\"}], \"user\": {\"username\": \"admin\", \"roles_links\": [], \"id\": \"ac42fa83e52947fe8a827bdd0e4ec89b\", \"roles\": [{\"name\": \"admin\"}], \"name\": \"admin\"}, \"metadata\": {\"is_admin\": 0, \"roles\": [\"280d416875ef40a4bc9928e56f519b79\"]}}}, \"user\": {\"username\": \"admin\", \"email\": \"alop@localhost\", \"enabled\": true, \"id\": \"ac42fa83e52947fe8a827bdd0e4ec89b\", \"name\": \"admin\"}, \"key\": \"MIIHhQYJKoZIhvcNAQcCoIIHdjCCB3ICAQExCTAHBgUrDgMCGjCCBdsGCSqGSIb3DQEHAaCCBcwEggXIeyJhY2Nlc3MiOiB7InRva2VuIjogeyJpc3N1ZWRfYXQiOiAiMjAxNi0wOS0xOVQxOTo0MzozOS44MTc2NTAiLCAiZXhwaXJlcyI6ICIyMDE2LTA5LTE5VDIwOjQzOjM5WiIsICJpZCI6ICJwbGFjZWhvbGRlciIsICJ0ZW5hbnQiOiB7ImRlc2NyaXB0aW9uIjogbnVsbCwgImVuYWJsZWQiOiB0cnVlLCAiaWQiOiAiZGY2ZTg5MWZhZDViNGFjZDllNjc3NTllNWRiNWIwMjciLCAibmFtZSI6ICJhZG1pbiJ9fSwgInNlcnZpY2VDYXRhbG9nIjogW3siZW5kcG9pbnRzIjogW3siYWRtaW5VUkwiOiAiaHR0cDovL2xvY2FsaG9zdDo4Nzc2L3YxL2RmNmU4OTFmYWQ1YjRhY2Q5ZTY3NzU5ZTVkYjViMDI3IiwgInJlZ2lvbiI6ICJyZWdpb25PbmUiLCAiaW50ZXJuYWxVUkwiOiAiaHR0cDovL2xvY2FsaG9zdDo4Nzc2L3YxL2RmNmU4OTFmYWQ1YjRhY2Q5ZTY3NzU5ZTVkYjViMDI3IiwgImlkIjogIjMwMmUxZTAzMTRiZDQxYmNhZWYzOWQ4MjAwODJhZDk0IiwgInB1YmxpY1VSTCI6ICJodHRwOi8vbG9jYWxob3N0Ojg3NzYvdjEvZGY2ZTg5MWZhZDViNGFjZDllNjc3NTllNWRiNWIwMjcifV0sICJlbmRwb2ludHNfbGlua3MiOiBbXSwgInR5cGUiOiAidm9sdW1lIiwgIm5hbWUiOiAiY2luZGVyIn0sIHsiZW5kcG9pbnRzIjogW3siYWRtaW5VUkwiOiAiaHR0cDovL2xvY2FsaG9zdDo4Nzc2L3YyL2RmNmU4OTFmYWQ1YjRhY2Q5ZTY3NzU5ZTVkYjViMDI3IiwgInJlZ2lvbiI6ICJyZWdpb25PbmUiLCAiaW50ZXJuYWxVUkwiOiAiaHR0cDovL2xvY2FsaG9zdDo4Nzc2L3YyL2RmNmU4OTFmYWQ1YjRhY2Q5ZTY3NzU5ZTVkYjViMDI3IiwgImlkIjogIjc1OGU1NzdlM2JkZTRhYzNhOGI0MDhlOWNjNjI2NjQ2IiwgInB1YmxpY1VSTCI6ICJodHRwOi8vbG9jYWxob3N0Ojg3NzYvdjIvZGY2ZTg5MWZhZDViNGFjZDllNjc3NTllNWRiNWIwMjcifV0sICJlbmRwb2ludHNfbGlua3MiOiBbXSwgInR5cGUiOiAidm9sdW1ldjIiLCAibmFtZSI6ICJjaW5kZXJ2MiJ9LCB7ImVuZHBvaW50cyI6IFt7ImFkbWluVVJMIjogImh0dHA6Ly9sb2NhbGhvc3Q6MzUzNTcvdjIuMCIsICJyZWdpb24iOiAicmVnaW9uT25lIiwgImludGVybmFsVVJMIjogImh0dHA6Ly9sb2NhbGhvc3Q6NTAwMC92Mi4wIiwgImlkIjogIjhjMjcyYjFmYWEyYjQ4Y2U5YzVmMjgyNTg0ODhjNWIxIiwgInB1YmxpY1VSTCI6ICJodHRwOi8vbG9jYWxob3N0OjUwMDAvdjIuMCJ9XSwgImVuZHBvaW50c19saW5rcyI6IFtdLCAidHlwZSI6ICJpZGVudGl0eSIsICJuYW1lIjogImtleXN0b25lIn1dLCAidXNlciI6IHsidXNlcm5hbWUiOiAiYWRtaW4iLCAicm9sZXNfbGlua3MiOiBbXSwgImlkIjogImFjNDJmYTgzZTUyOTQ3ZmU4YTgyN2JkZDBlNGVjODliIiwgInJvbGVzIjogW3sibmFtZSI6ICJhZG1pbiJ9XSwgIm5hbWUiOiAiYWRtaW4ifSwgIm1ldGFkYXRhIjogeyJpc19hZG1pbiI6IDAsICJyb2xlcyI6IFsiMjgwZDQxNjg3NWVmNDBhNGJjOTkyOGU1NmY1MTliNzkiXX19fTGCAYEwggF9AgEBMFwwVzELMAkGA1UEBhMCVVMxDjAMBgNVBAgMBVVuc2V0MQ4wDAYDVQQHDAVVbnNldDEOMAwGA1UECgwFVW5zZXQxGDAWBgNVBAMMD3d3dy5leGFtcGxlLmNvbQIBATAHBgUrDgMCGjANBgkqhkiG9w0BAQEFAASCAQBBEmaNydoZAj0IbW0wkRxx7qPiJEH4cGMdcPhJbhVieojE9ioAYh0gs4QQIqCoNDbnLy+uIlMrIYH+8kal501BtoMZsRxxxguFtnqrSXd2PCHI6Y+J8j254sUHDnQjGm0wUVa4DJG2Wa8E0jR6esNqTKmFKGBA0mMJWUZxuXXHe5Fy7UBaXKYfN3PGN+mI9kZG1x3eD8SK0dD5ZYXbNhW6zjDDzU+Po53RwaokpmmsP7hQPdpRCUKQB2jDRcgbfSEEZ6YsS4US8lh487Ov3wj4aYWxQyKauSg6bASz05nq0OJmu0qD2XFnMNf0LTLqv1UJ9sD9m+rs2CcO72tNtLCR\", \"token_version\": \"v2.0\", \"tenant\": {\"id\": \"df6e891fad5b4acd9e67759e5db5b027\", \"enabled\": true, \"description\": null, \"name\": \"admin\"}, \"metadata\": {\"roles\": [\"280d416875ef40a4bc9928e56f519b79\"]}}',1,NULL,'ac42fa83e52947fe8a827bdd0e4ec89b');
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trust`
--

DROP TABLE IF EXISTS `trust`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trust` (
  `id` varchar(64) NOT NULL,
  `trustor_user_id` varchar(64) NOT NULL,
  `trustee_user_id` varchar(64) NOT NULL,
  `project_id` varchar(64) DEFAULT NULL,
  `impersonation` tinyint(1) NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  `extra` text,
  `remaining_uses` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trust`
--

LOCK TABLES `trust` WRITE;
/*!40000 ALTER TABLE `trust` DISABLE KEYS */;
/*!40000 ALTER TABLE `trust` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trust_role`
--

DROP TABLE IF EXISTS `trust_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trust_role` (
  `trust_id` varchar(64) NOT NULL,
  `role_id` varchar(64) NOT NULL,
  PRIMARY KEY (`trust_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trust_role`
--

LOCK TABLES `trust_role` WRITE;
/*!40000 ALTER TABLE `trust_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `trust_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` varchar(64) NOT NULL,
  `name` varchar(255) NOT NULL,
  `extra` text,
  `password` varchar(128) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `domain_id` varchar(64) NOT NULL,
  `default_project_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `domain_id` (`domain_id`,`name`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`domain_id`) REFERENCES `domain` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('28d16fa0461d4a7dbfea238e70534460','demo','{\"email\": \"alop@localhost\"}','$6$rounds=40000$dIAHNj8YvLL.t877$o6YgvXp1Xzlhd6QaHKeUE1E4EOoZBZ76bRvbt4UMZJ3JPf3lsdp2l87r.evyfIVrEdmfOZ3zhZXfOaN0GkX3G/',1,'default','62c092ccba1c49d7b7a239d08c5ce0c2'),('7ddaf5f867ea42c5be60d6fb59d00144','cinder','{\"email\": null}','$6$rounds=40000$6gjguyH3g4mItb.4$FrQuZXLSt4IOqjNtvT/RzlhKRQR1Y.3WtA/PdwIv01duYnCkQOP4MhHZEr5N4VAU0OaNMTS/iKRb2rgI8trOh0',1,'default',NULL),('ac42fa83e52947fe8a827bdd0e4ec89b','admin','{\"email\": \"alop@localhost\"}','$6$rounds=40000$K5jZ6cgSYSjxsz5t$8UWM1ieEE5Yq0ihcKVPNR4DsEs.IabrrTq6oIHbwannNIvVgXIBsvsC6EYZW8TWi.sLV4iztQGOdIZS9BSuqU.',1,'default',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group_membership`
--

DROP TABLE IF EXISTS `user_group_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_group_membership` (
  `user_id` varchar(64) NOT NULL,
  `group_id` varchar(64) NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `user_group_membership_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `user_group_membership_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group_membership`
--

LOCK TABLES `user_group_membership` WRITE;
/*!40000 ALTER TABLE `user_group_membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_group_membership` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-19 19:58:40
