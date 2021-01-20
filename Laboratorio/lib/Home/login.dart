import 'dart:convert';
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
  // controle para para datos
  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();
  // fin de controle

  //Mensaje por si surge algun problema
  String mensaje = "";
  //fin del mensaje
  //conexion a la api para validar a usuario
  Future<List> login() async {
    final response = await http.post(
        "https://pagina-web-optimizacion.000webhostapp.com/API/api/sesion.php",
        body: {
          "username": user.text,
          "password": pass.text,
        });
    //fallos en esta part
    var datauser = json.decode(response.body);

    if (datauser.length == 0) {
      setState(() {
        mensaje = "Login Fail";
      });
    } else {
      if (datauser[0][''] == '6') {
        Navigator.pushReplacementNamed(context, '/administrador');
      } else if (datauser[0][''] == '8') {
        Navigator.pushReplacementNamed(context, '/Docente');
      }
    }
  }

  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Form(
      child: Container(
        child: Padding(
            padding: EdgeInsets.all(10.0),
            child: new ListView(children: <Widget>[
              new Column(children: <Widget>[
                new TextField(
                  controller: user,
                  decoration: new InputDecoration(labelText: "Nombre"),
                ),
                //--------------------------------
                new TextField(
                  controller: pass,
                  decoration: new InputDecoration(labelText: "Descripcion"),
                ),
                _buildLoginBtn(),
              ])
            ])),
      ),
    ));
  }

/*

      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'welcome to labotory',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 35.0),
                      _buildEmailTF(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _buildPasswordTF(),
                      _buildForgotPasswordBtn(),
                      _buildRememberMeCheckbox(),
                      _buildLoginBtn(),
                      _buildSignupBtn()
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),

 */
  Widget _buildSignupBtn() {
    return GestureDetector(
      onTap: () => print('Registrate presionando el boton'),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'No tienes una cuenta? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Regístrate',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'E-Mail',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: user,
            keyboardType: TextInputType.name,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              hintText: 'Username',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Contraseña',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: pass,
            obscureText: true,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Escribe tu contraseña',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => print('Si olvido su contraseña presione el texto'),
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Olvido su contraseña?',
          style: kLabelStyle,
        ),
      ),
    );
  }

  Widget _buildRememberMeCheckbox() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value;
                });
              },
            ),
          ),
          Text(
            'Recordar',
            style: kLabelStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          login();
          Navigator.of(context).pushNamed('/Docente');
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'Iniciar',
          style: TextStyle(
            color: Colors.black,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }
}
