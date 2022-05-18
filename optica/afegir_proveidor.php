<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OPTICA AFEGIR PROVEIDOR</title>
    <link rel="stylesheet" href="css/style.css">
</head>

    <?php require_once 'header.php';?>
    <?php require_once 'conection.php';?>

    <main>

    <h1>Afegir Proveidor</h1>

        <form action="#" method="post">

            <div class="dalt">
                <div class="part">
                    <label>
                        Nom<span class="req">*</span>
                    </label>
                    <input type="text" name="nom" required id="nom" />
                </div>
                <div class="part">
                    <label>
                        Carrer<span class="req">*</span>
                    </label>
                    <input type="text" name="carrer" required id="carrer" />
                </div>
            </div>
            <div class="dalt">
                <div class="part">
                    <label>
                        Número<span class="req">*</span>
                    </label>
                    <input type="number" step="any" max="9999" name="numero" required id="numero" />
                </div>
                <div class="part">
                    <label>
                        Pis
                    </label>
                    <input type="number" step="any" max="9999" name="pis" id="pis" />
                </div>
            </div>
            <div class="dalt">
                <div class="part">
                    <label>
                        Porta
                    </label>
                    <input type="text" name="porta" id="nom" />
                </div>
                <div class="part">
                    <label>
                        Ciutat<span class="req">*</span>
                    </label>
                    <input type="text" name="ciutat" required id="ciutat" />
                </div>
            </div>
            <div class="dalt">
                <div class="part">
                    <label>
                        Codi postal<span class="req">*</span>
                    </label>
                    <input type="number" step="any" max="99999" name="codi_postal" required id="codi_postal" />
                </div>

                <div class="part">
                    <label>
                        Pais<span class="req">*</span>
                    </label>
                    <input type="text" name="pais" required id="pais" />
                </div>
            </div>
            <div class="dalt">
                <div class="part">
                    <label>
                        Telefon<span class="req">*</span>
                    </label>
                    <input type="number" step="any" max="999999999" name="telefon" required id="telefon" />
                </div>
                <div class="part">
                    <label>
                        Fax
                    </label>
                    <input type="number" step="any" max="999999999" name="fax" id="fax" />
                </div>
            </div>
            <div class="dalt">
                <div class="part">
                    <label>
                        Nif<span class="req">*</span>
                    </label>
                    <input type="text" name="nif" required id="nif" />
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
    $carrer =  $_POST['carrer'];
    $numero =  $_POST['numero'];
    $pis =  $_POST['pis'];
    $porta =  $_POST['porta'];
    $ciutat =  $_POST['ciutat'];
    $codi_postal =  $_POST['codi_postal'];
    $pais =  $_POST['pais'];
    $telefon =  $_POST['telefon'];
    $fax = $_POST['fax'];
    $nif = $_POST['nif'];

    $sql = "INSERT INTO proveidors (nom, carrer, numero, pis, porta, ciutat, codi_postal, pais, telefon, fax, nif) 
    VALUES ('$nom', '$carrer', '$numero', '$pis', '$porta', '$ciutat', '$codi_postal', '$pais', '$telefon', '$fax', '$nif')";
    mysqli_query($connect, $sql);

    mysqli_close($connect);

    header('Location: /optica/afegir_proveidor.php?succes');

}

if (isset($_GET['succes'])){
    echo "***   PROVEIDOR afegit correctament ***"; 
}

?>

</main>
    
    <?php require_once 'footer.php';?>

</body>
</html>