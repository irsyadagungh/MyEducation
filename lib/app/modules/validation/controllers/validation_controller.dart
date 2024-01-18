import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ValidationController extends GetxController {
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

  final nameController = TextEditingController();
  final nominalPaymentController = TextEditingController();
  final paymentMethodController = TextEditingController();
  final messageController = TextEditingController();

  RxBool isValid = false.obs;

  void validateData() {
    // Perform your validation logic here
    bool isNameValid = nameController.text.isNotEmpty;
    bool isNominalValid = nominalPaymentController.text.isNotEmpty;
    bool isPaymentMethodValid = paymentMethodController.text.isNotEmpty;
    bool isMessageValid = messageController.text.isNotEmpty;

    isValid.value =
        isNameValid && isNominalValid && isPaymentMethodValid && isMessageValid;
  }

  Future<void> storeData() async {
    try {
      await FirebaseFirestore.instance.collection('your_collection_name').add({
        'name': nameController.text,
        'nominalPayment': nominalPaymentController.text,
        'paymentMethod': paymentMethodController.text,
        'message': messageController.text,
      });
    } catch (e) {
      print('Error storing data: $e');
    }
  }
}
