import 'package:flutter/material.dart';

import 'funcion/Itemlist.dart';

//package para base datos <- implementar
//import 'package:http/http.dart';

class lista extends StatefulWidget {
  @override
  _listaState createState() => _listaState();
}

class _listaState extends State<lista> {
  // no implemtado
  //Future<List> getData() async{
  //  final response = await http.get("url")
  //}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lista de laboratorio"), actions: <Widget>[
        IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context);
            })
      ]),
      body: FutureBuilder<List>(
        //future: getData(),
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
    );
  }
}
