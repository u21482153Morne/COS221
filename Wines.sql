-- phpMyAdmin SQL Dump
-- version 5.0.4deb2~bpo10+1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 05, 2023 at 07:04 PM
-- Server version: 10.3.31-MariaDB-0+deb10u1
-- PHP Version: 7.3.31-1~deb10u3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u21598012`
--

-- --------------------------------------------------------

--
-- Table structure for table `Wines`
--

CREATE TABLE `Wines` (
  `Brand` varchar(200) NOT NULL,
  `Wine` varchar(200) NOT NULL,
  `Link` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Wines`
--

INSERT INTO `Wines` (`Brand`, `Wine`, `Link`) VALUES
('Alvi\'s Drift', 'Signature Sauvignon Blanc', 'https://cdn.shopify.com/s/files/1/0608/0505/4720/products/Alvi_sDriftSignatureSauvignonBlanc_4ae26721-9528-4e72-b854-58e5f32e47a0.png?v=1650650879\r\n'),
('Alvi\'s Drift', 'Signature Chenin Blanc', 'https://cdn.shopify.com/s/files/1/0608/0505/4720/products/Alvi_sDriftSignatureCheninBlanc_21ec78cc-095f-4f55-8a03-77724642c18d.png?v=1650650655\r\n'),
('Alvi\'s Drift', 'Signature Viognier', 'https://cdn.shopify.com/s/files/1/0608/0505/4720/products/Alvi_sDriftSignatureViognier_00d65540-3c78-46f4-b836-c283c82c8dc5.png?v=1650650964\r\n'),
('Alvi\'s Drift', 'Signature Chardonnay', 'https://cdn.shopify.com/s/files/1/0608/0505/4720/products/Alvi_sDriftSignatureChardonnay_071edcef-ea36-475c-beb2-68a1c1b13baf.png?v=1650650618\r\n'),
('Alvi\'s Drift', 'Signature Pinotage Rosé', 'https://cdn.shopify.com/s/files/1/0608/0505/4720/products/Alvi_sDriftSignaturePinotageRose_03abeddf-dab0-49f1-b841-724cb7b1a924.png?v=1650650829\r\n'),
('Alvi\'s Drift', 'Signature Pinotage', 'https://cdn.shopify.com/s/files/1/0608/0505/4720/products/Alvi_sDriftSignaturePinotage_5364644e-69ff-42fa-9de1-7438f180b9a1.png?v=1650650731\r\n'),
('Alvi\'s Drift', 'Signature Cabernet Sauvignon', 'https://cdn.shopify.com/s/files/1/0608/0505/4720/products/Alvi_sDriftSignatureCabernetSauvignon_51036f0a-916d-4373-8e11-2b6297152893.png?v=1650650577\r\n'),
('Alvi\'s Drift', 'Signature Shiraz', 'https://cdn.shopify.com/s/files/1/0608/0505/4720/products/Alvi_sDriftSignatureShiraz_11705954-3cfa-43b9-a70f-23dfdfde131f.png?v=1650650916\r\n'),
('Alvi\'s Drift', 'Signature Merlot', 'https://cdn.shopify.com/s/files/1/0608/0505/4720/products/Alvi_sDriftSignatureMerlot_282459d0-3e26-427d-9a9e-bfee257c6155.png?v=1650650691\r\n'),
('Alvi\'s Drift', '221 Chenin Blanc', 'https://cdn.shopify.com/s/files/1/0608/0505/4720/products/Alvi_sDrift221CheninBlanc_05099f28-82bd-4d7f-bdba-061a1000db35.png?v=1650649720\r\n'),
('Alvi\'s Drift', 'Sauvignon Blanc', 'https://cdn.shopify.com/s/files/1/0608/0505/4720/products/Alvi_sDrift221SauvignonBlanc.png?v=1654637066'),
('Alvi\'s Drift', 'Pinotage', 'https://cdn.shopify.com/s/files/1/0608/0505/4720/products/Alvi_sDrift221Pinotage_e5591309-789d-4757-a1af-149f8b38b2e6.png?v=1650649742'),
('Alvi\'s Drift', 'Special Cuvee', 'https://cdn.shopify.com/s/files/1/0608/0505/4720/products/Alvi_sDrift221SpecialCuvee_4d4729b8-742c-4fbb-b545-25901e438727.png?v=1650649761'),
('Alvi\'s Drift', 'Reserve CVC Blend', 'https://cdn.shopify.com/s/files/1/0608/0505/4720/products/Alvi_sDriftReserveCVCBlend_b6d7bb18-cf19-40ef-a695-0804fefbaf6e.png?v=1650650321'),
('Alvi\'s Drift', 'Reserve Sauvignon Blanc', 'https://cdn.shopify.com/s/files/1/0608/0505/4720/products/Alvi_sDriftReserveSauvignonBlanc_f8ccb931-a250-496e-b538-3ad60b9534ec.png?v=1650650539'),
('Alvi\'s Drift', 'Reserve Chardonnay', 'https://cdn.shopify.com/s/files/1/0608/0505/4720/products/Alvi_sDriftReserveChardonnay_6b68036d-93fb-423a-b3ad-d8518228b0bd.png?v=1650650283'),
('Alvi\'s Drift', 'Reserve Drift Fusion', 'https://cdn.shopify.com/s/files/1/0608/0505/4720/products/Alvi_sDriftReserveDriftFusion_cae2b930-5dc8-422f-8fca-1b1bfb250aa3.png?v=1650650360'),
('Alvi\'s Drift', 'Reserve Muscat Nectarinia', 'https://cdn.shopify.com/s/files/1/0608/0505/4720/products/Alvi_sDriftReserveMuscatNectarinia_8ed1cc9e-3a64-4455-b301-e4ab6d40f5e3.png?v=1650650445'),
('Alvi\'s Drift', 'Reserve Muscat De Frontignan', 'https://cdn.shopify.com/s/files/1/0608/0505/4720/products/Alvi_sDriftReserveMuscatDeFrontignan.png?v=1650650404'),
('Alvi\'s Drift', 'Icon Albertus Viljoen Chardonnay', 'https://cdn.shopify.com/s/files/1/0608/0505/4720/products/Alvi_sDriftIconAlbertusViljoenChardonnay_6251aa59-358b-4941-9b10-2117571277d4.png?v=1650650144'),
('Alvi\'s Drift', 'Icon Albertus Viljoen Bismarck', 'https://cdn.shopify.com/s/files/1/0608/0505/4720/products/Alvi_sDriftIconAlbertusViljoenBismarck_3bbdcd39-9c2d-443a-bf06-7e9b112f521b.png?v=1650650105'),
('Alvi\'s Drift', 'Flagship Verreaux Pinotage', 'https://cdn.shopify.com/s/files/1/0608/0505/4720/products/Alvi_sDriftFlagshipVerreauxPinotage_c74a709b-508b-42f2-a1ee-6655a49cfd77.png?v=1650649896'),
('Alvi\'s Drift', 'Sparkling Brut Rose', 'https://cdn.shopify.com/s/files/1/0608/0505/4720/products/Alvi_sDriftSparklingBrutRose_04e95927-250a-458c-a9b8-2b7259621d1c.png?v=1650651280'),
('Alvi\'s Drift', 'Dessert Moscatel', 'https://cdn.shopify.com/s/files/1/0608/0505/4720/products/Alvi_sDriftDessertMoscatel_31de1f3d-50b5-4912-81d7-28e2f2ad940e.png?v=1650651239'),
('Alvi\'s Drift', 'Dessert Moscatel', 'https://cdn.shopify.com/s/files/1/0608/0505/4720/products/Alvi_sDriftDessertMoscatel_31de1f3d-50b5-4912-81d7-28e2f2ad940e.png?v=1650651239'),
('Alvi\'s Drift', 'Dessert Hanepoot', 'https://cdn.shopify.com/s/files/1/0608/0505/4720/products/Alvi_sDriftDessertHanepoot_342727ee-7c55-4e22-9b1f-2f9df56b149b.png?v=1650651260'),
('', '', ''),
('Bosman Family Vineyards', 'Adama 2021', 'https://images.commerce7.com/bosman-family-vineyards/images/medium/bosman-adama-2021-002-2-1684996747731.webp'),
('Bosman Family Vineyards', 'Adama White 2021', 'https://images.commerce7.com/bosman-family-vineyards/images/medium/bosman_adama_white_2021-1679917811633.webp'),
('Bosman Family Vineyards', 'Cabernet Sauvignon 2016', 'https://images.commerce7.com/bosman-family-vineyards/images/medium/bosman-cab-sauv-2016_web-1679918014117.webp'),
('Bosman Family Vineyards', 'Erfenis 2017', 'https://images.commerce7.com/bosman-family-vineyards/images/medium/erfenis-2017_web-2-1679918191089.webp'),
('Bosman Family Vineyards', 'Dolce Primitivo 2017', 'https://images.commerce7.com/bosman-family-vineyards/images/medium/bosman-dolce-primitivo-2017-email-1679918324254.webp'),
('Bosman Family Vineyards', 'Fides Grenache Blanc 2015', 'https://images.commerce7.com/bosman-family-vineyards/images/medium/bosman_fides_grenache_blanc_2015-1-1679918989408.webp'),
('Bosman Family Vineyards', 'Generation 8 Cabernet Sauvignon 2022', 'https://images.commerce7.com/bosman-family-vineyards/images/medium/bosman_generation_8_cabernet_sauvignon_2022-1679919481045.webp'),
('Bosman Family Vineyards', 'G8 Chenin Blanc 2022', 'https://images.commerce7.com/bosman-family-vineyards/images/medium/bosman-g8-chenin-blanc-2022-1680084858064.webp'),
('Bosman Family Vineyards', 'G8 Merlot 2022', 'https://images.commerce7.com/bosman-family-vineyards/images/medium/g8_merlot_2022-1681371257334.webp'),
('', '', ''),
('KWV', 'Annabelle Curve Rose Sparkling Wine', 'https://kwv.co.za/wp-content/uploads/2022/11/ANNABELLE-CURVE-ROSE-SPARKLING-WINE_PACKSHOT_R1-300x300.png'),
('KWV', 'Nouveau 2023 White', 'https://kwv.co.za/wp-content/uploads/2023/05/Nouveau-2023-White-300x300.jpg'),
('KWV', 'Cafe Culture', 'https://kwv.co.za/wp-content/uploads/2023/05/CAFE-CULTURE_PACKSHOT_R1-300x300.png'),
('KWV', 'Laborie Sauvignon Blanc', 'https://kwv.co.za/wp-content/uploads/2022/06/LABORIE-SAVIGNONBLANC_PACKSHOT_R1-300x300.png'),
('KWV', 'Laborie Chenin Blanc', 'https://kwv.co.za/wp-content/uploads/2022/06/LABORIE-CHENIN-BLANC_PACKSHOT_R1-300x300.png'),
('KWV', 'Cathedral Cellar Sauvignon Blanc', 'https://kwv.co.za/wp-content/uploads/2022/12/CATHEDRAL-CELLAR_SAUVIGNON-BLANC_PACKSHOT_R1-300x300.png'),
('KWV', 'Laborie Chardonnay', 'https://kwv.co.za/wp-content/uploads/2022/10/LABORIE-CHARDONNAY_PACKSHOT_R1-300x300.png'),
('KWV', 'Cathedral Cellar Chardonnay NV', 'https://kwv.co.za/wp-content/uploads/2022/02/Cathedral_Cellar_Chardonnay_NV-300x300.png'),
('KWV', 'Annabelle Curve Blanche Sparkling Wine', 'https://kwv.co.za/wp-content/uploads/2020/08/ANNABELLE-CURVE-BLANCHE-SPARKLING-WINE_PACKSHOT_R1-300x300.png'),
('KWV', 'Annabelle Curve Rose Non-Alcoholic Sparkling Wine', 'https://kwv.co.za/wp-content/uploads/2021/06/ANNABELLE-CURVE-ROSE-NON-ALC-SPARKLING-WINE_PACKSHOT_R1-300x300.png'),
('', '', ''),
('Peter Falke Wines', 'Kailani 2018', 'https://www.peterfalkewines.com/wp-content/uploads/2021/07/Kailani-2018-1.jpg'),
('Peter Falke Wines', 'Kanoa 2017', 'https://www.peterfalkewines.com/wp-content/uploads/2018/08/Kanoa-2017-3.jpg'),
('Peter Falke Wines', 'Alani 2019', 'https://www.peterfalkewines.com/wp-content/uploads/2018/08/Alani-2019-1.jpg'),
('Peter Falke Wines', 'Noelina 2017', 'https://www.peterfalkewines.com/wp-content/uploads/2018/08/Noelina-2017-1.jpg'),
('Peter Falke Wines', 'Muscat', 'https://www.peterfalkewines.com/wp-content/uploads/2018/08/Muscat.jpg'),
('', '', ''),
('Rupert & Rothschild', 'CLASSIQUE', 'https://cdn.shopify.com/s/files/1/2788/1238/products/1_RUPERT-_-ROTHSCHILD-CLASSIQUE-750ML_480x480.jpg?v=1627371494'),
('Villa Cape', 'CHARDONNAY GRAND RESERVE', 'https://cdn.shopify.com/s/files/1/2788/1238/products/1_VILLA-CAPE-CHARDONNAY-GRAND-RESERVE-750ML-X1_480x480.jpg?v=1632814481'),
('Villa Cape', 'SHIRAZ GRAND RESERVE', 'https://cdn.shopify.com/s/files/1/2788/1238/products/1_VILLA-CAPE-SHIRAZ-GRAND-RESERVE-750ML-X1_480x480.jpg?v=1632814508'),
('Villa Cape', 'RIESLING', 'https://cdn.shopify.com/s/files/1/2788/1238/products/1_VILLA-CAPE-RIESLING-750ML_480x480.jpg?v=1632814494'),
('Villa Cape', 'ROSE', 'https://cdn.shopify.com/s/files/1/2788/1238/products/1_VILLA-CAPE-ROSE-750ML_480x480.jpg?v=1632814499'),
('Villa Cape', 'SHIRAZ', 'https://cdn.shopify.com/s/files/1/2788/1238/products/1_VILLA-CAPE-SHIRAZ-750ML_480x480.jpg?v=1632814503'),
('Villa Cape', 'PINOTAGE', 'https://cdn.shopify.com/s/files/1/2788/1238/products/1_VILLA-CAPE-PINOTAGE-750ML_480x480.jpg?v=1632814490'),
('Juno', 'NON-ALCOHOLIC BLUSH', 'https://cdn.shopify.com/s/files/1/2788/1238/products/1_JUNO-NON-ALCOHOLIC-BLUSH-750ML_480x480.jpg?v=1627049328'),
('Meerlust', 'Meerlust Red', 'https://cdn.shopify.com/s/files/1/2788/1238/products/MeerlustRed_480x480.png?v=1679656971'),
('Wildekrans Estate', 'CHENIN BLANC', 'https://cdn.shopify.com/s/files/1/2788/1238/products/1_WILDEKRANS-ESTATE-CHENIN-BLANC-750ML_480x480.jpg?v=1627892207'),
('Casal Garcia', 'SANGRIA RED', 'https://cdn.shopify.com/s/files/1/2788/1238/products/1_CASAL-GARCIA-SANGRIA-RED-750ML_480x480.jpg?v=1627891730'),
('Casa Portuguesa', 'WHITE', 'https://cdn.shopify.com/s/files/1/2788/1238/products/1_CASA-PORTUGUESA-WHITE-750ML_480x480.jpg?v=1627891721');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
