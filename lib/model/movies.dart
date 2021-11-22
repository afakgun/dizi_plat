import 'movie_model.dart';

class Movies {
  List<Movie>? movies;

  final String error;

  Movies(this.movies, this.error);

  Movies.fromJson(Map<String, dynamic> json)
      : movies = (json["results"] as List)
            .map((i) => new Movie.fromJson(i))
            .toList(),
        error = "";

  Movies.withError(String errorValue)
      // ignore: deprecated_member_use
      : movies = [],
        error = errorValue;
}
