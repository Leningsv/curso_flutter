import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPageState createState() {
    return new _AnimatedContainerPageState();
  }
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.pink;
  BorderRadius _borderRadius = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated cointainer'),
      ),
      body: Center(
        child: Container(
          width: this._width,
          height: this._height,
          decoration: BoxDecoration(
            borderRadius: this._borderRadius,
            color: this._color
          ),
        ),
      ),
    );
  }
}
