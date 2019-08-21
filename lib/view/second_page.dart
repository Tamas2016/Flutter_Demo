import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  SecondPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SecondPageState createState() => _SecondPageState();
}


var descTextStyle = new TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w800,
  fontFamily: 'Roboto',
  letterSpacing: 0.5,
  fontSize: 18.0,
  height: 2.0,
);

 var ratings = new Container(
  padding: new EdgeInsets.all(8.0),
  child: new Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      new Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new Icon(Icons.star, color: Colors.black,),
          new Icon(Icons.star, color: Colors.black,),
          new Icon(Icons.star, color: Colors.black,),
          new Icon(Icons.star, color: Colors.black,),
          new Icon(Icons.star, color: Colors.black,),
        ],
      ),
      new Text('160 Reviews', style: new TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w800,
        fontFamily: 'Roboto',
        letterSpacing: 0.5,
        fontSize: 20.0,
      ),
      ),
    ],
  ),
);
 
 // DefaultTextStyle.merge可以允许您创建一个默认的文本样式，该样式会被其所有的子节点继承
 var iconList = DefaultTextStyle.merge(
     style: descTextStyle,
     child: new Container(
       padding: new EdgeInsets.all(20.0),
       child: new Row(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: <Widget>[
           new Column(
             children: <Widget>[
               new Icon(Icons.kitchen,color: Colors.green[500],),
               new Text('PREP:'),
               new Text('25 min'),
             ],
           ),
           new Column(
             children: <Widget>[
               new Icon(Icons.timer,color: Colors.green[500],),
               new Text('COOK:'),
               new Text('1 hr'),
             ],
           ),
           new Column(
             children: <Widget>[
               new Icon(Icons.restaurant,color: Colors.green[500],),
               new Text('FEEDS:'),
               new Text('4-6'),
             ],
           ),
         ],
       ),
     ),
 );

class _SecondPageState extends State<SecondPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(widget.title),
      body: _buildWidget(),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  Widget _buildWidget() {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: new Column(
        children: <Widget>[
          Text(
            'Stawberry Pavlova',
            style: TextStyle(
              fontSize: 32.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Kandersteg, Switzerland Kandersteg,  Kandersteg, you can pass the color as the `color` argument to the,',
            softWrap: true,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          ratings,
          iconList,
          _mainImage
        ],
      ),
    );
  }






  Widget _mainImage = new Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      new Expanded(
        child:
          new Container(
            decoration: new BoxDecoration(
              border: new Border.all(width: 10.0,color: Colors.black38),
              borderRadius:
              const BorderRadius.all(
                const Radius.circular(8.0),)
            ),
            margin: const EdgeInsets.all(4.0),
            child: new Image.asset('images/gsy_cat.png'),
          )
      ),
      new Expanded(
          child:
          new Container(
            decoration: new BoxDecoration(
                border: new Border.all(width: 10.0,color: Colors.black38),
                borderRadius:
                const BorderRadius.all(
                  const Radius.circular(8.0),)
            ),
            margin: const EdgeInsets.all(4.0),
            child: new Image.asset('images/nothing.png'),
          )
      ),

    ],
  );



  Column _buildButtonColumn(IconData icon, String label) {
    Color color = Theme.of(context).primaryColor;
    return new Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Icon(
          icon,
          color: color,
        ),
        new Container(
          margin: const EdgeInsets.only(top: 8.0),
          child: new Text(
            label,
            style: new TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
              color: color,
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
                Icons.share,
                color: Colors.white,
              ),
            ));
  }
}
