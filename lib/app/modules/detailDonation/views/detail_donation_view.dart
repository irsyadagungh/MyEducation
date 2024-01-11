import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_education/app/data/models/content_donation_model.dart';

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
          children: [Text("${item.title}")],
        ));
  }
}
