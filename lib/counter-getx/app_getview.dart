import 'package:belajar_flutter/counter-getx/controller.dart';
import 'package:belajar_flutter/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterGetXwithGetView extends GetView<CounterController> {
  const CounterGetXwithGetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                controller.count.toString(),
                style: const TextStyle(
                  fontSize: 50,
                  color: Colors.green,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    title: 'tambah',
                    onPressed: () {
                      controller.increment();
                    },
                  ),
                ),
                Expanded(
                  child: CustomButton(
                    title: 'kurang',
                    onPressed: () {
                      controller.decrement();
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
