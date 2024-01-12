// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_education/app/controllers/auth_controller.dart';
import 'package:my_education/app/modules/home/views/home_view.dart';
import 'package:my_education/app/modules/register/views/register_view.dart';

// import '../../../../main.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final authC = Get.find<AuthController>();

  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //Background
          Container(
            child: Image.asset(
              'assets/images/bg.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),

          //Content
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),

                  //Logo
                  Container(
                    alignment: AlignmentDirectional.topCenter,
                    child: Image.asset(
                      'assets/images/log in.png',
                    ),
                  ),

                  //Username
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Email"),
                      SizedBox(
                        height: 40,
                        child: TextFormField(
                          controller: email,
                          decoration: InputDecoration(
                              suffixIcon: Icon(Icons.person),
                              isDense: true,
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none)),
                        ),
                      )
                    ],
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  //Password
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Password"),
                      SizedBox(
                        height: 40,
                        child: Center(
                          child: TextFormField(
                            controller: password,
                            decoration: InputDecoration(
                                suffixIcon: Icon(Icons.remove_red_eye),
                                isDense: true,
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none)),
                          ),
                        ),
                      )
                    ],
                  ),

                  SizedBox(
                    height: 40,
                  ),

                  // Button Login
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        authC.login(email.text, password.text);
                      },
                      child: Text("Login"),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xffFE8991)),
                        foregroundColor: MaterialStatePropertyAll(Colors.white),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide.none,
                        )),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 40,
                  ),

                  // devider
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Colors.black,
                          margin: EdgeInsets.only(right: 20),
                        ),
                      ),
                      Text("or"),
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Colors.black,
                          margin: EdgeInsets.only(left: 20),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 40,
                  ),

                  // Button Sign Up
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => RegisterView());
                      },
                      child: Text("Sign Up"),
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                        foregroundColor: MaterialStatePropertyAll(Colors.black),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(width: 1),
                        )),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 40,
                  ),

                  //Sign In With Google
                  ElevatedButton(
                    onPressed: () async {
                      await authC.signInWithGoogle();
                      Get.to(() => HomeView());
                    },
                    child: Text("Sign In With Google"),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
