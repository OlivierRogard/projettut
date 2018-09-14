-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 25 mai 2018 à 21:42
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
  `id_abs` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY
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

DROP TABLE IF EXISTS `cours`;
CREATE TABLE IF NOT EXISTS `cours` (
  `Matière` text CHARACTER SET utf8 NOT NULL,
  `id_prof` int(11) NOT NULL,
  `id_promo` text CHARACTER SET utf8 NOT NULL,
  `salle` text CHARACTER SET utf8 NOT NULL,
  `debut` datetime NOT NULL,
  `fin` datetime NOT NULL,
  `id_cours` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `qrcode`
-- 

DROP TABLE IF EXISTS `qrcode`;
CREATE TABLE IF NOT EXISTS `qrcode`(
  `horaire` datetime NOT NULL,
  `id_cours` text CHARACTER SET utf8 NOT NULL,
  `qr` text CHARACTER SET utf8 NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET = latin1;

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

--
-- Déchargement des données de la table `etudiant`
--

INSERT INTO `etudiant` (`Nom`, `Prénom`, `id_promo`, `photo`, `login`, `MDP`, `Groupe`, `presencetemp`) VALUES
('Briand-Goudet', 'Loetis', 'FI1A', 'loetisb', 1, NULL, 1, 0),
('Barreau', 'Pierre', 'FI1A', 'pierreb', 2, NULL, 1, 0),
('Blanchon', 'Erwan', 'FI1A', 'erwanb', 3, NULL, 1, 0),
('Boucey', 'Paul', 'FI1A', 'paulb', 4, NULL, 2, 0),
('Boudaud', 'Jules', 'FI1A', 'julesb', 5, NULL, 1, 0),
('Bouland', 'Thomas', 'FI1A', 'thomasb', 6, NULL, 2, 0),
('Bret', 'Vladimir', 'FI1A', 'vladimirb', 7, NULL, 2, 0),
('Briand', 'Dorian', 'FI1A', 'dorianb', 8, NULL, 2, 0),
('Camera', 'Romain', 'FI1A', 'romainc', 9, NULL, 1, 0),
('Cassecuel', 'Clément', 'FI1A', 'clementc', 10, NULL, 2, 0),
('Choquet', 'Nicolas', 'FI1A', 'nicolasc', 11, NULL, 1, 0),
('Coquette', 'Yann', 'FI1A', 'yannc',12, NULL, 1, 0),
('Duchatel', 'Mathis', 'FI1A', 'mathisd', 13, NULL, 1, 0),
('Keller', 'Maxime', 'FI1A', 'maximek', 14, NULL, 1, 0),
('Lafont', 'Emeline', 'FI1A', 'emelinel',15, NULL, 2, 0),
('Laurain', 'Titouan', 'FI1A', 'titouanl', 16, NULL, 2, 0),
('Le Coz', 'Samuel', 'FI1A', 'samuell', 17, NULL, 1, 0),
('Lecrivain', 'Ugo', 'FI1A', 'ugol', 18, NULL, 2, 0),
('Levielle', 'Cedric', 'FI1A', 'cedricl', 19, NULL, 2, 0),
('Lisnic', 'Dorian', 'FI1A', 'dorianl', 20, NULL, 2, 0),
('Maulnier', 'Leopold', 'FI1A', 'leopoldm', 21, NULL, 1, 0),
('Metayer', 'Coralie', 'FI1A', 'coraliem', 12345, '12345', 1, 0),
('Miché', 'Paul', 'FI1A', 'paulm', 22, NULL, 1, 0),
('Morvan', 'Alan', 'FI1A', 'alanm', 23, NULL, 1, 0),
('Mouazan', 'Morgann', 'FI1A', 'morgannm', 24, NULL, 1, 0),
('Ndao', 'Mouhamed', 'FI1A', 'mouhamedn', 25, NULL, 1, 0),
('Parola', 'Mario', 'FI1A', 'mariop', 26, NULL, 1, 0),
('Passelande Porte', 'Baptiste', 'FI1A', 'baptistep', 27, NULL, 2, 0),
('Polet', 'Allan', 'FI1A', 'allanp', 28, NULL, 1, 0),
('Raux', 'Kevin', 'FI1A', 'kevinr', 29, NULL, 1, 0),
('Reintjes', 'Willian', 'FI1A', 'williamr', 30, NULL, 1, 0),
('Rogard', 'Olivier', 'FI1A', 'olivierr', 31, NULL, 1, 0),
('Samson', 'Théo', 'FI1A', 'theos', 32, NULL, 2, 0),
('Talio', 'Romain', 'FI1A', 'romaint', 33, NULL, 1, 0),
('Termet', 'Mathieu', 'FI1A', 'mathieut', 34, NULL, 1, 0),
('Trinquart', 'Kilian', 'FI1A', 'kiliant', 35, NULL, 1, 0),
('Vetele', 'Ewen', 'FI1A', 'ewenv', 36, NULL, 2, 0),
('test', 'test', 'FI1A', 'test', '123', '123', 1, 0),
('Macé', 'Louise', 'FA1A', 'louisem', 37, NULL, 2, 0),
('Martyn', 'Marie', 'FA1A', 'mariem', 38, NULL, 1, 0),
('Chaffotec', 'Adrien', 'FA1A', 'adrienc', 39, NULL, 1, 0),
('Conqueur', 'Nina', 'FA1A', 'ninac', 40, NULL, 1, 0),
('Debray', 'Rémi', 'FA1A', 'remid', 41, NULL, 1, 0),
('Fabre', 'Maël', 'FA1A', 'maelf', 42, NULL, 1, 0),
('Georget', 'Florian', 'FA1A', 'floriang', 43, NULL, 1, 0),
('Goupil', 'Romain', 'FA1A', 'romaing', 44, NULL, 1, 0),
('Gouverith', 'Antoine', 'FA1A', 'antoineg', 45, NULL, 1, 0),
('Gueraud', 'Dorian', 'FA1A', 'doriang', 46, NULL, 1, 0),
('Guégant', 'Axel', 'FA1A', 'axelg', 47, NULL, 1, 0),
('Guillaume', 'Maxime', 'FA1A', 'maximeg', 48, NULL, 1, 0),
('Guitton', 'Aloïs', 'FA1A', 'aloisg', 49, NULL, 1, 0),
('Koebel', 'Kilian', 'FA1A', 'kiliank', 50, NULL, 1, 0),
('Lemoing', 'Pierre', 'FA1A', 'pierrel', 51, NULL, 1, 0),
('Marziou', 'Romain', 'FA1A', 'romainm', 52, NULL, 1, 0),
('Meunier', 'Claire', 'FA1A', 'clairem', 53, NULL, 1, 0),
('Payet', 'Mathieu', 'FA1A', 'mathieup', 54, NULL, 1, 0),
('Raynard', 'Paul', 'FA1A', 'paulr', 55, NULL, 1, 0),
('Reichert', 'Raphaël', 'FA1A', 'raphaelr', 56, NULL, 1, 0),
('Rolland', 'Orlane', 'FA1A', 'orlaner', 57, NULL, 1, 0),
('Torres', 'Ken', 'FA1A', 'kent', 58, NULL, 1, 0),
('Vaucheret', 'Loïc', 'FA1A', 'loicv', 59, NULL, 1, 0),
('Beaufils', 'Eliott', 'FA1A', 'eliottb', 60, NULL, 2, 0),
('Boutet', 'Louna', 'FA1A', 'lounab', 61, NULL, 2, 0),
('Colineaux', 'Marie', 'FA1A', 'mariec', 62, NULL, 2, 0),
('Coste', 'Guillaume', 'FA1A', 'guillaumec', 63, NULL, 2, 0),
('Crié', 'Bastien', 'FA1A', 'bastienc', 64, NULL, 2, 0),
('Garion', 'Héloïse', 'FA1A', 'heloiseg', 65, NULL, 2, 0),
('Guillou', 'Maïwenn', 'FA1A', 'maiwenng', 66, NULL, 2, 0),
('Imbeaud', 'Aymeric', 'FA1A', 'aymerici', 67, NULL, 2, 0),
('Jannot', 'Killian', 'FA1A', 'killianj', 68, NULL, 2, 0),
('Jeusset', 'Mathis', 'FA1A', 'mathisj', 69, NULL, 2, 0),
('Jouan', 'Goulwen', 'FA1A', 'goulwenj', 70, NULL, 2, 0),
('L\'Helgoualc\'h', 'Justine', 'FA1A', 'justinel', 71, NULL, 2, 0),
('Lamour', 'Mickael', 'FA1A', 'mickaell', 72, NULL, 2, 0),
('Lucas', 'Léandre', 'FA1A', 'leandrel', 73, NULL, 2, 0),
('Magadur', 'Alexandre', 'FA1A', 'alexandrem', 74, NULL, 2, 0),
('Marchand', 'Jean-Baptiste', 'FA1A', 'jbm', 75, NULL, 2, 0),
('Meilleur', 'Jérémy', 'FA1A', 'jeremym', 76, NULL, 2, 0),
('Menard', 'Mathis', 'FA1A', 'mathism', 77, NULL, 2, 0),
('Redouté', 'Thomas', 'FA1A', 'thomasr', 78, NULL, 2, 0),
('Vermet', 'Julien', 'FA1A', 'julienv', 79, NULL, 2, 0);

-- --------------------------------------------------------

--
-- Structure de la table `personnel`
--

DROP TABLE IF EXISTS `personnel`;
CREATE TABLE IF NOT EXISTS `personnel` (
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
('Prof', 'Prof', '1234', '1234', 0),
('BARA', 'YANN', 'baray', NULL, 1),
('ABGRALL', 'CHRISTOPHE', 'abgrallc', NULL, 2),
('BEUCHER', 'LAURENT', 'beucherl', NULL, 3),
('PRIGENT', 'ANNE', 'prigenta', NULL, 4),
('GATEL', 'DAVID', 'gateld', '1234', 5),
('TABOURET', 'MICHEL', 'tabouretm', NULL, 6),
('DUMONT', 'FABIENNE', 'dumontf', NULL, 7),
('PASQUET', 'MAXINE', 'pasquetm', NULL, 8),
('FEREY', 'PHILIPPE', 'fereyp', NULL, 9),
('MORVAN', 'LAURENT', 'morvanl', NULL, 10),
('HUART', 'DEBORAH', 'huartd', '1234', 11),
('PARIZE', 'LAURENT', 'parizel', '1234', 12),
('CHOLLET', 'DIDIER', 'cholletd', NULL, 13),
('BARRO', 'Oumar-Alassane', 'barrooa', NULL, 14),
('PIEL', 'MARIE-BERNADETTE', 'pielmb', NULL, 15),
('GAILLARD', 'THIERRY', 'gaillardt', NULL, 16),
('SIMON', 'CLAUDE', 'simonc', NULL, 17),
('NUNES', 'JEAN-CLAUDE', 'nunesjc', NULL, 18),
('WEIS', 'FREDERIC', 'weisf', NULL, 19),
('MOTTA', 'FLAVIEN', 'mottaf', '1234', 20),
('COLLARDEY', 'SYLVAIN', 'collardeys', NULL, 21),
('ADMIN','ADMIN','admin','admin',22);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
