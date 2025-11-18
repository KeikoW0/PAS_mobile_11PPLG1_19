import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_19/controllers/splashscreen_controller.dart';

class SplashScreenPage extends StatelessWidget {
  SplashScreenPage({super.key});

  final controller = Get.put(SplashscreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircleAvatar(
              radius: 50,
              child: Icon(Icons.shopping_basket, size: 50),
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(),
            SizedBox(height: 10),
            Text("Loading...", style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
