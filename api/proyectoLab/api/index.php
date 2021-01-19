<?php

include_once 'Nuevo.php';

 ?>



<!DOCTYPE html>

<html lang="en">



<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel=" stylesheet " href=" https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css ">

    <title>Preuba Administrador</title>

</head>



<body>

    <div>

        <h1>NUEVO Laboratorio</h1>

        <hr>

    </div>

    <hr>

    <div>

        <h6>CREAR NUEVO</h6>

        <div class="container-fluid">

            <div>

                <h2 class="text-center">Nuevo producto</h2>

            </div>





            <form method="post">

                <div class="form-group">

                    <label class="control-label">Nombre:</label>

                    <input type="text" class="form-control text-uppercase" name="NomLab"

                        placeholder="Nombre"

                        value="<?php if (isset($_GET['editar'])) echo $getROW['Nombre'];  ?>" />



                </div>



                <div class="form-group">

                    <label class="control-label">Descripcion:</label>

                    <div class="control-label">

                        <input type="text" class="form-control text-uppercase" name="DesLab" placeholder="Descripcion"

                            value="<?php

                                                                                                              if (isset($_GET['editar']))

                                                                                                                echo $getROW['descripcion'];

                                                                                                              ?>" />

                    </div>

                </div>



                <div class="form-group">

                    <label class="control-label">Codigo:</label>



                    <input type="number"  class="form-control text-uppercase" name="CodLab"

                        placeholder="12133123"

                        value="<?php if (isset($_GET['editar'])) echo $getROW['codigo'];  ?>" />



                </div>



                <div class="form-group">

                    <label class="control-label">Edificio:</label>



                    <input type="text"  class="form-control text-uppercase" name="EdiLab"

                        placeholder="A"

                        value="<?php if (isset($_GET['editar'])) echo $getROW['edificio'];  ?>" />



                </div>

                <div class="form-group">

                    <label class="control-label">Numero de aula:</label>



                    <input type="number" class="form-control text-uppercase" name="NoLab"

                        placeholder="1"

                        value="<?php if (isset($_GET['editar'])) echo $getROW['numero_aula'];  ?>" />



                </div>

                <div class="form-group">

                    <label class="control-label">foto:</label>

                    <input type="text" class="form-control text-uppercase" name="FotLab"

                        placeholder="C/imagen/arch.png"

                        value="<?php if (isset($_GET['editar'])) echo $getROW['foto'];  ?>" />

                </div>

                <div class="form-group">

                    <label class="control-label">carrera:</label>



                    <input type="number" class="form-control text-uppercase" name="CarLab"

                        placeholder="ISC"

                        value="<?php if (isset($_GET['editar'])) echo $getROW['carrera_idcarrera'];  ?>" />



                </div>

                <div class="form-group">

                    <label class="control-label">Hora:</label>



                    <input type="number" class="form-control text-uppercase" name="HorLab" placeholder="10:00"

                        value="<?php if (isset($_GET['editar'])) echo $getROW['Hora_idHora'];  ?>" />



                </div>

                <div class="form-group">

                    <?php

        if (isset($_GET['editar'])) {

        ?>

                    <div class="col-12">

                        <button type="submit" class="btn btn-success" name="actualizar">Actualizar</button>

                    </div>

                    <?php

        } else {

        ?>

                    <div class="col-12">

                        <button type="submit" class="btn btn-success" name="guardar">Guardar</button>

                    </div>

                    <?php

        }

        ?>

                </div>

            </form>

        </div>

    </div>

    <hr>

    <hr>



    <div>

        <!--Table-->

        <div class="container-fluid">

            <table class="table table-hover table-bordered shadow p-3 mb-5 bg-white rounded">

                <tr>

                    <th>idlaboratorio</th>

                    <th>Nombre</th>

                    <th>descripcion</th>

                    <th>codigo</th>

                    <th>edificio</th>

                    <th>numero_aula</th>

                    <th>foto</th>

                    <th>carrera_idcarrera</th>

                    <th>Hora_idHora</th>

                    <th>acccion</th>



                </tr>



                <?php



   $res = $MySQLiconn->query("SELECT * FROM laboratorio");

   while($row=$res->fetch_array())

   {

    ?>

                <tr>

                    <td> <?php echo $row['idlaboratorio']; ?> </td>

                    <td> <?php echo $row['Nombre']; ?> </td>

                    <td> <?php echo $row['descripcion']; ?> </td>

                    <td> <?php echo $row['codigo']; ?></td>

                    <td> <?php echo $row['edificio']; ?> </td>

                    <td> <?php echo $row['numero_aula']; ?> </td>

                    <td> <?php echo $row['foto']; ?> </td>

                    <td> <?php echo $row['carrera_idcarrera']; ?> </td>

                    <td> <?php echo $row['Hora_idHora']; ?> </td>

                    <td><a href="?editar=<?php echo $row['idlaboratorio']; ?>"

                            onclick="return confirm('¿Deseas Editarlo ?'); ">

                            <span>Editar</span></a>



                        <a href="?eliminar=<?php echo $row['idlaboratorio']; ?>"

                            onclick="return confirm('¿Seguro deseas eliminarlo?'); ">

                            <span>trash</span>

                        </a>

                    </td>

                </tr>

                <?php

   }

   ?>

            </table>

        </div>



    </div>

    </div>

</body>



</html>