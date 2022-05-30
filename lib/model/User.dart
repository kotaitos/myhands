import 'package:myhands/model/UserField.dart';

class User {
  String uid = "";
  String mail = "";

  User(this.uid, this.mail);

  toJson() {
    return {
      UserField.uid: uid,
      UserField.mail: mail,
    };
  }
}
