-- MariaDB dump 10.17  Distrib 10.4.15-MariaDB, for Linux (x86_64)
--
-- Host: mysql.hostinger.ro    Database: u574849695_21
-- ------------------------------------------------------
-- Server version	10.4.15-MariaDB-cll-lve

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Фамилия',
  `email` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_hash` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  KEY `users_firstname_lastname_idx` (`firstname`,`lastname`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='юзеры';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (101,'Stevie','McDermott','htorphy@example.net','cf93d00e5fa78bbc1c045b79fa8e8b9bb83280e5',290),(102,'Josh','D\'Amore','uyundt@example.net','aa82a40630e067615d590bb08bd2159ee0cbc65d',614439),(103,'Jerald','Goldner','laron54@example.com','df787b3a3514a04b144de0263df705b160aae8b3',157),(104,'Lonzo','Howell','elyssa.bauch@example.org','a36b3345881d355998d31aebc6e7f1e85b4dc5a2',807744),(105,'Joany','Abbott','daniel.derek@example.org','df957f5aff45b03a28a046413d57d8b55a3c66ab',1),(106,'Dion','Jenkins','jameson.corwin@example.com','b273d1b6fafc39abf8fc540e6ed464e53a97c928',0),(107,'Jalen','Dare','nitzsche.alda@example.com','5c0e88f9c2d64bf1b5b17afa08f9159625119736',113488),(108,'Mireya','Bednar','dannie90@example.org','67ffdad0a081530b1911b41890a0a631a9c4bf80',570),(109,'Harmon','Leffler','kertzmann.vernie@example.org','9a23c5d05d37f43baa4088e0e359f2793dd9ada2',307),(113,'Filiberto','Wintheiser','brennon.corkery@example.com','c8140bd28e8d7f7dd885458f9393f5383cf9324e',618411),(114,'Nina','Rau','pietro.krajcik@example.net','ac91397f3cda4d5a9a8cfd443da9ca3e72df9028',282544),(115,'Viviane','Bosco','maudie48@example.net','f1efada7ed38de0dcfe94ce60e8aee7aaeb1d625',334957),(119,'Kenyatta','Mayer','breana.collins@example.com','02acc924d678be978932596f5166b4061cded02e',829195),(121,'Margaretta','Kozey','luettgen.stacy@example.com','a953f96fbabe2ebec85d66fbc4fa12aede00849d',11),(122,'Allene','Upton','jacobs.pascale@example.net','7914d095d55530cf8b3d5fbdd371d4aa83360848',17),(123,'Daron','Turcotte','wolf.sylvester@example.org','a098b4d51608f70831fc03650dcdc28a3d8d478d',1546951304),(127,'Damaris','Windler','rachel30@example.com','b431d289133ed4f17fc715455a77b8db738080c4',195),(129,'Aiden','Murray','grimes.nathen@example.org','49712ef9ce7a63a70b46e52cacde5ec620f70591',93),(130,'Lorenzo','Dach','fkilback@example.org','c1980a34863af52197b84f27a1fb6cdab22c0729',390),(132,'Obie','Lemke','stracke.maya@example.net','d5b474feafe2ef2d954ea4648b25f234a30390bf',6255229627),(133,'Rocio','Bergnaum','kshlerin.antwan@example.net','87311b8a30ee80ba81ef15ad85510297bf24ef07',39317),(134,'Jerrell','Hintz','jerod09@example.com','da71f52fafa8fd8f82763d2cca2670f769c034a0',862945),(135,'Agnes','Hartmann','adam38@example.org','83fe67ef1feb9563a49a796e17382b09f6af390d',698791),(136,'Roxanne','Okuneva','wchristiansen@example.org','fd910316e549b3209dbd6ad421de5adb8ca1a875',326),(137,'Gaylord','Considine','hartmann.dina@example.com','00dfc4746e2d30381d1b5c3b4768a30b5d853927',330),(140,'Laverna','Emard','bonnie.wiegand@example.net','0085de272903c446ae0fcb1bc99355b03e4f2e7f',690570),(142,'Dedric','Kub','moshe00@example.net','5abc065439c5d030a3100ae61c9308a0c2d2efa0',4197773092),(144,'Westley','Reinger','garland.bednar@example.net','ae8ef52998fd49edbb9b40c5b17c738199429b42',466),(145,'Adriel','Bahringer','arden85@example.org','84fa912d8f5ec257dc00a0e255698683b13e180d',973597),(146,'Sven','Christiansen','zackery36@example.net','347796202a471cb775a8a4301da5b206136fc8a4',926054),(147,'Stephania','Corkery','zsawayn@example.com','be011ee110bd657f24372860004d1e91d0ceceea',77),(148,'Vernice','Romaguera','mcdermott.aaron@example.net','50dfcb3ba88f2a26fe88e7e024b7f476af727de9',39),(149,'Max','Bailey','olson.stefan@example.net','fe334dd6fcc23f1790b9228581d0c0696c55ca4c',75),(150,'Mandy','Howe','bpurdy@example.org','00da303a1176a269c5df448eaa5473aa94a805d8',1906358546),(151,'Cary','Fadel','loren.rohan@example.org','541073c0fa1cf5549468a8639873c7e3cfbefcaf',676221),(153,'Amos','Parisian','kohler.helena@example.net','32de97566b2a75029c6bde332e76572a5fa87d3d',696),(154,'Reanna','Connelly','thalvorson@example.com','2d3129cfde3b922141ef25f77d6922a6d14de78c',583),(155,'Camryn','Kulas','marisa73@example.net','4dab3c7b15d8a0b49cc17bf1c5cf78e60b695915',964),(156,'Julianne','Williamson','ngrady@example.net','6fe3bddf6fea040026a11a22cb1a9d3400bba5f0',34),(157,'Fernando','Hermiston','reichert.harley@example.net','07a038abecb88a29fb06ac23c826e42cee601bac',78),(159,'Clinton','Moore','hauck.dina@example.org','8b42bad89a3259d85d1a0d3f009300e290730a27',636),(160,'Jeanne','Ratke','dblick@example.net','dee7577b0730df3f565d8baad3965289ad529fdf',475200),(161,'Yadira','Cremin','everett.gorczany@example.net','2f3effbfcdacf263a9478ef784a42bfeec31882e',30),(163,'Mateo','Will','hoppe.delmer@example.com','86d921e6011839bc1f145ca113ea08e0c99ae56f',579865),(164,'Jewel','Renner','mraz.jose@example.com','b44685047b0549418ab5abac550d4389bbc4678d',96),(165,'Dariana','Beer','albertha20@example.net','1444de059d3ac386f5e9f560006e9c16fdf25e49',2574110490),(167,'Alford','Zieme','raegan.weimann@example.net','45b8b24119e9c2d0684e3eaece534d9b4e5fec30',620),(169,'Henriette','Sauer','stehr.brooklyn@example.com','e735b7ae27655d069301f24cc2b47ed13b3b3692',687),(174,'Sheldon','Nitzsche','taya.osinski@example.org','748763e558ac9d914ad8d5496fc249567290e0fe',187),(175,'Donny','Anderson','tyrese.bartell@example.com','b980fe5111dfff92df2c2d3e3872a3b0efcb372a',336),(180,'Chauncey','Lesch','novella.langworth@example.com','df9631e2d7b7c046349db4c467bfff8ab4f9096f',225775),(181,'Gene','Boyer','ikohler@example.net','25a85b701a7ad51e3e92b1d62a72fef9266ae46b',933986),(182,'Kennedi','Gerlach','alexane96@example.com','fc3a77da16afa7ef0b6bd1f485ff940899505007',107),(183,'Dolly','Bernhard','oren35@example.com','2c394798fb4fbf5c431566375d6c7f8fb677953a',571),(184,'Retta','Schaefer','glabadie@example.net','5430284a9a23a92a8f0b8a34dcb8f69c68436509',6961928526),(185,'Brenda','Wuckert','ursula73@example.com','1ae514d7fdd552aa0e4ecba445865c3849435178',57),(187,'Orie','Ortiz','myron81@example.org','df18d9e6a5b5839da15e7e495e5f23588f9a8da2',974200),(188,'Alfredo','Marvin','ekemmer@example.org','47abfd2b181149aef29b1a908bdd1e512c2799c1',274),(190,'Phyllis','Funk','smitham.magdalena@example.net','259a274f11cf680a1df0835f8904544139d4f615',6844239960),(191,'Al','Nicolas','blanche.kuhn@example.net','43e4e425eecb20ff413e28be04909d5b34e19773',958827),(193,'Oma','Cartwright','elenor.funk@example.net','73f67f04ab022f2e4478d6acaa60d6d579d518d3',329035),(194,'Vivian','Langosh','dcrist@example.com','1fc9be8cbd1d76cace14facdd9d198ddc7f55c55',434497),(195,'Ramona','Corwin','ularkin@example.net','20c7ab275739d14a9fda1f0490c102ccccf899b5',58),(197,'Calista','Hickle','domingo24@example.com','83315cfd81bab709d0d512e7b91f9e8018d51a2f',855),(199,'Patience','Dickinson','margret28@example.org','fa6096f8d7eb09070115c753cb52227d7f7a3b57',296);
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

-- Dump completed on 2021-05-30 15:32:08
