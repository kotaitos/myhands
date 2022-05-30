import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myhands/l10n/l10n.dart';
import 'package:myhands/model/Post.dart';
import 'package:myhands/model/TrumpCard.dart';
import 'package:myhands/res/Spot.dart';
import 'package:myhands/service/firestore.dart';
import 'package:myhands/ui/component/overlay_loading.dart';
import 'package:myhands/ui/component/trump_card_row.dart';

class Edit extends StatefulWidget {
  final String mode;
  const Edit({Key? key, required this.mode}) : super(key: key);
  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  static final String _uid = FirebaseAuth.instance.currentUser?.uid.toString() ?? 'ログインユーザー名取得失敗';

  static Post post = Post();

  static bool loading = true;

  @override
  void initState() {
    super.initState();
    if (widget.mode == 'create') {
      setState(() {
        post.load(
          "",
          "",
          "",
          "",
          <TrumpCard>[],
          <TrumpCard>[],
          <TrumpCard>[],
          <TrumpCard>[],
          "",
          "",
          "",
          "");
      });
      post.uid = _uid;
      post.hero = <TrumpCard>[
        TrumpCard("", ""),
        TrumpCard("", ""),
      ];
      post.frop = <TrumpCard>[
        TrumpCard("", ""),
        TrumpCard("", ""),
        TrumpCard("", ""),
      ];
      post.turn = <TrumpCard>[
        TrumpCard("", ""),
      ];
      post.river = <TrumpCard>[
        TrumpCard("", ""),
      ];

      setState(() {
        loading = false;
      });
    }
  }

  setCard(String key, int index, TrumpCard card) {
    if (key == Spot.hero) {
      setState(() {
        post.hero[index] = card;
      });
    } else if (key == Spot.frop) {
      setState(() {
        post.frop[index] = card;
      });
    } else if (key == Spot.turn) {
      setState(() {
        post.turn[index] = card;
      });
    } else if (key == Spot.river) {
      setState(() {
        post.river[index] = card;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.ui__view__edit__app_bar_title),
        actions: <Widget>[
          IconButton(
            onPressed: () async {
              if (widget.mode == 'create') {
                setState(() {
                  loading = true;
                });
                await FirestoreService.createPost(post);
                setState(() {
                  loading = false;
                });
                await showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(l10n.ui__view__edit__saved),
                      actions: [],
                    );
                  });
                Navigator.of(context).pop();
              }
            },
            icon: const Icon(Icons.check),
          ),
        ],
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        l10n.ui__view__edit__title,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0, top: 0.0, left: 0.0, right: 0.0),
                    child: TextField(
                      maxLines: 1,
                      minLines: 1,
                      onChanged: (text) {
                        setState(() {
                          post.title = text;
                        });
                      },
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        l10n.ui__view__edit__description,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0, top: 0.0, left: 0.0, right: 0.0),
                    child: TextField(
                      maxLines: 10,
                      minLines: 1,
                      onChanged: (text) {
                        setState(() {
                          post.description = text;
                        });
                      },
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        l10n.ui__view__edit__hero,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 36,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  TrumpCardRow(spot: Spot.hero, cards: post.hero, callback: setCard),
                  Row(
                    children: [
                      Text(
                        l10n.ui__view__edit__memo,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0, top: 0.0, left: 0.0, right: 0.0),
                    child: TextField(
                      maxLines: 100,
                      minLines: 1,
                      onChanged: (text) {
                        setState(() {
                          post.hero_memo = text;
                        });
                      },
                    ),
                  ),
                  
                  Row(
                    children: [
                      Text(
                        l10n.ui__view__edit__frop,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 36,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  TrumpCardRow(spot: Spot.frop, cards: post.frop, callback: setCard),
                  Row(
                    children: [
                      Text(
                        l10n.ui__view__edit__memo,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0, top: 0.0, left: 0.0, right: 0.0),
                    child: TextField(
                      maxLines: 100,
                      minLines: 1,
                      onChanged: (text) {
                        setState(() {
                          post.frop_memo = text;
                        });
                      },
                    ),
                  ),
                  
                  Row(
                    children: [
                      Text(
                        l10n.ui__view__edit__turn,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 36,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  TrumpCardRow(spot: Spot.turn, cards: post.turn, callback: setCard),
                  Row(
                    children: [
                      Text(
                        l10n.ui__view__edit__memo,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0, top: 0.0, left: 0.0, right: 0.0),
                    child: TextField(
                      maxLines: 100,
                      minLines: 1,
                      onChanged: (text) {
                        setState(() {
                          post.turn_memo = text;
                        });
                      },
                    ),
                  ),

                  Row(
                    children: [
                      Text(
                        l10n.ui__view__edit__river,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 36,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  TrumpCardRow(spot: Spot.river, cards: post.river, callback: setCard),
                  Row(
                    children: [
                      Text(
                        l10n.ui__view__edit__memo,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0, top: 0.0, left: 0.0, right: 0.0),
                    child: TextField(
                      maxLines: 100,
                      minLines: 1,
                      onChanged: (text) {
                        setState(() {
                          post.river_memo = text;
                        });
                      },
                    ),
                  ),
                ],
              )
            )
          ),
          OverlayLoadingMolecules(visible: loading),
        ],
        )
      );
  }
}