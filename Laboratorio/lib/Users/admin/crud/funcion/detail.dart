import 'dart:ffi';

import 'package:flutter/material.dart';
import 'Itemlist.dart';

//package para base datos <- implementar
import 'package:http/http.dart' as http;

class Detail extends StatefulWidget {
  List list;
  int index;
  Detail({this.index, this.list});
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  Void delenteData() {
    var url = "http://192.168.43.86/Labortorio/api/delent.php";
    http.post(url,
        body: {'idlaboratorio': widget.list[widget.index]['idelaboratorio']});
  }

  void confirmar() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Text(
          "Seguro deseas eliminar '${widget.list[widget.index]['username']}'"),
      actions: <Widget>[
        RaisedButton(
          child: Text(
            "ok Eliminado",
            style: TextStyle(color: Colors.black),
          ),
          color: Colors.red,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => ItemList()));
          },
        )
      ],
    );
    showDialog(context: context, child: alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${widget.list[widget.list[widget.index]['username']]}"),
        ),
        body: Container(
          height: 270.0,
          padding: const EdgeInsets.all(20.0),
          child: Card(
            child: Center(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                  ),
                  Text(
                    widget.list[widget.index]['username'],
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Divider(),
                  //Text()
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      RaisedButton(
                        child: Text("editar"),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
