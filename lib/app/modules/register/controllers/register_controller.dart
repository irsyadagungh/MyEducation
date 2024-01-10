import 'package:get/get.dart';

class RegisterController extends GetxController {
  //TODO: Implement RegisterController

  void registerUser() {
    // Implement your registration logic here
    print('User registered');
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
