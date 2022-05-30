import 'package:flutter/material.dart';
import 'package:myhands/model/TrumpCard.dart';
import 'package:myhands/model/TrumpCardField.dart';

class TrumpCardWidget extends StatelessWidget {
  TrumpCard card;
  TrumpCardWidget({Key? key, required this.card}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (card.rank != "" && card.suit != "") {
      return Image.asset('assets/card1/${card.suit}${card.rank}.png', height: 150, width: 105);
    } else {
      return Image.asset('assets/card1/brank.png', height: 150, width: 105);
    }
  }
}