import 'package:flutter/material.dart';
import 'detail.dart';

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: List == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return Container(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (BuildContext) => new Detail(
                        list: list,
                        index: i,
                      )),
            ),
            child: new Card(
              child: ListTile(
                  title: new Text(
                    list[i]['username'],
                    style: TextStyle(fontSize: 25.0, color: Colors.black),
                  ),
                  leading: new Icon(
                    Icons.person_pin,
                    size: 77.0,
                    color: Colors.blue,
                  )),
            ),
          ),
        );
      },
    );
  }
}
