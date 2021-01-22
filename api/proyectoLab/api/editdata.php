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
    
    


    $SQL = "UPDATE laboratorio SET Nombre='$NombreLab', descripcion='$DescripcioLab', codigo='$CodigoLab', edificio='$EdificioLab', numero_aula='$NumeroAula', foto='$FotoLab', carrera_idcarrera='$Carrera', Hora_idHora='$HoraLab' WHERE idlaboratorio = '$id'";
    $query = $MySQLiconn->query($SQL);
    
    //$MySQLiconn->query("UPDATE laboratorio SET Nombre='".$NomLab."',descripcion='".$DesLab."', codigo='".$CodLab."', edificio='".$EdiLab."', numero_aula='".$NoLab."', foto='".$FotLab."', carrera_idcarrera='".$CarLab."', Hora_idHora='".$HorLab."' WHERE idlaboratorio=". $id);
    //$sql = "UPDATE usuarios SET nombre='$nombre', telefono='$telefono', email='$email' WHERE idUsuario='$idUsuario'";


?>

