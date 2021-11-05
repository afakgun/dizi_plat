import 'dart:convert';

import 'package:dizi_plat/model/movie_model.dart';
import 'package:http/http.dart' as http;

class TmdbService {
  String popularMovieUrl =
      "https://api.themoviedb.org/3/movie/popular?api_key=1849a5f051876a04425890d9ee32e80e&language=en-US&page=1";
  Future<List<Movie>> getMovie() async {
    var url = Uri.parse(
        "https://api.themoviedb.org/3/movie/popular?api_key=1849a5f051876a04425890d9ee32e80e&language=en-US&page=1");
    var response = await http.get(url);

    var body = jsonDecode(response.body);
    var getMovie = body["results"] as List;
    var movieList = getMovie.map((e) => Movie.fromJson(e)).toList();

    return movieList;
  }
}
