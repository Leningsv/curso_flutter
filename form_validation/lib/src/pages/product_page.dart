import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_validation/src/bloc/product_bloc.dart';
import 'package:form_validation/src/bloc/provider.dart';
import 'package:form_validation/src/models/product_model.dart';
import 'package:form_validation/src/utils/validators.dart' as utils;
import 'package:image_picker/image_picker.dart';

class ProductPage extends StatefulWidget {
  @override
  State createState() {
    return _ProductPageState();
  }
}

class _ProductPageState extends State {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  ProductBloc _productBloc;
  ProductModel product = new ProductModel();
  bool _isSaved = false;
  File _photo;

  @override
  Widget build(BuildContext context) {
    this._productBloc = Provider.productBloc(context);
    final ProductModel productData = ModalRoute.of(context).settings.arguments;
    if (productData != null) {
      product = productData;
    }
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Producto'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.photo_size_select_actual),
            onPressed: () {
              this._selectPhoto();
            },
          ),
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: () {
              this._takePhoto();
            },
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
                this._showPhoto(),
                this._createName(),
                this._createPrice(),
                this._createIsAvailability(),
                this._createButton(context),
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
      onSaved: (value) {
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
      onSaved: (value) {
        product.value = double.parse(value);
      },
      validator: (value) {
        if (!utils.isNumeric(value)) {
          return 'Ingrese un valor numerico';
        }
        return null;
      },
    );
  }

  Widget _createButton(BuildContext context) {
    return RaisedButton.icon(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        color: Colors.deepPurple,
        textColor: Colors.white,
        onPressed: this._isSaved
            ? null
            : () {
                this._submit(context);
              },
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

  _submit(BuildContext context) async {
    if (!formKey.currentState.validate()) {
      return;
    }
    formKey.currentState.save();
    setState(() {
      this._isSaved = true;
    });
    if (this._photo != null) {
      product.urlPicture = await this._productBloc.uploadImage(this._photo);
    }
    if (product.id == null) {
      this._productBloc.createProduct(product);
    } else {
      this._productBloc.updateProduct(product);
    }
    this.showSnackbar('Registro guardado');
    Navigator.pop(context);
  }

  void showSnackbar(String message) {
    final snackbar = SnackBar(
      content: Text(message),
      duration: Duration(milliseconds: 1500),
    );
    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  Widget _showPhoto() {
    if (this.product.urlPicture == null) {
      return Image(
        image: AssetImage(this._photo?.path ?? 'assets/no-image.png'),
        height: 300,
        fit: BoxFit.cover,
      );
    }
    return FadeInImage(
        image: NetworkImage(this.product.urlPicture),
        placeholder: AssetImage('assets/jar-loafing.gif'),
        height: 300.0,
        fit: BoxFit.contain);
  }

  void _selectPhoto() async {
    this._processImage(ImageSource.gallery);
  }

  void _takePhoto() async {
    this._processImage(ImageSource.camera);
  }

  void _processImage(ImageSource source) async {
    this._photo = await ImagePicker.pickImage(source: source);
    if (this._photo != null) {
      product.urlPicture = null;
    }
    setState(() {});
  }
}
