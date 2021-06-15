import 'package:flutter/material.dart';

import 'package:clip_regular_polygon/clip_regular_polygon.dart';

void main() {
  runApp(Showcase());
}

class Showcase extends StatefulWidget {
  Showcase({Key? key}) : super(key: key);

  @override
  _ShowcaseState createState() => _ShowcaseState();
}

class _ShowcaseState extends State<Showcase> {
  RegularPolygon _regularPolygon = RegularPolygon.hexagon(
    corners: Corner.round(0.15),
    rotation: 90,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Showcase ClipRegularPolygon',
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Showcase ClipRegularPolygon',
            maxLines: 1,
            softWrap: false,
            overflow: TextOverflow.fade,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            children: <Widget>[
              Expanded(
                child: ClipRegularPolygon(
                  regularPolygon: _regularPolygon,
                  child: Material(
                    color: Colors.grey[100],
                    child: InkWell(
                      onTap: () {},
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
