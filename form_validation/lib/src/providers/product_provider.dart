import 'dart:convert';
import 'dart:io';

import 'package:form_validation/src/models/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime_type/mime_type.dart';

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

  Future<String> uploadImage(File image) async {
    final url = Uri.parse('https://api.cloudinary.com/v1_1/dvijttdkz/image/upload?upload_preset=qfjxzard');
    final mimeType = mime(image.path).split('/'); //image/jpeg
    final imageUploadRequest = http.MultipartRequest(
      'POST',
      url
    );
    final file = await http.MultipartFile.fromPath('file', image.path, contentType: MediaType(mimeType[0], mimeType[1]));
    imageUploadRequest.files.add(file);
    final streamResponse = await imageUploadRequest.send();
    final response = await http.Response.fromStream(streamResponse);
    if(response.statusCode != 200 && response.statusCode != 201){
      print('Algo salio mal');
      print(response.body);
      return null;
    }
    final responseData = json.decode(response.body);
    print(responseData);
    return responseData['secure_url'];
  }
}