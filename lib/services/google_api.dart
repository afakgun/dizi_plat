import 'package:dizi_plat/pages/homepage/home_page.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInApi {
  static final _googleSignIn = GoogleSignIn();

  static Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();

 
}

class GoogleSignOutApi {
  static final _googleSignOut = GoogleSignIn();

  static Future<GoogleSignInAccount?> logout() => _googleSignOut.signOut();

 
}
