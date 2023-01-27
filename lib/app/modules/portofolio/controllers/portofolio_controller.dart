import 'package:bareksa/app/const.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
// To parse this JSON data, do
//
//     final dataPerJenis = dataPerJenisFromJson(jsonString);

class PortofolioController extends GetxController {
  RxBool visible = false.obs;
  int touchedIndex = -1.obs;

  List<Color> warna = [
    Color.fromARGB(255, 1, 35, 86),
    darkGreen,
    Color.fromARGB(255, 151, 73, 37),
    Color.fromARGB(255, 135, 114, 176),
    Color.fromARGB(255, 51, 38, 77),
  ];

  List<Map<String, dynamic>> dataPerJenis = [
    {
      "jenisProduk": "Reksadana",
      "jumlahBeli": 1500000,
      "jumlahSekarang": 1498000
    },
    {
      "jenisProduk": "Robo Advisor",
      "jumlahBeli": 100000,
      "jumlahSekarang": 120000,
    },
    {
      "jenisProduk": "SBN",
      "jumlahBeli": 1000000,
      "jumlahSekarang": 1020301,
    },
    {
      "jenisProduk": "Emas",
      "jumlahBeli": 1000000,
      "jumlahSekarang": 1020301,
    },
    {
      "jenisProduk": "Umroh",
      "jumlahBeli": 1000000,
      "jumlahSekarang": 50000,
    },
  ];

  int? total = 0;
  //TODO: Implement PortofolioController

  // "percentage": percentage,
  // "profit": profit,
  // "percentageProfit": percentageProfit

  final count = 0.obs;
  @override
  void onInit() {
    total = 0;
    for (var i = 0; i < dataPerJenis.length; i++) {
      int a = dataPerJenis[i]['jumlahSekarang'];
      total = a + total!;
      int profit =
          dataPerJenis[i]['jumlahSekarang'] - dataPerJenis[i]['jumlahBeli'];
      String percentageProfit =
          (profit / dataPerJenis[i]['jumlahBeli'] * 100).toStringAsFixed(1);
      dataPerJenis[i]
          .addAll({"profit": profit, "percentageProfit": percentageProfit});
    }
    for (var i = 0; i < dataPerJenis.length; i++) {
      double percentage = dataPerJenis[i]['jumlahSekarang'] / total! * 100;
      dataPerJenis[i].addAll({"percentage": percentage});
    }
    print(total);
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
