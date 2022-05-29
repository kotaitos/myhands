import 'package:myhands/ui/component/trump_card.dart';

class Post {
  String uid = "";
  String post_id = "";

  String title = "";
  String description = "";
  List<TrumpCard> hero = [];
  List<TrumpCard> frop = [];
  TrumpCard turn = TrumpCard(rank: "", suit: "");
  TrumpCard river = TrumpCard(rank: "", suit: "");
  String hero_memo = "";
  String frop_memo = "";
  String turn_memo = "";
  String river_memo = "";

  Post(this.uid, this.post_id, this.title, this.description, this.hero, this.frop, this.turn, this.river, this.hero_memo, this.frop_memo, this.turn_memo, this.river_memo);

  toJson() {
    return {
      "uid": uid,
      "title": title,
      "description": description,
      "hero": [
        for (int i = 0; i < hero.length; i++)
          hero[i].toJson()
      ],
      "frop": [
        for (int i = 0; i < frop.length; i++)
          frop[i].toJson()
      ],
      "turn": turn.toJson(),
      "river": river.toJson(),
      "hero_memo": hero_memo,
      "frop_memo": frop_memo,
      "turn_memo": turn_memo,
      "river_memo": river_memo,
    };
  }
}