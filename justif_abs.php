<?php
	include('bdd_connect.php');
	
	if(!is_dir('justificatifs')){
		mkdir('justificatifs');
	}
	/*on récupère le fichier avec la variable globale $_FILES*/
	if ($_FILES['file']['error'] > 0) 
		echo "Erreur lors du transfert";

	$fichier = "justificatifs\\".$_FILES['file']['name'];	//on récupère le nom du fichier pdf envoyé

	$extension = strtolower(  substr(  strrchr($fichier, '.')  ,1)  );			//on vérifie son extension
	if ( $extension!='pdf' ) 
		echo "Extension incorrecte";
	
	/*téléchargement du fichier sur notre serveur*/

	$uploaddir = 'justificatifs\\';
	$uploadfile = $uploaddir . basename($_FILES['file']['name']);
	$name = basename($fichier);
	move_uploaded_file($_FILES['file']['tmp_name'], $uploadfile);
	
	header('Location: justificatif.php');
	
?>
