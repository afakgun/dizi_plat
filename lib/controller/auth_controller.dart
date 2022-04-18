import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dizi_plat/model/user_model.dart';
import 'package:dizi_plat/pages/authPages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../widgets/bottom_nav_bar.dart';

class AuthController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;

  final usersStream = FirebaseFirestore.instance.collection('users');
  

  final db = FirebaseFirestore.instance;

  RxString profilName = "".obs;
  RxString profilPic = "".obs;
  RxString profilMail = "".obs;
  RxString profilPhone = "".obs;
  RxString profilId = "".obs;

  late String email, password, username;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> checkAuthentification() async {
    auth.authStateChanges().listen((data) async {
      if (data != null) {
        // try {
        //   await db.doc(data.displayName!.isNotEmpty ? data.displayName : "asdasdasd").set({
        //     'fullname': data.displayName,
        //     'phone': data.phoneNumber,
        //     'photoUrl': data.photoURL,
        //     'email': data.email,
        //     'Provider': data.providerData,
        //     'lastSeen': data.emailVerified
        //   });
        // } catch (e) {
        //   print(e);
        // }
        Get.off(BottomNavBar());
      } else {
        Get.defaultDialog(title: "Kullanıcı Bulanamadı", middleText: "Lütfen Tekrar Deneyiniz!");
      }
    });
  }

  Future<void> updateUserData(GoogleSignInAccount user) async {
    DocumentReference ref = db.collection('users').doc(user.id);
    profilId.value = user.id;
    return ref.set(
      {'uid': user.id, 'email': user.email, 'photoURL': user.photoUrl, 'displayName': user.displayName, 'lastSeen': DateTime.now()},
    );
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    checkAuthentification();
  }

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      try {
        await auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
      } catch (e) {
        showError(e.toString());
        print(e);
      }
    }
  }

  showError(String errormessage) {
    Get.defaultDialog(
      title: 'ERROR',
      content: Text(errormessage),
      actions: <Widget>[
        FlatButton(
            onPressed: () {
              Get.off(BottomNavBar());
            },
            child: const Text('OK'))
      ],
    );
  }

  Future<void> signUp() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      try {
        UserCredential user = await auth.createUserWithEmailAndPassword(email: email, password: password);
        if (user != null) {
          // UserUpdateInfo updateuser = UserUpdateInfo();
          // updateuser.displayName = _name;
          //  user.updateProfile(updateuser);
          await auth.currentUser!.updateProfile(displayName: username);
          // await Navigator.pushReplacementNamed(context,"/") ;

        }
      } catch (e) {
        showError(e.toString());
        print(e);
      }
      Get.to(LoginPage());
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    await updateUserData(googleUser!);

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
