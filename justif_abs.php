<?php
	session_start();
	include('bdd_connect.php');
	ob_start();
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
	$loginetu=$_SESSION['login'];echo $loginetu;
	$req = $bdd->prepare("SELECT * FROM etudiant WHERE login=? ");
	$req->execute(array($loginetu));
	$date=$_POST['absence'];
	while($test=$req->fetch()){
	    $classe=$test['id_promo'];}
	   echo $classe;
	$req = $bdd->prepare("INSERT INTO `justificatif` (`loginetu`, `dateabs`, `filename`,`classe`) VALUES (:logetu,:dt,:name,:classe)"); 
	$req->execute(array('logetu'=>$loginetu,'dt'=>$date,'name'=>$name,'classe'=>$classe));
	header('Location: justificatif.php');
	ob_end_flush();
?>
