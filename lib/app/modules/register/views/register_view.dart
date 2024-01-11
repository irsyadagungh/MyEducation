// views/register_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_education/app/controllers/auth_controller.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  final authC = Get.find<AuthController>();

  final username = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Your registration form widgets can go here
            TextFormField(
              controller: username,
              decoration: InputDecoration(labelText: 'Username'),
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
                authC.register(
                    username.text, email.text, password.text, "user");
              },
              child: const Text('Register'),
            ),

            ElevatedButton(
                onPressed: () {
                  authC.register(
                      username.text, email.text, password.text, "school");
                },
                child: Text("Sign In as School"))
          ],
        ),
      ),
    );
  }
}
