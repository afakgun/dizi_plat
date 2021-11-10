import 'package:dizi_plat/controller/tvseries_controller.dart';
import 'package:dizi_plat/widgets/homepage_listviews/car_tv_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SeriesCardListView extends GetWidget {
  SeriesCardListView({Key? key}) : super(key: key);
  TvSeriesController tvseriesController = Get.put(TvSeriesController());

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
              itemCount: tvseriesController.tvSeries!.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
              itemBuilder: (context, index) {
                return CardTvWidget(
                  tvserieses: tvseriesController.tvSeries![index],
                );
              }),
        ),
      ),
    );
  }
}
