import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final styleText = new TextStyle(fontSize: 25.0);
  final counter = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Titulo'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Numero de clicks: ',
              style: styleText,
            ),
            Text(counter.toString(), style: styleText)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
//          this.counter = this.counter + 1;
          print('HOla  mundo123');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
