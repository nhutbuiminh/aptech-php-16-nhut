<?php
$serverName = "localhost";
$userName = "root";
$password = "";
$dbname = "createDB";

$conn = mysqli_connect( $serverName,$userName,$password,$dbname);
if (!$conn){
    die("connection failed: " . mysqli_connect_error());
}
$sql = "create table nv (
id int(5)  ,
)"