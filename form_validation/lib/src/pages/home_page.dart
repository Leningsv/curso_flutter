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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Email: ${loginBloc.email}'),
          Divider(),
          Text('Password: ${loginBloc.password}')
        ],
      ),
    );
  }
}