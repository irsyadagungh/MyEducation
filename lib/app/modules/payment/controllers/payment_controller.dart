import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PaymentController extends GetxController {
  //TODO: Implement PaymentController

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

// firebase
  UserCredential? userCredential;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Future<void> payment(
  //     String name, Int jumlah, String payment_method, String message) async {}

  // Properties to store data
  RxString name = ''.obs;
  RxString nominal_payment = ''.obs;
  RxString payment_method = ''.obs;
  RxString payment_method_image = "".obs;
  RxString message = ''.obs;

  // Function to handle payment logic and save data
  void processPayment() {
    // Access the data from the properties and perform necessary actions
    print('Name: $name');
    print('Nominal Payment: $nominal_payment');
    print('Payment Method: $payment_method');
    print('Message: $message');

    // You can save the data to a database, make an API call, or perform any other logic here.
  }
}
