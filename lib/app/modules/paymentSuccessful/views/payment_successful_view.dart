import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_education/app/modules/home/views/home_view.dart';

class PaymentSuccessfulView extends StatelessWidget {
  final String name;
  final String nominalPayment;
  final String paymentMethod;
  final String message;
  final String date;

  PaymentSuccessfulView({
    required this.name,
    required this.nominalPayment,
    required this.paymentMethod,
    required this.message,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:
                CrossAxisAlignment.center, // Center text horizontally
            children: [
              Center(
                child: Container(
                  child: Image.asset(
                    'assets/images/checklist.png',
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Pembayaran Berhasil!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Center(
                child: Text(
                  date,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(height: 16),
              PaymentInfoRow(
                label: 'Nama',
                value: name,
              ),
              PaymentInfoRow(
                label: 'Nominal',
                value: nominalPayment,
              ),
              PaymentInfoRow(
                label: 'Metode Pembayaran',
                value: paymentMethod,
              ),
              SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => HomeView());
                  },
                  child: Text('Kembali Ke Home'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentInfoRow extends StatelessWidget {
  final String label;
  final String value;

  PaymentInfoRow({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 8),
        Center(
          child: Text(
            ': $value',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
