import 'package:dizi_plat/controller/actor_controller.dart';
import 'package:dizi_plat/widgets/homepage_listviews/actors_avatar.dart';
import 'package:dizi_plat/widgets/homepage_listviews/male_actors_avatar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MaleActorsList extends GetWidget {
  MaleActorsList({
    Key? key,
  }) : super(key: key);

  ActorController actorController = Get.put(ActorController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15.0, bottom: 8),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
              ),
              child: const Text("Erkek Aktörler")),
        ),
        Container(
          height: Get.height * 0.14,
          child: Obx(
            () => ListView.builder(
                padding: EdgeInsets.only(left: 10, right: 10),
                itemCount: actorController.man!.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return MaleAvatarWidget(
                    manName: actorController.manName![index],
                    man: actorController.man![index],
                  );
                }),
          ),
        ),
      ],
    );
  }
}
