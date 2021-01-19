import 'package:flutter/material.dart';

class CustomScrollViewComponent extends StatefulWidget {
  @override
  _CustomScrollViewComponentState createState() =>
      _CustomScrollViewComponentState();
}

class _CustomScrollViewComponentState extends State<CustomScrollViewComponent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Material(
          child: CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                delegate: MySliverAppBar(
                    expandedHeight: MediaQuery.of(context).size.height * 0.3),
                pinned: true,
              ),
              // SliverList(
              // delegate: SliverChildBuilderDelegate(
              // (_, index) => ListTile(title: Text("Usuario")),
              // ),
              //),
            ],
          ),
        ),
      ),
    );
  }
}

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  MySliverAppBar({@required this.expandedHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        Positioned(
            top: expandedHeight / 1.7 - shrinkOffset,
            left: MediaQuery.of(context).size.width / 3.5,
            child: CircleAvatar(
              radius: MediaQuery.of(context).size.width / 4.3,
              backgroundColor: Colors.yellow,
              child: CircleAvatar(
                radius: MediaQuery.of(context).size.width / 4.6,
                backgroundImage: NetworkImage(
                    'https://pm1.narvii.com/7219/b493e34427e645f3fb82d09f2185a177d9230392r1-466-658v2_00.jpg'),
              ),
            )),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
