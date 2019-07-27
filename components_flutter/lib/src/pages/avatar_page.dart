import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Avatar'),
        actions: <Widget>[
          Container(
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://pbs.twimg.com/media/CJj5n4QWUAAcLhQ.png'),
              radius: 25.0,
            ),
            padding: EdgeInsets.all(5.0),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('LS'),
              backgroundColor: Colors.brown,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage('https://i.pinimg.com/474x/66/fc/b1/66fcb132daa68cd48fd42a233bc90efe.jpg'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
    );
  }
}