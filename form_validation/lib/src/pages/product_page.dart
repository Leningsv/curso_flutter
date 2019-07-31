import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {

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
            child: Column(
              children: <Widget>[
                this._createName(),
                this._createPrice(),
                this._createButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _createName() {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Product'
      ),
    );
  }

  Widget _createPrice() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Price'
      ),
    );
  }

  Widget _createButton() {
    return RaisedButton.icon(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        color: Colors.deepPurple,
        textColor: Colors.white,
        onPressed: (){}, icon: Icon(Icons.save), label: Text('Save'));
  }
}