import 'package:dizi_plat/consts/theme_helper.dart';
import 'package:dizi_plat/pages/authPages/register_page.dart';
import 'package:dizi_plat/pages/homepage/home_page.dart';
import 'package:dizi_plat/widgets/authWidgets/header_widget.dart';
import 'package:dizi_plat/widgets/authWidgets/text_field_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String _email, _password;

  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user != null) {
        print(user);

        Navigator.pushReplacementNamed(context, "/");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentification();
  }

  login() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      try {
        await _auth.signInWithEmailAndPassword(
            email: _email, password: _password);
      } catch (e) {
        showError(e.toString());
        print(e);
      }
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

  navigateToSignUp() async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const HomePage()));
  }

  final double _headerHeight = 250;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                          'Giriş Yapın',
                          style: TextStyle(
                              fontSize: 50, fontWeight: FontWeight.bold),
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
                              CustomTextField(
                                onSaved: (input) => _email = input!,
                                validator: (input) {
                                  if (input!.isEmpty) return 'Enter Email';
                                },
                                icon: const Icon(Icons.email),
                                hint: "EMAIL",
                              ),
                              const SizedBox(height: 30.0),
                              Container(
                                child: TextFormField(
                                  obscureText: true,
                                  decoration: ThemeHelper().textInputDecoration(
                                      'Parola', 'Parolanızı Giriniz'),
                                  validator: (input) {
                                    if (input!.length < 6) {
                                      return 'Şifreniz en az 6 karakter olmalı!';
                                    }
                                  },
                                  onSaved: (input) => _password = input!,
                                ),
                                decoration:
                                    ThemeHelper().inputBoxDecorationShaddow(),
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
                                decoration:
                                    ThemeHelper().buttonBoxDecoration(context),
                                child: ElevatedButton(
                                  style: ThemeHelper().buttonStyle(),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(40, 10, 40, 10),
                                    child: Text(
                                      'Giriş Yap'.toUpperCase(),
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                  onPressed: () {
                                    login();
                                  },
                                ),
                              ),
                              GestureDetector(
                                onTap: navigateToSignUp,
                                child: Container(
                                  margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                                  //child: Text('Don\'t have an account? Create'),
                                  child: const Text.rich(TextSpan(children: [
                                    TextSpan(text: "Bir Hesabın Yok Mu? "),
                                    TextSpan(
                                      text: 'Oluşturr',
                                      
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF17162e)),
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
