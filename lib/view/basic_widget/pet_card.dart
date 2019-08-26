import 'package:flutter/material.dart';

class PetCard extends StatelessWidget{

  final PetCardViewModel data;

  const PetCard({
    Key key,
    this.data,
  }) : super(key: key);


 Widget renderCover() {
   return Stack(
    fit: StackFit.passthrough,
     children: <Widget>[
       ClipRRect(
         borderRadius: BorderRadius.only(
           topLeft: Radius.circular(8),
           topRight: Radius.circular(8),
         ),
         child: Image.network(
           data.coverUrl,
           height: 200,
           fit: BoxFit.fitWidth,
         ),
       ),
       Positioned(
           left: 0,
           top: 100,
           right: 0,
           bottom: 0,
           child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Color.fromARGB(0, 0, 0, 0),
                Color.fromARGB(80, 0, 0, 0),
              ])
            ),
       ))
     ],
   );
 }


  @override
  Widget build(BuildContext context) {
    return new Container(
      margin:  EdgeInsets.fromLTRB(16, 16, 16, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            blurRadius: 6,
            spreadRadius: 4,
            color: Color.fromARGB(20, 0, 0, 0),
          )
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
        this.renderCover(),
        ],
      ),
    );
  }



}



class PetCardViewModel {
  /// 封面地址
  final String coverUrl;

  /// 用户头像地址
  final String userImgUrl;

  /// 用户名
  final String userName;

  /// 用户描述
  final String description;

  /// 话题
  final String topic;

  /// 发布时间
  final String publishTime;

  /// 发布内容
  final String publishContent;

  /// 回复数量
  final int replies;

  /// 喜欢数量
  final int likes;

  /// 分享数量
  final int shares;

  const PetCardViewModel({
    this.coverUrl,
    this.userImgUrl,
    this.userName,
    this.description,
    this.topic,
    this.publishTime,
    this.publishContent,
    this.replies,
    this.likes,
    this.shares,
  });
}