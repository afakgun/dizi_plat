import 'package:dizi_plat/model/movie_model.dart';
import 'package:dizi_plat/model/movie_upcoming_model.dart';
import 'package:dizi_plat/services/api_service.dart';
import 'package:get/state_manager.dart';

class MovieUpComingController extends GetxController {
  RxList<MovieUpComing>? moviescoming = RxList([]);
  
  @override
  onInit() {
    // called immediately after the widget is allocated memory
    TmdbService().getMovieUpComing().then((value) {
      moviescoming!.value = value.cast<MovieUpComing>();
  });

    super.onInit();
  }

  Future<List<MovieUpComing>> fetchMovieUpComing() async {
    moviescoming!.value = await TmdbService().getMovieUpComing();
    return moviescoming!;
  }
}
