import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_validation/src/bloc/product_bloc.dart';
import 'package:form_validation/src/bloc/provider.dart';
import 'package:form_validation/src/models/product_model.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productBloc = Provider.productBloc(context);
    productBloc.loadProducts();
    return new Scaffold(
      appBar: AppBar(
        title: Text('Home page'),
      ),
      body: this._getProducts(productBloc),
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

  Widget _getProducts(ProductBloc productBloc) {
    return StreamBuilder(
      stream: productBloc.productStream,
      builder: (BuildContext context, AsyncSnapshot<List<ProductModel>> snapshot){
        if (!snapshot.hasData) {
          return Container();
        }
        final products = snapshot.data;
        return ListView.builder(
          itemBuilder: (context, index) {
            return this._createItem(context, products[index], productBloc);
          },
          itemCount: products.length,
        );
      },
    );
  }

  Widget _createItem(BuildContext context, ProductModel product, ProductBloc productBloc) {
    return Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.deepOrangeAccent,
        ),
        onDismissed: (direction) {
          productBloc.deleteProduct(product.id);
        },
        child: Card(
          child: Column(
            children: <Widget>[
              product.urlPicture == null
                  ? Image(image: AssetImage('assets/no-image.png'))
                  : FadeInImage(
                      image: NetworkImage(product.urlPicture),
                      placeholder: AssetImage('assets/jar-loading.gif'),
                      height: 300.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
              ListTile(
                title: Text(product.title),
                subtitle: Text(product.id),
                onTap: () =>
                    Navigator.pushNamed(context, 'product', arguments: product),
              ),
            ],
          ),
        ));
  }
}
