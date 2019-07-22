import 'package:components_flutter/src/pages/alert_page.dart';
import 'package:components_flutter/src/pages/animated_container_page.dart';
import 'package:components_flutter/src/pages/avatar_page.dart';
import 'package:components_flutter/src/pages/card_page.dart';
import 'package:components_flutter/src/pages/home_page.dart';
import 'package:flutter/cupertino.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => new HomePage(),
    'alert': (BuildContext context) => new AlertPage(),
    'avatar': (BuildContext context) => new AvatarPage(),
    'card': (BuildContext context) => new CardPage(),
    'animatedContainer': (BuildContext context) => new AnimatedContainerPage()
  };
}
