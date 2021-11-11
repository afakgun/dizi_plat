import 'package:dizi_plat/model/actor_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class AvatarWidget extends StatelessWidget {
  AvatarWidget({Key? key, required this.woman, required this.nameWoman})
      : super(key: key);

  Actor woman = Actor();
  Actor nameWoman = Actor();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: Get.width * 0.26,
          height: Get.height * 0.1,
          child: CircleAvatar(
            backgroundColor: Colors.tealAccent[400],
            radius: 40,
            child: CircleAvatar(
              radius: 39,
              backgroundColor: Colors.transparent,
              // backgroundColor: Colors.transparent,
              foregroundImage: NetworkImage(
                "https://image.tmdb.org/t/p/w500/" +
                    woman.profilePic.toString(),
                scale: 10,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: Get.width * 0.2,
            child: Text(
              nameWoman.name.toString(),
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
