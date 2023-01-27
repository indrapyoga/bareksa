import 'dart:developer';

import 'package:bareksa/app/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainMenuController extends GetxController {
  //TODO: Implement MainMenuController

  ScrollController scrollController = ScrollController();
  RxBool atTop = true.obs;
  void _changeRotation(turns) {
    turns += 1.0 / 8.0;
  }

  RxList<bool> visibility = [false, false, false].obs;
  Map<String, dynamic> dataAkun = {"tabungan": 3200000};
  RxList<double> opacity = [0.0, 0.0, 0.0].obs;
  RxInt indikator = 0.obs;
  List<Color> warna = [
    green,
    Color.fromARGB(255, 0, 18, 83),
    Color.fromARGB(255, 255, 219, 164),
    blue,
    Color.fromARGB(255, 81, 62, 119)
  ];

  List<Map<String, dynamic>> warnaHeader = [
    {
      "dark": darkGreen,
      "light": green,
    },
    {
      "dark": Color.fromARGB(255, 92, 61, 46),
      "light": Color.fromARGB(255, 255, 192, 144),
    },
    {
      "dark": Color.fromARGB(255, 21, 14, 86),
      "light": Color.fromARGB(255, 210, 218, 255),
    },
    {
      "dark": Color.fromARGB(255, 212, 155, 84),
      "light": Color.fromARGB(255, 255, 251, 193),
    },
    {
      "dark": Color.fromARGB(255, 127, 102, 157),
      "light": Color.fromARGB(255, 202, 184, 255),
    },
  ];

  Map<String, dynamic> promo = {
    "Rookie": [
      {
        "promo": "Voucher Promo",
      }
    ],
    "Secure": [
      {
        "promo": "Voucher Promo",
      },
      {"promo": "Voucher Promo"}
    ],
    "Wealthy": [
      {
        "promo": "Voucher Promo",
      }
    ],
    "Rich": [
      {
        "promo": "Voucher Promo",
      },
      {
        "promo": "Voucher Promo",
      },
      {
        "promo": "Voucher Promo",
      },
      {
        "promo": "Voucher Promo",
      },
    ],
    "Freedom": [
      {
        "promo": "Voucher Promo",
      },
      {
        "promo": "Voucher Promo",
      },
      {
        "promo": "Voucher Promo",
      },
      {
        "promo": "Voucher Promo",
      },
      {
        "promo": "Voucher Promo",
      },
    ],
  };

  List<Map<String, dynamic>> levelInvestasi = [
    {
      "level": "Rookie",
      "threshold": 1500000,
    },
    {
      "level": "Secure",
      "threshold": 3000000,
    },
    {
      "level": "Wealthy",
      "threshold": 4500000,
    },
    {
      "level": "Rich",
      "threshold": 100000000,
    },
    {
      "level": "Freedom",
      "threshold": 250000000,
    },
  ];

  List<String> picture = [
    'https://cdn-icons-png.flaticon.com/512/7169/7169647.png',
    'https://cdn-icons-png.flaticon.com/512/4593/4593620.png',
    'https://cdn-icons-png.flaticon.com/512/8662/8662228.png',
    'https://cdn-icons-png.flaticon.com/512/4952/4952984.png',
    'https://cdn-icons-png.flaticon.com/512/4954/4954407.png'
  ];
  final count = 0.obs;
  @override
  void onInit() {
    print(indikator.value);
    for (var i = 0; i < levelInvestasi.length; i++) {
      if (dataAkun['tabungan'] <= levelInvestasi[i]['threshold']) {
        dataAkun.addAll({"level": levelInvestasi[i]["level"]});
        break;
      }
    }
    print(dataAkun);
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
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    indikator.value = 0;
    super.onClose();
  }

  void increment() => count.value++;
}
