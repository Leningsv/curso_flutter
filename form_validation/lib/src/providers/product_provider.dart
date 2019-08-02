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

  Future<List<ProductModel>> getProducts() async {
    final url = '${this._url}/products.json';
    final response = await http.get(url);
    final Map<String, dynamic> decodedData = json.decode(response.body);
    final List<ProductModel> products= new List<ProductModel>();
    if(decodedData == null) {
      return products;
    }
    decodedData.forEach((id, product) {
      final productModel = ProductModel.fromJson(product);
      productModel.id = id;
      products.add(productModel);
    });
    return products;
  }

  Future<void> deleteProduct(String idProduct) async {
    final url = '${this._url}/products/$idProduct.json';
    await http.delete(url);
  }

  Future<bool> updateProduct(ProductModel product) async {
    final url = '${this._url}/products/${product.id}.json';
    final response = await http.put(url, body: productModelToJson(product));
    final decodedData = json.decode(response.body);
    print(decodedData);
    return true;
  }
}