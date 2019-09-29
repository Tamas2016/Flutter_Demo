import 'package:flutter/material.dart';

class ThemeWidgetsDemo extends StatefulWidget {
  @override
  _ThemeWidgetsDemoState createState() => _ThemeWidgetsDemoState();
}

class _ThemeWidgetsDemoState extends State<ThemeWidgetsDemo> {


  Color _themeColor = Colors.teal; //当前路由主题色
  double _top = 0.0;
  String _operation = "No Gesture detected!";
  double _width = 200.0; //通过修改图片宽度来达到缩放效果

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Theme(
      data: ThemeData(
          primarySwatch: _themeColor, //用于导航栏、FloatingActionButton的背景色等
          iconTheme: IconThemeData(color: _themeColor) //用于Icon颜色
      ),
      child: Scaffold(
        appBar: AppBar(title: Text("主题测试")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //第一行Icon使用主题中的iconTheme
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.favorite),
                  Icon(Icons.airport_shuttle),
                  Text("  颜色跟随主题")
                ]
            ),
            //为第二行Icon自定义颜色（固定为黑色)
            Theme(
              data: themeData.copyWith(
                iconTheme: themeData.iconTheme.copyWith(
                    color: Colors.black
                ),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.favorite),
                    Icon(Icons.airport_shuttle),
                    Text("  颜色固定黑色")
                  ]
              ),
            ),
            GestureDetector(
              child: Container(
                alignment: Alignment.center,
                color: _themeColor,
                width: 200.0,
                height: 100.0,
                child: Text(
                  _operation,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              onTap: () =>   updateText("Tap"),//点击
              onDoubleTap: () => updateText("DoubleTap"), //双击
              onLongPress: () => updateText("LongPress"), //长按
            ),
            GestureDetector(
              child: Image.asset("images/gsy_cat.png",width: _width,),
              onScaleUpdate: (ScaleUpdateDetails details){
                setState(() {
                  //缩放倍数在0.8到10倍之间
                  _width=200*details.scale.clamp(.8, 10.0);
                });
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () =>  //切换主题
            setState(() =>
            _themeColor =
            _themeColor == Colors.teal ? Colors.blue : Colors.teal
            ),
            child: Icon(Icons.palette)
        ),
      ),
    );
  }

  void updateText(String text){
    setState(() {
      _operation = text;
    });
  }

}
