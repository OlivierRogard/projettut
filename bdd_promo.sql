-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  lun. 03 déc. 2018 à 18:51
-- Version du serveur :  10.1.37-MariaDB
-- Version de PHP :  7.2.12

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

CREATE TABLE `absences` (
  `loginetu` text NOT NULL,
  `j` int(11) DEFAULT NULL,
  `nj` int(11) DEFAULT NULL,
  `loginprof` text NOT NULL,
  `date` datetime NOT NULL,
  `id_abs` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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

CREATE TABLE `cours` (
  `Matière` text CHARACTER SET utf8 NOT NULL,
  `id_prof` int(11) NOT NULL,
  `id_promo` text CHARACTER SET utf8 NOT NULL,
  `salle` text CHARACTER SET utf8 NOT NULL,
  `debut` datetime NOT NULL,
  `fin` datetime NOT NULL,
  `id_cours` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

CREATE TABLE `etudiant` (
  `Nom` text CHARACTER SET utf8 NOT NULL,
  `Prénom` text CHARACTER SET utf8 NOT NULL,
  `id_promo` text CHARACTER SET utf8 NOT NULL,
  `photo` text NOT NULL,
  `login` text CHARACTER SET utf8 COLLATE utf8_bin,
  `MDP` text,
  `Groupe` int(11) NOT NULL,
  `presencetemp` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `geoloc`
--

CREATE TABLE `geoloc` (
  `Salle` text NOT NULL,
  `Latitude1` double NOT NULL,
  `Longitude1` double NOT NULL,
  `Latitude2` double NOT NULL,
  `Longitude2` double NOT NULL,
  `Latitude3` double NOT NULL,
  `Longitude3` double NOT NULL,
  `Latitude4` double NOT NULL,
  `Longitude4` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `geoloc`
--

INSERT INTO `geoloc` (`Salle`, `Latitude1`, `Longitude1`, `Latitude2`, `Longitude2`, `Latitude3`, `Longitude3`, `Latitude4`, `Longitude4`) VALUES
('Salle de conference', 48.656877, -1.969057, 48.656895, -1.968904, 48.656944, -1.196909, 48.657011, -1.968941);

-- --------------------------------------------------------

--
-- Structure de la table `personnel`
--

CREATE TABLE `personnel` (
  `Nom` text CHARACTER SET utf8 NOT NULL,
  `Prénom` text CHARACTER SET utf8 NOT NULL,
  `login` text CHARACTER SET utf8,
  `MDP` text CHARACTER SET utf8 NOT NULL,
  `id_prof` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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

CREATE TABLE `qrcode` (
  `horaire` datetime NOT NULL,
  `id_cours` text CHARACTER SET utf8 NOT NULL,
  `qr` text CHARACTER SET utf8 NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `absences`
--
ALTER TABLE `absences`
  ADD PRIMARY KEY (`id_abs`);

--
-- Index pour la table `cours`
--
ALTER TABLE `cours`
  ADD PRIMARY KEY (`id_cours`);

--
-- Index pour la table `personnel`
--
ALTER TABLE `personnel`
  ADD PRIMARY KEY (`id_prof`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `absences`
--
ALTER TABLE `absences`
  MODIFY `id_abs` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `cours`
--
ALTER TABLE `cours`
  MODIFY `id_cours` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3513;

--
-- AUTO_INCREMENT pour la table `personnel`
--
ALTER TABLE `personnel`
  MODIFY `id_prof` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
