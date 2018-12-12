<?php
    session_start();
    include('bdd_connect.php');
    $login_prof=$_SESSION['login'];
    $id_promo=$_SESSION['id_promo'];
    if (isset ($_SESSION['gr'])) {		//si le cours se fait en demi-groupes
		$id_groupe = $_SESSION['gr'];

		$reponse = $bdd->prepare('SELECT * FROM etudiant WHERE presencetemp = 0 AND id_promo = ? AND Groupe=? ORDER BY Nom');
		$reponse->execute(array($id_promo,$id_groupe));
    }
	else {						// si le cours se fait en classe entière
		$reponse = $bdd->prepare('SELECT * FROM etudiant WHERE presencetemp = 0 AND id_promo = ? ORDER BY Nom');
		$reponse->execute(array($id_promo));
	}
    while ($donnees = $reponse->fetch()){		
            if ($donnees['presencetemp'] == 0) 		//si la personne est absente
            {		
            	$login_etu=$donnees['login'];	//recupère le login étudiant dans table étudiant
            	$heure=date('H:i');
				$heure2=substr($heure,0,2);
				$heure2+=1;
				$min=substr($heure,3,5);
				$heure=$heure2.":".$min;
				echo $heure;
    			$req = $bdd->prepare("INSERT INTO `absences` (`loginetu`, `nj`, `loginprof`,`date`,`heure`) VALUES (:logetu,:nj,:logprof,:dt,:h)"); //on ajoute les absences à la bdd
				$req->execute(array('logetu'=>$login_etu,'j'=>"0",'nj'=>"1",'logprof'=>$login_prof,'dt'=>$date,'h'=>$heure));
			header('location:trombi.php');
            }
        }
?>
