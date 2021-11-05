import 'dart:convert';

import 'package:dizi_plat/model/tv_model.dart';
import 'package:http/http.dart' as http;

class TmdbTvSeriesService {
  String popularTvSeriesUrl =
      "https://api.themoviedb.org/3/tv/popular?api_key=1849a5f051876a04425890d9ee32e80e&language=en-US&page=1";
  Future<List<TvSeries>> getTvseries() async {
    var url = Uri.parse(
        "https://api.themoviedb.org/3/tv/popular?api_key=1849a5f051876a04425890d9ee32e80e&language=en-US&page=1");
    var response = await http.get(url);

    var body = jsonDecode(response.body);
    var getTvseries = body["results"] as List;
    var tvseriesList = getTvseries.map((e) => TvSeries.fromJson(e)).toList();
    return tvseriesList;
  }
  
}
