import 'package:belajar_flutter/halaman_counter.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              obscureText: !isVisible,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  labelText: 'Input Username',
                  hintText: 'Masukkan username anda dengan lengkap',
                  prefixIcon: const Icon(Icons.people),
                  prefixIconColor: Colors.purple[300],
                  suffixIcon: isVisible
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                          icon: const Icon(Icons.visibility),
                        )
                      : IconButton(
                          onPressed: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                          icon: const Icon(Icons.visibility_off),
                        )),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(),
            ),
            const SizedBox(height: 100),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (builder) =>
                        CounterPage(title: usernameController.text),
                  ),
                );
              },
              child: const Text('Button pindah halaman'),
            ),
            const SizedBox(height: 20),
            RichText(
              text: const TextSpan(
                text: 'Don\'t have an account?',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
                children: [
                  TextSpan(
                    text: 'Join Us',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
