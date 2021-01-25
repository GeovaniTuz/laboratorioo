import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:laboratorio/Home/Usuario/Administrador/Accion/subirImagen.dart';

// state full Agregar Usuario
class AgregarUsuario extends StatefulWidget {
  @override
  _AgregarUsuarioState createState() => _AgregarUsuarioState();
}

class _AgregarUsuarioState extends State<AgregarUsuario> {
  var _formKey = GlobalKey<FormState>();
  //declaracion de uso editi
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
    return Scaffold(
        appBar: AppBar(
          title: Text("Editar Laboratorio"),
        ),
        //Fin de barra
        //inicio butto Flotante
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.camera),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                  //accion para agregar
                  builder: (BuildContext context) => LandingScreen()),
            );
          },
        ),
        body: new Form(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: new ListView(children: <Widget>[
              new Column(
                children: <Widget>[
                  //children: <Widget>[
                  //--------------------------------
                  ListTile(
                    leading: const Icon(Icons.person, color: Colors.black),
                    title: new TextField(
                      controller: controllerNombre,
                      decoration: new InputDecoration(
                          border: OutlineInputBorder(), labelText: "Nombre"),
                    ),
                  ),
                  //--------------------------------
                  ListTile(
                    leading: const Icon(Icons.text_fields, color: Colors.black),
                    title: new TextField(
                      controller: controllerDescripcion,
                      decoration: new InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Descripcion"),
                    ),
                  ),
                  //--------------------------------
                  ListTile(
                    leading: const Icon(Icons.code, color: Colors.black),
                    title: new TextField(
                        controller: controllerCodigo,
                        decoration: new InputDecoration(
                            border: OutlineInputBorder(), labelText: "Codigo"),
                        keyboardType: TextInputType.number),
                  ),
                  //--------------------------------
                  ListTile(
                    leading: const Icon(Icons.home_work, color: Colors.black),
                    title: new TextField(
                      controller: controllerEdificio,
                      decoration: new InputDecoration(
                          border: OutlineInputBorder(), labelText: "Edificio"),
                    ),
                  ),
                  //--------------------------------
                  ListTile(
                    leading: const Icon(Icons.home, color: Colors.black),
                    title: new TextField(
                        controller: controllerNumeroAula,
                        decoration: new InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Num. Aula"),
                        keyboardType: TextInputType.number),
                  ),
                  //--------------------------------
                  ListTile(
                    leading: const Icon(Icons.photo, color: Colors.black),
                    title: new TextField(
                      controller: controllerFoto,
                      decoration: new InputDecoration(
                          border: OutlineInputBorder(), labelText: "Foto"),
                    ),
                  ),
                  //--------------------------------
                  ListTile(
                    leading: const Icon(Icons.settings, color: Colors.black),
                    title: new TextField(
                        controller: controllerCarreraId,
                        decoration: new InputDecoration(
                            border: OutlineInputBorder(), labelText: "Carrera"),
                        keyboardType: TextInputType.number),
                  ),
                  //--------------------------------
                  ListTile(
                    leading:
                        const Icon(Icons.access_alarm, color: Colors.black),
                    title: new TextField(
                        controller: controllerHoraId,
                        decoration: new InputDecoration(
                            border: OutlineInputBorder(), labelText: "Hora"),
                        keyboardType: TextInputType.number),
                  ),
                  //--------------------------------

                  //--------------------------------

                  new RaisedButton(
                    child: Text("Guadar"),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    onPressed: () {
                      agregarUsuario();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ]),
          ),
        ));
  }

  void agregarUsuario() {
    var url =
        "https://pagina-web-optimizacion.000webhostapp.com/API/api/add.php";
    http.post(url, body: {
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
} // fin de State Full
