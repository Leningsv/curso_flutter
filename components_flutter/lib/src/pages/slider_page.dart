import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  State createState() {
    return new _SliderPageState();
  }
}

class _SliderPageState extends State<SliderPage> {
  double _valueSlider = 300.0;
  bool _valueCheckBox = false;

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
              this._checkBox(),
              this._createSwitch(),
              Expanded(child: this._createImage())
            ],
          )),
    );
  }

  Widget _createSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen',
      divisions: 20,
      onChanged: (this._valueCheckBox)
          ? null
          : (double value) {
              this.setState(() {
                this._valueSlider = value;
              });
            },
      value: this._valueSlider,
      min: 100.0,
      max: 400.0,
    );
  }

  Widget _createImage() {
    return Image(
      image: NetworkImage(
          'https://k62.kn3.net/taringa/E/B/4/4/6/0/lucyalegria/550x680_F63.jpg'),
      width: this._valueSlider,
    );
  }

  Widget _checkBox() {
//    return Checkbox(
//      value: this._valueCheckBox,
//      onChanged: (bool value) {
//        setState(() {
//          this._valueCheckBox = value;
//        });
//      },
//    );
    return CheckboxListTile(
      title: Text('Bloquear slider'),
      value: this._valueCheckBox,
      onChanged: (bool value) {
        setState(() {
          this._valueCheckBox = value;
        });
      },
    );
  }

  Widget _createSwitch() {
    return SwitchListTile(
      title: Text('Bloquear slider'),
      value: this._valueCheckBox,
      onChanged: (bool value) {
        setState(() {
          this._valueCheckBox = value;
        });
      },
    );
  }
}
