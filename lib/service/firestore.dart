import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myhands/model/User.dart';
import 'package:myhands/model/Profile.dart';
import 'package:myhands/model/Post.dart';

class FirestoreService {
  static Future<Profile> getUserProfile(String uid) async {
    final profileSnapshot = await FirebaseFirestore.instance
    .collection('users')
    .doc(uid)
    .get();

    Profile profile = Profile(profileSnapshot['uid'], profileSnapshot['username'], profileSnapshot['nickname'], profileSnapshot['profile'], profileSnapshot['birthday'].toDate());
    return profile;
  }
}