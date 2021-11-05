import 'package:dizi_plat/model/tv_model.dart';
import 'package:dizi_plat/services/api_service.dart';
import 'package:get/state_manager.dart';

class TvSeriesController extends GetxController {
  RxList<TvSeries>? tvSeries = RxList([]);

  @override
  onInit() {
    // called immediately after the widget is allocated memory
    TmdbService().getTvseries().then((value) {
      tvSeries!.value = value.cast<TvSeries>();
    });

    super.onInit();
  }

  Future<List<TvSeries>> fetchTvSeries() async {
    tvSeries!.value = (await TmdbService().getTvseries()).cast<TvSeries>();
    return tvSeries!;
  }
}
