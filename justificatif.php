<!DOCTYPE html>

<html>
    <?php
        include('bdd_connect.php')
    ?>
    <head>
        <meta charset="utf-8" />
        <link rel="stylesheet" href="style.css" />
        <link rel="shortcut icon" type="image/x-icon" href="logo3.png" />
        <title>Envoi d'un justificatif</title>
    </head>
    <body>
        <header> IUT de Saint-Malo </header>
        <h1>Statistiques individuelles d'absence</h1>
        
		<form method="post" action="justif_abs.php" enctype="multipart/form-data">
    		<input type="file" name="file" id="file" /><br>
    		<input type="submit" name="submit" value="Envoyer"/>
    	</form>
		
        <a class="btn-warning  btn-outline" href="modifs.php" role="button">Paramètres du compte</a>
        <a class="btn-warning btn-outline" href="faq.php" role="button">FAQ</a>
		<a class="btn-warning btn-outline" href="pageetudiant.php" role="button">Retour</a>

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
        <button class="btn-warning btn-outline" onclick="Deconnexion()">Deconnexion</button>
    </body>

</html>