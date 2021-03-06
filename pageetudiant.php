<?php
    session_start();
?>

<!DOCTYPE html>

<html>
    <?php
        include('bdd_connect.php')
    ?>
    <head>
        <meta charset="utf-8" />
        <link rel="stylesheet" href="style.css" />
        <link rel="shortcut icon" type="image/x-icon" href="logo3.png" />
        <title>Statistiques d'absence</title>
    </head>
    <body>
        <header> IUT de Saint-Malo </header>
        <h1>Statistiques individuelles d'absence</h1>
        <table id="b" align="center">
            <thead>
                <tr>
                    <td>Absences justifiées </td>
                    <td>Absence injustifiées</td>
                    <td>Date</td>
                </tr>
            </thead>
            <tbody>
                <?php
                $jtotal=0;
                $njtotal=0;
                $reponse = $bdd->prepare('SELECT * FROM bdd_promo.etudiant,bdd_promo.absences WHERE etudiant.login=? AND etudiant.login=absences.loginetu');
                $reponse->execute(array($_SESSION['login']));
                while ($res =$reponse->fetch())    
                {
                ?>
                <tr>
                    <td><?php echo $res['j']; ?></td>
                    <td><?php echo $res['nj']; ?></td>
                    <td><?php echo $res['date']; ?></td>
                </tr>
                <?php
                    $jtotal = $res['j']+$jtotal;
                    $njtotal=$res['nj']+$njtotal;
                }
                $reponse->closeCursor();                                                //Termine le traitement de la requête
                ?>
                <tr>
                    <td><?php echo $jtotal; ?></td>
                    <td><?php echo $njtotal; ?></td>
            </tbody>
        </table>
        <a class="btn-warning  btn-outline" href="modifs.php" role="button">Paramètres du compte</a>
        <a class="btn-warning btn-outline" href="faq.php" role="button">FAQ</a>
		<a class="btn-warning btn-outline" href="justificatif.php" role="button">Envoyer un justificatif d'absence</a>

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