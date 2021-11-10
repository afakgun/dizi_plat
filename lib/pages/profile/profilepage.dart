import 'package:dizi_plat/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:swipe_deck/swipe_deck.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  static const images = [
    "apex",
    "nfs",
    "pubg",
  ];

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF17162e),
      body: Container(
        decoration: BoxDecoration(
            color: const Color(0xFF17162e),
            borderRadius: BorderRadius.circular(24)),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                  color: const Color(0xFF17162e),
                  borderRadius: BorderRadius.circular(24)),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: Get.width * 0.05, right: Get.width * 0.05),
                    child: SizedBox(
                      height: Get.height * 0.55,
                      width: Get.width * 0.90,
                      child: Card(
                        color: const Color(0xff1d1c3b),
                        child: Column(
                          children: [
                            SizedBox(
                              height: Get.height * 0.25,
                              width: Get.width * 0.40,
                              child: const CircleAvatar(
                                foregroundImage: NetworkImage(
                                    "https://static.photocdn.pt/images/articles/2019/08/07/images/articles/2019/07/31/linkedin_profile_picture_tips-1.jpg"),
                              ),
                            ),
                            const Text(
                              "John Doe",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              width: 150,
                              height: 200,
                              child: SwipeDeck(
                                startIndex: 1,
                                emptyIndicator: const Center(
                                  child: Text("Nothing Here"),
                                ),
                                cardSpreadInDegrees:
                                    170, // Change the Spread of Background Cards

                                widgets: ProfilePage.images
                                    .map((e) => GestureDetector(
                                          onTap: () {
                                            // ignore: avoid_print
                                            print(e);
                                          },
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(24),
                                              child: Image.asset(
                                                "assets/$e.jpg",
                                                fit: BoxFit.cover,
                                              )),
                                        ))
                                    .toList(),
                              ),
                            ),
                            //       ListTileSwitch(
                            //   value: themeChange.karanlikMod,
                            //   leading: Icon(Icons.light_mode),
                            //   onChanged: (value) {
                            //     setState(() {
                            //       themeChange.karanlikMod = value;
                            //     });
                            //   },
                            //   visualDensity: VisualDensity.comfortable,
                            //   switchType: SwitchType.cupertino,
                            //   switchActiveColor: Colors.tealAccent[700],
                            //   title: Text('Karanlık Mod'),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Container(
                  //   height: Get.height * 0.30,
                  //   width: Get.width,!
                  //   decoration: const BoxDecoration(color: Colors.amber),
                  //   child: ListView.builder(
                  //       itemCount: 10,
                  //       scrollDirection: Axis.horizontal,
                  //       padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                  //       itemBuilder: (context, index) {
                  //         return CardWidget();
                  //       }),
                  // ),
                  SizedBox(
                    height: Get.height * 0.60,
                    width: Get.width * 0.9,
                    child: Card(
                      color: Colors.amber,
                      child: Column(
                        children: const [
                          Text(
                            "deneme",
                            style: TextStyle(color: Colors.white),
                          ),
                          
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      // ignore: prefer_const_literals_to_create_immutables
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
