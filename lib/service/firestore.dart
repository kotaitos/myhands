import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myhands/model/Profile.dart';
import 'package:myhands/model/Post.dart';

class FirestoreService {
  static Future<Profile> getUserProfile(String uid) async {
    final profileSnapshot = await FirebaseFirestore.instance
    .collection('users')
    .doc(uid)
    .get();

    Profile profile = Profile.fromMap(profileSnapshot.data());
    return profile;
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getPostStream(String uid) {
    final postCollectionSnapshots = FirebaseFirestore.instance
    .collection('users')
    .doc(uid)
    .collection('posts')
    .snapshots();
    return postCollectionSnapshots;
  }

  static createPost(Post post) async {
    DocumentReference<Map<String, dynamic>> document = await FirebaseFirestore.instance
    .collection('users')
    .doc(post.uid)
    .collection('posts')
    .doc();

    post.post_id = document.id;
    document.set(post.toMap());
  }
}