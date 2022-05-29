
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myhands/model/Post.dart';
import 'package:myhands/service/firestore.dart';
import 'package:myhands/ui/view/edit.dart';

class PostList extends StatefulWidget {
  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  final String _uid = FirebaseAuth.instance.currentUser?.uid.toString() ?? 'ログインユーザー名取得失敗';
  List<Post> post_list = [];
  bool _loading = true;
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  void initState() {
    super.initState();
    Future(() async {
      final pl = await FirestoreService.getPostList(_uid);
      setState(() {
        post_list = pl;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator())
      );
    }
    return ListView.builder(
      itemCount: post_list.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.black12),
            ),
          ),
          child: ListTile(
            title: Text(post_list[index].title),
            subtitle: Text(post_list[index].description),
            onTap: (){},
          ));
      });
  }
}
