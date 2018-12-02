<?php
	include('bdd_connect.php');																		//connexion à la bdd
	session_start();
	$edt = file_get_contents('edt/calendrier.ics');														//récupération du fichier calendrier

	/*Utilisation d'expressions régulières afin de récupérer les lignes qui nous intéressent*/
	$regExpMatiere = '/'.'SUMMARY:(.*)'.'/';														//Les '/' sont des délimiteurs
	$regExpDebut = '/'.'DTSTART:(.*)'.'/';
	$regExpFin = '/'.'DTEND:(.*)'.'/';
	$regExpProf = '/'.'DESCRIPTION:(.*)'.'/';
	$regExpSalle = '/'.'LOCATION:(.*)'.'/';

	/*On entre les expressions régulières dans des tableau*/
	$l = preg_match_all($regExpMatiere, $edt, $tabMatiere, PREG_PATTERN_ORDER);						
	preg_match_all($regExpDebut, $edt, $tabDebut, PREG_PATTERN_ORDER);
	preg_match_all($regExpFin, $edt, $tabFin, PREG_PATTERN_ORDER);
	preg_match_all($regExpProf, $edt, $tabProf, PREG_PATTERN_ORDER);
	preg_match_all($regExpSalle, $edt, $tabSalle, PREG_PATTERN_ORDER);

	$del=$bdd->query('DELETE FROM `cours`');
	$id=0;
	/*boucle pour chaque paragraphe event du fichier*/
	for ($i=0 ; $i < $l ; ++$i)
	{
		$id=$id+1;
		$_SESSION['id_cours']=$id;
		// Récupération de l'horaire de début
		$anneede = substr($tabDebut[0][$i], 8);
		$anneedebut = substr($anneede,0,4);
		$moisdebut = substr($tabDebut[0][$i], 12, 2);
		$jourdebut = substr($tabDebut[0][$i], 14, 2);
		$heuredebut = substr($tabDebut[0][$i], 17, 2);
		$mindebut = substr($tabDebut[0][$i], 19, 2);
		$hordebut = $anneedebut.'-'.$moisdebut.'-'.$jourdebut.' '.$heuredebut.':'.$mindebut;

		// Récupération de l'horaire de fin
		$anneef = substr($tabFin[0][$i], 6);
		$anneefin=substr($anneef,0,4);
		$moisfin = substr($tabFin[0][$i], 10, 2);
		$jourfin = substr($tabFin[0][$i], 12, 2);
		$heurefin = substr($tabFin[0][$i], 15, 2);
		$minfin = substr($tabFin[0][$i], 17, 2);
		$horfin = $anneefin.'-'.$moisfin.'-'.$jourfin.' '.$heurefin.':'.$minfin;

		//Récupération de la matière
		$matiere = substr($tabMatiere[0][$i], 8);
		//echo " cours de ".$matiere;
		$groupe=strstr($matiere,"Gr.");
		$groupe=substr($groupe,3);
		//echo $groupe;

		/*Traitement de la description, récupération des enseignants*/
		$desc = substr($tabProf[0][$i], 16);
		$k=explode('\n',$desc);
		
		if (isset($k[3])){
			if(strlen($k[3])>2){
				list($promo,$prof1,$prof2,$export)=$k;
				if((substr($prof1,0,3)==substr($promo,0,3)) || ($prof1=="Economie")){
					$prof1=$prof2;
					$prof2=NULL;
					$nom=explode(' ',$prof1);
				}
				if($export=="ABGRALL CHRISTOPHE"){
					$prof1=$export;
					$prof2=NULL;
					$nom=explode(' ',$prof1);
				}
				else{
					$nom=explode(' ',$prof1);
					$nom2=explode(' ',$prof2);
					//print_r($nom2);
				}
				//echo 'cours avec '.$prof1.' et '.$prof2;
			}
			else{
				list($promo,$prof,$export)=$k;
				//echo 'cours avec '.$prof;
				$nom=explode(' ',$prof);	
				$prof2=NULL;	
			}
		}
		else{
			list($promo,$export)=$k;
			$prof="Prof Prof";
			$nom=explode(' ',$prof);
			//$nom2=NULL;
			//$idpr2=NULL;
		}

		if(substr($promo,0,3)=="R&T"){
			$promo = substr($promo,-4);
		}

		$salle = substr($tabSalle[0][$i],9);	

		if (!isset($nom[0]) || !isset($nom[1])){
			$nom[0]=0;
			$nom[1]=0;
		}
		if (($prof2!=NULL && (!isset($nom2[0]) || !isset($nom2[1])))){
			$nom2[0]=0;
			$nom2[1]=0;
		}

		$idpr=1;
		$idpr2=1;
		/*Récupération de l'id_prof dans la bdd*/
		$rec=$bdd->prepare('SELECT * FROM `personnel` WHERE `Nom`=? AND `Prénom`=?');
		$rec->execute(array($nom[0],$nom[1]));
		while($rep=$rec->fetch())
		{
			$idpr=$rep['id_prof'];
		}
		if ($prof2!=NULL){
			$rec2=$bdd->prepare('SELECT `id_prof` FROM `personnel` WHERE `Nom`=? AND `Prénom`=?');
			$rec2->execute(array($nom2[0],$nom2[1]));
			while($rep2=$rec2->fetch())
			{
				$idpr2=$rep2['id_prof'];
			}
		}
		//$idpr2=0;

		//Remplissage de la base de données
		$req = $bdd->prepare("INSERT INTO `cours` (`Matière`, `id_prof`,`id_prof2`, `id_promo`,`salle`,`debut`,`fin`) VALUES (:mat,:prof,:prof2,:promo,:salle,:debut,:fin)");
		$req->execute(array('mat'=>$matiere,'prof'=>$idpr,'prof2'=>$idpr2,'promo'=>$promo,'salle'=>$salle,'debut'=>$hordebut,'fin'=>$horfin));
	}
	
	header('Location: administration.php');
?>
