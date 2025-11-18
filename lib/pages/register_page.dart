import 'package:flutter/material.dart';
import 'package:pas_mobile_11pplg1_19/widgets/widget_textfield.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  void _register() {
    final username = usernameController.text;
    final password = passwordController.text;
    final nama = namaController.text;
    final email = emailController.text;

    print("Username: $username");
    print("Password: $password");
    print("Nama: $nama");
    print("Email: $email");

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Register berhasil!")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register Page")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(label: "Username", controller: usernameController),
            CustomTextField(
              label: "Password",
              controller: passwordController,
              obscureText: true,
            ),
            CustomTextField(label: "Nama Lengkap", controller: namaController),
            CustomTextField(
              label: "Email",
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: _register,
                child: Text("Daftar"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
