import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myhands/model/Post.dart';
import 'package:myhands/service/firestore.dart';
import 'package:myhands/ui/component/overlay_loading.dart';
import 'package:myhands/ui/component/trump_card.dart';

class Edit extends StatefulWidget {
  final String mode;
  Edit({Key? key, required this.mode}) : super(key: key);
  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  static final String _uid = FirebaseAuth.instance.currentUser?.uid.toString() ?? 'ログインユーザー名取得失敗';
      
  static final List<String> ranks = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "T", "J", "Q", "K"];
  static final List<String> suit = ["spade", "heart", "diamond", "club"];


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
          TrumpCard(rank: "", suit: ""),
          TrumpCard(rank: "", suit: ""),
          "",
          "",
          "",
          "");
      });
      post.uid = _uid;
      post.hero = <TrumpCard>[
        TrumpCard(rank: "", suit: ""),
        TrumpCard(rank: "", suit: ""),
      ];
      post.frop = <TrumpCard>[
        TrumpCard(rank: "", suit: ""),
        TrumpCard(rank: "", suit: ""),
        TrumpCard(rank: "", suit: ""),
      ];

      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('新規作成'),
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
                    return const AlertDialog(
                      title: Text("保存しました"),
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
          icon: Icon(Icons.arrow_back_ios),
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
                          post.title = text;
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
                          post.description = text;
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
                      for (int i = 0; i < post.hero.length; ++i)
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
                                              post.hero[i] = TrumpCard(rank: "", suit: "");
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
                                                    setState(() {post.hero[i] = TrumpCard(rank: post.hero[i].rank, suit: suit[j]);});
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
                                                    setState(() {post.hero[i] = TrumpCard(rank: ranks[k], suit: post.hero[i].suit);});
                                                  },
                                                ),
                                              )
                                          ],)
                                      ],) 
                                    ))
                                  );
                                });
                            },
                            child: post.hero[i],
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
                          post.hero_memo = text;
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
                      for (int i = 0; i < post.frop.length; ++i)
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
                                              post.frop[i] = TrumpCard(rank: "", suit: "");
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
                                                    setState(() {post.frop[i] = TrumpCard(rank: post.frop[i].rank, suit: suit[j]);});
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
                                                    setState(() { post.frop[i] = TrumpCard(rank: ranks[k], suit: post.frop[i].suit);});
                                                  },
                                                ),
                                              )
                                          ],)
                                      ],) 
                                    ))
                                  );
                                });
                            },
                            child: post.frop[i],
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
                          post.frop_memo = text;
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
                                            post.turn = TrumpCard(rank: "", suit: "");
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
                                                  setState(() {post.turn = TrumpCard(rank: post.turn.rank, suit: suit[j]);});
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
                                                  setState(() { post.turn = TrumpCard(rank: ranks[k], suit: post.turn.suit);});
                                                },
                                              ),
                                            )
                                        ],)
                                    ],) 
                                  ))
                                );
                              });
                          },
                          child: post.turn,
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
                          post.turn_memo = text;
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
                                            post.river = TrumpCard(rank: "", suit: "");
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
                                                  setState(() {post.river = TrumpCard(rank: post.river.rank, suit: suit[j]);});
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
                                                  setState(() { post.river = TrumpCard(rank: ranks[k], suit: post.river.suit);});
                                                },
                                              ),
                                            )
                                        ],)
                                    ],) 
                                  ))
                                );
                              });
                          },
                          child: post.river,
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