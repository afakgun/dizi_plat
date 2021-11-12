import 'package:dizi_plat/controller/tvseries_controller.dart';
import 'package:dizi_plat/controller/tvseries_today_controller.dart';
import 'package:dizi_plat/model/tvseriestoday_model.dart';
import 'package:dizi_plat/widgets/homepage_listviews/card_tv_today_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SeriesCardTodayListView extends GetWidget {
  SeriesCardTodayListView({Key? key}) : super(key: key);
  TvSeriesTodayController tvseriesTodayController = Get.put(TvSeriesTodayController());
  TvSeriesToday tvSeriesToday = TvSeriesToday();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: Get.width * 0.01, right: Get.width * 0.01),
      child: Container(
        height: Get.height * 0.35,
        decoration: const BoxDecoration(),
        child: Obx(
          () => ListView.builder(
              shrinkWrap: false,
              itemCount: tvseriesTodayController.tvSeriesToday!.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
              itemBuilder: (context, index) {
                return CardTvTodayWidget(
                  tvseriestoday: tvseriesTodayController.tvSeriesToday![index],
                );
              }),
        ),
      ),
    );
  }
}
