import 'package:dizi_plat/model/actor_model.dart';
import 'package:dizi_plat/services/api_service.dart';
import 'package:get/state_manager.dart';

class ActorController extends GetxController {
  RxList<Actor>? actors = RxList([]);
  RxList<Actor>? woman = RxList([]);
  RxList<Actor>? man = RxList([]);
  RxList<Actor>? womanName = RxList([]);
    RxList<Actor>? manName = RxList([]);


  @override
  onInit() {
    // called immediately after the widget is allocated memory
    TmdbService().getActor().then(
      (value) {
        womanName!.value = value;
                manName!.value = value;

        actors!.value = value;
        for (var i = 0; i < actors!.length; i++) {
          if (actors![i].gender == 1) {
            woman!.add(actors![i]);
          }
          if (actors![i].gender == 2) {
            man!.add(actors![i]);
          }
        }
      },
    );

    super.onInit();
  }

  Future<List<Actor>> fetchActor() async {
    actors!.value = await TmdbService().getActor();
    return actors!;
  }
}
