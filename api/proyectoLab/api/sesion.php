<?php

    include 'conexion.php';

    $username = $_POST['username'];
    $password = $_POST['password'];

    $MySQLiconn=$connect->query("SELECT * FROM usuario WHERE username='".$username."' and password='".$password."'");

    $resultado=array();

    while($extraerDatos=$MySQLiconn->fetch_assoc()){
        $resultado[]=$extraerDatos;
    }
    header("Location:index.php");
    //echo json_encode($resultado);

    ?>