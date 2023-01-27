import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AkunController extends GetxController {
  //TODO: Implement AkunController
  ScrollController scrollController = ScrollController();
  RxBool atTop = true.obs;

  final count = 0.obs;
  @override
  void onInit() {
    scrollController.addListener(() {
      RxBool isTop = (scrollController.position.pixels == 0).obs;
      if (scrollController.position.pixels == 0) {
        atTop.value = true;
      } else {
        atTop.value = false;
      }
    });
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
