<?php
        session_start();
        include('bdd_connect.php');
?>
<!DOCTYPE html>
<html>
    <header>
        <link rel="stylesheet" href="style.css" />
    </header>
    <table id="b">
        <thead>
            <tr>
                <td colspan="3"="3">Elèves absents</td>
            </tr>
        </thead>
        <tbody>
    <?php
        $id_cours= $_SESSION['id_cours'];
        $id_promo= $_SESSION['id_promo'];
        $id_groupe=$_SESSION['gr'];
        $reponse = $bdd->prepare('SELECT * FROM bdd_promo.etudiant WHERE etudiant.presencetemp = 0 AND etudiant.id_promo = ? AND etudiant.Groupe= ? ORDER BY Nom');
        //On récupère le contenu du tableau etudiant de la bdd
        $reponse->execute(array($id_promo,$id_groupe));
        ?>
        <?php
        while ($donnees = $reponse->fetch())
        {
            if ($donnees['presencetemp'] == 0) 
            {

    ?>  <tr><td>
            <img class='trombi' src="trombi/<?php echo $donnees['photo']; ?>.png" title="trombi" alt="photo_etudiant"/>
        </td>
        <td>
    <?php
                echo $donnees['Nom']." ";
                echo $donnees['Prénom'];
            }
    ?>
        </td>
        <td>
            <form method="post" action="corrige.php">
                <input type="text" name="present" value="<?php echo $donnees['login'] ?>" class="cache" />
                <input type="submit" value="Présent"/>
            </form>
        </td></tr>
        <?php 
        } 
        $reponse->closeCursor();   
        ?>
        </tbody>
    </table>
    <table id="b">
        <thead>
            <tr><td colspan="2">Validation des absences</td></tr>
        </thead>
        <tbody>
        <?php
        $reponse = $bdd->prepare('SELECT * FROM bdd_promo.etudiant WHERE etudiant.presencetemp = 0 AND etudiant.id_promo = ? AND etudiant.Groupe= ? ORDER BY Nom');
        //On récupère le contenu du tableau etudiant de la bdd
        $reponse->execute(array($id_promo,$id_groupe));
        while ($donnees = $reponse->fetch())
        {
            if ($donnees['presencetemp'] == 0) 
            {
    ?>
        <tr><td>
            <img class='trombi' src="trombi/<?php echo $donnees['photo']; ?>.png" title="trombi" />
        </td>
        <td>
            <?php
                        echo $donnees['Nom']." ";
                        echo $donnees['Prénom'];
                    }
            ?>
        </td></tr>
        <form method="post" action="valide_absents.php">
            <input type="text" name="absent" value="<?php echo $donnees['login'] ?>" class="cache" /></br>
        <?php 
            }
        ?>
    </table>
        <input type="submit" value="Valider les absences"/>
        </form>
        <a class="btn-warning btn-outline" href="javascript:history.go(-1)" role="button">retour</a>
</html>
