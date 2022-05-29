import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myhands/model/Post.dart';
import 'package:myhands/service/firestore.dart';
import 'package:myhands/ui/component/trump_card.dart';

class Edit extends StatefulWidget {
  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  final String _uid = FirebaseAuth.instance.currentUser?.uid.toString() ?? 'ログインユーザー名取得失敗';
      
  final List<String> ranks = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "T", "J", "Q", "K"];
  final List<String> suit = ["spade", "heart", "diamond", "club"];

  String _title = "";
  String _description = "";

  final List<TrumpCard> _hero = [
    TrumpCard(rank: "", suit: ""),
    TrumpCard(rank: "", suit: ""),
  ];
  String _hero_memo = "";

  final List<TrumpCard> _frop = [
    TrumpCard(rank: "", suit: ""),
    TrumpCard(rank: "", suit: ""),
    TrumpCard(rank: "", suit: ""),
  ];
  String _frop_memo = "";

  TrumpCard _turn = TrumpCard(rank: "", suit: "");
  String _turn_memo = "";

  TrumpCard _river = TrumpCard(rank: "", suit: "");
  String _river_memo = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('新規作成'),
        actions: <Widget>[
          IconButton(
            onPressed: () async {
              await FirestoreService.createPost(Post(_uid, "", _title, _description, _hero, _frop, _turn, _river, _hero_memo, _frop_memo, _turn_memo, _river_memo));
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.check),
          ),
        ],
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Container(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: const [
                    Text(
                      'タイトル',
                      textAlign: TextAlign.left,
                      style: TextStyle(
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
                    maxLines: 3,
                    minLines: 1,
                    onChanged: (text) {
                      setState(() {
                        _title = text;
                      });
                    },
                  ),
                ),
                Row(
                  children: const [
                    Text(
                      '概要',
                      textAlign: TextAlign.left,
                      style: TextStyle(
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
                        _description = text;
                      });
                    },
                  ),
                ),
                Row(
                  children: const [
                    Text(
                      'Your Hand',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 36,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    for (int i = 0; i < _hero.length; ++i)
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
                                  child: AlertDialog(
                                    title: const Text("カードの種類"),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          setState(() {
                                            _hero[i] = TrumpCard(rank: "", suit: "");
                                          });
                                        },
                                        child: const Text('クリア')
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
                                                  setState(() {_hero[i] = TrumpCard(rank: _hero[i].rank, suit: suit[j]);});
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
                                                  setState(() { _hero[i] = TrumpCard(rank: ranks[k], suit: _hero[i].suit);});
                                                },
                                              ),
                                            )
                                        ],)
                                    ],) 
                                  ))
                                );
                              });
                          },
                          child: _hero[i],
                        ),
                      ),
                  ],),
                Row(
                  children: const [
                    Text(
                      'メモ',
                      textAlign: TextAlign.left,
                      style: TextStyle(
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
                        _hero_memo = text;
                      });
                    },
                  ),
                ),
                
                Row(
                  children: const [
                    Text(
                      'Frop',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 36,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    for (int i = 0; i < _frop.length; ++i)
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
                                  child: AlertDialog(
                                    title: const Text("カードの種類"),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          setState(() {
                                            _frop[i] = TrumpCard(rank: "", suit: "");
                                          });
                                        },
                                        child: const Text('クリア')
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
                                                  setState(() {_frop[i] = TrumpCard(rank: _frop[i].rank, suit: suit[j]);});
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
                                                  setState(() { _frop[i] = TrumpCard(rank: ranks[k], suit: _frop[i].suit);});
                                                },
                                              ),
                                            )
                                        ],)
                                    ],) 
                                  ))
                                );
                              });
                          },
                          child: _frop[i],
                        ),
                      )
                  ],),
                Row(
                  children: const [
                    Text(
                      'メモ',
                      textAlign: TextAlign.left,
                      style: TextStyle(
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
                        _frop_memo = text;
                      });
                    },
                  ),
                ),
                
                Row(
                  children: const [
                    Text(
                      'Turn',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 36,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
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
                                child: AlertDialog(
                                  title: const Text("カードの種類"),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          _turn = TrumpCard(rank: "", suit: "");
                                        });
                                      },
                                      child: const Text('クリア')
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
                                                setState(() {_turn = TrumpCard(rank: _turn.rank, suit: suit[j]);});
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
                                                setState(() { _turn = TrumpCard(rank: ranks[k], suit: _turn.suit);});
                                              },
                                            ),
                                          )
                                      ],)
                                  ],) 
                                ))
                              );
                            });
                        },
                        child: _turn,
                      ),
                    )
                  ],),
                Row(
                  children: const [
                    Text(
                      'メモ',
                      textAlign: TextAlign.left,
                      style: TextStyle(
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
                        _turn_memo = text;
                      });
                    },
                  ),
                ),

                Row(
                  children: const [
                    Text(
                      'River',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 36,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
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
                                child: AlertDialog(
                                  title: const Text("カードの種類"),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          _river = TrumpCard(rank: "", suit: "");
                                        });
                                      },
                                      child: const Text('クリア')
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
                                                setState(() {_river = TrumpCard(rank: _river.rank, suit: suit[j]);});
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
                                                setState(() { _river = TrumpCard(rank: ranks[k], suit: _river.suit);});
                                              },
                                            ),
                                          )
                                      ],)
                                  ],) 
                                ))
                              );
                            });
                        },
                        child: _river,
                      ),
                    )
                  ],),
                Row(
                  children: const [
                    Text(
                      'メモ',
                      textAlign: TextAlign.left,
                      style: TextStyle(
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
                        _river_memo = text;
                      });
                    },
                  ),
                ),
              ],
            )
          )
    ));
  }
}