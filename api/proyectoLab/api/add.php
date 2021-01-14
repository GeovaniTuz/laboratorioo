<?php

    include 'conexion.php';
    
    $id = $_POST['idlaboratorio'];
    $NombreLab = $_POST['Nombre'];
    $DescripcioLab = $_POST['descripcion'];
    $CodigoLab = $_POST['codigo'];
    $EdificioLab = $_POST['edificio'];
    $NumeroAula = $_POST['numero_aula'];
    $FotoLab = $_POST['foto'];
    $Carrera = $_POST['carrera_idcarrera'];
    $HoraLab = $_POST['Hora_idHora'];
	

	
	
	$MySQLiconn->query("INSERT INTO laboratorio (idlaboratorio, Nombre, descripcion, codigo, edificio, numero_aula, foto, carrera_idcarrera, Hora_idHora) VALUES ('".$id."','".$NomLab."','".$DesLab."','".$CodLab."', '".$EdiLab."', '".$NoLab."', '".$FotLab."', '".$CarLab."', '".$HorLab."')")

?>