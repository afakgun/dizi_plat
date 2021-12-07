import 'package:dizi_plat/consts/theme_helper.dart';
import 'package:dizi_plat/pages/authPages/login_page.dart';
import 'package:dizi_plat/widgets/authWidgets/header_widget.dart';
import 'package:dizi_plat/widgets/authWidgets/text_field_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  double _headerHeight = 250;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String _email, _password, _username;

  checkAuthentication() async {
    _auth.authStateChanges().listen((user) async {
      if (user != null) {
        Navigator.pushReplacementNamed(context, "/");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentication();
  }

  signUp() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      try {
        UserCredential user = await _auth.createUserWithEmailAndPassword(
            email: _email, password: _password);
        if (user != null) {
          // UserUpdateInfo updateuser = UserUpdateInfo();
          // updateuser.displayName = _name;
          //  user.updateProfile(updateuser);
          await _auth.currentUser!.updateProfile(displayName: _username);
          // await Navigator.pushReplacementNamed(context,"/") ;

        }
      } catch (e) {
        showError(e.toString());
        print(e);
      }
      Get.to(LoginPage());
    }
  }

  showError(String errormessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('ERROR'),
            content: Text(errormessage),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF17162e),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: _headerHeight,
              child: HeaderWidget(
                  _headerHeight,
                  true,
                  Icons
                      .slow_motion_video), //let's create a common header widget
            ),
            SafeArea(
              child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: const EdgeInsets.fromLTRB(
                      20, 10, 20, 10), // This will be the login form
                  child: Column(
                    children: [
                      const Center(
                        child: Text(
                          'Kayıt Ol',
                          style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      const Text(
                        'Film Ve Dizi Dünyasına Hoşgeldiniz',
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 30.0),
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Stack(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        border: Border.all(
                                            width: 5, color: Colors.white),
                                        color: Colors.white,
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 20,
                                            offset: Offset(5, 5),
                                          ),
                                        ],
                                      ),
                                      child: Icon(
                                        Icons.person,
                                        color: Colors.grey.shade300,
                                        size: 80.0,
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          80, 80, 0, 0),
                                      child: Icon(
                                        Icons.add_circle,
                                        color: Colors.grey.shade700,
                                        size: 25.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: Get.height * 0.02),
                                child: Container(
                                  child: CustomTextField(
                                    icon: Icon(Icons.person),
                                    validator: (input) {
                                      if (input!.isEmpty)
                                        return 'Kullanıcı adı giriniz';
                                    },
                                    onSaved: (input) => _username = input!,
                                    hint: "KULLANICI ADI",
                                  ),
                                  decoration:
                                      ThemeHelper().inputBoxDecorationShaddow(),
                                ),
                              ),
                              const SizedBox(height: 30.0),
                              Container(
                                child: CustomTextField(
                                  icon: Icon(Icons.email),
                                  validator: (input) {
                                    if (input!.isEmpty)
                                      return 'Bir Mail Giriniz';
                                  },
                                  onSaved: (input) => _email = input!,
                                  hint: "EMAIL",
                                ),
                                decoration:
                                    ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              const SizedBox(height: 30.0),
                              Container(
                                child: CustomTextField(
                                  hint: "PAROLA",
                                  validator: (input) {
                                    if (input!.length < 6)
                                      return 'Şifreniz en az 6 haneli olmalıdır';
                                  },
                                  obsecure: true,
                                  icon: Icon(Icons.password),
                                  onSaved: (input) => _password = input!,
                                ),
                                decoration:
                                    ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              const SizedBox(height: 15.0),
                              Container(
                                decoration:
                                    ThemeHelper().buttonBoxDecoration(context),
                                child: ElevatedButton(
                                  style: ThemeHelper().buttonStyle(),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        40, 10, 40, 10),
                                    child: Text(
                                      'Kayıt Ol'.toUpperCase(),
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                  onPressed: () {
                                    signUp();
                                  },
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
