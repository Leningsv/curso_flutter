import 'dart:convert';

import 'package:flutter/services.dart';

class _MenuProvider {
  List<dynamic> options = [];

  Future<List<dynamic>> loadData() async {
    final data = await rootBundle.loadString('data/menu_opts.json');
    Map dataMap = json.decode(data);
    options = dataMap['rutas'];
    return options;
  }
}

final menuProvider = new _MenuProvider();
