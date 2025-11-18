import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_19/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final Color backgroundColor = Colors.white;
  final Color textColor = Colors.green[900]!;

  final String userName = "Keiko Shafira Wiyana";
  final String userAbsen = "19";
  final String userKelas = "11 PPLG 1";
  final String userImage = "assets/images/avatar_1.png"; // ganti sesuai asetmu

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Get.offAllNamed(AppRoutes.login); // replace route -> balik ke splash/login
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text("My Profile", style: TextStyle(color: textColor)),
        iconTheme: IconThemeData(color: textColor),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(radius: 60, backgroundImage: AssetImage(userImage)),
            const SizedBox(height: 20),
            Text(
              userName,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              "Absen: $userAbsen",
              style: TextStyle(fontSize: 16, color: textColor.withOpacity(0.8)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              "Kelas: $userKelas",
              style: TextStyle(fontSize: 16, color: textColor.withOpacity(0.8)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            ElevatedButton.icon(
              onPressed: logout,
              icon: const Icon(Icons.logout, color: Colors.white),
              label: const Text(
                "Logout",
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[700],
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
