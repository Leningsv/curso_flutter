import 'package:components_flutter/src/pages/alert_page.dart';
import 'package:components_flutter/src/routes/routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: getApplicationRoutes(),
      onGenerateRoute: (RouteSettings routeSettings) {
        print('ruta llamada ${routeSettings.name}');
        return new MaterialPageRoute(
            builder: (BuildContext context) => new AlertPage());
      },
    );
  }
}
