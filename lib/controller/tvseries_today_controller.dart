import 'package:dizi_plat/model/tvseriestoday_model.dart';
import 'package:dizi_plat/services/api_service.dart';
import 'package:get/state_manager.dart';

class TvSeriesTodayController extends GetxController {
  RxList<TvSeriesToday>? tvSeriesToday = RxList([]);

  @override
  onInit() {
    // called immediately after the widget is allocated memory
    
    TmdbService().getTvseriesToday().then((value) {
      tvSeriesToday!.value = value.cast<TvSeriesToday>();
     
    });

    super.onInit();
  }

  Future<List<TvSeriesToday>> fetchTvSeriesToday() async {
    tvSeriesToday!.value = await TmdbService().getTvseriesToday();
    return tvSeriesToday!;
  }
  
}
