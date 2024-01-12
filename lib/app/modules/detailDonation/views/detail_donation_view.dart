import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_education/app/data/models/content_donation_model.dart';
import 'package:my_education/app/modules/payment/views/payment_view.dart';

import '../controllers/detail_donation_controller.dart';

class DetailDonationView extends GetView<DetailDonationController> {
  final ContentDonation item;
  const DetailDonationView({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailDonationView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text("${item.title}"),
          Container(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Get.to(() => PaymentView());
              },
              child: Text("Donasi"),
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                foregroundColor: MaterialStateProperty.all(Colors.black),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(width: 1),
                  ),
                ),
              ),
            ),
          ), // <-- Closing parenthesis for Container
        ],
      ),
    );
  }
}
