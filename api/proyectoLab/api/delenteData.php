<?php
	include 'conexion.php';
	
	$id=$_POST['idlaboratorio'];

	$MySQLiconn->query("DELETE FROM laboratorio WHERE idlaboratorio=".$id);

?>