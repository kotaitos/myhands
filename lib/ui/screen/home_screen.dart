import 'package:myhands/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myhands/ui/view/edit.dart';
import 'package:myhands/ui/view/post_list.dart';

// [Themelist] インスタンスにおける処理。
class HomeScreen extends StatelessWidget {
  final String _uid =
      FirebaseAuth.instance.currentUser?.uid.toString() ?? 'ログインユーザー名取得失敗';

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context)!;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0, top: 20.0, left: 20.0, right: 10.0),
              child: Container(
                width: double.infinity,
                child: Row(children: [
                  const Text(
                    'あなたのメモ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 36,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  TextButton.icon(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute<void>(
                        builder: (BuildContext context) {
                          return Edit();
                        },
                      ));
                    },
                    label: const Text('新規メモ'),
                    icon: const Icon(Icons.edit),
                  )
                ]),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 0.0, top: 10.0, left: 20.0, right: 20.0),
                child: Container(
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: PostList(),
                )
              )
            )
          ],
        ),
      )
    );
  }
}
