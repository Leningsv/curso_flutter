import 'dart:async';

import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() {
    return new _ListViewPageState();
  }
}

class _ListViewPageState extends State<ListViewPage> {
  ScrollController _scrollController;
  List<int> _numbers;
  int _lastImage;
  bool _isLoading;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Listas'),
        ),
        body: Stack(
          children: <Widget>[
            this._createList(),
            this._createLoading()],
        ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._initVariables();
    this._addImages(10);
    this._scrollController.addListener(() {
      print('SCROLL');
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // this._addImages(10);
        this._loadData();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    this._scrollController.dispose();
  }

  void _initVariables() {
    this._numbers = new List<int>();
    this._lastImage = 0;
    this._scrollController = new ScrollController();
    this._isLoading = false;
  }

  Widget _createList() {
    return RefreshIndicator(
      onRefresh: this._getInitImages,
      child: ListView.builder(
        controller: this._scrollController,
        itemCount: this._numbers.length,
        itemBuilder: (BuildContext context, int index) {
          final _images = _numbers[index];
          return FadeInImage(
            image: NetworkImage('https://picsum.photos/500/400?image=$_images'),
            placeholder: AssetImage('assets/jar-loading.gif'),
          );
        },
      ),
    );
  }

  void _addImages(int numberImages) {
    for (int i = 0; i < numberImages; i++) {
      this._lastImage++;
      this._numbers.add(_lastImage);
    }
    this.setState(() => {});
  }

  Future<Null> _loadData() {
    this._isLoading = true;
    setState(() {});
    final duration = new Duration(seconds: 2);
    new Timer(duration, responseHttp);
    return null;
  }

  void responseHttp() {
    this._isLoading = false;
    this._scrollController.animateTo(
        this._scrollController.position.pixels + 100,
        duration: Duration(microseconds: 250),
        curve: Curves.fastOutSlowIn
    );
    this._addImages(10);
  }

  Widget _createLoading() {
    if (this._isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(height: 15,)
        ],
      );
    } else {
      return Container();
    }
  }

  Future<Null> _getInitImages() async {
    final duration = new Duration(seconds: 2);
    new Timer(duration, () {
      this._numbers.clear();
      this._lastImage ++;
      this._addImages(10);
    });
    return Future.delayed(duration);
  }
}
