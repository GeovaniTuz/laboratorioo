<?php
include_once 'conexion.php';
/* Codigo para Insertar Datos */
if(isset($_POST['guardar']))
{
		
	 echo "Guardandoooooooooooooooooooo";
     $NombreLab = $MySQLiconn->real_escape_string($_POST['NomLab']);
     $DescripcioLab = $MySQLiconn->real_escape_string($_POST['DesLab']);
     $CodigoLab = $MySQLiconn->real_escape_string($_POST['CodLab']);
     $EdificioLab = $MySQLiconn->real_escape_string($_POST['EdiLab']);
     $NumeroAula = $MySQLiconn->real_escape_string($_POST['NoLab']);
     $FotoLab = $MySQLiconn->real_escape_string($_POST['FotLab']);
     $Carrera = $MySQLiconn->real_escape_string($_POST['CarLab']);
     $HoraLab = $MySQLiconn->real_escape_string($_POST['HorLab']);


  $SQL = $MySQLiconn->query("INSERT INTO laboratorio (Nombre, descripcion, codigo, edificio, numero_aula,foto,carrera_idcarrera, Hora_idHora) VALUES('$NombreLab','$DescripcioLab','$CodigoLab','$EdificioLab','$NumeroAula','$FotoLab','$Carrera','$HoraLab')");
  
  if(!$SQL)
  {
   echo $MySQLiconn->error;
  } 
  header("Location:index.php");
}

/* Codigo para eliminar Datos */
if(isset($_GET['eliminar']))
{
 $SQL = $MySQLiconn->query("DELETE FROM laboratorio WHERE idlaboratorio=".$_GET['eliminar']);
 header("Location:index.php");
}


/* Codigo para Editar Datos */
if(isset($_GET['editar']))
{

 $SQL = $MySQLiconn->query("SELECT * FROM laboratorio WHERE idlaboratorio=".$_GET['editar']);
 $getROW = $SQL->fetch_array();
}

/* Codigo para Actualizar Datos */
if(isset($_POST['actualizar']))
{
 $SQL = $MySQLiconn->query("UPDATE laboratorio SET Nombre='".$_POST['NomLab']."',descripcion='".$_POST['DesLab']."', codigo='".$_POST['CodLab']."', edificio='".$_POST['EdiLab']."', numero_aula='".$_POST['NoLab']."', foto='".$_POST['FotLab']."', carrera_idcarrera='".$_POST['CarLab']."', Hora_idHora='".$_POST['HorLab']."' WHERE idlaboratorio".$_GET['editar']);
 header("Location:index.php");
}


?>