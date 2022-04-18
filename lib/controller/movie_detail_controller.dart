import 'package:dizi_plat/model/movie_detail_model.dart';
import 'package:dizi_plat/model/movie_model.dart';
import 'package:dizi_plat/services/api_service.dart';
import 'package:get/state_manager.dart';

// class MovieDetailController extends GetxController {
//   RxList<MovieDetail>? movies = RxList([]);

//   @override
//   onInit() {
    
//     TmdbService().getMovieDetail().then((value) {
//       movies!.value = value;
      
//       print(movies.toString());
//     });

//     super.onInit();
//   }

//   Future<List<MovieDetail>> fetchMovie() async {
//     movies!.value = await TmdbService().getMovieDetail();
//     print(movies!.value);
//     return movies!.value;
//   }
// }
