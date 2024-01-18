import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/validation_controller.dart';

class ValidationView extends StatelessWidget {
  final ValidationController controller = Get.put(ValidationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  child: Image.asset(
                    'assets/images/donate.png',
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    'Nama :',
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(width: 10),
                  Obx(() => Text(
                        controller.nameController.text,
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      )),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    'Nominal Pembayaran :',
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(width: 10),
                  Obx(() => Text(
                        controller.nominalPaymentController.text,
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      )),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    'Metode Pembayaran :',
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(width: 10),
                  Obx(() => Text(
                        controller.paymentMethodController.text,
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      )),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    'Message :',
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(width: 10),
                  Obx(() => Text(
                        controller.messageController.text,
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      )),
                ],
              ),
              SizedBox(height: 20),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.all(12),
                  child: Text(
                    'Mohon pastikan semua informasi sudah sesuai sebelum melakukan transaksi',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      // Handle "Batal" button press
                      Get.back();
                    },
                    child: Text('Batal'),
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                      minimumSize: Size(150, 50),
                      side: BorderSide(
                          color: Colors.red), // Add this line for red border
                    ),
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      // Handle "Lanjutkan" button press
                      if (controller.isValid.isTrue) {
                        controller.storeData();
                        Get.back();
                      } else {
                        Get.snackbar(
                          'Validation Error',
                          'Please fill in all fields.',
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                        );
                      }
                    },
                    child: Text('Lanjutkan'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red[300],
                      onPrimary: Colors.white,
                      minimumSize: Size(150, 50),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
