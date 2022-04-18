// import 'package:dizi_plat/model/castlist_model.dart';
// import 'package:get/get.dart';

// import '../services/api_service.dart';

// class CastListController extends GetxController {
//   RxList<CastList>? cast = RxList([]);
//   CastList castList = CastList();

//   @override
//   onInit() {
//     // called immediately after the widget is allocated memory
//     TmdbService().getCastList(634649).then((value) {
//       cast!.value = value;
//       for (var i = 0; i < cast!.length; i++) {
//         cast!.value = castList.name as List<CastList>;
//       }

//       // ignore: avoid_print
//       print(cast.toString());
//     });

//     super.onInit();
//   }

//   Future<List<CastList>> fetchMovie() async {
//     cast!.value = await TmdbService().getCastList(634649);
//     return cast!;
//   }
// }
