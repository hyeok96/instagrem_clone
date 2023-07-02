class IUser {
  String? uid;
  String? nickname;
  String? thumbnail;
  String? description;

  IUser({this.uid, this.nickname, this.thumbnail, this.description});

  factory IUser.fromMap(Map<String, dynamic> map) {
    return IUser(
      uid: map["uid"] == null ? "" : map["uid"] as String,
      nickname: map["nickname"] == null ? "" : map["nickname"] as String,
      thumbnail: map["thumbnail"] == null ? "" : map["thumbnail"] as String,
      description:
          map["description"] == null ? "" : map["description"] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'nickname': nickname,
      "thumbnail": thumbnail,
      "description": description
    };
  }

  IUser copyWith({
    String? uid,
    String? nickname,
    String? thumbnail,
    String? description,
  }) {
    return IUser(
      uid: uid ?? this.uid,
      nickname: nickname ?? this.nickname,
      thumbnail: thumbnail ?? this.thumbnail,
      description: description ?? this.description,
    );
  }
}
