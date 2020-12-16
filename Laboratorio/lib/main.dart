import 'package:flutter/material.dart';
//import 'Users/MainUser.dart';
import 'Users/MainAdmin.dart';
//import 'login.dart';

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
    );
  }
}
