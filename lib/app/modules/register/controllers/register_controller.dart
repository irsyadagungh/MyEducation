import 'package:get/get.dart';
import 'package:my_education/app/modules/register/services/firestore_service.dart';
// import 'package:my_education/firebase_options.dart';

class RegisterController extends GetxController {
  //TODO: Implement RegisterController

  final FirestoreService _firestoreService = FirestoreService();

  void registerUser(String username, String Email, String password) async {
    try {
      await _firestoreService.addUser(username, password);
      print('User registered in Firestore');
    } catch (e) {
      print('Error registering user: $e');
      // Handle error as needed
    }
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
