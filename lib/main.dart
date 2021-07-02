import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple APP',
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
    return Row(
      children: <Widget>[
        Container(
          child: IconButton(
            onPressed: _toggleFavorite, 
            icon: (_isFav ? Icon(Icons.favorite) : Icon(Icons.favorite_border)),
            color: Colors.red[500],
          ),
        ),
        SizedBox(
          width: 40,
          child: Container(
            child: Text('$_fav'),
          ),
        ),
      ],
    );
  }

  void _toggleFavorite() {
    setState(() {
      if (_isFav) {
        _isFav = false;
        _fav -= 1;
      } else {
        _isFav = true;
        _fav += 1;
      }
    });
  }

}


class PersonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Kobi Brayan'),
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
                child: _buildRaiting(),
              ),
              Card(
                margin: const EdgeInsets.all(5),
                elevation: 5,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: _buildAction(),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(5),
                child: _buildDescribe(),
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
        'assets/images/player.jpg',
        fit: BoxFit.cover,
      ),
    ),
  );

  Widget _buildRaiting() => ListTile(
    title: Text(
      'Kobi Brayan',
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 18.0,

      ),
    ),
    subtitle: Text('USA, NewYork'),
    trailing: Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        FavoriteWidget()
      ],
    ),
  );

  Widget _buildAction() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      _buildButton('Блокирующий', Icons.star, Colors.black),
      _buildButton('Рост 198 см', Icons.radio_button_checked, Colors.black),
      _buildButton('Возраст 19', Icons.school, Colors.black),
    ],
  );

  Widget _buildButton(
      String label,
      IconData icon, 
      Color color) => Column(
    children: <Widget>[
      Icon(icon, color: Colors.black,),
      Container(
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      )
    ],
  );

  Widget _buildDescribe() => Text(
    'Lonzo Anderson Ball (born October 27, 1997) is an American professional basketball player'
    'for the New Orleans Pelicans of the National Basketball Association (NBA).',
    softWrap: true,
    style: TextStyle(
      fontSize: 17.0,
    ),
  );
}