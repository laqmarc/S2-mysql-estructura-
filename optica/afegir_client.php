<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OPTICA AFEGIR CLIENT</title>
    <link rel="stylesheet" href="css/style.css">
</head>



<?php require_once 'header.php';?>
<?php require_once 'conection.php';?>

<main>

    <h1>Afegir Client</h1>

    <form action="#" method="post">

        <div class="dalt">
            <div class="part">
                <label>
                    Nom<span class="req">*</span>
                </label>
                <input type="text" name="nom" id="nom" required />
            </div>
            <div class="part">
                <label>
                    Adreça<span class="req">*</span>
                </label>
                <input type="text" name="adress" id="adress" required />
            </div>
        </div>

        <div class="dalt">
            <div class="part">
                <label>
                    Telèfon
                </label>
                <input type="number" max="999999999" step="any" name="telefon" id="telefon" />
            </div>

            <div class="part">
                <label>
                    Email<span class="req">*</span>
                </label>
                <input type="email" name="email" id="email" required />
            </div>
        </div>

        <button type="submit" name="boto-summit" class="button button-block" />Afegir</button>

    </form>

    <?php

if (isset($_POST['boto-summit'])){
    if (!$connect) {
        die("ERROR DE CONEXIÓ: " . mysqli_connect_error());
      }

      $nom =  $_POST['nom'];
      $adress = $_POST['adress'];
      $telefon =  $_POST['telefon'];
      $email = $_POST['email'];

      $sql = "INSERT INTO clients (nom, adress, telefon, email) 
      VALUES ('$nom', '$adress','$telefon','$email')";
      mysqli_query($connect, $sql);
     
    mysqli_close($connect);

    header('Location: /optica/afegir_client.php?succes');

}

if (isset($_GET['succes'])){
    echo "***   CLIENT afegit correctament ***"; 

}

?>

</main>

<?php require_once 'footer.php';?>

</body>
</html>