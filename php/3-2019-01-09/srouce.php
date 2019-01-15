<?php
function connectDB($serverName = "localhost", $userName = "root", $password = "", $database = "createdb")
{
    $conn = mysqli_connect($serverName, $userName, $password, $database);
    if (!$conn) {
      die("Connection failed : " . $mysqli_connect_error());
    }
    return $conn;
  }