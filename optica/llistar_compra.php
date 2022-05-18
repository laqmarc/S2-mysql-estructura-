<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OPTICA LLISTAR COMPRA</title>
    <link rel="stylesheet" href="css/style.css">
</head>

<body>


    <?php require_once 'header.php';?>
    <?php require_once 'conection.php';?>
    <main>
        <h1>Llistar compres d'un client</h1>
        <div class="container-compres">
            <div class="llistat-id-clients">
               
                <?php

                $query3 = "SELECT DISTINCT id_client FROM `ventes`";
                $result3 = mysqli_query($connect, $query3);
                
                ?>

                <table>
                    <tr>
                        <th>Id Clients amb compres fetes</th>
                    </tr>

                    <?php while($row3 = mysqli_fetch_array($result3)):;?>

                    <tr>
                        <td><?php echo $row3[0];?></td>
                    </tr>

                    <?php endwhile;?>

                </table>
            </div>

            <!-- formulari per triar la id del client -->

            <div class="formulari-id">
                <form action="#" method="post">

                    <div class="part">
                        <label>
                            ID Client<span class="req">*</span>
                        </label>
                        <input type="number" name="id" required id="id" step="any"  />
                    </div>
                    <input type="submit" value="Buscar Client" name="boto-summit" />
                </form>
            </div>
            <?php
 
            $id = $_POST['id'];
        
            $query = "SELECT ventes.id, ulleres.id, ulleres.marca, ventes_detall.cantitat, ventes.id_client
            FROM ventes
            LEFT JOIN ventes_detall 
            ON ventes_detall.id_ventes = ventes.id
            LEFT JOIN ulleres
            ON ventes_detall.id_ulleres = ulleres.id
            WHERE ventes.id_client = '$id'
            ORDER BY ventes.id";
            $result1 = mysqli_query($connect, $query);
            
            ?>

            <table>

                <tr>
                    <th>Id</th>
                    <th>Id ulleres</th>
                    <th>ulleres</th>
                    <th>cantitat</th>
                    <th>Client Id</th>
                </tr>

                <?php while($row1 = mysqli_fetch_array($result1)):;?>

                <tr>
                    <td><?php echo $row1[0];?></td>
                    <td><?php echo $row1[1];?></td>
                    <td><?php echo $row1[2];?></td>
                    <td><?php echo $row1[3];?></td>
                    <td><?php echo $row1[4];?></td>
                </tr>

                <?php endwhile;?>

            </table>

            <br><br>
        </div>
        

    </main>

    <?php require_once 'footer.php';?>

</body>

</html>