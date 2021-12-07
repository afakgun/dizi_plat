import 'package:dizi_plat/consts/theme_helper.dart';
import 'package:dizi_plat/pages/authPages/login_page.dart';
import 'package:dizi_plat/pages/authPages/register_page.dart';
import 'package:dizi_plat/services/google_api.dart';
import 'package:dizi_plat/widgets/bottom_nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:blobs/blobs.dart';

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

  final listTileisim = [
    'İzleme Listesi'
        'Geri Bildirim'
        'Yorumlarım'
  ];

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
                        left: Get.width * 0.05,
                        right: Get.width * 0.05,
                        top: Get.height * 0.01),
                    child: Container(
                      height: Get.height * 0.55,
                      width: Get.width * 0.90,
                      decoration: BoxDecoration(
                          color: const Color(0xff1d1c3b),
                          borderRadius: BorderRadius.circular(16)),
                      child: Column(
                        children: [
                          Container(
                            height: Get.height * 0.3,
                            child: ClipPath(
                              clipper: BlobClipper(
                                edgesCount: 3,
                                minGrowth: 8,
                              ),
                              child: Image.network(
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

                          Padding(
                            padding: EdgeInsets.only(top: Get.height * 0.08),
                            child: Container(
                              height: Get.height * 0.065,
                              width: Get.width * 0.53,
                              decoration:
                                  ThemeHelper().buttonBoxDecoration(context),
                              child: ElevatedButton.icon(
                                style: ThemeHelper().buttonStyle(),
                                icon: const Icon(
                                  Icons.logout,
                                  size: 16,
                                  color: Colors.tealAccent,
                                ),
                                label: Text("Çıkış Yapın"),
                                onPressed: signOut,
                              ),
                            ),
                          ),

                          // SizedBox(
                          //   width: 150,
                          //   height: 200,
                          //   child: SwipeDeck(
                          //     startIndex: 1,
                          //     emptyIndicator: const Center(
                          //       child: Text("Nothing Here"),
                          //     ),
                          //     cardSpreadInDegrees:
                          //         170, // Change the Spread of Background Cards

                          //     widgets: ProfilePage.images
                          //         .map((e) => GestureDetector(
                          //               onTap: () {
                          //                 // ignore: avoid_print
                          //                 print(e);
                          //               },
                          //               child: ClipRRect(
                          //                   borderRadius:
                          //                       BorderRadius.circular(24),
                          //                   child: Image.asset(
                          //                     "assets/$e.jpg",
                          //                     fit: BoxFit.cover,
                          //                   )),
                          //             ))
                          //         .toList(),
                          //   ),
                          // ),
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
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Container(
                      height: Get.height * 0.60,
                      width: Get.width * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: const Color(0xff1d1c3b),
                      ),
                      child: Column(
                        children: [
                          const ListTileMaterial(),
                          dividerWidget(),
                          const ListTileMaterial(),
                          dividerWidget(),
                          const ListTileMaterial(),
                          dividerWidget(),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                Get.to(const LoginPage());
                              },
                              child: ListTile(
                                title: const Text(
                                  'İzleme Listem',
                                  style: TextStyle(color: Colors.white),
                                ),
                                trailing: Icon(
                                  Icons.chevron_right_rounded,
                                  color: Colors.tealAccent[400],
                                ),
                                leading: Icon(
                                  Icons.login,
                                  color: Colors.tealAccent[400],
                                ),
                              ),
                            ),
                          ),
                          dividerWidget(),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      // ignore: prefer_const_literals_to_create_immutables
    );
  }

  Future signOut() async {
    await GoogleSignOutApi.logout();
    FirebaseAuth.instance.signOut();
    Get.to(const LoginPage());
  }

  Divider dividerWidget() {
    return Divider(
      thickness: 1.5,
      color: Colors.tealAccent[700],
      endIndent: 10,
      indent: 10,
    );
  }
}

class ListTileMaterial extends StatelessWidget {
  const ListTileMaterial({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Get.to(const RegisterPage());
        },
        child: ListTile(
          title: const Text(
            'İzleme Listem',
            style: TextStyle(color: Colors.white),
          ),
          trailing: Icon(
            Icons.chevron_right_rounded,
            color: Colors.tealAccent[400],
          ),
          leading: Icon(Icons.ac_unit),
        ),
      ),
    );
  }
}
