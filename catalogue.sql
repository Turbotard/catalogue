-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 14 oct. 2022 à 06:16
-- Version du serveur : 8.0.27
-- Version de PHP : 8.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `catalogue`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(25) NOT NULL,
  `slug` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id`, `nom`, `slug`) VALUES
(49, 'Science-Fiction', 'science-fiction'),
(35, 'Historique', 'historique'),
(51, 'Horreur', 'horreur'),
(52, 'Fantastique', 'fantastique'),
(53, 'Policier', 'policier'),
(54, 'Romantique', 'romantique');

-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

DROP TABLE IF EXISTS `commentaire`;
CREATE TABLE IF NOT EXISTS `commentaire` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_film` int NOT NULL,
  `id_user` int NOT NULL,
  `note` int NOT NULL,
  `commentaire` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `commentaire`
--

INSERT INTO `commentaire` (`id`, `id_film`, `id_user`, `note`, `commentaire`) VALUES
(1, 43, 52, 3, 'j\'ai souri mais pas ri'),
(2, 35, 53, 3, 'peut mieux faire'),
(3, 36, 54, 2, 'bienn'),
(4, 35, 54, 5, 'Genial'),
(5, 43, 52, 4, 'meilleur film du monde'),
(6, 43, 53, 5, 'yolo'),
(7, 36, 54, 5, 'comment (se) taire');

-- --------------------------------------------------------

--
-- Structure de la table `film`
--

DROP TABLE IF EXISTS `film`;
CREATE TABLE IF NOT EXISTS `film` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `prix` int NOT NULL,
  `description` text NOT NULL,
  `date_sortie` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `film`
--

INSERT INTO `film` (`id`, `titre`, `slug`, `image`, `prix`, `description`, `date_sortie`) VALUES
(36, 'Shining', 'shining', '3280da8582968cd3e0f341ca235ea5f9.png', 20, 'Jack Torrance, gardien d\'un hôtel fermé l\'hiver, sa femme et son fils Danny s\'apprêtent à vivre de longs mois de solitude. Danny, qui possède un don de médium, le Shining, est effrayé à l\'idée d\'habiter ce lieu, théâtre marqué par de terribles évènements passés...										', '1980-10-16'),
(35, 'The Matrix', 'the-matrix', '4fb60596008ffe50f8b16ca54b68542c.jpg', 20, 'Programmeur anonyme dans un service administratif le jour, Thomas Anderson devient Neo la nuit venue. Sous ce pseudonyme, il est l\'un des pirates les plus recherchés du cyber-espace. À cheval entre deux mondes, Neo est assailli par d\'étranges songes et des messages cryptés provenant d\'un certain Morpheus. Celui-ci l\'exhorte à aller au-delà des apparences et à trouver la réponse à la question qui hante constamment ses pensées : qu\'est-ce que la Matrice ?', '1999-06-11'),
(43, 'Ben-Hur', 'benhur', 'c715dfae10c54589071ff828eb04297f.jpg', 200, 'film primé de 12 oscars', '1959-01-13');

-- --------------------------------------------------------

--
-- Structure de la table `films_categs`
--

DROP TABLE IF EXISTS `films_categs`;
CREATE TABLE IF NOT EXISTS `films_categs` (
  `id_film` int NOT NULL,
  `id_categorie` int NOT NULL,
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `films_categs`
--

INSERT INTO `films_categs` (`id_film` `id_categorie`) VALUES
(43, 51),
(35, 35),
(35, 52),
(36, 49),
(36, 51),
(43, 53),
(43, 54);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `role` smallint NOT NULL,
  `login` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `avatar`, `role`, `login`) VALUES
(53, 'admin2@admin2.fr', '5f4dcc3b5aa765d61d8327deb882cf99', '34.png', 2, 'admin2'),
(52, 'admin@admin.fr', '5f4dcc3b5aa765d61d8327deb882cf99', '556a1bcd06fcf45533238190653dc512.png', 2, 'admin'),
(54, 'user@user.fr', '5f4dcc3b5aa765d61d8327deb882cf99', '512.png', 1, 'user'),
(55, 'user4@user.fr', '5f4dcc3b5aa765d61d8327deb882cf99', '5132.png', 1, 'user');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
