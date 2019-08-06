import 'dart:io';

import 'package:form_validation/src/models/product_model.dart';
import 'package:form_validation/src/providers/product_provider.dart';
import 'package:rxdart/rxdart.dart';

class ProductBloc {
  final _productController = new BehaviorSubject<List<ProductModel>>();
  final _loadingController = new BehaviorSubject<bool>();

  final _productProvider = new ProductProvider();

  Stream<List<ProductModel>> get productStream => this._productController.stream;
  Stream<bool> get loadingStream => this._loadingController.stream;

  void loadProducts() async{
    final products = await this._productProvider.getProducts();
    this._productController.sink.add(products);
  }
  void createProduct(ProductModel product) async{
    this._loadingController.sink.add(true);
    await this._productProvider.createProduct(product);
    this._loadingController.sink.add(false);
  }

  Future<String> uploadImage(File image) async {
    this._loadingController.sink.add(true);
    final pictureUrl =await this._productProvider.uploadImage(image);
    this._loadingController.sink.add(false);
    return pictureUrl;
  }

  void updateProduct(ProductModel product) async {
    this._loadingController.sink.add(true);
    await this._productProvider.updateProduct(product);
    this._loadingController.sink.add(false);
  }

  void deleteProduct(String productId) async {
    this._loadingController.sink.add(true);
    await this._productProvider.deleteProduct(productId);
    this._loadingController.sink.add(false);
  }

  dispose() {
    this._productController?.close();
    this._loadingController?.close();
  }
}
