import 'package:components_flutter/src/providers/menu_provider.dart';
import 'package:components_flutter/src/utils/icon_string_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Componentes'),
      ),
      body: this._items(),
    );
  }

  Widget _items() {
    return new FutureBuilder(
      future: menuProvider.loadData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        print(snapshot);
        return ListView(
          children: _getItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _getItems(List<dynamic> data, BuildContext context) {
    final List<Widget> options = [];
    data.forEach((option) {
      options.add(new ListTile(
        title: new Text(option['texto']),
        leading: getIcon(option['icon']),
        trailing: new Icon(
          Icons.keyboard_arrow_right,
          color: Colors.blue,
        ),
        onTap: () {
          Navigator.pushNamed(context, option['ruta']);
//          final route = new MaterialPageRoute(builder: (context) {
//            return new AlertPage();
//          });
//          Navigator.push(context, route);
        },
      ));
      options.add(new Divider());
    });
    return options;
  }
}
