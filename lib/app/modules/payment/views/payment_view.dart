import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_education/app/controllers/payment_controller.dart';

class PaymentView extends GetView<PaymentController> {
  final payment = Get.find<PaymentController>();

  TextEditingController name = TextEditingController();
  TextEditingController nominal_payment = TextEditingController();
  TextEditingController message = TextEditingController();
  var payment_method = ''.obs;
  var payment_method_image = 'assets/images/bg.png'.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: Image.asset(
              'assets/images/bgdonate.png',
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
                Container(
                  child: Image.asset(
                    'assets/images/donate.png',
                  ),
                ),
                TextFormField(
                  controller: name,
                  decoration: InputDecoration(labelText: 'Fullname'),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 8.0),
                  child: TextFormField(
                    controller: nominal_payment,
                    decoration: InputDecoration(labelText: 'Jumlah'),
                  ),
                ),
                Container(
                  child: ElevatedButton(
                    onPressed: () {
                      showPaymentMethodList();
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(() {
                          String imagePath =
                              controller.payment_method_image.value;
                          if (imagePath.isNotEmpty) {
                            return Container(
                              width: 40,
                              height: 40,
                              child: Image.asset(
                                imagePath,
                                fit: BoxFit.cover,
                              ),
                            );
                          } else {
                            // Return a default image or an empty container if imagePath is empty
                            return Container();
                          }
                        }),
                        Spacer(),
                        Obx(() => Text(
                              controller.payment_method.value.isEmpty
                                  ? 'Choose Payment Method'
                                  : controller.payment_method.value,
                              style: TextStyle(fontSize: 16),
                            )),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
                TextFormField(
                  controller: message,
                  decoration: InputDecoration(labelText: 'Pesan'),
                ),
                // ElevatedButton(
                //   onPressed: () {
                //     controller.name.value = name.text;
                //     controller.payment_method.value =
                //         controller.payment_method.value;
                //     controller.nominal_payment.value = nominal_payment.text;
                //     controller.message.value = message.text;
                //     controller.processPayment();
                //   },
                //   child: const Text('Make Payment'),
                // ),
                ElevatedButton(
                  onPressed: () {
                    // Extract the entered data
                    String enteredName = name.text;
                    String enteredNominalPayment = nominal_payment.text;
                    String enteredMessage = message.text;

                    // Check if all required fields are filled
                    if (enteredName.isNotEmpty &&
                        enteredNominalPayment.isNotEmpty &&
                        controller.payment_method.value.isNotEmpty) {
                      // Navigate to the validation view, passing entered data
                      Get.to(() => ValidationView(
                            name: enteredName,
                            nominalPayment: enteredNominalPayment,
                            paymentMethod: controller.payment_method.value,
                            paymentMethodImage:
                                controller.payment_method_image.value,
                            message: enteredMessage,
                          ));
                    } else {
                      // Show an error message or prompt the user to fill in all fields
                      Get.snackbar(
                          'Error', 'Please fill in all required fields');
                    }
                  },
                  child: const Text('Make Payment'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showPaymentMethodList() {
    showModalBottomSheet(
      context: Get.context!,
      builder: (BuildContext context) {
        return ListView(
          children: [
            ListTile(
              title: Row(
                children: [
                  Image.asset(
                    'assets/images/donate.png',
                    width: 30,
                    height: 30,
                  ),
                  SizedBox(width: 10),
                  Text('Payment Method 1'),
                ],
              ),
              onTap: () {
                controller.payment_method.value = 'Payment Method 1';
                controller.payment_method_image.value =
                    'assets/images/donate.png';
                Get.back();
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Image.asset(
                    'assets/images/bg.png',
                    width: 30,
                    height: 30,
                  ),
                  SizedBox(width: 10),
                  Text('Payment Method 2'),
                ],
              ),
              onTap: () {
                controller.payment_method.value = 'Payment Method 2';
                controller.payment_method_image.value = 'assets/images/bg.png';
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }
}
