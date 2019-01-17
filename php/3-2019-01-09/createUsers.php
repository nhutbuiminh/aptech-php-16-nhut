<?php
require('./srouce.php');
$conn = connectDB();
$sql =  "create table users (
    id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50),
email VARCHAR(255) UNIQUE,
password VARCHAR(50),
role INT DEFAULT 1,
FOREIGN KEY (role) REFERENCES roles(id)
);";
if (mysqli_query($conn, $sql)) {
    echo "Table MyGuests created successfully";
} else {
    echo "Error creating table: " . mysqli_error($conn);
}
mysqli_close($conn);