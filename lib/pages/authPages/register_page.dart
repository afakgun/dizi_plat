import 'package:dizi_plat/consts/theme_helper.dart';
import 'package:dizi_plat/widgets/authWidgets/header_widget.dart';
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

  // checkAuthentication() async {
  //   _auth.authStateChanges().listen((user) async {
  //     if (user != null) {
  //       Navigator.pushReplacementNamed(context, "/");
  //     }
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   this.checkAuthentication();
  // }

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
    }
  }

  showError(String errormessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('ERROR'),
            content: Text(errormessage),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _headerHeight,
              child: HeaderWidget(
                  _headerHeight,
                  true,
                  Icons
                      .slow_motion_video), //let's create a common header widget
            ),
            SafeArea(
              child: Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: EdgeInsets.fromLTRB(
                      20, 10, 20, 10), // This will be the login form
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          'Kayıt Ol',
                          style: TextStyle(
                              fontSize: 50, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        'Film Ve Dizi Dünyasına Hoşgeldiniz',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(height: 30.0),
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              GestureDetector(
                                child: Stack(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        border: Border.all(
                                            width: 5, color: Colors.white),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 20,
                                            offset: const Offset(5, 5),
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
                                      padding:
                                          EdgeInsets.fromLTRB(80, 80, 0, 0),
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
                                  child: TextFormField(
                                    validator: (input) {
                                      if (input!.isEmpty)
                                        return 'Kullanıcı adı giriniz';
                                    },
                                    onSaved: (input) => _username = input!,
                                    decoration: ThemeHelper()
                                        .textInputDecoration('Kullanıcı Adı',
                                            'Kullanıcı Adınızı Giriniz'),
                                  ),
                                  decoration:
                                      ThemeHelper().inputBoxDecorationShaddow(),
                                ),
                              ),
                              SizedBox(height: 30.0),
                              Container(
                                child: TextFormField(
                                  decoration: ThemeHelper().textInputDecoration(
                                      'Email', 'Emailinizi Giriniz'),
                                  validator: (input) {
                                    if (input!.isEmpty)
                                      return 'Bir Mail Giriniz';
                                  },
                                  onSaved: (input) => _email = input!,
                                ),
                                decoration:
                                    ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              SizedBox(height: 30.0),
                              Container(
                                child: TextFormField(
                                  validator: (input) {
                                    if (input!.length < 6)
                                      return 'Şifreniz en az 6 haneli olmalıdır';
                                  },
                                  obscureText: true,
                                  decoration: ThemeHelper().textInputDecoration(
                                      'Parola', 'Parolanızı Giriniz'),
                                  onSaved: (input) => _password = input!,
                                ),
                                decoration:
                                    ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              SizedBox(height: 15.0),
                              Container(
                                decoration:
                                    ThemeHelper().buttonBoxDecoration(context),
                                child: ElevatedButton(
                                  style: ThemeHelper().buttonStyle(),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(40, 10, 40, 10),
                                    child: Text(
                                      'Kayıt Ol'.toUpperCase(),
                                      style: TextStyle(
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