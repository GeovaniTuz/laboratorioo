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
                showSearch(context: context, delegate: null);
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
      itemCount: lista == null ? 0 : lista.length,
      itemBuilder: (context, posicion) {
        return new Container(
          padding: EdgeInsets.all(2.0),
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
              child: new Container(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  lista[posicion]['idlaboratorio'] +
                      ".- " +
                      lista[posicion]['Nombre'],
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

//fin de la clase lista
