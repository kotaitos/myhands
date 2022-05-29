import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myhands/model/Profile.dart';
import 'package:myhands/model/Post.dart';
import 'package:myhands/ui/component/trump_card.dart';

class FirestoreService {
  static Future<Profile> getUserProfile(String uid) async {
    final profileSnapshot = await FirebaseFirestore.instance
    .collection('users')
    .doc(uid)
    .get();

    Profile profile = Profile(profileSnapshot['uid'], profileSnapshot['username'], profileSnapshot['nickname'], profileSnapshot['profile'], profileSnapshot['birthday'].toDate());
    return profile;
  }

  static Future<List<Post>> getPostList(String uid) async {
    List<Post> post_list = [];
    final postCollectionSnapshots = await FirebaseFirestore.instance
    .collection('users')
    .doc(uid)
    .collection('posts')
    .get();

    for (var doc in postCollectionSnapshots.docs) {
      post_list.add(Post(uid, doc.id, doc["title"], doc["description"], [], [], TrumpCard(rank: "", suit: "",), TrumpCard(rank: "", suit: "",), "", "", "", ""));
    }
    return post_list;
  }

  static createPost(Post post) async {
    await FirebaseFirestore.instance
    .collection('users')
    .doc(post.uid)
    .collection('posts')
    .doc()
    .set(post.toJson());
  }
}