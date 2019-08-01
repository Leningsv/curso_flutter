import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_validation/src/models/product_model.dart';
import 'package:form_validation/src/providers/product_provider.dart';
import 'package:form_validation/src/utils/validators.dart' as utils;

class ProductPage extends StatefulWidget {
  @override
  State createState() {
    return _ProductPageState();
  }
}
class _ProductPageState extends State {
  final formKey = GlobalKey<FormState>();
  final _productProvider = new ProductProvider();
  ProductModel product = new ProductModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Producto'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.photo_size_select_actual),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: this.formKey,
            child: Column(
              children: <Widget>[
                this._createName(),
                this._createPrice(),
                this._createIsAvailability(),
                this._createButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _createName() {
    return TextFormField(
      initialValue: product.title,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Product'),
      onSaved: (value){
        product.title = value;
      },
      validator: (value) {
        if (value.length < 3) {
          return 'Ingrese el nombre del producto';
        }
        return null;
      },
    );
  }

  Widget _createPrice() {
    return TextFormField(
      initialValue: product.value.toString(),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(labelText: 'Price'),
      onSaved: (value){
        product.value = double.parse(value);
      },
      validator: (value){
        if(!utils.isNumeric(value)) {
          return 'Ingrese un valor numerico';
        }
        return null;
      },
    );
  }

  Widget _createButton() {
    return RaisedButton.icon(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        color: Colors.deepPurple,
        textColor: Colors.white,
        onPressed: this._submit,
        icon: Icon(Icons.save),
        label: Text('Save'));
  }

  Widget _createIsAvailability() {
    return SwitchListTile(
      value: product.isAvailability,
      title: Text('Disponible'),
      activeColor: Colors.deepPurple,
      onChanged: (value) {
        setState(() {
          product.isAvailability = value;
        });
      },
    );
  }

  void _submit() {
    if(!formKey.currentState.validate()) {
      return;
    }
    formKey.currentState.save();
    this._productProvider.createProduct(product);
    print('Todo Ok');
  }
}
