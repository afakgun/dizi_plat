class MovieDetail {
  int? id;
  dynamic popularity;
  String? title;
  String? backPoster;
  String? poster;
  String? overview;
  dynamic rating;

  MovieDetail();

  MovieDetail.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        popularity = json["popularity"],
        title = json["title"],
        backPoster = json["backdrop_path"],
        poster = json["poster_path"],
        overview = json["overview"],
        rating = json["vote_average"];

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['id'] = id;
    map['popularity'] = popularity;
    map['title'] = title;
    map['backPoster'] = backPoster;
    map['poster'] = poster;
    map['overview'] = overview;
    map['rating'] = rating;
    return map;
  }

  MovieDetail.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    popularity = map['popularity'];
    title = map['title'];
    backPoster = map['backPoster'];
    poster = map['poster'];
    overview = map['overview'];
    rating = map['rating'];
  }
}
