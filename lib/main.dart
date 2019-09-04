import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_demo/view/first_page.dart';
import 'package:flutter_first_demo/view/grid_view/index.dart';
import 'package:flutter_first_demo/view/list_view/index.dart';
import 'package:flutter_first_demo/view/second_page.dart';
import 'package:flutter_first_demo/view/third_page.dart';

import 'view/basic_widget/index.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        'basic_widgets':(context)=>BasicWidgetsDemo(),
        'list_view':(context)=>ListViewDemo(),
        'grid_view':(context)=>GridViewDemo(),
        'custom_icons':(context)=>BasicWidgetsDemo(),
      },
    );
  }
}





//颜色
const List<Color> COLORS = [
  Color(0xFFFF4777),
  Color(0xFFCA6924),
  Color(0xFF00BC12),
  Color(0xFF725E82),
  Color(0xFFFFA400),
  Color(0xFFDD7160),
  Color(0xFF5D513C),
  Color(0xFFD180D2),
];


const DEMOS = [

  Demo(
    title: '基础组件',
    description: '容器、行、列、文字、图片、图标等最常用组件，是构成界面的基础',
    routeName: 'basic_widgets',
  ),

  Demo(
    title: 'ListView组件',
    description: '滚动型容器列表组件，支持下拉刷新，上拉加载等交互操作',
    routeName: 'list_view',
  ),
  Demo(
    title: 'GridView组件',
    description: '网格布局，支持自定义每行显示的列数以及每一格的宽高比例',
    routeName: 'grid_view',
  ),
  Demo(
    title: '自定义Icon图标',
    description: '下载ttf字体文件，fonts声明，根据unicode码对照生成语义的图标类型',
    routeName: 'custom_icons',
  ),
  Demo(
    title: 'Sliver系列组件',
    description: '自定义高级滚动组件，float、snap、pinned效果任你组合',
    routeName: 'sliver_widgets',
  ),
];


class Demo {
  /// 标题
  final String title;

  /// 描述
  final String description;

  /// 路由名
  final String routeName;

  const Demo({
    this.title,
    this.description,
    this.routeName,
  });
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        centerTitle:  true,
        title: Text('Flutter Training'),
      ),
      body: GridView.builder(
        itemCount: DEMOS.length,
          padding: EdgeInsets.all(16),
          //控制子widget layout的委托
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //横轴数量 这里的横轴就是x轴
              crossAxisCount:2,
            //横轴间隔
            crossAxisSpacing: 6.0,
            //主轴间隔
            mainAxisSpacing: 16.0,
              //宽高比为1时，子widget
            childAspectRatio: 1.0
          ),
          itemBuilder: (context,index){
            return FlatButton(
              onPressed: ()=>Navigator.pushNamed(context, DEMOS[index].routeName),
              color: COLORS[index%COLORS.length],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text(
                      DEMOS[index].title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      DEMOS[index].description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70,
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }



}


//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Flutter Demo',
//      theme: ThemeData(
//        primarySwatch: Colors.lightBlue,
//      ),
//      home: MyHomePage(title: 'Welcome to Flutter Demo'),
////      home: FirstPage(title: 'Welcome to First Demo'),
////      home: SecondPage(title: 'Welcome to Second Demo'),
////      home: ThirdPage(title: 'Welcome to Second Demo'),
//    );
//  }
//}

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
