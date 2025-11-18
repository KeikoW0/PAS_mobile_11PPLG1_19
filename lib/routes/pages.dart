import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_19/bindings/login_binding.dart';
import 'package:pas_mobile_11pplg1_19/pages/bottomnav.dart';
import 'package:pas_mobile_11pplg1_19/pages/login_page.dart';
import 'package:pas_mobile_11pplg1_19/pages/products_page.dart';
import 'package:pas_mobile_11pplg1_19/pages/register_page.dart';
import 'package:pas_mobile_11pplg1_19/routes/routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.register, page: () => RegisterPage()),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.products,
      page: () => ProductsPage(),
      binding: LoginBinding(),
    ),
    GetPage(name: AppRoutes.main, page: () => BottomNavExample()),
  ];
}
