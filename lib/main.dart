import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_first_demo/view/first_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
//      home: MyHomePage(title: 'Welcome to Flutter Demo'),
      home: FirstPage(title: 'Welcome to Flutter Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String word = "Hello world";

  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 16.0);
  final _saved = new Set<WordPair>();

  final wordPair = new WordPair.random();

   _incrementCounter() {
    setState(() {
      _counter++;
      word = new WordPair.random().asPascalCase;
      print("===========>> $_counter  ====$word");
    });
  }


  _displaySnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message),duration: Duration(milliseconds:1000),);
    Scaffold.of(context).showSnackBar(snackBar);
  }

  _pushSaved(){
    Navigator.of(context).push(
      new MaterialPageRoute(
          builder: (context){
            final tiles = _saved.map(
                (pair){
                  return new ListTile(
                    title: new Text(
                      pair.asPascalCase,
                      style: _biggerFont,
                    ),
                  );
                },
            );
            final divided = ListTile
                .divideTiles(tiles: tiles, context: context).toList();
            return new Scaffold(
              appBar: new AppBar(title: Text('Save Suggestions'),),
              body: new ListView(children: divided,),
            );
          }
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(widget.title),
      body: _buildSuggestions(),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  
  Widget _buildAppBar(String title){
    return new AppBar(
      title: new Text(title),
      actions: <Widget>[
        new IconButton(
            icon: new Icon(Icons.list),
            onPressed: _pushSaved)
      ],
    );
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved? Icons.favorite : Icons.favorite_border,
        color: alreadySaved?Colors.red:null,
      ),
      onTap: (){
        setState(() {
          if(alreadySaved){
            _saved.remove(pair);
          }else{
            _saved.add(pair);
          }
        });
      },
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(4.0),
      itemBuilder: (context, i) {
        //在每一列之前，添加一个1像素高的分隔线widget
        if (i.isOdd) return new Divider();

        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildFloatingActionButton(){
    return Builder(
        builder: (context) =>
            FloatingActionButton(
              onPressed: () => {
              _displaySnackBar(context, '第 $_counter 个：${_suggestions[_counter].asPascalCase}'),
              _incrementCounter(),

              },
              tooltip: 'Increment',
              child: Icon(Icons.warning,color: Colors.white,),

            ));
  }
}
