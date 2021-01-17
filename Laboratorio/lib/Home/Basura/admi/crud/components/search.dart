//no implemntado por completo
import 'package:flutter/material.dart';

class dataSearch extends SearchDelegate<String> {
// crear los datos para la busqueda.

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [IconButton(icon: Icon(Icons.clear), onPressed: () {})];
    //throw UnimplementedError();
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {});
    //throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    //final suggestionList = query.isEmpty ? recen : lab;
    return ListView.builder(
        itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.location_history),
              title: Text("recientes"),
            ));
    //throw UnimplementedError();
  }
}
