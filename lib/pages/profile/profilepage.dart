import 'package:dizi_plat/provider/dark_theme_provider.dart';
import 'package:dizi_plat/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:provider/provider.dart';
import 'package:swipe_deck/swipe_deck.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  static const IMAGES = [
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
    final themeChange = Provider.of<KaranlikTemaProvider>(context);
    return Scaffold(
      backgroundColor: const Color(0xFF17162e),
      body: Builder(
        builder: (context) {
          return Container(
            decoration: const BoxDecoration(color: Color(0xFF17162e)),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  decoration: const BoxDecoration(color: Color(0xFF17162e)),
                  child: Column(
                    children: [
                      Center(
                        child: Card(
                          color: Color(0xFF17162e),
                          child: Column(
                            children: [
                              Container(
                                height: Get.height * 0.25,
                                width: Get.width * 0.25,
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
                              Container(
                                width: 150,
                                height: 200,
                                child: SwipeDeck(
                                  startIndex: 1,
                                  emptyIndicator: Container(
                                    child: Center(
                                      child: Text("Nothing Here"),
                                    ),
                                  ),
                                  cardSpreadInDegrees:
                                      170, // Change the Spread of Background Cards
                                  onSwipeLeft: () {
                                    print(
                                        "USER SWIPED LEFT -> GOING TO NEXT WIDGET");
                                  },

                                  onSwipeRight: () {
                                    print(
                                        "USER SWIPED RIGHT -> GOING TO PREVIOUS WIDGET");
                                  },
                                  onChange: (index) {
                                    print(ProfilePage.IMAGES[index]);
                                  },

                                  widgets: ProfilePage.IMAGES
                                      .map((e) => GestureDetector(
                                            onTap: () {
                                              print(e);
                                            },
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                child: Image.asset(
                                                  "assets/$e.jpg",
                                                  fit: BoxFit.cover,
                                                )),
                                          ))
                                      .toList(),
                                ),
                              ),
                              ListTileSwitch(
                          value: themeChange.karanlikMod,
                          leading: Icon(Icons.light_mode),
                          onChanged: (value) {
                            setState(() {
                              themeChange.karanlikMod = value;
                            });
                          },
                          visualDensity: VisualDensity.comfortable,
                          switchType: SwitchType.cupertino,
                          switchActiveColor: Colors.tealAccent[700],
                          title: Text('Karanlık Mod'),
                        ),
                            ],
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
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      ),
      // ignore: prefer_const_literals_to_create_immutables
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
