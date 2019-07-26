import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {

  @override
  State createState() {
    return new _SliderPageState();
  }
}

class _SliderPageState extends State<SliderPage> {
  double valueSlider = 100.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            this._createSlider(),
            this._createImage()
          ],
        )
      ),
    );
  }

  Widget _createSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen',
      divisions: 20,
      onChanged: (double value) {
        this.setState(() {
          this.valueSlider = value;
        });
      },
      value: this.valueSlider,
      min: 10.0,
      max: 400.0,
    );
  }

  Widget _createImage() {
    return Image(

    );
  }
}