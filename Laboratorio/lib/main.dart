// Administrador.==> Implementado para admin, se puede buscar las otras partes en archivo *.txt
import 'package:flutter/material.dart';
import 'Users/MainAdmin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Laboratorio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AdminMail(title: 'Laboratorio'),
    );
  }
}
