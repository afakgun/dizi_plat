import 'package:dizi_plat/model/movie_model.dart';
import 'package:dizi_plat/services/api_service.dart';
import 'package:get/state_manager.dart';

class MovieController extends GetxController {
  RxList<Movie>? movies = RxList([]);

  @override
  onInit() {
    // called immediately after the widget is allocated memory
    TmdbService().getMovie().then((value) {
      movies!.value = value;
      // ignore: avoid_print
      print(movies.toString());
    });

    super.onInit();
  }

  Future<List<Movie>> fetchMovie() async {
    movies!.value = await TmdbService().getMovie();
    return movies!;
  }
}
