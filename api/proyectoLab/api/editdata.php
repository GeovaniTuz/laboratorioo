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
	

	$MySQLiconn->query("UPDATE laboratorio SET Nombre='".$NomLab."',descripcion='".$DesLab."', codigo='".$CodLab."', edificio='".$EdiLab."', numero_aula='".$NoLab."', foto='".$FotLab."', carrera_idcarrera='".$CarLab."', Hora_idHora='".$HorLab."' WHERE idlaboratorio=". $id);

?>