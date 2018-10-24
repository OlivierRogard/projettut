-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 27 sep. 2018 à 07:52
-- Version du serveur :  5.7.19
-- Version de PHP :  5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `bdd_promo`
--

-- --------------------------------------------------------

--
-- Structure de la table `absences`
--

DROP TABLE IF EXISTS `absences`;
CREATE TABLE IF NOT EXISTS `absences` (
  `loginetu` text NOT NULL,
  `j` int(11) DEFAULT NULL,
  `nj` int(11) DEFAULT NULL,
  `loginprof` text NOT NULL,
  `date` datetime NOT NULL,
  `id_abs` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_abs`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `absences`
--

INSERT INTO `absences` (`loginetu`, `j`, `nj`, `loginprof`, `date`, `id_abs`) VALUES
('123', 0, 1, 'Prof', '2019-03-15 08:14:37', 1),
('123', 1, 0, 'Prof', '2019-04-17 10:14:37', 2);

-- --------------------------------------------------------

--
-- Structure de la table `cours`
--

DROP TABLE IF EXISTS `cours`;
CREATE TABLE IF NOT EXISTS `cours` (
  `Matière` text CHARACTER SET utf8 NOT NULL,
  `id_prof` int(11) NOT NULL,
  `id_promo` text CHARACTER SET utf8 NOT NULL,
  `salle` text CHARACTER SET utf8 NOT NULL,
  `debut` datetime NOT NULL,
  `fin` datetime NOT NULL,
  `id_cours` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_cours`)
) ENGINE=MyISAM AUTO_INCREMENT=3513 DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

DROP TABLE IF EXISTS `etudiant`;
CREATE TABLE IF NOT EXISTS `etudiant` (
  `Nom` text CHARACTER SET utf8 NOT NULL,
  `Prénom` text CHARACTER SET utf8 NOT NULL,
  `id_promo` text CHARACTER SET utf8 NOT NULL,
  `photo` text NOT NULL,
  `login` text CHARACTER SET utf8 COLLATE utf8_bin,
  `MDP` text,
  `Groupe` int(11) NOT NULL,
  `presencetemp` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--------------------------------------------------------------------

--
-- Structure de la table `personnel`
--

DROP TABLE IF EXISTS `personnel`;
CREATE TABLE IF NOT EXISTS `personnel` (
  `Nom` text CHARACTER SET utf8 NOT NULL,
  `Prénom` text CHARACTER SET utf8 NOT NULL,
  `login` text CHARACTER SET utf8,
  `MDP` text CHARACTER SET utf8 NOT NULL,
  `id_prof` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_prof`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `personnel`
--

INSERT INTO `personnel` (`Nom`, `Prénom`, `login`, `MDP`, `id_prof`) VALUES
('Prof', 'Prof', '1234', '1234', 1),
('BARA', 'YANN', 'baray', '1234', 2),
('ABGRALL', 'CHRISTOPHE', 'abgrallc', '1234', 3),
('BEUCHER', 'LAURENT', 'beucherl', '1234', 4),
('PRIGENT', 'ANNE', 'prigenta', '1234', 5),
('GATEL', 'DAVID', 'gateld', '1234', 6),
('TABOURET', 'MICHEL', 'tabouretm', '1234', 7),
('DUMONT', 'FABIENNE', 'dumontf', '1234', 8),
('PASQUET', 'MAXINE', 'pasquetm', '1234', 9),
('FEREY', 'PHILIPPE', 'fereyp', '1234', 10),
('MORVAN', 'LAURENT', 'morvanl', '1234', 11),
('HUART', 'DEBORAH', 'huartd', '1234', 12),
('PARIZE', 'LAURENT', 'parizel', '1234', 13),
('CHOLLET', 'DIDIER', 'cholletd', '1234', 14),
('BARRO', 'Oumar-Alassane', 'barrooa', '1234', 15),
('PIEL', 'MARIE-BERNADETTE', 'pielmb', '1234', 16),
('GAILLARD', 'THIERRY', 'gaillardt', '1234', 17),
('SIMON', 'CLAUDE', 'simonc', '1234', 18),
('NUNES', 'JEAN-CLAUDE', 'nunesjc', '1234', 19),
('WEIS', 'FREDERIC', 'weisf', '1234', 20),
('MOTTA', 'FLAVIEN', 'mottaf', '1234', 21),
('COLLARDEY', 'SYLVAIN', 'collardeys', '1234', 22),
('ADMIN', 'ADMIN', 'admin', 'admin', 23);

-- --------------------------------------------------------

--
-- Structure de la table `qrcode`
--

DROP TABLE IF EXISTS `qrcode`;
CREATE TABLE IF NOT EXISTS `qrcode` (
  `horaire` datetime NOT NULL,
  `id_cours` text CHARACTER SET utf8 NOT NULL,
  `qr` text CHARACTER SET utf8 NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
