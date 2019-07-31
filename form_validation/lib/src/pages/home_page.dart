import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_validation/src/bloc/provider.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final loginBloc = Provider.of(context);
    return new Scaffold(
      appBar: AppBar(
        title: Text('Home page'),
      ),
      body: Container(),
      floatingActionButton: this._createButton(context),
    );
  }

  Widget _createButton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: Colors.deepPurple,
      onPressed: () {
        Navigator.pushNamed(context, 'product');
      },
    );
  }
}