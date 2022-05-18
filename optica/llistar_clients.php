<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OPTICA AFEGIR PROVEIDOR</title>
    <link rel="stylesheet" href="css/style.css">
</head>

<body>




<?php require_once 'header.php';?>
<?php require_once 'conection.php';?>

<main>
<h1>Llistar clients</h1>
<?php

$query = "SELECT * FROM `clients`";
$result1 = mysqli_query($connect, $query);

?>
<table>

<tr>
    <th>Id</th>
    <th>Nom</th>
    <th>Adreça</th>
    <th>telefon</th>
    <th>email</th>
    <th>data registre</th>
</tr>

<?php while($row1 = mysqli_fetch_array($result1)):;?>
<tr>
    <td><?php echo $row1[0];?></td>
    <td><?php echo $row1[1];?></td>
    <td><?php echo $row1[2];?></td>
    <td><?php echo $row1[3];?></td>
    <td><?php echo $row1[4];?></td>
    <td><?php echo $row1[5];?></td>
</tr>

<?php endwhile;?>

</table>

<br><br>
</main>
    
    <?php require_once 'footer.php';?>

</body>
</html>