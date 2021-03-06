import 'package:dizi_plat/model/actor_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MaleAvatarWidget extends StatelessWidget {
  MaleAvatarWidget({Key? key, required this.man, required this.manName})
      : super(key: key);

  Actor man = Actor();
  Actor manName = Actor();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: Get.width * 0.26,
            height: Get.height * 0.1,
            child: CircleAvatar(
              backgroundColor: const Color(0xffD9EDDF),
              radius: 45,
              child: CircleAvatar(
                radius: 39,
                backgroundColor: Colors.transparent,
                // backgroundColor: Colors.transparent,
                foregroundImage: man.profilePic != null ? NetworkImage(
                "https://image.tmdb.org/t/p/w500/" +
                    man.profilePic.toString(),

                scale: 10,
              ) : const NetworkImage(
                "https://p.kindpng.com/picc/s/52-525992_woman-question-mark-clip-art-question-mark-face.png",
                ),
              ),
            )),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: Get.width * 0.2,
            child: Text(
              manName.name.toString(),
              textAlign: TextAlign.center,
              maxLines: 2,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ],
    );
  }
}
