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
  //declaracion de uso editi
  TextEditingController controllerNombre;
  TextEditingController controllerDescripcion;
  TextEditingController controllerCodigo;
  TextEditingController controllerEdificio;
  TextEditingController controllerNumeroAula;
  TextEditingController controllerFoto;
  TextEditingController controllerCarreraId;
  TextEditingController controllerHoraId;
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
      body: new Container(
        padding: EdgeInsets.all(10.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text("ID: " + widget.lista[widget.index]['idlaboratorio']),
              //--------------------------------
              new TextField(
                controller: controllerNombre,
                decoration: new InputDecoration(labelText: "Nombre"),
              ),
              //--------------------------------
              new TextField(
                controller: controllerDescripcion,
                decoration: new InputDecoration(labelText: "Descripcion"),
              ),
              //--------------------------------
              new TextField(
                controller: controllerCodigo,
                decoration: new InputDecoration(labelText: "Codigo"),
              ),
              //--------------------------------
              new TextField(
                controller: controllerEdificio,
                decoration: new InputDecoration(labelText: "Edificio"),
              ),
              //--------------------------------
              new TextField(
                controller: controllerNumeroAula,
                decoration: new InputDecoration(labelText: "Num. Aula"),
              ),
              //--------------------------------
              new TextField(
                controller: controllerFoto,
                decoration: new InputDecoration(labelText: "Foto"),
              ),
              //--------------------------------
              new TextField(
                controller: controllerCarreraId,
                decoration: new InputDecoration(labelText: "Carrera"),
              ),
              //--------------------------------
              new TextField(
                controller: controllerHoraId,
                decoration: new InputDecoration(labelText: "Hora"),
              ),
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
          ),
        ),
      ),
    );
    // fin de scaf
  }

  void editar() {
    var url =
        "https://pagina-web-optimizacion.000webhostapp.com/API/api/editdata.php";
    http.post(url, body: {
      "idlaboratorio": widget.lista[widget.index]['idlaboratorio'],
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
