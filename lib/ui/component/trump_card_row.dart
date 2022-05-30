import 'package:flutter/material.dart';
import 'package:myhands/model/TrumpCard.dart';
import 'package:myhands/res/CardRank.dart';
import 'package:myhands/res/CardSuit.dart';
import 'package:myhands/ui/component/set_card_dialog.dart';
import 'package:myhands/ui/component/trump_card_widget.dart';

class TrumpCardRow extends StatefulWidget {
  Function callback;
  String spot;
  List<TrumpCard> cards;

  TrumpCardRow({Key? key, required this.spot, required this.cards, required this.callback}) : super(key: key);
  @override
  _TrumpCardRowState createState() => _TrumpCardRowState();
}

class _TrumpCardRowState extends State<TrumpCardRow> {
  static final List<String> ranks = [
    CardRank.ace,
    CardRank.two,
    CardRank.three,
    CardRank.four,
    CardRank.five,
    CardRank.six,
    CardRank.seven,
    CardRank.eight,
    CardRank.nine,
    CardRank.ten,
    CardRank.jack,
    CardRank.queen,
    CardRank.king
  ];
  static final List<String> suit = [
    CardSuit.spade,
    CardSuit.heart,
    CardSuit.diamond,
    CardSuit.club
  ];


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < widget.cards.length; i++)
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0, top: 10.0, left: 10.0, right: 10.0),
            child: GestureDetector(
              onTap: () async {
                await showDialog(
                  context: context,
                  builder: (context) {
                    return WillPopScope(
                      onWillPop: () async {
                        setState(() {});
                        return true;
                      },
                      child: SetCardDialog(spot: widget.spot, index: i, cards: widget.cards, callback: widget.callback,)
                    );
                  });
              },
              child: TrumpCardWidget(card: widget.cards[i],),
            ),
          )
      ],);
  }
  
}