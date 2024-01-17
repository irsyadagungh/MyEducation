import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  var page = 0.obs;

  void changePage(int index) {
    page.value = index;
  }
}
