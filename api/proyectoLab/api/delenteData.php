<?php
	include 'conexion.php';
	$id=$_POST['idlaboratorio'];
	$MySQLiconn->query("DELETE FROM laboratorio WHERE id=".$id);

?>