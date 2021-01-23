import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:laboratorio/Home/Usuario/Administrador/Accion/Editar_Usuario.dart';

// meter en aler dialogo para confima edicion o elimacion

// Inicio de state full

class DetalleLaboratorio extends StatefulWidget {
  //declaracion de usuario
  int index;
  List lista;
  // Fin de usuario

  DetalleLaboratorio({this.index, this.lista});

  @override
  _DetalleLaboratorioState createState() => _DetalleLaboratorioState();
}

class _DetalleLaboratorioState extends State<DetalleLaboratorio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalle Laboratorio"),
      ),
      body: new Container(
        padding: EdgeInsets.all(50.0),
        child: new Center(
          //verficar para alinear bonito
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              // Inicio texto
              /*new Text(
                "Id: " + widget.lista[widget.index]['idlaboratorio'],
                style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),*/
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
              ),
              new Text(
                "" + widget.lista[widget.index]['Nombre'],
                style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              new Text(
                "Descripcion: " + widget.lista[widget.index]['descripcion'],
                style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              new Text(
                "Codigo: " + widget.lista[widget.index]['codigo'],
                style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              new Text(
                "Edificio: " + widget.lista[widget.index]['edificio'],
                style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              new Text(
                "Numero de Aula: " + widget.lista[widget.index]['numero_aula'],
                style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              new Text(
                "Foto: " + widget.lista[widget.index]['foto'],
                style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              new Text(
                "Carrera: " + widget.lista[widget.index]['carrera_idcarrera'],
                style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              new Text(
                "Hora: " + widget.lista[widget.index]['Hora_idHora'],
                style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new RaisedButton(
                    child: Text("EDITAR"),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(
                        new MaterialPageRoute(
                          builder: (BuildContext context) => new EditarUsuario(
                            lista: widget.lista,
                            index: widget.index,
                          ),
                        ),
                      );
                    },
                  ),
                  VerticalDivider(),
                  new RaisedButton(
                    child: Text("BORRAR"),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    onPressed: () {
                      var url =
                          "https://pagina-web-optimizacion.000webhostapp.com/API/api/delenteData.php";
                      http.post(url, body: {
                        "idlaboratorio": widget.lista[widget.index]
                            ['idlaboratorio']
                      });

                      Navigator.of(context).pop();
                    },
                  ),
                ],
              )
              // fin del text
            ],
          ),
        ),
      ),
    );
  }
}

// fin de state full
