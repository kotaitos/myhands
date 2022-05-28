class Profile {
  String uid = "";
  String username = "";
  String nickname = "";
  String profile = "";
  DateTime? birthday;

  Profile(this.uid, this.username, this.nickname, this.profile, this.birthday);

  toJson() {
    return {
      "uid": uid,
      "username": username,
      "nickname": nickname,
      "profile": profile,
      "birthday": birthday,
    };
  }
}