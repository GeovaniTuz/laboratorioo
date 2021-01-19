import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:laboratorio/Home/MainAdmin.dart';
import 'package:laboratorio/Home/MainUser.dart';

import 'package:laboratorio/Home/login.dart';
import 'package:http/http.dart' as http;

import 'Home/login/animation/FadeAnimation.dart';
import 'Home/login/animation/makein.dart';

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
      //home: LoginPage() //LOGIN
      //home: mainUser() //USUARIO

      /*,routes: <String, WidgetBuilder>{
        '/MainAdmin': (BuildContext context) => new AdminMail(),
        '/MainUser': (BuildContext context) => new mainUser(),
        '/login': (BuildContext context) => new MyHomePage(),
      },
*/
      /*routes: <String, WidgetBuilder>{
        '/Users/MainAdmin': (BuildContext context) => new AdminMail(),
        '/Users/MainUser': (BuildContext context) => new mainUser(),
        '/Users/LoginPage': (BuildContext context) => new MyHomePage(),
      },*/
    );
  }
}

/*
//inplementacion de login fallida.

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // carga de datos
  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();
  //fin de carga de dato

  //mensaje de falla
  String msg = '';
  //fin de mensaje

  //se pide los datos desde la pagina web
  Future<List> login() async {
    final response = await http.post(
        "https://pagina-web-optimizacion.000webhostapp.com/API/api/sesion.php",
        body: {
          "username": user.text,
          "password": pass.text,
        });

    var datauser = json.decode(response.body);

    if (datauser.length == 0) {
      setState(() {
        msg = "Login Fail";
      });
    } else {
      if (datauser[0]['rol_idrol'] == '3') {
        Navigator.pushReplacementNamed(context, '/MainAdmin');
      } else if (datauser[0]['rol_idrol'] == '4') {
        Navigator.pushReplacementNamed(context, '/MainUser');
      }

      setState(() {
        username = datauser[0]['username'];
      });
    }

    return datauser;
  }

// fin de base de datos.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                "Username",
                style: TextStyle(fontSize: 18.0),
              ),
              TextField(
                controller: user,
                decoration: InputDecoration(
                    icon: Icon(Icons.email, color: Colors.black),
                    hintText: 'Username'),
              ),
              Text(
                "Password",
                style: TextStyle(fontSize: 18.0),
              ),
              TextField(
                controller: pass,
                obscureText: true,
                decoration: InputDecoration(
                    icon: Icon(Icons.vpn_key, color: Colors.black),
                    hintText: 'Password'),
              ),
              Text(
                msg,
                style: TextStyle(fontSize: 20.0, color: Colors.red),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 6, right: 32),
                  child: Text(
                    'Recorar contraseña',
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              ),
              //Spacer(),
              new RaisedButton(
                child: Text("Login"),
                color: Colors.blue,
                onPressed: () {
                  login();
                  Navigator.pop(context);
                },
              ),
              Text(
                msg,
                style: TextStyle(fontSize: 25.0, color: Colors.red),
              )
            ],
          ),
        ),
      ),
    );
  }
}
*/
