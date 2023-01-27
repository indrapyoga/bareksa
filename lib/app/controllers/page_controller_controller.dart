import 'package:bareksa/app/routes/app_pages.dart';
import 'package:get/get.dart';

class PageControllerController extends GetxController {
  RxInt selectedNavbar = 0.obs;

  void changeIndex(int i) {
    switch (i) {
      case 1:
        selectedNavbar.value = i;
        Get.offAllNamed(Routes.TRANSAKSI);
        break;
      case 2:
        selectedNavbar.value = i;
        Get.offAllNamed(Routes.PORTOFOLIO);
        break;
      case 3:
        selectedNavbar.value = i;
        Get.offAllNamed(Routes.BANTUAN);
        break;
      case 4:
        selectedNavbar.value = i;
        Get.offAllNamed(Routes.AKUN);
        break;
      default:
        selectedNavbar.value = i;
        Get.offAllNamed(Routes.MAIN_MENU);
    }
  }
  //TODO: Implement PageControllerController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
