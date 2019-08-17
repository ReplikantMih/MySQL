-- Generation time: Fri, 16 Aug 2019 20:00:06 +0000
-- Host: mysql.hostinger.ro
-- DB name: u574849695_23
/*!40030 SET NAMES UTF8 */;
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP TABLE IF EXISTS `communities`;
CREATE TABLE `communities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=751 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `communities` VALUES ('15','a'),
('413','ab'),
('460','accusamus'),
('68','accusantium'),
('81','ad'),
('75','adipisci'),
('39','alias'),
('211','aliquam'),
('87','aliquid'),
('29','amet'),
('645','animi'),
('33','aperiam'),
('219','architecto'),
('451','asperiores'),
('264','aspernatur'),
('445','assumenda'),
('55','at'),
('1','atque'),
('44','aut'),
('212','autem'),
('82','beatae'),
('67','blanditiis'),
('273','commodi'),
('25','consectetur'),
('30','consequatur'),
('464','consequuntur'),
('271','corporis'),
('91','corrupti'),
('214','culpa'),
('679','cum'),
('18','cumque'),
('217','cupiditate'),
('423','debitis'),
('245','deleniti'),
('243','deserunt'),
('84','dicta'),
('79','dignissimos'),
('57','distinctio'),
('43','dolor'),
('446','dolore'),
('449','dolorem'),
('95','doloremque'),
('492','dolores'),
('69','doloribus'),
('225','dolorum'),
('47','ducimus'),
('54','ea'),
('10','eaque'),
('221','earum'),
('35','eius'),
('89','eligendi'),
('97','enim'),
('220','eos'),
('280','error'),
('45','esse'),
('13','est'),
('6','et'),
('210','eum'),
('668','eveniet'),
('429','ex'),
('72','excepturi'),
('27','exercitationem'),
('628','explicabo'),
('487','facere'),
('425','facilis'),
('85','fuga'),
('300','fugiat'),
('32','fugit'),
('248','harum'),
('48','hic'),
('4','id'),
('238','illo'),
('63','illum'),
('252','impedit'),
('16','in'),
('21','incidunt'),
('2','inventore'),
('90','ipsa'),
('450','ipsam'),
('499','ipsum'),
('76','iste'),
('99','itaque'),
('71','iure'),
('8','iusto'),
('83','labore'),
('42','laboriosam'),
('19','libero'),
('205','magnam'),
('250','magni'),
('251','maiores'),
('294','maxime'),
('222','minima'),
('278','minus'),
('452','modi'),
('266','molestiae'),
('284','molestias'),
('28','mollitia'),
('94','nam'),
('3','natus'),
('20','nemo'),
('454','neque'),
('240','nesciunt'),
('61','nihil'),
('227','nisi'),
('748','nobis'),
('58','non'),
('223','nostrum'),
('237','nulla'),
('41','numquam'),
('638','occaecati'),
('56','odio'),
('616','odit'),
('65','officia'),
('46','officiis'),
('495','omnis'),
('277','pariatur'),
('36','perferendis'),
('74','perspiciatis'),
('38','placeat'),
('206','porro'),
('34','possimus'),
('26','praesentium'),
('11','provident'),
('269','quae'),
('12','quaerat'),
('80','quam'),
('435','quas'),
('419','quasi'),
('51','qui'),
('60','quia'),
('625','quibusdam'),
('49','quidem'),
('77','quis'),
('258','quisquam'),
('92','quo'),
('22','quod'),
('468','quos'),
('31','ratione'),
('86','recusandae'),
('418','reiciendis'),
('70','rem'),
('443','repellat'),
('24','repellendus'),
('731','reprehenderit'),
('270','repudiandae'),
('52','rerum'),
('726','saepe'),
('643','sapiente'),
('62','sed'),
('96','sequi'),
('660','similique'),
('5','sint'),
('40','sit'),
('100','soluta'),
('50','sunt'),
('256','suscipit'),
('697','tempora'),
('9','tempore'),
('7','temporibus'),
('298','tenetur'),
('274','totam'),
('78','ullam'),
('73','unde'),
('53','ut'),
('59','vel'),
('23','velit'),
('236','veniam'),
('93','veritatis'),
('64','vero'),
('98','vitae'),
('17','voluptas'),
('14','voluptate'),
('37','voluptatem'),
('88','voluptates'),
('66','voluptatum'); 




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

