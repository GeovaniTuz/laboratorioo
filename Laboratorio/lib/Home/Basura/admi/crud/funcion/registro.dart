import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => new _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController controllerid = new TextEditingController();
  TextEditingController controllerNombre = new TextEditingController();
  TextEditingController controllerDescripcion = new TextEditingController();
  TextEditingController controllerCodigo = new TextEditingController();
  TextEditingController controllerEdificio = new TextEditingController();
  TextEditingController controllerNumeroAula = new TextEditingController();
  TextEditingController controllerFoto = new TextEditingController();
  TextEditingController controllerCarreraId = new TextEditingController();
  TextEditingController controllerHoraId = new TextEditingController();

  var _formKey = GlobalKey<FormState>();

  void addData() {
    var url =
        "https://pagina-web-optimizacion.000webhostapp.com/API/api/add.php";

    http.post(url, body: {
      "idlaboratorio": controllerid.text,
      "Nombre": controllerNombre.text,
      "descripcion": controllerDescripcion.text,
      "codigo": controllerCodigo.text,
      "edificio": controllerEdificio.text,
      "numero_aula": controllerNumeroAula.text,
      "foto": controllerFoto.text,
      "carrera_idcarrera": controllerCarreraId.text,
      "Hora_idHora": controllerHoraId,
      //"Hora_idHora": _mySelection.toString(),

      //aqui traemos el DropdownMenuItem lo llamamos _mySelection este es como el controller
    });
  }

// hay que implemetar para el caso de hora y carrerra
  /* String _mySelection;
  List<Map> _myJson = [
    {"Hora_idHora": 0, "name": "8:00"},
    {"Hora_idHora": 1, "name": "14:00"}
  ];*/

  //fin de la map

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Nuevo Laboratorio"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              new Column(
                children: <Widget>[
                  new ListTile(
                    leading:
                        const Icon(Icons.reduce_capacity, color: Colors.black),
                    title: new TextFormField(
                      controller: controllerNombre,
                      validator: (value) {
                        if (value.isEmpty) return "Ingresa los datos";
                      },
                      decoration: new InputDecoration(
                        hintText: "Ejem. Cisco",
                        labelText: "Laboratorio",
                      ),
                    ),
                  ),
                  new ListTile(
                    leading: const Icon(Icons.description, color: Colors.black),
                    title: new TextFormField(
                      controller: controllerDescripcion,
                      validator: (value) {
                        if (value.isEmpty)
                          return "Ingresa un nombre de descripcion";
                      },
                      decoration: new InputDecoration(
                        hintText: "Ejem. Lugar para materiales...",
                        labelText: "Descripcion",
                      ),
                    ),
                  ),
                  new ListTile(
                    leading: const Icon(Icons.confirmation_number,
                        color: Colors.black),
                    title: new TextFormField(
                      controller: controllerCodigo,
                      validator: (value) {
                        if (value.isEmpty) return "Ingresa Codigo";
                      },
                      decoration: new InputDecoration(
                        hintText: "Ejem. 122345",
                        labelText: "Codigo",
                      ),
                    ),
                  ),
                  new ListTile(
                    leading:
                        const Icon(Icons.location_city, color: Colors.black),
                    title: new TextFormField(
                      controller: controllerEdificio,
                      validator: (value) {
                        if (value.isEmpty) return "Ingresa Edificio";
                      },
                      decoration: new InputDecoration(
                        hintText: "Ejem. B",
                        labelText: "Edificio",
                      ),
                    ),
                  ),
                  new ListTile(
                    leading:
                        const Icon(Icons.confirmation_num, color: Colors.black),
                    title: new TextFormField(
                      controller: controllerNumeroAula,
                      validator: (value) {
                        if (value.isEmpty) return "Numero Aula";
                      },
                      decoration: new InputDecoration(
                        hintText: "Ejem. 2",
                        labelText: "No. Aula ",
                      ),
                    ),
                  ),
                  new ListTile(
                    leading: const Icon(Icons.photo, color: Colors.black),
                    title: new TextFormField(
                      controller: controllerFoto,
                      validator: (value) {
                        if (value.isEmpty) return "Agregar foto";
                      },
                      decoration: new InputDecoration(
                        hintText: "Ejem. imagen.png",
                        labelText: "Foto",
                      ),
                    ),
                  ),
                  new ListTile(
                    leading: const Icon(Icons.settings, color: Colors.black),
                    title: new TextFormField(
                      controller: controllerCarreraId,
                      validator: (value) {
                        if (value.isEmpty) return "Carerra";
                      },
                      decoration: new InputDecoration(
                        hintText: "Ejem. 6",
                        labelText: "Carrera",
                      ),
                    ),
                  ),
                  new ListTile(
                    leading: const Icon(Icons.timelapse, color: Colors.black),
                    title: new TextFormField(
                      controller: controllerHoraId,
                      validator: (value) {
                        if (value.isEmpty) return "Hora";
                      },
                      decoration: new InputDecoration(
                        hintText: "Ejem. 1",
                        labelText: "Hora",
                      ),
                    ),
                  ),
                  /*Row(
                    children: <Widget>[
                      new Container(
                        margin: EdgeInsets.only(left: 20.0),
                        child: Icon(Icons.list),
                      ),
                      VerticalDivider(
                        width: 40.0,
                      ),
                      new Container(
                        //margin: EdgeInsets.only(right: 80.0),
                        height: 50.0,
                        width: 100.0,
                        child: new DropdownButton<String>(
                          isDense: true,
                          hint: new Text("Nivel"),
                          iconSize: 40.0,
                          elevation: 10,
                          value: _mySelection,
                          onChanged: (String newValue) {
                            setState(() {
                              _mySelection = newValue;
                            });
                            print(_mySelection);
                          },
                          items: _myJson.map((Map map) {
                            return new DropdownMenuItem<String>(
                              //value: map["id"].toString(),
                              value: map["name"].toString(),
                              child: new Text(
                                map["name"],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),*/
                  new Padding(
                    padding: const EdgeInsets.all(30.0),
                  ),
                  new RaisedButton(
                    child: new Text("Agregar"),
                    color: Colors.blueAccent,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        addData();
                        Navigator.pop(context);
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
