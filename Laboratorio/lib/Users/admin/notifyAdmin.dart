import 'package:flutter/material.dart';

class NotifyAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Solicitud"),
      ),
      body: Container(
        child: Text('Ninguna Solicitud', textScaleFactor: 2.2),
      ),
    );
  }
}
