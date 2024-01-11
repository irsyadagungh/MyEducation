import 'package:get/get.dart';

import '../controllers/detail_donation_controller.dart';

class DetailDonationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailDonationController>(
      () => DetailDonationController(),
    );
  }
}
