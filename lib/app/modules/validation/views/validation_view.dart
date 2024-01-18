import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_education/app/controllers/payment_controller.dart';

import '../../paymentSuccessful/views/payment_successful_view.dart';

class ValidationView extends StatelessWidget {
  final String name;
  final String nominalPayment;
  final String paymentMethod;
  final String paymentMethodImage;
  final String message;

  ValidationView({
    required this.name,
    required this.nominalPayment,
    required this.paymentMethod,
    required this.paymentMethodImage,
    required this.message,
  });

  // Get reference to PaymentController
  final PaymentController paymentController = Get.find<PaymentController>();

  @override
  Widget build(BuildContext context) {
    // Create a new variable date with the current date and time
    DateTime now = DateTime.now();
    String formattedDateTime =
        "${now.day} ${_getMonth(now.month)} ${now.year} ${_formatTime(now)}";
    String date = formattedDateTime;

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
                  Text(
                    name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
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
                  Text(
                    nominalPayment,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
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
                  Text(
                    paymentMethod,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
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
                  Text(
                    message,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
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
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      // Pass data to PaymentController before storing
                      paymentController.name.value = name;
                      paymentController.nominal_payment.value = nominalPayment;
                      paymentController.payment_method.value = paymentMethod;
                      paymentController.payment_method_image.value =
                          paymentMethodImage;
                      paymentController.message.value = message;

                      // Store data including the date in PaymentController
                      paymentController.storeData(date);

                      // Navigate to PaymentSuccessfulView and pass data as arguments
                      Get.to(() => PaymentSuccessfulView(
                            name: name,
                            nominalPayment: nominalPayment,
                            paymentMethod: paymentMethod,
                            message: message,
                            date: date,
                          ));
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

  String _getMonth(int month) {
    const List<String> months = [
      'Januari',
      'Februari',
      'Maret',
      'April',
      'Mei',
      'Juni',
      'Juli',
      'Agustus',
      'September',
      'Oktober',
      'November',
      'Desember'
    ];

    return months[month - 1];
  }

  String _formatTime(DateTime dateTime) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return "${twoDigits(dateTime.hour)}:${twoDigits(dateTime.minute)}:${twoDigits(dateTime.second)} WIB";
  }
}
