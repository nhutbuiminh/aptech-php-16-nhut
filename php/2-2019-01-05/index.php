
<?php
$products = [
    'iphone X' =>
    ['price' => 18000000,
    'color' => 'red'], 
    'ipad' =>
    ['price' => 8000000,
    'color' => 'blue'],
];
 foreach($products as $keys => $values){
     echo $keys;
    foreach($values as $a){
        echo $a;
     }
     echo "<br>";
 }
 
 
 
 

