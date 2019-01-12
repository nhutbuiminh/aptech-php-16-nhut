<?php
$serverName = "localhost";
$userName = "root";
$password = "";

$conn = mysqli_connect($serverName,$userName,$password);
if(!$conn){
    die("connection failed" . mysqli_connect_error());
}
$sql = "create database createDB";
if(mysqli_query($conn,$sql)){
    echo "Database created successfully";
}