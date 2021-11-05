class Actor {
  int? id;
  int? gender;
  dynamic popularity;
  String? name;
  String? profilePic;


  Actor();

  Actor.fromJson(Map<String, dynamic> json)
      : gender = json["gender"],
        id = json["id"],
        popularity = json["popularity"],
        name = json["name"],
        profilePic = json["profile_path"];

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['id'] = id;
    map['popularity'] = popularity;
    map['name'] = name;
    map['profile_path'] = profilePic;
    return map;
  }

  Actor.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    popularity = map['popularity'];
    name = map['name'];
    profilePic = map['profile_path'];
  }
}
