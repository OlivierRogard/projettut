<?php
    session_start();
    include('bdd_connect.php');
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
        <h1>Feuille d'absence</h1>
    	<h4>Ajouter un fichier Excel d'étudiants :</h4>
    	<form method="post" action="excel.php" enctype="multipart/form-data">
    		<input type="file" name="file" id="file" /><br>
    		<input type="submit" name="submit" value="Envoyer"/>
    	</form>
    	<br><br>
    	<h4>Gérer les absences :</h4>
    </body>

</html>