import 'package:get/get.dart';

import '../controllers/home_school_controller.dart';

class HomeSchoolBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeSchoolController>(
      () => HomeSchoolController(),
    );
  }
}
