import 'package:flutter/material.dart';

import 'package:clip_regular_polygon/clip_regular_polygon.dart';

extension on RegularPolygon {
  RegularPolygon copyWith({
    int? sides,
    num? rotation,
    Corner? corners,
  }) =>
      RegularPolygon(
        sides: sides ?? this.sides,
        rotation: rotation ?? this.rotation,
        corners: corners ?? this.corners,
      );
}

extension on Corner {
  Corner copyWith({
    CornerShape? shape,
    num? radius,
  }) =>
      Corner(
        shape: shape ?? this.shape,
        radius: radius ?? this.radius,
      );
}

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

  void _setSides(double sides) {
    setState(() {
      _regularPolygon = _regularPolygon.copyWith(
        sides: sides.round(),
      );
    });
  }

  void _setRotation(double rotation) {
    setState(() {
      _regularPolygon = _regularPolygon.copyWith(
        rotation: rotation,
      );
    });
  }

  void _setCornerShape(CornerShape? cornerShape) {
    setState(() {
      _regularPolygon = _regularPolygon.copyWith(
        corners: _regularPolygon.corners.copyWith(
          shape: cornerShape ?? CornerShape.sharp,
        ),
      );
    });
  }

  void _setRadius(double radius) {
    setState(() {
      _regularPolygon = _regularPolygon.copyWith(
        corners: _regularPolygon.corners.copyWith(
          radius: radius,
        ),
      );
    });
  }

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
              Slider(
                min: 3,
                max: 10,
                divisions: 7,
                value: _regularPolygon.sides.toDouble(),
                onChanged: _setSides,
              ),
              Slider(
                min: 0,
                max: 360,
                value: _regularPolygon.rotation,
                onChanged: _setRotation,
              ),
              for (CornerShape cornerShape in CornerShape.values)
                Row(
                  children: <Widget>[
                    Radio<CornerShape>(
                      value: cornerShape,
                      groupValue: _regularPolygon.corners.shape,
                      onChanged: _setCornerShape,
                    ),
                    Text(cornerShape.toString()),
                  ],
                ),
              Slider(
                min: 0,
                max: 1,
                value: _regularPolygon.corners.radius,
                onChanged: _setRadius,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
