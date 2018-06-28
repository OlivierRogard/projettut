<?php
    include('bdd_connect.php');
    $v=1;
    // Récupéraiton du temps de génération du QR code
    $req_temps_ref = $bdd-> prepare('SELECT horaire FROM qrcode WHERE id_cours = ? LIMIT 1');
    $req_temps_ref -> execute(array($v));
    $array_temps_ref = $req_temps_ref -> fetch();
    print_r($array_temps_ref);
    $chaine_temps_ref=implode(" ", $array_temps_ref);
    $chaine_temps_ref=substr($chaine_temps_ref, 19);
    $temps_ref=strtotime($chaine_temps_ref);
    echo 'temps_ref'.$temps_ref;
    $temps=time();
    echo 'temps'.$temps;
    $v=0;
                /*Recherche du cours dans la bdd*/
                $req_temps_ref = $bdd->prepare('SELECT * FROM cours WHERE id_prof = ?');
                $req_temps_ref -> execute(array($v));

                /*comparaison de l'heure pour trouver le bon cours de la semaine*/
                while($rep=$req_temps_ref->fetch()){

                    $array_deb=array($rep['debut']);
                    $array_fin=array($rep['fin']);
                    $chaine_deb_ref=implode(" ", $array_deb);
                    $chaine_fin_ref=implode(" ", $array_deb);
                    $chaine_deb_ref=substr($chaine_deb_ref, 19);
                    $chaine_fin_ref=substr($chaine_fin_ref, 19);
                    $deb_ref=strtotime($chaine_deb_ref);
                    $fin_ref=strtotime($chaine_fin_ref);

                    if($deb_ref<=$temps){
                        if($temps<=$fin_ref){
                            echo "c'est tout bon";                            
                        }
                    }
                }

?>