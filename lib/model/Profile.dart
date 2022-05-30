import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myhands/model/ProfileField.dart';

class Profile {
  String uid = "";
  String username = "";
  String nickname = "";
  String profile = "";
  DateTime? birthday;

  Profile(this.uid, this.username, this.nickname, this.profile, this.birthday);

  Profile.fromMap(Map<String, dynamic>? map) {
    uid = map![ProfileField.uid];
    username = map[ProfileField.username];
    nickname = map[ProfileField.nickname];
    profile = map[ProfileField.profile];
    if (map[ProfileField.birthday] is Timestamp) {
      birthday = map[ProfileField.birthday].toDate();
    }
  }

  toJson() {
    return {
      ProfileField.uid: uid,
      ProfileField.username: username,
      ProfileField.nickname: nickname,
      ProfileField.profile: profile,
      ProfileField.birthday: birthday,
    };
  }
}