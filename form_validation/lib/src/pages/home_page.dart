import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_validation/src/bloc/provider.dart';
import 'package:form_validation/src/models/product_model.dart';
import 'package:form_validation/src/providers/product_provider.dart';

class HomePage extends StatelessWidget {
  final _productProvider = new ProductProvider();
  @override
  Widget build(BuildContext context) {
    final loginBloc = Provider.of(context);

    return new Scaffold(
      appBar: AppBar(
        title: Text('Home page'),
      ),
      body: this._getProducts(),
      floatingActionButton: this._createButton(context),
    );
  }

  Widget _createButton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: Colors.deepPurple,
      onPressed: () {
        Navigator.pushNamed(context, 'product');
      },
    );
  }

  Widget _getProducts() {
    return FutureBuilder(
      future: this._productProvider.getProducts(),
      builder: (BuildContext context, AsyncSnapshot<List<ProductModel>> snapshot){
        if(!snapshot.hasData){
          return Container();
        }
        final products = snapshot.data;
        return ListView.builder(
          itemBuilder: (context, index) {
            return this._createItem(context, products[index]);
          },
          itemCount: products.length,
        );
      },
    );
  }

  Widget _createItem(BuildContext context, ProductModel product) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.deepOrangeAccent,
      ),
      onDismissed: (direction) {
        this._productProvider.deleteProduct(product.id);
      },
      child: ListTile(
        title: Text(product.title),
        subtitle: Text(product.id),
        onTap: () => Navigator.pushNamed(context, 'product', arguments: product),
      ),
    );
  }
}