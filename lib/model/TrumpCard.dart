import 'package:myhands/model/TrumpCardField.dart';

class TrumpCard {
  String suit = "";
  String rank = "";

  TrumpCard(this.suit, this.rank);

  toJson() {
    return {
      TrumpCardField.suit: suit,
      TrumpCardField.rank: rank,
    };
  }
}