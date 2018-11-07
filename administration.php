<?php
    session_start();
    include('bdd_connect.php');

    if (isset($_POST['nom']) && isset($_POST['prénom']) && isset($_POST['log']) && isset($_POST['mdp'])){
    	$req = $bdd->prepare("INSERT INTO `personnel` (`Nom`, `Prénom`, `login`,`mdp`) VALUES (:nom,:prenom,:log,:mdp)");
		$req->execute(array('nom'=>$_POST['nom'],'prenom'=>$_POST['prénom'],'log'=>$_POST['log'],'mdp'=>$_POST['mdp']));
    }
?>
<!DOCTYPE html>

<html>
     <head>
        <meta charset="utf-8" />
        <link rel="stylesheet" href="style.css" />
        <link rel="shortcut icon" type="image/x-icon" href="logo3.png" />
        <title>Administration</title>
    </head>
    <body>
    	<header> IUT de Saint-Malo </header>
        <h1>Administration</h1>
        <h4><a href="emploidutemps.php">Mettre à jour l'emploi du temps</a></h4>
    	<h4>Liste des étudiants au format CSV :</h4>
    	<form method="post" action="excel.php" enctype="multipart/form-data">
    		<input type="file" name="file" id="file" /><br>
    		<input type="submit" name="submit" value="Envoyer"/>
    	</form>
    	<br><br>
    	<h4>Gérer les absences :</h4>
    	<br><br>
    	<h4>Ajouter un intervenant :</h4>
    	<fieldset>
    	<form method="post" action="administration.php">
    		Nom : <input type="text" name="nom" /> <br>
    		Prénom : <input type="text" name="prénom" /> <br>
    		Login : <input type="text" name="log" /> <br>
    		Mot de passe : <input type="password" name="mdp" /> <br>
    		<input type="submit" name="submit" value="Envoyer"/>
    	</form>
    	</fieldset>
		
		<?php 
			echo "<h2>Récupérer les justificatifs des élèves</h2><br/>";
			//Ouvre le répertoire
			if(!is_dir('justificatifs')){
				mkdir('justificatifs');
			}
			$rep= opendir("justificatifs");
			
			echo "<center><table id='justif'>\n";
			while($fichier = readdir($rep)){
				if ($fichier!="." && $fichier!=".."){
					echo "<tr>"
						."<td>". $fichier ."</td>"
						."<td><a href='justificatifs/" . $fichier ."' target='_blank'>Télécharger ce justificatif</a></td>"
					. "</tr>\n";
				}
				if($fichier == "." || $fichier== "..")
					$contenu=0;
			} 
			echo "</table></center>\n";
			if ($contenu==0)
				echo "Il n'y a aucun justificatif à récupérer.";
			
			closedir($rep);
		?>
		<br/><br/><br/><br/><br/>
    	<script>
                function Deconnexion ()
                {
                function RedirigeDeconnexion()
                {
                document.location.href="deconnect.php"; 
                }
                if (confirm("Etes-vous sûr de vouloir vous déconnecter ?")) 
                    {
                        RedirigeDeconnexion();
                    }
                }
        </script>
    	<button class="btn-warning btn-outline" href="deconnect.php" onclick="Deconnexion()">Déconnexion</button>

        <a class="btn-warning btn-outline" href="faq.php" role="button">FAQ</a>

        <a class="btn-warning btn-outline" href="modifs.php" role="button">Paramètres du compte</a>
    </body>

</html>
