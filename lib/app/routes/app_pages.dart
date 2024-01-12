import 'package:get/get.dart';

import '../data/models/content_donation_model.dart';
import '../modules/detailDonation/bindings/detail_donation_binding.dart';
import '../modules/detailDonation/views/detail_donation_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home_school/bindings/home_school_binding.dart';
import '../modules/home_school/views/home_school_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/payment/bindings/payment_binding.dart';
import '../modules/payment/views/payment_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_DONATION,
      page: () {
        final item = Get.arguments as ContentDonation;
        return DetailDonationView(item: item);
      },
      binding: DetailDonationBinding(),
    ),
    GetPage(
      name: _Paths.HOME_SCHOOL,
      page: () => HomeSchoolView(),
      binding: HomeSchoolBinding(),
    ),
  ];
}
