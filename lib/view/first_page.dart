import 'package:flutter/material.dart';




class FirstPage extends StatefulWidget {
  FirstPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  final _biggerFont = const TextStyle(fontSize: 16.0);


  _displaySnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message),duration: Duration(milliseconds:1000),);
    Scaffold.of(context).showSnackBar(snackBar);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(widget.title),
      body: _buildBody(),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  Widget _buildBody(){
     return new Container(
       padding: const EdgeInsets.all(32.0),
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
           new Icon(Icons.star,
           color: Colors.red,),
           new Text('41'),
         ],
       ),
     );
  }
  
  Widget _buildAppBar(String title){
    return new AppBar(
      title: new Text(title),
    );
  }




  Widget _buildFloatingActionButton(){
    return Builder(
        builder: (context) =>
            FloatingActionButton(
              onPressed: () => {
              },
              tooltip: 'Increment',
              child: Icon(Icons.warning,color: Colors.white,),

            ));
  }
}
