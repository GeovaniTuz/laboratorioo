import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

//se importa lor archivos de la clase
import 'admin/notifyAdmin.dart';
import 'admin/AdminLab.dart';

class AdminMail extends StatefulWidget {
  AdminMail({Key key, this.title}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
  final String title;
}

class _MyHomePageState extends State<AdminMail> {
  int _pageIn = 0;

  //se instancia la clase para poder usar
  final NotifyAdmin _notificacion = new NotifyAdmin();
  final lista _crud = new lista();

  // selecionar para que cargue primero
  Widget _InicioP = new lista();

  Widget _SelectPa(int page) {
    switch (page) {
      case 0:
        return _crud;
        break;
      case 1:
        return _notificacion;
        break;
      default:
        return new Container(
          child: new Center(
              child: new Text(
            'no page foud',
            style: new TextStyle(fontSize: 30),
          )),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      //  title: Text(widget.title),
      //),
      bottomNavigationBar: CurvedNavigationBar(
          index: _pageIn,
          items: <Widget>[
            Icon(Icons.list_alt, size: 30),
            Icon(Icons.notifications, size: 30),
          ],
          color: Colors.blue,
          backgroundColor: Colors.white,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (int tapped) {
            setState(() {
              _InicioP = _SelectPa(tapped);
            });
          }),
      body: Container(
        color: Colors.white,
        child: Center(
          child: _InicioP,
        ),
      ),
    );
  }
}
