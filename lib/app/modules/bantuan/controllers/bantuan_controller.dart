import 'package:get/get.dart';
import 'package:flutter/material.dart';

class BantuanController extends GetxController {
  //TODO: Implement BantuanController

  List<String> cardPicture = [
    "https://images.bareksa.com/icons/1/secure.svg",
    "https://images.bareksa.com/icons/1/mudah.svg",
    "https://images.bareksa.com/icons/1/lengkap.svg",
    "https://images.bareksa.com/icons/1/transparant.svg",
    "https://images.bareksa.com/icons/1/educational.svg",
  ];
  List<Color> pastelColor = [
    // Color.fromARGB(255, 144, 161, 125),
    // Color.fromARGB(255, 130, 148, 96),
    Color.fromARGB(255, 250, 247, 240),
    Color.fromARGB(255, 238, 238, 238),
    Color.fromARGB(255, 200, 219, 190),
    Color.fromARGB(255, 188, 206, 248)
    // Color.fromARGB(255, 159, 135, 114),
  ];

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
