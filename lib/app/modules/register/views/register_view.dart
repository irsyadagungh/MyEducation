// views/register_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_education/app/controllers/auth_controller.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  final authC = Get.find<AuthController>();

  final name = TextEditingController();
  final username = TextEditingController();
  final phone = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          child: Image.asset(
            'assets/images/bg.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Logo
              Container(
                alignment: AlignmentDirectional.topCenter,
                child: Image.asset(
                  'assets/images/log in.png',
                ),
              ),
              // Your registration form widgets can go here
              TextFormField(
                controller: name,
                decoration: InputDecoration(labelText: 'Fullname'),
              ),
              TextFormField(
                controller: username,
                decoration: InputDecoration(labelText: 'Username'),
              ),
              TextFormField(
                controller: phone,
                decoration: InputDecoration(labelText: 'Nomor Telephone'),
              ),
              TextFormField(
                controller: email,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextFormField(
                controller: password,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              ElevatedButton(
                onPressed: () {
                  // Call a function in the controller to handle registration logic
                  authC.register(name.text, username.text, phone.text,
                      email.text, password.text);
                },
                child: const Text('Register'),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
