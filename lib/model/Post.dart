class Post {
  String uid = "";
  String content = "";

  Post(this.uid, this.content);

  toJson() {
    return {
      "uid": uid,
      "content": content,
    };
  }
}