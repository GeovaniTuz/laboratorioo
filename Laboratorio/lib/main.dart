// inportar libreria principal
import 'package:flutter/material.dart';
// Inportotar clase Widget necesarios
//import 'Users/MainUser.dart';
import 'Users/MainAdmin.dart';

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
      home: AdminMail(title: 'Laboratorio'),
      //home: MyHomePage(title: 'Laboratorio'),
    );
  }
}
