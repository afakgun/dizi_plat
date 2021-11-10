
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class DetailOverview extends StatelessWidget {
  DetailOverview({
    Key? key,
    
  }) : super(key: key);


  

  

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: Get.height * 0.22,
      right: Get.width * 0.025,
      left: Get.width * 0.025,
      child: Container(
        height: Get.height * 0.4,
        child: Card(
          color: const Color(0xff1d1c3b),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: Get.height * 0.02),
                child: const ListTile(
                  title: Text("Venom",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.white)),
                  subtitle: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed dapibus aliquet magna, at maximus nunc tempus et. Aliquam condimentum iaculis dolor, vel vulputate purus pharetra at. Curabitur euismod aliquam orci in mattis. Pellentesque ut mollis risus. Vivamus congue sed dolor ut euismod. Vestibulum sit amet turpis eget dolor scelerisque molestie. Aliquam erat volutpat. Aliquam blandit placerat ligula sit amet lobortis. Nullam aliquam metus et vestibulum auctor. Integer ut commodo urna. Donec sodales urna non enim viverra pharetra. Cras vitae vehicula metus. Pellentesque et mollis nulla, et lobortis nulla. Sed semper justo semper justo auctor condimentum. Pellentesque ullamcorper sagittis neque, at vestibulum turpis condimentum ultrices.',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Colors.white54)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
