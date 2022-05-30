import 'package:flutter/material.dart';
import 'package:myhands/l10n/l10n.dart';
import 'package:myhands/model/TrumpCard.dart';
import 'package:myhands/res/CardRank.dart';
import 'package:myhands/res/CardSuit.dart';
import 'package:myhands/ui/component/trump_card_widget.dart';

class SetCardDialog extends StatefulWidget {
  Function callback;
  String spot;
  int index;
  List<TrumpCard> cards;

  SetCardDialog({Key? key, required this.spot, required this.index, required this.cards, required this.callback}) : super(key: key);
  @override
  _SetCardDialogState createState() => _SetCardDialogState();
}

class _SetCardDialogState extends State<SetCardDialog> {
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
    final l10n = L10n.of(context)!;
    return AlertDialog(
      title: Text(l10n.ui__component__set_card_dialog__title),
      actions: [
        TextButton(
          onPressed: () {
            setState(() {
              widget.callback(widget.spot, widget.index, TrumpCardWidget(card: TrumpCard("", "")));
            });
          },
          child: Text(l10n.ui__component__set_card_dialog__clear)
        )
      ],
      content: SingleChildScrollView(
        child: Column(children: <Widget>[
          Row(children: [
            for (int j = 0; j < suit.length; j++)
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0, top: 10.0, left: 10.0, right: 10.0),
                child: GestureDetector(
                  child: Image.asset('assets/card1/${suit[j]}.png', height: 50, width: 50,),
                  onTap: (){
                    setState(() {
                      widget.callback(widget.spot, widget.index, TrumpCard(suit[j], widget.cards[widget.index].rank));
                    });
                  },
                ),
              )
          ],),
          Wrap(children: [
            for (int k = 0; k < ranks.length; k++)
              Padding(
                padding: const EdgeInsets.only(bottom: 0.0, top: 0.0, left: 0.0, right: 0.0),
                child: TextButton(
                  child: Text(ranks[k], style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  onPressed: (){
                    setState(() {
                      widget.callback(widget.spot, widget.index, TrumpCard(widget.cards[widget.index].suit, ranks[k]));
                    });
                  },
                ),
              )
          ],)
      ],) 
    ));
  }
}
