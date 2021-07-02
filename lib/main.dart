import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample APP',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: PersonWidget(),
    );
  }
}


class FavoriteWidget extends StatefulWidget {
  
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {


  bool _isFav = false;
  int _fav = 432;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('TEXT'),
    );
  }
}


class PersonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Japony'),
      ),
      body: Container(
        child: _buildMainColumn(),
      ),
    );
  }

  Widget _buildMainColumn() => ListView(
    children: [
      _buildTopImage(),
      Center(
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(5),
                child: Text('Raiting'),
              ),
              Card(
                margin: const EdgeInsets.all(5),
                elevation: 5,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Text('Buttons'),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(5),
                child: Text('DEscribe'),
              ),
            ],
          ),
        ),
      ),
    ],
  );

  Widget _buildTopImage() => Container(
    child: Card(
      margin: const EdgeInsets.only(
        left: 20, 
        right: 20, 
        top: 20,
      ),
      elevation: 5,
      child: Image.asset(
        'assets/images/img2.jpg',
        fit: BoxFit.cover,
      ),
    ),
  );
}