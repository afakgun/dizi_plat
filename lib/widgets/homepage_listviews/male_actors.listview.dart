import 'package:dizi_plat/controller/actor_controller.dart';
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
            padding: const EdgeInsets.all(8),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.transparent,
              ),
              child: const Text(
                "Erkek Aktörler",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w800),
              ),
            )),
        Container(
          height: Get.height * 0.16,
          child: Obx(
            () => ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.only(left: 10, right: 10),
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
