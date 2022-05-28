class User {
  String uid = "";
  String mail = "";

  User(this.uid, this.mail);

  toJson() {
    return {
      "uid": uid,
      "mail": mail,
    };
  }
}
