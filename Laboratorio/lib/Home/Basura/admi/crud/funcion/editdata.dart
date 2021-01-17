import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:laboratorio/Home/Basura/AdminLab.dart';

class EditData extends StatefulWidget {
  final List list;
  final int index;

  EditData({this.list, this.index});

  @override
  _EditDataState createState() => new _EditDataState();
}

class _EditDataState extends State<EditData> {
  //crear instacia de dato
  TextEditingController controllerNombre;
  TextEditingController controllerDescripcion;
  TextEditingController controllerCodigo;
  TextEditingController controllerEdificio;
  TextEditingController controllerNumeroAula;
  TextEditingController controllerFoto;
  TextEditingController controllerCarreraId;
  TextEditingController controllerHoraId;

  void editData() {
    //url donde se llama los archivos
    var url =
        "https://pagina-web-optimizacion.000webhostapp.com/API/api/editdata.php";

    http.post(url, body: {
      // se pide los datos de la tabla y se pasa el cotroller
      "idlaboratorio": widget.list[widget.index]['id'],
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

  @override
  void initState() {
    controllerNombre =
        new TextEditingController(text: widget.list[widget.index]['Nombre']);
    controllerDescripcion = new TextEditingController(
        text: widget.list[widget.index]['descripcion']);
    controllerCodigo =
        new TextEditingController(text: widget.list[widget.index]['codigo']);
    controllerEdificio =
        new TextEditingController(text: widget.list[widget.index]['edificio']);
    controllerNumeroAula = new TextEditingController(
        text: widget.list[widget.index]['numero_aula']);
    controllerFoto =
        new TextEditingController(text: widget.list[widget.index]['foto']);
    controllerCarreraId = new TextEditingController(
        text: widget.list[widget.index]['carrera_idcarrera']);
    controllerHoraId = new TextEditingController(
        text: widget.list[widget.index]['Hora_idHora']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("EDITAR"),
      ),
      body: Form(
        child: ListView(
          padding: const EdgeInsets.all(10.0),
          children: <Widget>[
            new Column(
              children: <Widget>[
                new ListTile(
                  leading: const Icon(Icons.person, color: Colors.black),
                  title: new TextFormField(
                    controller: controllerNombre,
                    validator: (value) {
                      if (value.isEmpty)
                        return "Ingresa un nombre de laboratorio";
                    },
                    decoration: new InputDecoration(
                      hintText: "Laboratorio",
                      labelText: "Laboratorio",
                    ),
                  ),
                ),
                new ListTile(
                  leading: const Icon(Icons.person, color: Colors.black),
                  title: new TextFormField(
                    controller: controllerDescripcion,
                    validator: (value) {
                      if (value.isEmpty)
                        return "Ingresa un nombre de descripcion";
                    },
                    decoration: new InputDecoration(
                      hintText: "Descripcion",
                      labelText: "Descripcion",
                    ),
                  ),
                ),
                new ListTile(
                  leading: const Icon(Icons.person, color: Colors.black),
                  title: new TextFormField(
                    controller: controllerCodigo,
                    validator: (value) {
                      if (value.isEmpty) return "Ingresa Codigo";
                    },
                    decoration: new InputDecoration(
                      hintText: "Codigo",
                      labelText: "Codigo",
                    ),
                  ),
                ),
                new ListTile(
                  leading: const Icon(Icons.person, color: Colors.black),
                  title: new TextFormField(
                    controller: controllerEdificio,
                    validator: (value) {
                      if (value.isEmpty) return "Ingresa Edificio";
                    },
                    decoration: new InputDecoration(
                      hintText: "Edificio",
                      labelText: "Edificio",
                    ),
                  ),
                ),
                new ListTile(
                  leading: const Icon(Icons.person, color: Colors.black),
                  title: new TextFormField(
                    controller: controllerNumeroAula,
                    validator: (value) {
                      if (value.isEmpty) return "Numero Aula";
                    },
                    decoration: new InputDecoration(
                      hintText: "NO. Aula",
                      labelText: "No. Aula ",
                    ),
                  ),
                ),
                new ListTile(
                  leading: const Icon(Icons.person, color: Colors.black),
                  title: new TextFormField(
                    controller: controllerFoto,
                    validator: (value) {
                      if (value.isEmpty) return "Agregar foto";
                    },
                    decoration: new InputDecoration(
                      hintText: "Foto",
                      labelText: "Foto",
                    ),
                  ),
                ),
                new ListTile(
                  leading: const Icon(Icons.person, color: Colors.black),
                  title: new TextFormField(
                    controller: controllerCarreraId,
                    validator: (value) {
                      if (value.isEmpty) return "Carerra";
                    },
                    decoration: new InputDecoration(
                      hintText: "Carrera",
                      labelText: "Carrera",
                    ),
                  ),
                ),
                new ListTile(
                  leading: const Icon(Icons.location_on, color: Colors.black),
                  title: new TextFormField(
                    controller: controllerHoraId,
                    validator: (value) {
                      if (value.isEmpty) return "Hora";
                    },
                    decoration: new InputDecoration(
                      hintText: "Hora",
                      labelText: "Hora",
                    ),
                  ),
                ),
                const Divider(
                  height: 1.0,
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                new RaisedButton(
                  child: new Text("Guardar"),
                  color: Colors.blueAccent,
                  onPressed: () {
                    editData();
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new lista()));
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
