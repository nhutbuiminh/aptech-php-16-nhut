<?php
$servername = "127.0.0.1";
$username = "root";
$password = "";

$conn = mysqli_connect($servername, $username, $password);

if (!$conn){
    die("connection failded: " . mysqli_connect_error());
}
echo "Connected successfully";
