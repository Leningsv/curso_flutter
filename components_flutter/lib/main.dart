import 'package:components_flutter/src/pages/alert_page.dart';
import 'package:components_flutter/src/pages/avatar_page.dart';
import 'package:components_flutter/src/pages/home_page.dart';
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
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => new HomePage(),
        'alert' : (BuildContext context) => new AlertPage(),
        'avatar' : (BuildContext context) => new AvatarPage()
      },
    );
  }
}
