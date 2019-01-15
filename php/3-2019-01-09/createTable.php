<?php
$serverName = "localhost";
$userName = "root";
$password = "";
$dbname = "createdb";

$conn = mysqli_connect( $serverName,$userName,$password,$dbname);
if (!$conn){
    die("connection failed: " . mysqli_connect_error());
}
$sql = "create table roles (
    id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50) UNIQUE
);";
if (mysqli_query($conn, $sql)) {
    echo "Table MyGuests created successfully";
} else {
    echo "Error creating table: " . mysqli_error($conn);
}
mysqli_close($conn);

