<?php
    session_start();
    include('bdd_connect.php');
    $login_prof=$_SESSION['login'];
    $id_promo=$_SESSION['id_promo'];

    $reponse = $bdd->prepare('SELECT * FROM etudiant WHERE presencetemp = 0 AND id_promo = ? ORDER BY Nom');
    $reponse->execute(array($id_promo));
    while ($donnees = $reponse->fetch())
        {
            if ($donnees['presencetemp'] == 0) 
            {		

            	$login_etu=$donnees['login'];
            	$date=date('Y-m-d H:i');							
    			$req = $bdd->prepare("INSERT INTO `absences` (`loginetu`, `nj`, `loginprof`,`date`) VALUES (:logetu,:nj,:logprof,:dt)");
				$req->execute(array('logetu'=>$login_etu,'nj'=>"1",'logprof'=>$login_prof,'dt'=>$date));
				header('location:trombi.php');
            }
        }
?>