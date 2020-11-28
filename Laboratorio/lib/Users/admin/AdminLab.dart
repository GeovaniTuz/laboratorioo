import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'crud/funcion/Itemlist.dart';

class lista extends StatefulWidget {
  @override
  _listaState createState() => _listaState();
}

class _listaState extends State<lista> {
  // no implemtado
  Future<List> getData() async {
    final response = await http.get("http://192.168.43.170/PreubaLab/db/");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lista de laboratorio"), actions: <Widget>[
        IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: null);
            })
      ]),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {}
                  //builder: (BuildContext context) => new addData(),
                  ));
        },
      ),
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
