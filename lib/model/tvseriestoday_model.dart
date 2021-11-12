class TvSeriesToday {
  int? id;
  dynamic popularity;
  String? title;
  String? backPoster;
  String? poster;
  String? overview;
  String? language;
  dynamic rating;

  TvSeriesToday();

  TvSeriesToday.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        popularity = json["popularity"],
        title = json["name"],
        backPoster = json["backdrop_path"],
        poster = json["poster_path"],
        overview = json["overview"],
        rating = json["vote_average"],
        language = json["original_language"];

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['id'] = id;
    map['popularity'] = popularity;
    map['name'] = title;
    map['backPoster'] = backPoster;
    map['poster'] = poster;
    map['overview'] = overview;
    map['rating'] = rating;
    map['original_language'] = language;
    return map;
  }

  TvSeriesToday.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    popularity = map['popularity'];
    title = map['name'];
    backPoster = map['backPoster'];
    poster = map['poster'];
    overview = map['overview'];
    rating = map['rating'];
    language = map['original_language'];
  }
}
