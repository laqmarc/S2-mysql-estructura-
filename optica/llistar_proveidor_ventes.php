<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OPTICA</title>
    <link rel="stylesheet" href="css/style.css">
</head>

<body>


    <?php require_once 'header.php';?>
    <?php require_once 'conection.php';?>
    <main>
        <h1>3-Llista els diferents proveïdors que han subministrat ulleres venudes amb èxit per l'òptica</h1>
        <div class="container-compres">
            <div class="llistat-id-clients">
               
                <?php

                $query3 = "SELECT DISTINCT id_proveidor FROM ulleres LEFT JOIN ventes_detall ON ventes_detall.id_ulleres = ulleres.id ";
                $result3 = mysqli_query($connect, $query3);
                
                ?>

                <table>
                    <tr>
                        <th>Proveidors que han venut</th>
                    </tr>

                    <?php while($row3 = mysqli_fetch_array($result3)):;?>

                    <tr>
                        <td><?php echo $row3[0];?></td>
                    </tr>

                    <?php endwhile;?>

                </table>
            </div>
        </div>

    </main>

    <?php require_once 'footer.php';?>

</body>

</html>