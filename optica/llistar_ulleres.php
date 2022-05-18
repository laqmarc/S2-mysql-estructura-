<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OPTICA LLISTAR ULLERES</title>
    <link rel="stylesheet" href="css/style.css">
</head>

<body>


<?php require_once 'header.php';?>
<?php require_once 'conection.php';?>
<main>
<h1>Llistar ulleres</h1>
<?php

$query = "SELECT * FROM `ulleres`";
$result1 = mysqli_query($connect, $query);

?>

<table>

<tr>
    <th>Id</th>
    <th>Marca</th>
    <th>Graduacio vidre esquerre</th>
    <th>Graducaió vidre dret</th>
    <th>Muntura</th>
    <th>Muntura color</th>
    <th>Vidre esquerre color</th>
    <th>Vidre dret color</th>
    <th>Preu</th>
    <th>Id proveidor</th>

</tr>

<?php while($row1 = mysqli_fetch_array($result1)):;?>
<tr>
    <td><?php echo $row1[0];?></td>
    <td><?php echo $row1[1];?></td>
    <td><?php echo $row1[2];?></td>
    <td><?php echo $row1[3];?></td>
    <td><?php echo $row1[4];?></td>
    <td><?php echo $row1[5];?></td>
    <td><?php echo $row1[6];?></td>
    <td><?php echo $row1[7];?></td>
    <td><?php echo $row1[8];?></td>
    <td><?php echo $row1[9];?></td>
</tr>

<?php endwhile;?>

</table>

<br><br>
</main>
    
    <?php require_once 'footer.php';?>

</body>
</html>