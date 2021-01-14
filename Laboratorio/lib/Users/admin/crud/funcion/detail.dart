import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:laboratorio/Users/admin/AdminLab.dart';
import 'package:laboratorio/Users/admin/crud/funcion/editdata.dart';
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
    var url =
        "https://pagina-web-optimizacion.000webhostapp.com/API/api/delenteData.php";
    http.post(url,
        body: {'idlaboratorio': widget.list[widget.index]['idelaboratorio']});
  }

  void confirmar() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Text(
          "Seguro deseas eliminar '${widget.list[widget.index]['idlaboratorio']}'"),
      actions: <Widget>[
        RaisedButton(
          child: Text(
            "ok Eliminado",
            style: TextStyle(color: Colors.black),
          ),
          color: Colors.red,
          onPressed: () {
            delenteData();
            Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => lista(),
            ));
          },
        ),
        new RaisedButton(
          child: new Text(
            "Cancelar",
            style: new TextStyle(color: Colors.black),
          ),
          color: Colors.green,
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
    showDialog(context: context, child: alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              "${widget.list[widget.list[widget.index]['idlaboratorio']]}"),
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
                    widget.list[widget.index]['idlaboratorio'],
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Divider(),
                  Text(
                    "Edificio: ${widget.list[widget.index]['idlaboratorio']}",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      RaisedButton(
                        child: Text("editar"),
                        color: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        onPressed: () =>
                            Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => new EditData(
                            list: widget.list,
                            index: widget.index,
                          ),
                        )),
                      ),
                      VerticalDivider(),
                      new RaisedButton(
                        child: Text("Eliminar"),
                        color: Colors.redAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        onPressed: () => confirmar(),
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
