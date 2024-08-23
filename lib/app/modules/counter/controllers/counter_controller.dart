import 'package:get/get.dart';

class CounterController extends GetxController {
  //TODO: Implement CounterController

  final bilangan = 0.obs;

  void increment() {
    if (bilangan.value >= 20) {
      Get.snackbar('warning', 'Ges atuh uy');
    } else {
      bilangan.value++;
    }
  }

  void decrement() {
    if (bilangan.value <= 0) {
      Get.snackbar('warning', 'Beak boss');
    } else {
      bilangan.value--;
    }
  }
}
