import 'package:belajar_flutter/custom_button.dart';
import 'package:flutter/material.dart';

import 'counter-getx/app_getview.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final int title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('INi title'),
            CustomButton(
              title: 'Sign Up',
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (builder) => const CounterGetXwithGetView()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
