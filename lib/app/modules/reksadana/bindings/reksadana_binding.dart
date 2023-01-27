import 'package:get/get.dart';

import '../controllers/reksadana_controller.dart';

class ReksadanaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReksadanaController>(
      () => ReksadanaController(),
    );
  }
}
