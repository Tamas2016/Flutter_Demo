import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  ThirdPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(widget.title),
      body: _buildGrid(),
//      body:_buildCard,
//      body:Container(
//        child: new Column(
//          children: <Widget>[
//            new Card(
//              child: new Column(
//               children: <Widget>[
//                 Text('sdd')
//               ],
//              ),
//            )
//          ],
//        )
//      ),

      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  var _buildCard = new SizedBox(
//    height: 210.0,
    child: new Card(
      child: new Column(
        children: <Widget>[
          new ListTile(
            title: new Text(
              '1733 Main Street',
              style: new TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: new Text('My City,CA 88390'),
            leading: new Icon(
              Icons.restaurant_menu,
              color: Colors.blue[500],
            ),
          ),
//          new Divider(),
//          new ListTile(
//            title: new Text('(408) 555-1212',
//              style: new TextStyle(fontWeight: FontWeight.w500),
//            ),
//            leading: new Icon(
//              Icons.contact_phone,
//              color: Colors.blue[500],
//            ),
//          ),
//          new ListTile(
//            title: new Text('costa@example.com',
//              style: new TextStyle(fontWeight: FontWeight.w500),
//            ),
//            leading: new Icon(
//              Icons.contact_mail,
//              color: Colors.blue[500],
//            ),
//          ),
        ],
      ),
    ),
  );

  Widget _buildStack = new Stack(
    alignment: const Alignment(0.6, 0.6),
    children: <Widget>[
      new CircleAvatar(
        backgroundImage: new AssetImage('images/gsy_cat.png'),
        radius: 100.0,
      ),
      new Container(
        decoration: new BoxDecoration(
          color: Colors.black45,
        ),
        child: new Text(
          'Mia B',
          style: new TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      )
    ],
  );

  List<Container> _buildGridTileList(int count) {
    return new List<Container>.generate(
        count,
        (int index) => new Container(
              child: new Image.asset('images/gsy_cat.png'),
            ));
  }

  List<Widget> _list = <Widget>[
    new ListTile(
      title: new Text(
        'CineArts at the Empire',
        style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
      ),
      subtitle: new Text('85 W pro Acv'),
      leading: new Icon(
        Icons.theaters,
        color: Colors.blue[500],
      ),
    ),
  ];

  Widget _buildList() {
    return new ListView(
      children: _list,
    );
  }

  Widget _buildGrid() {
    return new GridView.extent(
      maxCrossAxisExtent: 150.0,
      padding: const EdgeInsets.all(4.0),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      children: _buildGridTileList(30),
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
                Icons.share,
                color: Colors.white,
              ),
            ));
  }
}
