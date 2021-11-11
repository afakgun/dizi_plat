import 'dart:convert';

import 'package:dizi_plat/model/actor_model.dart';
import 'package:dizi_plat/model/detail_model.dart';
import 'package:dizi_plat/model/movie_detail_model.dart';
import 'package:dizi_plat/model/movie_model.dart';
import 'package:dizi_plat/model/movie_upcoming_model.dart';
import 'package:dizi_plat/model/trailer.dart';
import 'package:dizi_plat/model/tv_model.dart';
import 'package:http/http.dart' as http;

String baseUrl = "https://api.themoviedb.org/3";
var movieUrl = '$baseUrl/movie';

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

  Future<List<MovieDetail>> getMovieDetail(int id) async {
    var url = Uri.parse(
        "https://api.themoviedb.org/3/movie/$id?api_key=1849a5f051876a04425890d9ee32e80e&language=en-US");
    var response = await http.get(url);

    var body = jsonDecode(response.body);
    var getMovieDetail = body as List;
    var movieDetailList =
        getMovieDetail.map((e) => MovieDetail.fromJson(e)).toList();

    return movieDetailList;
  }

  Future<List<TvSeries>> getTvseries() async {
    var url = Uri.parse(
        "https://api.themoviedb.org/3/tv/popular?api_key=1849a5f051876a04425890d9ee32e80e&language=en-US&page=1");
    var response = await http.get(url);

    var body = jsonDecode(response.body);
    var getTvseries = body["results"] as List;
    var tvseriesList = getTvseries.map((e) => TvSeries.fromJson(e)).toList();
    return tvseriesList;
  }

  Future<List<Actor>> getActor() async {
    var url = Uri.parse(
        "https://api.themoviedb.org/3/person/popular?api_key=1849a5f051876a04425890d9ee32e80e&language=en-US&page=1");
    var response = await http.get(url);

    var body = jsonDecode(response.body);
    var getActor = body["results"] as List;
    var actorList = getActor.map((e) => Actor.fromJson(e)).toList();

    return actorList;
  }

  Future<List<Video>> getVideo(int id) async {
    var url = Uri.parse(
        "https://api.themoviedb.org/3/movie/$id/videos?api_key=1849a5f051876a04425890d9ee32e80e&language=en-US");
    var response = await http.get(url);

    var body = jsonDecode(response.body);
    var getVideo = body["results"] as List;
    var videoList = getVideo.map((e) => Video.fromJson(e)).toList();

    return videoList;
  }

  Future<List<MovieDetail>> getDetail(int id) async {
    var url = Uri.parse(
        "https://api.themoviedb.org/3/movie/id?api_key=1849a5f051876a04425890d9ee32e80e&language=en-US");
    var response = await http.get(url);

    var body = jsonDecode(response.body);
    var getDetail = body["results"] as List;
    var detailList = getDetail.map((e) => MovieDetail.fromJson(e)).toList();
    print(detailList);
    return detailList;
  }

  Future<List<MovieUpComing>> getMovieUpComing() async {
    var url = Uri.parse(
        "https://api.themoviedb.org/3/movie/id?api_key=1849a5f051876a04425890d9ee32e80e&language=en-US");
    var response = await http.get(url);

    var body = jsonDecode(response.body);
    var getMovieUpComing = body["results"] as List;
    var MovieUpComingList =
        getMovieUpComing.map((e) => MovieUpComing.fromJson(e)).toList();
    print(MovieUpComingList);
    return MovieUpComingList;
  }
}
