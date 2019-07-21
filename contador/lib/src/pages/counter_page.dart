import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  @override
  State createState() {
    return new _CounterPageState();
  }
}

class _CounterPageState extends State<CounterPage> {
  final _styleText = new TextStyle(fontSize: 25.0);
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('State Full'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Numero de clicks: ',
                style: this._styleText,
              ),
              Text(this._counter.toString(), style: this._styleText)
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: _createButtons());
  }

  Widget _createButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        new SizedBox(
          width: 30.0,
        ),
        new FloatingActionButton(
          child: Icon(Icons.exposure_zero),
          onPressed: this._reset,
        ),
        new Expanded(child: new SizedBox()),
        new FloatingActionButton(
          child: Icon(Icons.remove),
          onPressed: this._lees,
        ),
        new SizedBox(
          width: 5.0,
        ),
        new FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: this._add,
        ),
      ],
    );
  }
  
  void _add() {
    this._counter ++;
    this.setState(() =>{});
  }

  void _lees() {
    this._counter --;
    this.setState(() =>{});
  }

  void _reset() {
    this._counter = 0;
    this.setState(() => {});
  }
}
