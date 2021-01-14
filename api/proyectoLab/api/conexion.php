<?php
    define('_HOST_NAME','localhost');
    define('_DATABASE_USER_NAME','id13582161_sergio');
    define('_DATABASE_PASSWORD','HK1biDB&xxU%|33%');
    define('_DATABASE_NAME','id13582161_laboratorio');
      
    $MySQLiconn = new MySQLi(_HOST_NAME,_DATABASE_USER_NAME,_DATABASE_PASSWORD,_DATABASE_NAME);
  
    if($MySQLiconn->connect_errno)
    {
        die("ERROR : -> ".$MySQLiconn->connect_error);
    }
 ?>