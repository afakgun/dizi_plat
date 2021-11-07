import 'dart:convert';
import 'package:dizi_plat/model/detail_model.dart';
import 'package:http/http.dart' as http;

String baseUrl = "https://api.themoviedb.org/3";
var movieUrl = '$baseUrl/movie';

class TmdbDetailService {
  String detailMovieUrl =
      "https://api.themoviedb.org/3/movie/580489?api_key=1849a5f051876a04425890d9ee32e80e&language=en-US";
  Future<List<MovieDetail>> getDetail() async {
    var url = Uri.parse(
        "https://api.themoviedb.org/3/movie/580489?api_key=1849a5f051876a04425890d9ee32e80e&language=en-US");
    var response = await http.get(url);

    var body = jsonDecode(response.body);
    var getDetail = body["results"] as List;
    var detailList = getDetail.map((e) => MovieDetail.fromJson(e)).toList();

    return detailList;
  }
}
