import 'dart:developer';

import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ReksadanaController extends GetxController
    with GetSingleTickerProviderStateMixin {
  //TODO: Implement ReksadanaController

  final count = 0.obs;
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Pasar Uang'),
    Tab(text: 'Pendapatan Tetap'),
    Tab(text: 'Campuran'),
    Tab(text: 'Saham'),
    Tab(text: 'Indeks'),
  ];
  RxInt indikator = 0.obs;

  late TabController tabController;
  List<String> carouselPicture = [
    'https://images.bareksa.com/bareksa/img/sliders/bareksa-home-slider-414.jpg',
    'https://images.bareksa.com/bareksa/img/sliders/bareksa-home-slider-401.jpg',
    'https://images.bareksa.com/bareksa/img/sliders/bareksa-home-slider-420.jpg',
  ];
  RxList<double> opacity = [0.0, 0.0, 0.0].obs;
  RxList<bool> visibility = [false, false, false].obs;
  ScrollController scrollController = ScrollController();
  RxBool atTop = true.obs;

  @override
  void onInit() {
    scrollController.addListener(() {
      RxBool isTop = (scrollController.position.pixels == 0).obs;
      if (scrollController.position.pixels == 0) {
        visibility.value = [false, false, false].obs;
        atTop.value = true;
        opacity.value = [0.0, 0.0, 0.0];
      } else {
        atTop.value = false;
      }
    });
    super.onInit();
    visibility.value = [false, false, false].obs;
    super.onInit();
    tabController = TabController(length: myTabs.length, vsync: this);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    tabController.dispose();
    indikator.value = 0;

    super.onClose();
  }

  void increment() => count.value++;
}
