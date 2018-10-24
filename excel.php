<?php
	include('bdd_connect.php');

	/*on récupère le fichier avec la variable globale $_FILES*/
	if ($_FILES['file']['error'] > 0) $erreur = "Erreur lors du transfert";

	$fichier = "C:\wamp64\www\projet\listes\\".$_FILES['file']['name'];			 								//on récupère le nom du fichier csv envoyé

	$extension = strtolower(  substr(  strrchr($fichier, '.')  ,1)  );			//on vérifie son extension
	if ( $extension!='csv' ) echo "Extension incorrecte";

	/*téléchargement du fichier sur notre serveur*/

	$uploaddir = 'C:\wamp64\www\projet\listes\\';
	$uploadfile = $uploaddir . basename($_FILES['file']['name']);
	$name = basename($fichier);
	move_uploaded_file($_FILES['file']['tmp_name'], $uploadfile);
	echo $fichier;
	
	/*on ouvre le fichier*/
	if (file_exists($fichier)){
	 $fp = file($fichier); 
	}
 	else   		/*s'il n'existe pas*/
    { 
       echo "Fichier introuvable !<br>Importation stoppée.";
       exit();
    }

    /*on vide la table*/
    $del=$bdd->query('DELETE FROM `etudiant`');

    /*lecture du fichier*/
   foreach($fp as $ligne)
	{
		$k = explode(",",$ligne);
		$nom = $k[0];
		$prenom = $k[1];
		$promo = $k[2];
		$photo = strtolower($prenom).substr(strtolower(ucfirst($nom)),0,3);
		$login = $photo;
		$char = 'abcdefghijklmnopqrstuvwxyz0123456789'; 
		$mdp = substr(str_shuffle($char),26);
		$gr = $k[3];

		/*on remplit la table ligne par ligne*/
		$req = $bdd->prepare("INSERT INTO `etudiant` (`Nom`, `Prénom`, `id_promo`,`photo`,`login`,`MDP`,`Groupe`,`presencetemp`) VALUES (:nom,:prenom,:promo,:photo,:log,:mdp,:gr,'0')");
		$req->execute(array('nom'=>$nom,'prenom'=>$prenom,'promo'=>$promo,'photo'=>$photo,'log'=>$login,'mdp'=>$mdp,'gr'=>$gr));

	}
	header('Location: administration.php');
?>
