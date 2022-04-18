import 'package:dizi_plat/consts/theme_helper.dart';
import 'package:dizi_plat/controller/auth_controller.dart';
import 'package:dizi_plat/controller/profile_controller.dart';
import 'package:dizi_plat/pages/authPages/register_page.dart';
import 'package:dizi_plat/pages/homepage/home_page.dart';
import 'package:dizi_plat/services/google_api.dart';
import 'package:dizi_plat/widgets/authWidgets/header_widget.dart';
import 'package:dizi_plat/widgets/authWidgets/text_field_widget.dart';
import 'package:dizi_plat/widgets/bottom_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  ProfilePageController profilePageController = Get.put(ProfilePageController());
  AuthController authController = Get.put(AuthController());

  navigateToSignUp() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterPage()));
  }

  final double _headerHeight = 250;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF17162e),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: _headerHeight,
              child: HeaderWidget(_headerHeight, true, Icons.slow_motion_video), //let's create a common header widget
            ),
            SafeArea(
              child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: const EdgeInsets.fromLTRB(20, 10, 20, 10), // This will be the login form
                  child: Column(
                    children: [
                      const Center(
                        child: Text(
                          'Giriş Yapın',
                          style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                      const Text(
                        'Film Ve Dizi Dünyasına Hoşgeldiniz',
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 30.0),
                      Form(
                          key: authController.formKey,
                          child: Column(
                            children: [
                              CustomTextField(
                                onSaved: (input) => authController.email = input!,
                                validator: (input) {
                                  if (input!.isEmpty) return 'Enter Email';
                                },
                                icon: const Icon(Icons.email),
                                hint: "EMAIL",
                              ),
                              const SizedBox(height: 30.0),
                              Container(
                                child: CustomTextField(
                                  icon: Icon(Icons.password),
                                  hint: "PAROLA",
                                  validator: (input) {
                                    if (input!.length < 6) {
                                      return 'Şifreniz en az 6 karakter olmalı!';
                                    }
                                  },
                                  onSaved: (input) => authController.password = input!,
                                ),
                                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              // ignore: prefer_const_constructors
                              SizedBox(height: 15.0),
                              Container(
                                margin: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                                alignment: Alignment.topRight,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: const Text(
                                    "Şifreni mi unuttun?",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: ThemeHelper().buttonBoxDecoration(context),
                                child: ElevatedButton(
                                  style: ThemeHelper().buttonStyle(),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                                    child: Text(
                                      'Giriş Yap'.toUpperCase(),
                                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                                    ),
                                  ),
                                  onPressed: () {
                                    authController.login();
                                    profilePageController.displayName.value = authController.email;
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Container(
                                height: Get.height * 0.065,
                                width: Get.width * 0.53,
                                decoration: ThemeHelper().buttonBoxDecoration(context),
                                child: ElevatedButton.icon(
                                  style: ThemeHelper().buttonStyle(),
                                  icon: const Icon(
                                    Icons.login,
                                    size: 16,
                                    color: Colors.red,
                                  ),
                                  label: Text("Google Hesabınız İle Giriniz"),
                                  onPressed: authController.signInWithGoogle,
                                ),
                              ),
                              GestureDetector(
                                onTap: navigateToSignUp,
                                child: Container(
                                  margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                                  //child: Text('Don\'t have an account? Create'),
                                  child: Text.rich(TextSpan(children: [
                                    TextSpan(text: "Bir Hesabın Yok Mu? ", style: const TextStyle(color: Colors.white)),
                                    TextSpan(
                                      text: 'Oluştur'.toUpperCase(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.tealAccent,
                                      ),
                                    ),
                                  ])),
                                ),
                              ),
                            ],
                          )),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
