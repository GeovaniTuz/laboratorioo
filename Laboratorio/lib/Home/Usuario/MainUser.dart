import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:laboratorio/Home/Usuario/Docente/CatalLab.dart';
import 'package:laboratorio/Home/Usuario/Docente/NotifLab.dart';
import 'package:laboratorio/Home/Usuario/Docente/settings.dart';

class mainUser extends StatefulWidget {
  mainUser({Key key, this.title}) : super(key: key);
  @override
  _mainUserState createState() => _mainUserState();
  final String title;
}

class _mainUserState extends State<mainUser> {
  int _pageIn = 0;

  //se instancia la clase para poder usar
  final lista _listaCatal = new lista();
  final settingslab _sttings = new settingslab();
  final Notify _notificacion = new Notify();
  //final CustomScrollViewComponent _informacion = CustomScrollViewComponent();

  // selecionar para que cargue primero
  Widget _InicioP = new lista();

  Widget _SelectPa(int page) {
    switch (page) {
      case 0:
        return _listaCatal;
        break;
      case 1:
        return _notificacion;
        break;
      case 2:
        return _sttings;
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
      bottomNavigationBar: CurvedNavigationBar(
          index: _pageIn,
          items: <Widget>[
            Icon(Icons.list_alt, size: 30),
            Icon(Icons.notifications, size: 30),
            //Icon(Icons.settings, size: 30),
            Icon(Icons.exit_to_app, size: 30),
          ],
          color: Colors.white,
          backgroundColor: Colors.blue,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 500),
          onTap: (int tapped) {
            setState(() {
              _InicioP = _SelectPa(tapped);
            });
          }),
      body: Container(
        color: Colors.white10,
        child: Center(
          child: _InicioP,
        ),
      ),
    );
  }
}
