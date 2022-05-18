

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

<main>
<h1>Llistar proveidors</h1>

<?php


$hostname = "localhost";
$username = "root";
$password = "";
$databaseName = "optica";

// connect to mysql
$connect = mysqli_connect($hostname, $username, $password, $databaseName);

// mysql select query

$query = "SELECT * FROM `proveidors`";


// result for method one
$result1 = mysqli_query($connect, $query);


$_POST = [];
?>

<!-- Table One -->
<table>

<tr>
    <th>Id</th>
    <th>Nom</th>
    <th>Carrer</th>
    <th>Numero</th>
    <th>Pis</th>
    <th>Porta</th>
    <th>Ciutat</th>
    <th>Codipostal</th>
    <th>Pais</th>
    <th>Telefon</th>
    <th>fax</th>
    <th>Nif</th>
    
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
    <td><?php echo $row1[10];?></td>
    <td><?php echo $row1[11];?></td>
</tr>
<?php endwhile;?>

</table>

<br><br>
</main>
<?php require_once 'footer.php';?>
</body>
</html>