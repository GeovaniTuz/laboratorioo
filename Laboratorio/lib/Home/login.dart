import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:laboratorio/Home/login/animation/FadeAnimation.dart';
import 'package:laboratorio/Home/login/animation/makein.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

String username = '';

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();

  String msg = '';

  Future<List> _login() async {
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
        Navigator.pushReplacementNamed(context, '/Users/MainAdmin');
      } else if (datauser[0]['rol_idrol'] == '4') {
        Navigator.pushReplacementNamed(context, '/Users/MainUser');
      }

      setState(() {
        username = datauser[0]['username'];
      });
    }

    return datauser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        FadeAnimation(
                            1,
                            Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                            1.2,
                            Text(
                              "Login to your account",
                              style: TextStyle(
                                  fontSize: 15, color: Colors.grey[700]),
                            )),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: <Widget>[
                          FadeAnimation(1.2, makeInput(label: "Email")),
                          FadeAnimation(1.3,
                              makeInput(label: "Password", obscureText: true)),
                        ],
                      ),
                    ),
                    RaisedButton(
                      child: Text("Login"),
                      onPressed: () {
                        _login();
                        Navigator.pop(context);
                      },
                    ),
                    FadeAnimation(
                        1.5,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Don't have an account?"),
                            Text(
                              "Sign up",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 18),
                            ),
                          ],
                        ))
                  ],
                ),
              ),
              FadeAnimation(
                  1.2,
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/Imagen5.png'),
                            fit: BoxFit.cover)),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
