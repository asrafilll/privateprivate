import 'package:get/get.dart';

class CounterController extends GetxController {
  var count = 30.obs;
  increment() => count++;
  decrement() => count--;
}
