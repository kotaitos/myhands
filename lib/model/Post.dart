import 'package:myhands/model/PostField.dart';
import 'package:myhands/model/TrumpCard.dart';
import 'package:myhands/model/TrumpCardField.dart';

class Post {
  String uid = "";
  String post_id = "";

  String title = "";
  String description = "";
  List<TrumpCard> hero = <TrumpCard>[
    TrumpCard("", ""),
    TrumpCard("", ""),
  ];
  List<TrumpCard> frop = <TrumpCard>[
    TrumpCard("", ""),
    TrumpCard("", ""),
    TrumpCard("", ""),
  ];
  List<TrumpCard> turn = [
    TrumpCard("", ""),
  ];
  List<TrumpCard> river = [
    TrumpCard("", ""),
  ];
  String hero_memo = "";
  String frop_memo = "";
  String turn_memo = "";
  String river_memo = "";

  Post();

  load(
    String uid,
    String post_id,
    String title,
    String description,
    List<TrumpCard> hero,
    List<TrumpCard> frop,
    List<TrumpCard> turn,
    List<TrumpCard> river,
    String hero_memo,
    String frop_memo,
    String turn_memo,
    String river_memo
  ) {
    uid = uid;
    post_id = post_id;
    title = title;
    description = description;
    hero = hero;
    frop = frop;
    turn = turn;
    river = river;
    hero_memo = hero_memo;
    frop_memo = frop_memo;
    turn_memo = turn_memo;
    river_memo = river_memo;
  }


  Post.fromMap(Map<String, dynamic> map) {
    uid = map[PostField.uid];
    post_id = map[PostField.post_id];
    title = map[PostField.title];
    description = map[PostField.description];

    hero_memo = map[PostField.hero_memo];
    frop_memo = map[PostField.frop_memo];
    turn_memo = map[PostField.turn_memo];
    river_memo = map[PostField.river_memo];

    if (map[PostField.hero] is List) {
      List l = map[PostField.hero];
      hero = [
        for (int i = 0; i < l.length; i++)
          TrumpCard(l[i][TrumpCardField.rank], l[i][TrumpCardField.suit])
      ];
    }
    if (map[PostField.frop] is List) {
      List l = map[PostField.frop];
      frop = [
        for (int i = 0; i < l.length; i++)
          TrumpCard(l[i][TrumpCardField.rank], l[i][TrumpCardField.suit])
      ];
    }
    if (map[PostField.turn] is List) {
      List l = map[PostField.turn];
      turn = [
        for (int i = 0; i < l.length; i++)
          TrumpCard(l[i][TrumpCardField.rank], l[i][TrumpCardField.suit])
      ];
    }
    if (map[PostField.river] is List) {
      List l = map[PostField.river];
      river = [
        for (int i = 0; i < l.length; i++)
          TrumpCard(l[i][TrumpCardField.rank], l[i][TrumpCardField.suit])
      ];
    }
  }

  toMap() {
    return {
      PostField.uid: uid,
      PostField.post_id: post_id,
      PostField.title: title,
      PostField.description: description,
      PostField.hero: [
        for (int i = 0; i < hero.length; i++)
          hero[i].toJson()
      ],
      PostField.frop: [
        for (int i = 0; i < frop.length; i++)
          frop[i].toJson()
      ],
      PostField.turn: [
        for (int i = 0; i < turn.length; i++)
          turn[i].toJson()
      ],
      PostField.river: [
        for (int i = 0; i < river.length; i++)
          river[i].toJson()
      ],
      PostField.hero_memo: hero_memo,
      PostField.frop_memo: frop_memo,
      PostField.turn_memo: turn_memo,
      PostField.river_memo: river_memo,
    };
  }
}