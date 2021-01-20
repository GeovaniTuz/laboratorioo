import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditarUsuario extends StatefulWidget {
  //Declaracion de datos
  final List lista;
  int index;
  //Fin de declaración.

  //Inicio This
  EditarUsuario({this.lista, this.index});
  //fin This.
  @override
  _EditarUsuarioState createState() => _EditarUsuarioState();
}

class _EditarUsuarioState extends State<EditarUsuario> {
  var _formKey = GlobalKey<FormState>();
  // Inicio de los datos
  TextEditingController controllerid = new TextEditingController();
  TextEditingController controllerNombre = new TextEditingController();
  TextEditingController controllerDescripcion = new TextEditingController();
  TextEditingController controllerCodigo = new TextEditingController();
  TextEditingController controllerEdificio = new TextEditingController();
  TextEditingController controllerNumeroAula = new TextEditingController();
  TextEditingController controllerFoto = new TextEditingController();
  TextEditingController controllerCarreraId = new TextEditingController();
  TextEditingController controllerHoraId = new TextEditingController();

  // fin editi
  @override
  Widget build(BuildContext context) {
    //Inicio de scaf
    return Scaffold(
        //inicio de Barra
        appBar: AppBar(
          title: Text("Editar Laboratorio"),
        ),
        //Fin de barra
        body: new Form(
            key: _formKey,
            child: Padding(
                padding: EdgeInsets.all(10.0),
                child: new ListView(
                  children: <Widget>[
                    new Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new TextField(
                          controller: controllerid,
                          decoration: new InputDecoration(labelText: "ID"),
                          keyboardType: TextInputType.number,
                        ),

                        /*new Text("ID: " +
                            widget.lista[widget.index]['idlaboratorio']),
                        //--------------------------------
                        */
                        new TextField(
                          controller: controllerNombre,
                          decoration: new InputDecoration(labelText: "Nombre"),
                          keyboardType: TextInputType.name,
                        ),
                        //--------------------------------
                        new TextField(
                          controller: controllerDescripcion,
                          decoration:
                              new InputDecoration(labelText: "Descripcion"),
                        ),
                        //--------------------------------
                        new TextField(
                            controller: controllerCodigo,
                            decoration:
                                new InputDecoration(labelText: "Codigo"),
                            keyboardType: TextInputType.number),
                        //--------------------------------
                        new TextField(
                          controller: controllerEdificio,
                          decoration:
                              new InputDecoration(labelText: "Edificio"),
                        ),
                        //--------------------------------
                        new TextField(
                            controller: controllerNumeroAula,
                            decoration:
                                new InputDecoration(labelText: "Num. Aula"),
                            keyboardType: TextInputType.number),
                        //--------------------------------
                        new TextField(
                          controller: controllerFoto,
                          decoration: new InputDecoration(labelText: "Foto"),
                        ),
                        //--------------------------------

                        new TextField(
                            controller: controllerCarreraId,
                            decoration:
                                new InputDecoration(labelText: "Carrera"),
                            keyboardType: TextInputType.number),
                        //--------------------------------
                        new TextField(
                            controller: controllerHoraId,
                            decoration: new InputDecoration(labelText: "Hora"),
                            keyboardType: TextInputType.number),
                        //--------------------------------

                        //--------------------------------

                        new RaisedButton(
                          child: Text("Guadar"),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          onPressed: () {
                            editar();
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    )
                  ],
                ))));
    // fin de scaf
  }

  void editar() {
    var url =
        "https://pagina-web-optimizacion.000webhostapp.com/API/api/editdata.php";
    http.post(url, body: {
      "idlaboratorio": controllerid.text,
      "Nombre": controllerNombre.text,
      "descripcion": controllerDescripcion.text,
      "codigo": controllerCodigo.text,
      "edificio": controllerEdificio.text,
      "numero_aula": controllerNumeroAula.text,
      "foto": controllerFoto.text,
      "carrera_idcarrera": controllerCarreraId.text,
      "Hora_idHora": controllerHoraId.text
    });
  }

  void initState() {
    controllerid = new TextEditingController(
        text: widget.lista[widget.index]['idlaboratorio']);
    controllerNombre =
        new TextEditingController(text: widget.lista[widget.index]['Nombre']);
    controllerDescripcion = new TextEditingController(
        text: widget.lista[widget.index]['descripcion']);
    controllerCodigo =
        new TextEditingController(text: widget.lista[widget.index]['codigo']);
    controllerEdificio =
        new TextEditingController(text: widget.lista[widget.index]['edificio']);
    controllerNumeroAula = new TextEditingController(
        text: widget.lista[widget.index]['numero_aula']);
    controllerFoto =
        new TextEditingController(text: widget.lista[widget.index]['foto']);
    controllerCarreraId = new TextEditingController(
        text: widget.lista[widget.index]['carrera_idcarrera']);
    controllerHoraId = new TextEditingController(
        text: widget.lista[widget.index]['Hora_idHora']);
    super.initState();
  }
}
