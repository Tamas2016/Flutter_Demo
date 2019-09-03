import 'package:flutter/material.dart';
import 'package:flutter_first_demo/view/basic_widget/CreditCard.dart';
import 'package:flutter_first_demo/view/basic_widget/friend_circle.dart';
import 'package:flutter_first_demo/view/basic_widget/mock_data.dart';
import 'package:flutter_first_demo/view/basic_widget/pet_card.dart';

class NormalList extends StatelessWidget {
  const NormalList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        CreditCard(data: creditCardData),
        PetCard(data: petCardData),
        FriendCircle(data: friendCircleData),
      ],
    );
  }
}