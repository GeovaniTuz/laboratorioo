<?php

    include 'conexion.php';

    $username = $_POST['username'];
    $password = $_POST['password'];

    $MySQLicon=$MySQLiconn->query("SELECT * FROM usuario WHERE username='".$username."' and password='".$password."'");

    $resultado=array();

    while($extraerDatos=$MySQLicon->fetch_assoc()){
        $resultado[]=$extraerDatos;
    }
    //header("Location:index.php");
    echo json_encode($resultado);

    ?>