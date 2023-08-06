import 'package:flutter/material.dart';

class Halaman2 extends StatelessWidget {
  const Halaman2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ini halaman 2'),
      ),
      body: Center(
        child: InkWell(
          onTap: () {},
        ),
      ),
    );
  }
}
