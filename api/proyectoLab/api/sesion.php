<?php

    include 'conexion.php';

    $json = file_get_contents('php://input');
 
    // Decoding the received JSON and store into $obj variable.
    $obj = json_decode($json,true);
    
    // Getting User email from JSON $obj array and store into $email.
    $email = $obj['email'];
    
    // Getting Password from JSON $obj array and store into $password.
    $password = $obj['password'];
    

    $sql =$MySQLiconn->query("SELECT * FROM usuario WHERE username=' $username' and password='.$password.'");
    
    if(isset($sql)){
		
        // Successfully Login Message.
        $onLoginSuccess = 'Login Matched';
        
        // Converting the message into JSON format.
        $SuccessMSG = json_encode($onLoginSuccess);
        
        // Echo the message.
        echo $SuccessMSG ; 
    
    }
    
    else{
    
        // If Email and Password did not Matched.
       $InvalidMSG = 'Invalid Username or Password Please Try Again' ;
        
       // Converting the message into JSON format.
       $InvalidMSGJSon = json_encode($InvalidMSG);
        
       // Echo the message.
        echo $InvalidMSGJSon ;
    
    }

mysqli_close($sql);
    
?>
 
