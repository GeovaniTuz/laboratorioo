//import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:laboratorio/Home/MainAdmin.dart';
import 'package:laboratorio/Home/MainUser.dart';

import 'package:laboratorio/Home/login.dart';
//import 'package:http/http.dart' as http;

//import 'Home/login/animation/FadeAnimation.dart';
//import 'Home/login/animation/makein.dart';

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
      //home: AdminMail(), //ADMINISTRADOR
      //home: LoginPage() //LOGIN
      //home: mainUser() //USUARIO
      debugShowCheckedModeBanner: false,

      routes: {
        '/Home/login': (context) => new LoginScreen(),
        '/administrador': (context) => new AdminMail(),
        '/Docente': (context) => new mainUser(),
        //Perfil.ROUTE: (_) => Perfil(),
        //'/anuncios': (context) => Anuncio(),
        // AdminMail.ROUTE: (_) => AdminMail(),
        //Perguar.ROUTE: (_) => Perguar(),
        //Formulario.ROUTE: (_) => Formulario()
      },
      initialRoute: '/Home/login',
    );
  }
}
