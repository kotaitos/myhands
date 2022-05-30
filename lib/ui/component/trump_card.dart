import 'package:flutter/material.dart';

class TrumpCard extends StatelessWidget {
  String rank = "";
  String suit = "";
  TrumpCard({Key? key, required this.rank, required this.suit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (rank != "" && suit != "") {

      return Image.asset('assets/card1/${suit}${rank}.png', height: 150, width: 105);
    } else {
      return Image.asset('assets/card1/brank.png', height: 150, width: 105);
    }
  }

  setSuit(String suit) {
    this.suit = suit;
  }

  setRank(String rank) {
    this.rank = rank;
  }

  toJson() {
    return {
      "suit": suit,
      "rank": rank,
    };
  }
}