import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:laboratorio/Users/user/funcion/informacion.dart';

//se importa lor archivos de la clase
import 'user/CatalLab.dart';
import 'user/infoU.dart';
import 'user/NotifLab.dart';

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
  final NotificacionLab _notificacion = new NotificacionLab();
  final CustomScrollViewComponent _informacion = CustomScrollViewComponent();

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
        return _informacion;
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
            Icon(Icons.perm_identity, size: 30),
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
