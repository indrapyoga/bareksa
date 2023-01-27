import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
  RxBool atTop = true.obs;
  ScrollController scrollController = ScrollController();
  RxList<bool> visibility = [false, false, false].obs;
  RxList<double> opacity = [0.0, 0.0, 0.0].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    scrollController.addListener(() {
      RxBool isTop = (scrollController.position.pixels == 0).obs;
      print(isTop);
      if (scrollController.position.pixels == 0) {
        visibility.value = [false, false, false].obs;
        atTop.value = true;
        opacity.value = [0.0, 0.0, 0.0];
      } else {
        atTop.value = false;
      }
    });
    visibility.value = [false, false, false].obs;
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
