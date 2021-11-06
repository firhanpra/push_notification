import 'package:get/get.dart';

class NextPageController extends GetxController {
  //TODO: Implement NextPageController

  final count = 0.obs;
  var tess = 4.obs;

  @override
  void onInit() {
    tess.value = 5;
    super.onInit();
  }

  testing() {
    print(tess);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
