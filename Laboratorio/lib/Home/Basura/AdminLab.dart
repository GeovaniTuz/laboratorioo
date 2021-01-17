import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:laboratorio/Home/Basura/admi/crud/funcion/detail.dart';
import 'package:laboratorio/Home/Usuario/Administrador/Accion/Agregar_usuario.dart';

import 'dart:convert';

import 'dart:async';

class lista extends StatefulWidget {
  @override
  _listaState createState() => _listaState();
}

class _listaState extends State<lista> {
//Obtener usuario desde el servidor
  Future<List> getData() async {
    //peticion al servidor
    final response = await http.get(
        "https://pagina-web-optimizacion.000webhostapp.com/API/api/view.php");
    return json.decode(response.body);
  }
//fin de la solicitud

  @override
  Widget build(BuildContext context) {
    //Inicio scaffold
    return Scaffold(
      //Nombrar Barra
      appBar: AppBar(title: Text("Lista de laboratorio"), actions: <Widget>[
        IconButton(
            //Buscador inicio
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: null);
            }) //Buscador Fin
      ]), //fin Barra
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (BuildContext context) => AgregarUsuario()),
          );
        },
      ),
      body: FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new ItemList(
                  list: snapshot.data,
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    ); //Fin del scaffold
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: new GestureDetector(
            onTap: () => Navigator.of(context).push(
              new MaterialPageRoute(
                  builder: (BuildContext context) => Detail(
                        list: list,
                        index: i,
                      )),
            ),
            child: new Card(
              child: new ListTile(
                title: new Text(
                  list[i]['Nombre'],
                  style: TextStyle(fontSize: 25.0, color: Colors.blue),
                ),
                leading: new Icon(
                  Icons.lightbulb_outline,
                  size: 75.0,
                  color: Colors.blueGrey,
                ),
                subtitle: new Text(
                  "Edificio: ${list[i]['edificio']} ${list[i]['numero_aula']}",
                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
