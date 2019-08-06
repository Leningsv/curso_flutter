import 'package:flutter/material.dart';
import 'package:form_validation/src/bloc/login_bloc.dart';
import 'package:form_validation/src/bloc/product_bloc.dart';


class Provider extends InheritedWidget {
  final loginBloc = new LoginBloc();
  final _productBloc = new ProductBloc();

  static Provider _instance;
  factory  Provider({Key key, Widget child}) {
    if(_instance == null) {
      _instance = new Provider._internal(key: key, child: child);
    }
    return _instance;
  }

  Provider._internal({Key key, Widget child}): super(key: key, child: child);

//  Provider({Key key, Widget child}): super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static LoginBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(Provider) as Provider).loginBloc;
  }

  static ProductBloc productBloc (BuildContext context) {
    return (context.inheritFromWidgetOfExactType(Provider) as Provider)._productBloc;
  }
}
