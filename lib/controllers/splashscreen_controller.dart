// splashscreen_controller.dart
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_19/pages/login_page.dart';
import 'package:pas_mobile_11pplg1_19/pages/products_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashscreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _checkLogin();
  }

  Future<void> _checkLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? user = prefs.getString('user');

    // kasih delay biar kaya splash screen beneran
    await Future.delayed(const Duration(seconds: 2));

    if (user == null) {
      Get.offAll(() => LoginPage());
    } else {
      Get.offAll(() => ProductsPage(categories: []));
    }
  }
}
