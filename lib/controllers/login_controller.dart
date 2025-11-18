import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pas_mobile_11pplg1_19/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;

  Future<void> loginApi(String username, String password) async {
    isLoading.value = true;

    final url = Uri.parse('https://mediadwi.com/api/latihan/login');

    try {
      // kirim pakai form data, bukan JSON
      final response = await http.post(
        url,
        body: {'username': username, 'password': password},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data['status'] == true) {
          Get.snackbar("Berhasil", data['message'] ?? "Login sukses!");
          print("Token: ${data['token']}");
          final token = data['token'];

          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('token', token);

          Get.offAllNamed(AppRoutes.products);
        } else {
          Get.snackbar(
            "Gagal",
            data['message'] ?? "Username atau password salah!",
          );
        }
      } else {
        Get.snackbar("Error", "Server error (${response.statusCode})");
      }
    } catch (e) {
      Get.snackbar("Error", "Terjadi kesalahan: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
