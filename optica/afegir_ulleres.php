<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OPTICA AFEGIR ULLERES</title>
    <link rel="stylesheet" href="css/style.css">
</head>

<?php require_once 'header.php';?>
<?php require_once 'conection.php';?>

<main>

    <h1>Afegir ulleres</h1>

    <div class="espai-ullerees">
        <div class="espai-proveidors">

            <?php

            $query = "SELECT * FROM `clients`";
            $result3 = mysqli_query($connect, $query);

            ?>

            <table>
                <tr>
                    <th>Id proveedor</th>
                    <?php while($row3 = mysqli_fetch_array($result3)):;?>
                </tr>
                <tr>
                    <td><?php echo $row3[0];?></td>
                    <?php endwhile;?>
                </tr>
            </table>

        </div>

        <div class="espai-formulari">

            <form action="#" method="post">

                <div class="dalt">
                    <div class="part">
                        <label>
                            Marca<span class="req">*</span>
                        </label>
                        <input type="text" name="marca" required id="marca" />
                    </div>
                    <div class="part">

                        <select name="muntura">
                            <option value="none" selected>Selecciona tipus de muntura *</option>
                            <option value="Flotant">Flotant</option>
                            <option value="Pasta">Pasta</option>
                            <option value="Metàl.lica">Metàl.lica</option>
                        </select>

                    </div>
                </div>

                <div class="dalt">
                    <div class="part">
                        <label>
                            Graduacio vidre esquerre<span class="req">*</span>
                        </label>
                        <input type="number" name="graduacio_left" required id="graduacio_left" step="any" max="99" />
                    </div>
                    <div class="part">
                        <label>
                            Graduacio vidre dret<span class="req">*</span>
                        </label>
                        <input type="number" name="graduacio_right" required id="graduacio_right" step="any" max="99" />
                    </div>
                </div>

                <div class="dalt">
                    <div class="part">
                        <label>
                            Muntura Color
                        </label>
                        <input type="text" name="muntura_color" id="muntura_color" />
                    </div>
                    <div class="part">
                        <label>
                            Color vidre esquerre<span class="req">*</span>
                        </label>
                        <input type="text" name="vidre_left_color" required id="vidre_left_color" />
                    </div>
                </div>

                <div class="dalt">
                    <div class="part">
                        <label>
                            Color vidre dret<span class="req">*</span>
                        </label>
                        <input type="text" name="vidre_right_color" required id="vidre_right_color" />
                    </div>

                    <div class="part">
                        <label>
                            Preu<span class="req">*</span>
                        </label>
                        <input type="number" name="preu" required id="preu" step="any" max="99999" />
                    </div>

                    <div class="part">
                        <label>
                            Id proveidor<span class="req">*</span>
                        </label>
                        <input type="number" name="id_proveidor" required id="id_proveidor" step="any" />
                    </div>
                </div>

                <button type="submit" name="boto-summit" class="button button-block" />Afegir</button>

            </form>
        </div>
    </div>


<?php

if (isset($_POST['boto-summit'])){
    if (!$connect) {
    die("ERROR DE CONEXIÓ: " . mysqli_connect_error());
    }

    $marca = $_POST['marca'];
    $muntura = $_POST['muntura'];
    $graduacio_left = $_POST['graduacio_left'];
    $graduacio_right = $_POST['graduacio_right'];
    $muntura_color = $_POST['muntura_color'];
    $vidre_left_color = $_POST['vidre_left_color'];
    $vidre_right_color = $_POST['vidre_right_color'];
    $preu = $_POST['preu'];
    $id_proveidor = $_POST['id_proveidor'];

    $sql = "INSERT INTO ulleres (marca, muntura, graduacio_left, graduacio_right, muntura_color, vidre_left_color, vidre_right_color, preu, id_proveidor)
    VALUES ('$marca', '$muntura', '$graduacio_left', '$graduacio_right', '$muntura_color', '$vidre_left_color', '$vidre_right_color', '$preu', '$id_proveidor')";

    mysqli_query($connect, $sql);
        
    mysqli_close($connect);

    header('Location: /optica/afegir_ulleres.php?succes');

}

if (isset($_GET['succes'])){
    echo "***   ULLERES afegit correctament ***"; 
}

?>

</main>

<?php require_once 'footer.php';?>

</body>

</html>