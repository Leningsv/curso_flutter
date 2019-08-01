import 'dart:convert';

import 'package:form_validation/src/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductProvider {
  final String _url = 'https://flutter-b53a3.firebaseio.com';
  Future<bool> createProduct(ProductModel product) async {
    final url = '${this._url}/products.json';
    final response = await http.post(url, body: productModelToJson(product));
    final decodedData = json.decode(response.body);
    print(decodedData);
    return true;
  }
}