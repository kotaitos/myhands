import 'package:myhands/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myhands/model/Profile.dart';
import 'package:myhands/service/firestore.dart';

class AccountsScreen extends StatefulWidget {
  @override
  _AccountsScreenState createState() => _AccountsScreenState();
}

class _AccountsScreenState extends State<AccountsScreen> {
  bool loading = true;
  String _uid = "";
  Profile? _profile;

  @override
  void initState() {
    super.initState();
    setState(() {
      _uid = FirebaseAuth.instance.currentUser?.uid.toString() ?? 'ログインユーザー名取得失敗';
    });
    Future(() async {
      final Profile profile = await FirestoreService.getUserProfile(_uid);
      setState(() {
        _profile = profile;
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context)!;
    if (loading) {
      return Container(
        width: double.infinity,
        decoration: new BoxDecoration(
          color: Color.fromRGBO(0, 0, 0, 0.6),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.white)),
          ],
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: Column(mainAxisSize: MainAxisSize.max, children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0, top: 50.0, left: 10.0, right: 25.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0, top: 10.0, left: 10.0, right: 10.0),
                      child: Column(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.logout),
                            onPressed: () async {
                              await showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text(l10n.ui__accounts__popup1__to_logout),
                                    actions: <Widget>[
                                      TextButton(
                                          child: Text(l10n.ui__accounts__popup1__cancel),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          }),
                                      TextButton(
                                          child: Text(l10n.ui__accounts__popup1__ok),
                                          onPressed: () {
                                            FirebaseAuth.instance.signOut();
                                            Navigator.of(context).pushNamed("/signin");
                                          }),
                                    ],
                                  );
                                });
                            },
                          ),
                          const Text(
                            'ログアウト',
                            style: TextStyle(
                              fontSize: 8,
                              color: Colors.black87,
                            ),
                            )
                        ],
                        ),
                    )
                  ],
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0, top: 50.0),
              child: Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                ),
              )
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Text('@' + _profile!.username),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    _profile!.nickname,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              )
            ),
          ]),
        ),
      );
    }
  }
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
