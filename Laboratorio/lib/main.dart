import 'package:flutter/material.dart';
import 'package:laboratorio/Home/Usuario/MainAdmin.dart';

//main principal de app
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Laboratorio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AdminMail(), //ADMINISTRADOR
      //home: MyHomePage() //LOGIN
      //home: mainUser() //USUARIO

      /*routes: <String, WidgetBuilder>{
        '/Users/MainAdmin': (BuildContext context) => new AdminMail(),
        '/Users/MainUser': (BuildContext context) => new mainUser(),
        '/Users/LoginPage': (BuildContext context) => new MyHomePage(),
      },*/
    );
  }
}
