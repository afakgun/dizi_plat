import 'package:dizi_plat/controller/tvseries_controller.dart';
import 'package:dizi_plat/widgets/car_tv_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SeriesCardListView extends GetWidget {
  SeriesCardListView({Key? key}) : super(key: key);
  TvSeriesController tvseriesController = Get.put(TvSeriesController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.3,
      decoration: const BoxDecoration(
        color: Colors.red,
      ),
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
    );
  }
}
