import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_19/controllers/login_controller.dart';
import 'package:pas_mobile_11pplg1_19/pages/register_page.dart';
import 'package:pas_mobile_11pplg1_19/widgets/widget_button.dart';
import 'package:pas_mobile_11pplg1_19/widgets/widget_textfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // pakai GetX untuk controller login
  final controller = Get.put(LoginController());

  // controller untuk text field
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login Page")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome to Our First App",
              style: TextStyle(
                fontSize: 20,
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text("Please Login Using Your Username and Password"),
            const SizedBox(height: 20),

            // Input Username
            MyTextField(
              textEditingController: usernameController,
              labelText: "Input username",
            ),

            const SizedBox(height: 10),

            // Input Password
            MyTextField(
              textEditingController: passwordController,
              labelText: "Input password",
            ),

            const SizedBox(height: 30),

            // Tombol login
            Center(
              child: Obx(
                () => controller.isLoading.value
                    ? const CircularProgressIndicator()
                    : CustomButton(
                        text: "Login",
                        textColor: Colors.red,
                        onPressed: () {
                          final username = usernameController.text.trim();
                          final password = passwordController.text.trim();

                          if (username.isEmpty || password.isEmpty) {
                            Get.snackbar(
                              "Peringatan",
                              "Isi semua field terlebih dahulu!",
                            );
                          } else {
                            controller.loginApi(username, password);
                          }
                        },
                      ),
              ),
            ),

            const SizedBox(height: 2),

            // Tombol Register
            Center(
              child: CustomButton(
                text: "Register",
                textColor: Colors.green,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterPage(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
