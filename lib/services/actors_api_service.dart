import 'dart:convert';

import 'package:dizi_plat/model/actor_model.dart';
import 'package:http/http.dart' as http;

class TmdbActorsService {
  String popularActorUrl =
      "https://api.themoviedb.org/3/person/popular?api_key=1849a5f051876a04425890d9ee32e80e&language=en-US&page=1";
  Future<List<Actor>> getActor() async {
    var url = Uri.parse(
        "https://api.themoviedb.org/3/person/popular?api_key=1849a5f051876a04425890d9ee32e80e&language=en-US&page=1");
    var response = await http.get(url);

    var body = jsonDecode(response.body);
    var getActor = body["results"] as List;
    var actorList = getActor.map((e) => Actor.fromJson(e)).toList();
   

    return actorList;
  }
}
