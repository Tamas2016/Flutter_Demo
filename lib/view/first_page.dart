import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  FirstPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  _displaySnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: Duration(milliseconds: 1000),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(widget.title),
      body: _buildWidget(),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  Widget _buildWidget() {
    return ListView(
      children: <Widget>[
        new Image.asset(
          'images/gsy_cat.png',
          width: 600.0,
          height: 240.0,
          fit: BoxFit.cover,
        ),
        _titleSection,
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildButtonColumn(Icons.call, 'CALL'),
            _buildButtonColumn(Icons.near_me, 'ROUTE'),
            _buildButtonColumn(Icons.share, 'SHARE'),
          ],
        ),
        Container(
          padding: const EdgeInsets.all(32.0),
          child: new Text(
            'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake,'
                ' which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.',
            softWrap: true,

          ),
        )
      ],
    );
  }

  Widget _titleSection = new Container(
    padding: const EdgeInsets.all(24.0),
    child: new Row(
      children: <Widget>[
        new Expanded(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: new Text(
                  'Oeschinen Lake Campground',
                  style: new TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              new Text(
                'Kandersteg, Switzerland',
                style: new TextStyle(
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ),
        new Icon(
          Icons.star,
          color: Colors.red,
        ),
        new Text('40'),
      ],
    ),
  );




  Column _buildButtonColumn(IconData icon ,String label) {
    Color color = Theme.of(context).primaryColor;
    return new Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Icon(icon,color:  color,),
        new Container(
          margin: const EdgeInsets.only(top: 8.0),
          child: new Text(
            label,
            style: new TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
              color:  color,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildAppBar(String title) {
    return new AppBar(
      title: new Text(title),
    );
  }

  Widget _buildFloatingActionButton() {
    return Builder(
        builder: (context) => FloatingActionButton(
              onPressed: () => {},
              tooltip: 'Increment',
              child: Icon(
                Icons.warning,
                color: Colors.white,
              ),
            ));
  }
}
