import 'package:flutter/material.dart';

import 'friend_card.dart';
import 'mock_data.dart';

class FriendList extends StatelessWidget {
  const FriendList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return FriendCard(data: friendList[index]);
      },
      separatorBuilder: (context, index) {
        return Divider(
          height: 0.5,
            indent: 75,
          color: Color(0xFFDDDDDD),
        );
      },
      itemCount: friendList.length,
    );
  }
}
