// lib/screen/login.dart
import 'package:flutter/material.dart';
import '../service/api_service.dart';
import 'laporan.dart';

class LoginScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final api = ApiService();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email')),
            TextField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Login'),
              onPressed: () async {
                final token = await api.login(
                  email: emailController.text,
                  password: passwordController.text,
                );

                if (token != null) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => LaporanScreen()));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Login gagal")));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
