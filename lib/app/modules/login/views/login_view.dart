import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_education/app/modules/home/views/home_view.dart';

import '../../../../main.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
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
            Container(
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
                      Text("Username"),
                      SizedBox(
                        height: 40,
                        child: TextField(
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
                          child: TextField(
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
                      onPressed: () {},
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
                      onPressed: () {},
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
                      UserCredential userCredential = await signInWithGoogle();
                      
                      // Lakukan sesuatu setelah pengguna berhasil masuk dengan Google
                      print(
                          'User ${userCredential.user?.displayName} berhasil masuk!');
        
                      if (userCredential.user != null) {
                        Get.to(() => HomeView());
                        print("Session User ada");
                      }
                    },
                    child: Text("Sign In With Google"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
