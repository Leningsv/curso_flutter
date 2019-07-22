import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Cards'),
      ),
      body: new ListView(
        padding: new EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
        children: <Widget>[
          this._getCardType1(),
          new SizedBox(
            height: 30.0,
          ),
          this._getCardType2()
        ],
      ),
    );
  }

  Widget _getCardType1() {
    return new Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      child: new Column(
        children: <Widget>[
          new ListTile(
            leading: new Icon(Icons.photo_album),
            title: new Text('Soy el titulo de la tarjeta'),
            subtitle: new Text(
                'Soy la descripcion de la tarjeta xxxsadas asdasdasda asdas d asd as'),
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              new FlatButton(
                child: new Text('Cancelar'),
                onPressed: () => {},
              ),
              new FlatButton(
                child: new Text('Ok'),
                onPressed: () => {},
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _getCardType2() {
    final card = new Container(
      child: new Column(
        children: <Widget>[
          new FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage('https://cdn.pixabay.com/photo/2017/02/01/22/02/mountain-landscape-2031539_960_720.jpg'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover,
          ),
//          new Image(
//            image: new  NetworkImage(
//                'https://cdn.pixabay.com/photo/2017/02/01/22/02/mountain-landscape-2031539_960_720.jpg'),
//          ),
          Container(
              padding: new EdgeInsets.all(10.0), child: new Text('No teengo idea'))
        ],
      ),
    );
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: card,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        boxShadow: <BoxShadow> [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(1, 3)
          )
        ]
      ),

    );
  }
}
