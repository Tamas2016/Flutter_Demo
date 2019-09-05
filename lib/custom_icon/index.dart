import 'package:flutter/material.dart';

import 'mock_data.dart';

class CustomIconsDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('自定义Icon'),
      ),
      body:GridView.builder(
        itemCount: iconList.length,

          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),

          itemBuilder: (context,index){
          return Center(
            child: Icon(
              iconList[index],
              size: 30,
              color: Colors.black,
            ),
          );
          }),
    );
  }
}