import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:laboratorio/Home/Usuario/Administrador/Accion/Agregar_usuario.dart';
import 'package:laboratorio/Home/Usuario/Administrador/Accion/Detalle_Usuario.dart';

// Inicio de Lista de laboratorio state
class listLab extends StatefulWidget {
  @override
  _listLabState createState() => _listLabState();
}

class _listLabState extends State<listLab> {
  //Obtener usuario desde el servidor
  Future<List> obtenerUsuarios() async {
    //peticion al servidor
    final response = await http.get(
        "https://pagina-web-optimizacion.000webhostapp.com/API/api/view.php");
    return json.decode(response.body);
  } //fin de la solicitud

  @override
  Widget build(BuildContext context) {
    // Inicio de scaffold
    return Scaffold(
      //inicio barra
      appBar: AppBar(
        title: Text("Lista de laboratorios"),
        actions: <Widget>[
          //Icono inicio
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                //_Serachbar();
                // showSearch(context: context, delegate: null);
              }) //Icono Fin
        ],
      ), //fin barra
      //inicio butto Flotante
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
                //accion para agregar
                builder: (BuildContext context) => AgregarUsuario()),
          );
        },
      ), //fin Boton flotante

      //contenido App
      body: new FutureBuilder<List>(
        future: obtenerUsuarios(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new ElementoLista(
                  lista: snapshot.data,
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    ); //fin de scaffold
  }
} // fin de state full

// Clase para elemento de lista.

class ElementoLista extends StatelessWidget {
  final List lista;

  ElementoLista({this.lista});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: lista == null ? 0 : lista.length,
      itemBuilder: (context, posicion) {
        return new Container(
          padding: EdgeInsets.all(4.0),
          child: new GestureDetector(
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new DetalleLaboratorio(
                  index: posicion,
                  lista: lista,
                ),
              ));
            },
            child: new Card(
              color: Colors.blueGrey,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: new Column(
                children: <Widget>[
                  ListTile(
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 25, 0),
                    title: Text(
                      lista[posicion]['idlaboratorio'] +
                          '.- ' +
                          lista[posicion]['Nombre'],
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    subtitle: Text(lista[posicion]['descripcion']),
                    leading: Icon(Icons.home, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

//fin de la clase lista

//Busqueda....
_Serachbar() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextField(
      decoration: InputDecoration(
        hintText: 'search.....',
      ),
    ),
  );
}
