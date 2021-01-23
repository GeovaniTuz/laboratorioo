/*import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:laboratorio/Home/login/animation/FadeAnimation.dart';
import 'package:laboratorio/Home/login/animation/makein.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:laboratorio/Home/util/constant.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool visible = false;

  final user = new TextEditingController();
  final pass = new TextEditingController();

  // fin de controle

  //Mensaje por si surge algun problema
  String mensaje = "";
  //fin del mensaje
  //conexion a la api para validar a usuario
  Future<List> userLogin() async {
    //circular progreso
    setState(() {
      visible = true;
    });

// Getting value from Controller
    String email = user.text;
    String password = pass.text;

    // SERVER LOGIN API URL
    var url =
        'https://pagina-web-optimizacion.000webhostapp.com/API/api/login_user.php';

    // Store all data with Param Name.
    var data = {'email': email, 'contrasenia': password};

    // Starting Web API Call.
    var response = await http.post(url, body: json.encode(data));

    // Getting Server response into variable.
    var message = jsonDecode(response.body);

    // If the Response Message is Matched.
    if (message == 'Login Matched') {
      // Hiding the CircularProgressIndicator.
      setState(() {
        visible = false;
      });

      // Navigate to Profile Screen & Sending Email to Next Screen.
      // Navigator.push(
      Navigator.of(context).pushNamed('/Docente');
    } else {
      // If Email or Password did not Matched.
      // Hiding the CircularProgressIndicator.
      setState(() {
        visible = false;
      });

      // Showing Alert Dialog with Response JSON Message.
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text(message),
            actions: <Widget>[
              FlatButton(
                child: new Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Center(
      child: Column(
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('User Login Form', style: TextStyle(fontSize: 21))),
          Divider(),
          Container(
              width: 280,
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: user,
                autocorrect: true,
                decoration: InputDecoration(hintText: 'UserName'),
              )),
          Container(
              width: 280,
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: pass,
                autocorrect: true,
                obscureText: true,
                decoration: InputDecoration(hintText: 'Contraseña'),
              )),
          RaisedButton(
            onPressed: userLogin,
            color: Colors.green,
            textColor: Colors.white,
            padding: EdgeInsets.fromLTRB(9, 9, 9, 9),
            child: Text('Click Here To Login'),
          ),
          Visibility(
              visible: visible,
              child: Container(
                  margin: EdgeInsets.only(bottom: 30),
                  child: CircularProgressIndicator())),
        ],
      ),
    )));
  }
}
*/
