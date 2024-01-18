import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Properties to store data
  RxString name = ''.obs;
  RxString nominal_payment = ''.obs;
  RxString payment_method = ''.obs;
  RxString payment_method_image = ''.obs;
  RxString message = ''.obs;

  // Function to handle payment logic
  void processPayment() {
    // Access the data from the properties and perform necessary actions
    print('Name: ${name.value}');
    print('Nominal Payment: ${nominal_payment.value}');
    print('Payment Method: ${payment_method.value}');
    print('Message: ${message.value}');

    // You can perform additional logic here if needed
  }

  // Function to store data in Cloud Firestore
  Future<void> storeData(String date) async {
    try {
      await firestore.collection('payment').add({
        'name': name.value,
        'nominal_payment': nominal_payment.value,
        'payment_method': payment_method.value,
        'payment_method_image': payment_method_image.value,
        'message': message.value,
        'date': date, // Add date to the Firestore document
      });
      print('Data stored successfully!');
    } catch (e) {
      print('Error storing data: $e');
    }
  }
}
