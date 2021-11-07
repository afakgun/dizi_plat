import 'package:dizi_plat/controller/actor_controller.dart';
import 'package:dizi_plat/widgets/homepage_listviews/actors_avatar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActorsList extends GetWidget {
  ActorsList({
    Key? key,
  }) : super(key: key);

  ActorController actorController = Get.put(ActorController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
              ),
              child: const Text("Kadın Aktörler")),
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
