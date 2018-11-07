<?php
    session_start();
    include('bdd_connect.php');
    $login_prof=$_SESSION['login'];
    $id_promo=$_SESSION['id_promo'];
    if (isset ($_SESSION['gr'])) {
		$id_groupe = $_SESSION['gr'];

		$reponse = $bdd->prepare('SELECT * FROM etudiant WHERE presencetemp = 0 AND id_promo = ? AND Groupe=? ORDER BY Nom');
		$reponse->execute(array($id_promo,$id_groupe));
    }
	else {
		$reponse = $bdd->prepare('SELECT * FROM etudiant WHERE presencetemp = 0 AND id_promo = ? ORDER BY Nom');
		$reponse->execute(array($id_promo));
	}
    while ($donnees = $reponse->fetch()){
            if ($donnees['presencetemp'] == 0) 
            {		
		
            	$login_etu=$donnees['login'];
            	$date=date('Y-m-d H:i');		

    			//$req = $bdd->prepare("INSERT INTO `absences` (`loginetu`, `nj`, `loginprof`,`date`) VALUES (:logetu,:nj,:logprof,:dt)");
				//$req->execute(array('logetu'=>$login_etu,'nj'=>"1",'logprof'=>$login_prof,'dt'=>$date));

                $test=$bdd -> prepare('SELECT * FROM absences WHERE loginetu = ?');
                $test->execute(array($login_etu));
                while ($abs = $test->fetch()){
                    if ($abs['loginetu']==$login_etu){
                        $date1 = $abs['date']; 
                        $jour1=substr($date1,0,-9); 
                        $heure1=substr($date1,11,-6); 
                        while($abs2 = $test-> fetch()){
                            if ($abs['loginetu']==$login_etu){
                                if($abs2['date']!=$date1){
                                    $jour=substr($abs2['date'],0,10);
                                    $heure=substr($abs2['date'],10,-6);
                                    if ($jour==$jour1){
                                        if (($heure1<=11) AND ($heure1>=06) AND ($heure<=11) AND ($heure>=06)){
											$tps = "matin";
                                            $del = $bdd->prepare('DELETE FROM absences WHERE `date`= ?');
                                            $del->execute(array($abs2['date']));
                                            $demij = substr($date1,0,-10);
                                            echo $demij;
                                            $modif = $bdd->prepare('UPDATE absences SET `date`= ? WHERE `date` = ? AND loginetu = ?');
                                            $modif->execute(array($demij,$date1,$login_etu));
                                        }
                                        elseif (($heure1<=18) AND ($heure1>=11) AND ($heure<=18) AND ($heure>=11)){
											echo $heure;
										   $tps = "aprem";
                                            $del = $bdd->prepare('DELETE FROM absences WHERE `date`= ?');
                                            $del->execute(array($abs2['date']));
                                            $demij = substr($date1,0,-9);
                                            echo $demij;
                                            $modif = $bdd->prepare('UPDATE absences SET `date`= ? WHERE `date` = ? AND loginetu = ?');
                                            $modif->execute(array($demij,$date1,$login_etu));
                                        }
                                    }


                                }
                            }
                        }
                    }
                }
				header('location:trombi.php');
            }
        }
?>