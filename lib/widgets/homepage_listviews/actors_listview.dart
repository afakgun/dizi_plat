import 'package:dizi_plat/controller/actor_controller.dart';
import 'package:dizi_plat/controller/castlist_controller.dart';
import 'package:dizi_plat/model/castlist_model.dart';
import 'package:dizi_plat/widgets/homepage_listviews/actors_avatar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActorsList extends GetWidget {
  ActorsList({
    Key? key,
  }) : super(key: key);

  ActorController actorController = Get.put(ActorController());
  // CastListController castList = CastListController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.transparent,
              ),
              child: const Text(
                "Kadın Aktörler",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w800),
              )),
        ),
        Container(
          height: Get.height * 0.16,
          child: Obx(
            () => ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.only(left: 10, right: 10),
                itemCount: actorController.woman!.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return AvatarWidget(
                    // castName: castList.cast![index],
                    woman: actorController.woman![index],
                    nameWoman: actorController.womanName![index],
                  );
                }),
          ),
        ),
      ],
    );
  }
}
