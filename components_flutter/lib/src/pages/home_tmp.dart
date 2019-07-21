import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeTmpPage extends StatelessWidget {
  final options = ['one', 'two', 'tree'];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Componentes tmp'),
      ),
      body: new ListView(
//        children: this._getItems()
        children: this._creteItems(),
      ),
    );
  }

  List<Widget> _getItems() {
    List<Widget> widgets = new List<Widget>();
    for (final option in options) {
      widgets
        ..add(new ListTile(
          title: Text(option),
        ))
        ..add(new Divider());
    }
    return widgets;
  }

  List<Widget> _creteItems() {
    List<Column> widgets = options.map((String option) {
      return Column(
        children: <Widget>[
          new ListTile(
            title: new Text(option),
            subtitle: new Text('Cualquier cosa'),
            leading: new Icon(Icons.widgets),
            trailing: new Icon(Icons.arrow_right),
            onTap: () => {},
          ),
          new Divider()
        ],
      );
    }).toList();
    return widgets;
  }
}
