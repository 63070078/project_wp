-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: p_wp
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'gold','ช่อม่วง','รุ่งเรือง','0802255524','purple@hotmail.com','42 หมู่ 1 บ้านสังแกตำบลสะเดา อ.บัวเชด จ.สุรินทร์ 32230',3),(2,'platinum','จุรินทร์','ทองแท้','0945278197','jurin001@hotmail.com','บ้านเลขที่ 30 ซอยริมทางรถไฟ5 แขวงบางยี่เรือ เขตธนบุรี กทม 10600',4),(3,'gold','สุเมธ','ไกรแสง','0854287911','sumetkrai@hotmail.com','100/129 หมู่ 7 ถนนรามอินทรา แขวงท่าแร้ง เขตบางเขน กทม. 10220',6),(4,'silver','ธนเดช','งามเลิศล้ำ','0825449634','thanadet_kg@hotmail.com','609/9 ถ.บำรุงเมือง แขวงคลองมหานาค เขตป้อมปราบ กทม. 10100',7),(5,'platinum','สุรีย์','ศรีสุนทร','0847687516','suree_lover@hotmail.com','บ้านเลขที่ 122 ถ.เทศบาลนิมิตเหนือ ซ.30 ลาดยาว จตุจักร กทม. 10900',8),(6,'platinum','อันปัง','แมน','0815492253','aunpang_ja@hotmail.com','69/2 ซ.ลาดพร้าว 81 ถ.ลาดพร้าว แขวงวังหลองหลาง กทม. 10310',9),(7,'gold','กรภัทร์','เกิดพันธุ์','0824791245','nnn_145@hotmail.com','บ้านเลขที่ 12 ถนนคลองเตย แขวงเชียงราก ต.เมือง อ.เมือง จ.ปทุมธานี 10220',20),(8,'gold','เอสเธอร์','สุปรีย์ลีลา','0862477945','estherrr@hotmail.com','99/54  ต.ห้วยแขวาง อ.เมือง จ.กรุงเทพมหานคร 10301',21),(9,'silver','ภูภูมิ','พงศ์ภาณุ','0849435479','kenny@hotmail.com','124/25 ต.ศีรษะจรเข้น้อย อ.บางเสาธง สมุทรปราการ 10540',22),(10,'platinum','อารดา','อารยวุฒิ','0845163547','giff_na@hotmail.com','55/127 ถ.พระยาสัจจา ต.บางปลาสร้อย อ.เมืองชลบุรี จ.ชลบุรี 20000',23),(11,'platinum','ธนทัต','ชัยอรรถ','0819784651','kang_som@hotmail.com','77/147 ถนน กำแพงเพชร แขวง ลาดยาว เขตจตุจักร กรุงเทพมหานคร 10900',24),(12,'silver','อลิสา','ขุนแขวง','0849563253','alisa_44@hotmail.com','18/189  ถนน ​ประชา​ราษฎร์​1 แขวง วงศ์สว่าง เขตบางซื่อ กรุงเทพมหานคร 10800',25),(13,'gold','โอบนิธิ','วิวรรธนวรางค์','0875462482','aob_nithi@hotmail.com','9/126 ถ. ประชาอุทิศ แขวง บางมด เขตทุ่งครุ กรุงเทพมหานคร 10140',26);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `customer_order`
--

LOCK TABLES `customer_order` WRITE;
/*!40000 ALTER TABLE `customer_order` DISABLE KEYS */;
INSERT INTO `customer_order` VALUES (1,'1000-01-01 00:00:00',265.00,3,13),(2,'2564-02-05 21:10:10',1260.00,8,1),(3,'2564-03-17 01:18:07',280.00,1,3),(4,'2564-04-30 09:07:51',1853.00,9,2),(5,'2564-06-21 23:59:01',900.00,11,4);
/*!40000 ALTER TABLE `customer_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'แผนกการตลาด','321 ถ.ศรีนวดิตถ์ ต.ท่าใหม่ อ.ท่าใหม่ จ.จันทบุรี 22120','1280 ถ.จันทน์ แขวงทุ่งวัดดอน เขตสาธร จ.กรุงเทพฯ 10120'),(2,'แผนกการผลิต','126 ถ. ประชาอุทิศ แขวง บางมด เขตทุ่งครุ กรุงเทพมหานคร 10140','41 Tamnaknum Road, ตำบล บางปลาสร้อย อำเภอเมืองชลบุรี ชลบุรี 20000'),(3,'แผนกการขาย','56 ซอย กรุงเทพนนท์ 4 ตำบลบางเขน ตำบลตลาดขวัญ, นนทบุรี 11000','14 ตำบลคูคต อำเภอลำลูกกา ปทุมธานี 12130');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,20000.00,'ดั่งหทัย','ศรีสุข','0844785541','juicy001@hotmail.com','151 หมู่6 ถ.สุขุมวิท ต.คลองด่าน อ.บางบ่อ จ.สมทุรปราการ 10550',3,10),(2,25000.00,'อิ่มใจ','สบายอุรา','0913667555','juicy002@hotmail.com','323 หมู่1 ถ.รัตนราช ต.บางบ่อ อ.บางบ่อ จ.สมทุรปราการ 10560',3,11),(3,20700.00,'เท่ห์','ภาคภูมิ','0973881224','juicy003@hotmail.com','135 หมู่1 ถ.บางกรวย-ไทรน้อย อ.บางกรวย จ.นนทบุรี 11130',3,12),(4,20000.00,'กลมเกลียว','สมัครสมาน','0968874352','juicy004@hotmail.com','135/1 หมู่5 ถ.บางกรวย-ไทรน้อย อ.บางใหญ่ จ.นนทบุรี 11140',3,13),(5,30000.00,'แอนโทนี่','ฟะรังคี','0873329986','juicy005@hotmail.com','53 หมู่5 ต.ไทรน้อย อ.ไทรน้อย จ.นนทบุรี 11150',3,14),(6,10000.00,'สามารถ','ยิ่งยง','0985432668','juicy006@hotmail.com','223/1 ถ.สายวัดโคก ต.บางปรอก อ.เมือง จ.ปทุมธานี 12000',3,15),(7,23000.00,'นีโอ','อาร์มสตรอง','0811356449','juicy007@hotmail.com','326 หมู่4 ต.ผักไห่ อ.ผักไห่ จ.พระนครศรีอยุธยา 13120',1,16),(8,25000.00,'ฝรั่ง','น้ำข้าว','0884379122','juicy008@hotmail.com','42 หมู่6 ต.โพนทอง อ.บ้านหมี่ จ.ลพบุรี 15110',2,17),(9,40000.00,'มานะ','ไทยแท้','0891355689','juicy009@hotmail.com','414 หมู่5 ถ.สุขาภิบาล ต.แสวงหา อ.แสวงหา จ.อ่างทอง 14150',2,18),(10,21000.00,'แคทเทอรีน','แสนดี','0986645578','juicy010@hotmail.com','81/9 หมู่6 ต.บางปะหัน อ.บางปะหัน จ.พระนครศรีอยุธยา 13220',2,19),(11,24000.00,'สามสี','แมวมอง','0845598763','juicy011@hotmail.com','555 หมู่3 ต.ดอนพุด อ.ดอนพุด จ.สระบุรี 18210',1,1),(12,10500.00,'มานี','ไทยแท้','0925468777','juicy012@hotmail.com','47 ถ.สุขุมวิท ต.แสนสุข อ.เมือง จ.ชลบุรี 20130',3,2),(13,55000.00,'ปรีดา','สมสุข','0965874553','juicy013@hotmail.com','32 ถ.มหาราช ต.ตลาด อ.เมือง จ.จันทบุรี 22000',3,5);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `material`
--

LOCK TABLES `material` WRITE;
/*!40000 ALTER TABLE `material` DISABLE KEYS */;
INSERT INTO `material` VALUES (1,'ส้ม',10),(2,'กล้วย',80);
/*!40000 ALTER TABLE `material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'asmma','samsee12','Admin'),(2,'manee','mane_eiei','Admin'),(3,'purple','purple123','Customer'),(4,'jurin001','jurin001tong','Customer'),(5,'preeda','preeda_som','Admin'),(6,'sumetkrai','sumetkrai254','Customer'),(7,'thanadet','thanadet_554','Customer'),(8,'suree_lover','suree_lover_xxy2','Customer'),(9,'aunpang','aunpang_ja22','Customer'),(10,'daung','dang_ha4','Admin'),(11,'aimjai','aimjai_sabye','Admin'),(12,'taee','tae_pakpoom','Admin'),(13,'gomkig','gomm35','Admin'),(14,'anne','anneee_kim','Admin'),(15,'samart','sa_mart','Admin'),(16,'neoo','neo_oo','Admin'),(17,'frang','fa_rangg','Admin'),(18,'mana','mana_nama','Admin'),(19,'katty','kat_sandee','Admin'),(20,'nanon','nananon123','Customer'),(21,'esther','esther_78','Customer'),(22,'kenn','ken_poomm','Customer'),(23,'giff','giffy_156','Customer'),(24,'kanggsomm','kang_som7','Customer'),(25,'alisaaza','alisa11','Customer'),(26,'aobb','nithizaa','Customer');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `order_list`
--

LOCK TABLES `order_list` WRITE;
/*!40000 ALTER TABLE `order_list` DISABLE KEYS */;
INSERT INTO `order_list` VALUES (1,30.00,3,90.00,1,1),(2,35.00,5,175.00,1,2),(3,30.00,10,300.00,2,1),(4,56.00,12,672.00,2,4),(5,36.00,8,288.00,2,6),(6,56.00,5,280.00,3,4),(7,56.00,13,728.00,4,8),(8,45.00,10,450.00,4,7),(9,45.00,15,675.00,4,9),(10,30.00,12,360.00,5,1),(11,45.00,12,540.00,5,9);
/*!40000 ALTER TABLE `order_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'น้ำส้ม','น้ำผลไม้ที่มาจากส้มให้คุณประโยชน์มากมาย เช่น สามารถเสริมสร้างแคลเซียม',25,30.00,'/uploads/orange_Juice.jpg','/uploads/orange.jpg','S'),(2,'น้ำผลไม้กีวี่','น้ำผลไม้ที่ให้คุณประโยชน์มากมาย เช่น ช่วยให้ผิวพรรณสดใสเปล่งปลั่ง',28,35.00,'/uploads/kiwi_Juice.jpg','/uploads/kiwi.jpg','S'),(3,'น้ำกล้วย','น้ำผลไม้ที่มาจากกล้วยให้คุณประโยชน์มากมาย เช่น แก้อาการนอนไม่หลับ',43,26.00,'/uploads/banana_Juice.jpg','/uploads/banana.jpg','S'),(4,'น้ำสัปปะรด','น้ำผลไม้ที่มาจากสัปปะรดให้คุณประโยชน์มากมาย เช่น ลดน้ำหนัก',18,56.00,'/uploads/pineapple_Juice.jpg','/uploads/pineapple.jpg','S'),(5,'น้ำมังคุด','น้ำผลไม้ที่มาจากมังคุดให้คุณประโยชน์มากมาย เช่น ช่วยปรับระดับภูมิคุ้มกันให้สมดุล',17,46.00,'/uploads/mangosteen_Juice.jpg','/uploads/mangosteen.jpg','S'),(6,'น้ำแตงโม','น้ำผลไม้ที่มาจากแตงโมให้คุณประโยชน์มากมาย เช่น มีวิตามินเอ ช่วยบำรุงสายตา',15,36.00,'/uploads/watermelon_Juice.jpg','/uploads/watermelon.jpg','S'),(7,'น้ำฝรั่ง','น้ำผลไม้ที่มาจากฝรั่งให้คุณประโยชน์มากมาย เช่น  มีสารต่อต้านอนุมูลอิสระสูงมากซึ่งช่วยในการชะลอวัย',26,45.00,'/uploads/guava_Juice.jpg','/uploads/guava.jpg','S'),(8,'น้ำสตอเบอรรี่','น้ำผลไม้ที่มาจากสตอเบอรรี่ให้คุณประโยชน์มากมาย เช่น ช่วยต่อต้านอนุมูลอิสระ',25,56.00,'/uploads/stawberry_Juice.jpg','/uploads/stawberry.jpg','S'),(9,'น้ำองุ่น','น้ำผลไม้ที่มาจากองุ่นให้คุณประโยชน์มากมาย เช่น ช่วยโรคอัลไซเมอร์',34,45.00,'/uploads/grape_Juice.jpg','/uploads/grape.jpg','S'),(10,'น้ำส้ม','น้ำผลไม้ที่มาจากส้มให้คุณประโยชน์มากมาย เช่น สามารถเสริมสร้างแคลเซียม',45,59.00,'/uploads/orange_Juice.jpg','/uploads/orange.jpg','M'),(11,'น้ำผลไม้กีวี่','น้ำผลไม้ที่ให้คุณประโยชน์มากมาย เช่น ช่วยให้ผิวพรรณสดใสเปล่งปลั่ง',18,69.00,'/uploads/kiwi_Juice.jpg','/uploads/kiwi.jpg','M'),(12,'น้ำสัปปะรด','น้ำผลไม้ที่มาจากสัปปะรดให้คุณประโยชน์มากมาย เช่น ลดน้ำหนัก',19,99.00,'/uploads/pineapple_Juice.jpg','/uploads/pineapple.jpg','M'),(13,'น้ำมังคุด','น้ำผลไม้ที่มาจากมังคุดให้คุณประโยชน์มากมาย เช่น ช่วยปรับระดับภูมิคุ้มกันให้สมดุล',23,89.00,'/uploads/mangosteen_Juice.jpg','/uploads/mangosteen.jpg','M'),(14,'น้ำฝรั่ง','น้ำผลไม้ที่มาจากฝรั่งให้คุณประโยชน์มากมาย เช่น  มีสารต่อต้านอนุมูลอิสระสูงมากซึ่งช่วยในการชะลอวัย',45,89.00,'/uploads/guava_Juice.jpg','/uploads/guava.jpg','M'),(15,'น้ำสตอเบอรรี่','น้ำผลไม้ที่มาจากสตอเบอรรี่ให้คุณประโยชน์มากมาย เช่น ช่วยต่อต้านอนุมูลอิสระ',26,99.00,'/uploads/stawberry_Juice.jpg','/uploads/stawberry.jpg','M'),(16,'น้ำองุ่น','น้ำผลไม้ที่มาจากองุ่นให้คุณประโยชน์มากมาย เช่น ช่วยโรคอัลไซเมอร์',14,89.00,'/uploads/grape_Juice.jpg','/uploads/grape.jpg','M'),(17,'น้ำส้ม','น้ำผลไม้ที่มาจากส้มให้คุณประโยชน์มากมาย เช่น สามารถเสริมสร้างแคลเซียม',17,100.00,'/uploads/orange_Juice.jpg','/uploads/orange.jpg','L'),(18,'น้ำผลไม้กีวี่','น้ำผลไม้ที่ให้คุณประโยชน์มากมาย เช่น ช่วยให้ผิวพรรณสดใสเปล่งปลั่ง',34,119.00,'/uploads/kiwi_Juice.jpg','/uploads/kiwi.jpg','L'),(19,'น้ำสัปปะรด','น้ำผลไม้ที่มาจากสัปปะรดให้คุณประโยชน์มากมาย เช่น ลดน้ำหนัก',35,159.00,'/uploads/pineapple_Juice.jpg','/uploads/pineapple.jpg','L'),(20,'น้ำมังคุด','น้ำผลไม้ที่มาจากมังคุดให้คุณประโยชน์มากมาย เช่น ช่วยปรับระดับภูมิคุ้มกันให้สมดุล',18,149.00,'/uploads/mangosteen_Juice.jpg','/uploads/mangosteen.jpg','L'),(21,'น้ำแตงโม','น้ำผลไม้ที่มาจากแตงโมให้คุณประโยชน์มากมาย เช่น มีวิตามินเอ ช่วยบำรุงสายตา',41,139.00,'/uploads/watermelon_Juice.jpg','/uploads/watermelon.jpg','L'),(22,'น้ำฝรั่ง','น้ำผลไม้ที่มาจากฝรั่งให้คุณประโยชน์มากมาย เช่น  มีสารต่อต้านอนุมูลอิสระสูงมากซึ่งช่วยในการชะลอวัย',28,149.00,'/uploads/guava_Juice.jpg','/uploads/guava.jpg','L'),(23,'น้ำสตอเบอรรี่','น้ำผลไม้ที่มาจากสตอเบอรรี่ให้คุณประโยชน์มากมาย เช่น ช่วยต่อต้านอนุมูลอิสระ',12,169.00,'/uploads/stawberry_Juice.jpg','/uploads/stawberry.jpg','L'),(24,'น้ำองุ่น','น้ำผลไม้ที่มาจากองุ่นให้คุณประโยชน์มากมาย เช่น ช่วยโรคอัลไซเมอร์',20,149.00,'/uploads/grape_Juice.jpg','/uploads/grape.jpg','L');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `products_material`
--

LOCK TABLES `products_material` WRITE;
/*!40000 ALTER TABLE `products_material` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `products_warehouse`
--

LOCK TABLES `products_warehouse` WRITE;
/*!40000 ALTER TABLE `products_warehouse` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_warehouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `warehouse`
--

LOCK TABLES `warehouse` WRITE;
/*!40000 ALTER TABLE `warehouse` DISABLE KEYS */;
INSERT INTO `warehouse` VALUES (1,'กรุงเทพคลังสินค้า','เขตราษฎร์บูรณะ','กรุงเทพมหานคร','10'),(2,'คลังบางอิน','เ73/7 หมู่ที่ 1 ตำบลคลองใหญ่ อำเภอคลองใหญ่ จ.ตราด\n','','4');
/*!40000 ALTER TABLE `warehouse` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-28 23:30:58
