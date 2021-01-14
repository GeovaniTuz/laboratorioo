<?php
include 'conexion.php';

$queryResult=$MySQLiconn->query("SELECT * FROM laboratorio");

$result=array();

while($fetchData=$queryResult->fetch_assoc()){
	$result[]=$fetchData;
}

echo json_encode($result);

?>