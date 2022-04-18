class CastList {
  String? name;
  
  String? character;
  String? profilePath;
  String? poster;
  String? overview;
  dynamic rating;

  CastList();

  CastList.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        character = json["character"],
        profilePath = json["profile_path"],


        overview = json["overview"],
        rating = json["vote_average"];

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['name'] = name;
    map['character'] = character;
    map['profile_path'] = profilePath;
    
    
    map['overview'] = overview;
    map['rating'] = rating;
    return map;
  }

  CastList.fromMap(Map<String, dynamic> map) {
    name = map['name'];
    character = map['character'];
    profilePath = map['profile_path'];

  overview = map['overview'];
    rating = map['rating'];
  }
}
