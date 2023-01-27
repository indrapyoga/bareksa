import 'package:bareksa/app/const.dart';
import 'package:bareksa/app/global_method.dart';
import 'package:bareksa/app/modules/main_menu/controllers/main_menu_controller.dart';
import 'package:bareksa/app/modules/main_menu/views/main_menu_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LevelView extends GetView<MainMenuController> {
  LevelView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.indikator.value = 0;
    return Scaffold(
      body: Obx(
        () => ListView(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          children: [
            Stack(
              children: [
                CarouselSlider(
                    options: CarouselOptions(
                      height: 260.0,
                      autoPlay: false,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        controller.indikator.value = index;
                      },
                    ),
                    items: [
                      for (var i = 0; i < controller.levelInvestasi.length; i++)
                        headerLevel(
                          thresholdLevel: controller.levelInvestasi[i]
                              ['threshold'],
                          tabunganAkun: controller.dataAkun["tabungan"],
                          levelAkun: controller.dataAkun["level"],
                          color: controller.warnaHeader[i]['dark'],
                          color2: controller.warnaHeader[i]['light'],
                          now: true,
                          picture: controller.picture[i],
                          level: controller.levelInvestasi[i]['level'],
                          sisa: CurrencyFormat.convertToIdr(3499074, 0),
                        ),
                    ]),
                Container(
                  height: 250,
                  width: Get.width,
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).padding.top,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: Icon(Icons.arrow_back)),
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Obx(
                          () => Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              for (var i = 0;
                                  i < controller.levelInvestasi.length;
                                  i++)
                                widgetIndikator(
                                  color: i == controller.indikator.value
                                      ? controller.warnaHeader[i]["dark"]
                                      : blue.withOpacity(0.4),
                                ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                height: 150,
                width: Get.width,
                decoration: BoxDecoration(
                    color: green, borderRadius: BorderRadius.circular(7)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 25),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.network(
                            "https://cdn-icons-png.flaticon.com/512/471/471713.png",
                            color: Colors.black.withOpacity(0.7),
                            width: 25,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: Get.width * 0.5,
                            child: CustomText(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              text: controller.dataAkun["tabungan"] >
                                      controller.levelInvestasi[controller
                                          .indikator.value]['threshold']
                                  ? "Anda berada di level ini"
                                  : controller.dataAkun["tabungan"] <
                                          controller.levelInvestasi[controller
                                              .indikator.value]['threshold']
                                      ? "Tingkatkan investasimu untuk menikmati berbagai keuntungan di level selanjutnya"
                                      : "Kamu belum berada di level ${controller.levelInvestasi[controller.indikator.value]['level']} dan saat ini levelmu adalah ${controller.dataAkun['level']}",
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 40,
                            width: Get.width * 0.5,
                            decoration: BoxDecoration(
                                color: Colors.lightGreen,
                                borderRadius: BorderRadius.circular(7)),
                            child: Center(
                                child: CustomText(
                              fontSize: 16,
                              text: "Tambah Investasi",
                              fontWeight: FontWeight.bold,
                            )),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            controller.dataAkun['tabungan'] >=
                    controller.levelInvestasi[controller.indikator.value]
                        ["threshold"]
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: CustomText(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        text:
                            "Keuntungan Level ${controller.levelInvestasi[controller.indikator.value]["level"]}"),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: CustomText(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        text: "Keuntungan yang Masih Terkunci"),
                  ),
            SizedBox(
              height: 10,
            ),
            for (var i = 0;
                i <
                    controller
                        .promo[
                            controller
                                    .levelInvestasi[controller.indikator.value]
                                ['level']]
                        .length;
                i++)
              promo(
                  i: i,
                  konten:
                      "Berkesempatan mendapatkan voucher reksadana, OVO Points, dan voucher Grab sampai dengan RP 100.000.*",
                  color1: controller.warnaHeader[controller.indikator.value]
                      ["dark"],
                  color2: controller.warnaHeader[controller.indikator.value]
                      ["light"],
                  judul: "Voucher Promo"),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                height: 50,
                width: Get.width,
                decoration: BoxDecoration(
                    color: lightGreen.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(3)),
                child: Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: CustomText(
                      color: darkGreen,
                      fontSize: 12,
                      text:
                          "*Syarat & Ketentuan berlaku. Silahkan cek halaman kode promo saat melakukan pembelian"),
                ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.4,
            )
          ],
        ),
      ),
    );
  }
}

class promo extends GetView<MainMenuController> {
  Color? color1;
  Color? color2;
  String? judul;
  String? konten;
  RxBool dropped = false.obs;

  int? i;
  Widget _child() {
    if (controller.levelInvestasi[controller.indikator.value]["threshold"] <=
            controller.dataAkun["tabungan"] ||
        controller.dataAkun["level"] ==
            controller.levelInvestasi[controller.indikator.value]["level"]) {
      return CustomText(
        text: "${i! + 1}",
        color: color1,
        fontWeight: FontWeight.w800,
      );
    } else {
      return Image.network(
        "https://cdn-icons-png.flaticon.com/512/3064/3064197.png",
        height: 20,
        color: color1,
      );
    }
  }

  promo({
    Key? key,
    required this.color1,
    required this.color2,
    required this.judul,
    required this.konten,
    required this.i,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 20),
            child: InkWell(
              onTap: () => dropped.toggle(),
              child: Row(
                children: [
                  Container(
                    height: 35,
                    width: 35,
                    decoration:
                        BoxDecoration(color: color2, shape: BoxShape.circle),
                    child: Center(child: _child()),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: CustomText(
                          text: judul,
                          fontWeight: FontWeight.w800,
                          fontSize: 16),
                    ),
                  ),
                  dropped.isFalse
                      ? Image.network(
                          "https://cdn-icons-png.flaticon.com/512/2722/2722987.png",
                          height: 20,
                        )
                      : Image.network(
                          "https://cdn-icons-png.flaticon.com/512/130/130906.png",
                          height: 13,
                        ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 60.0, right: 20),
            child: dropped.isFalse
                ? Divider(
                    color: Colors.black,
                  )
                : Column(
                    children: [
                      CustomText(fontWeight: FontWeight.w400, text: konten),
                      SizedBox(
                        height: 5,
                      ),
                      Divider(
                        color: Colors.black,
                      )
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}

class widgetIndikator extends StatelessWidget {
  Color? color;
  widgetIndikator({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }
}

class headerLevel extends StatelessWidget {
  int? tabunganAkun;
  String? levelAkun;
  bool? now;
  int? thresholdLevel;
  String? level;
  String? picture;
  String? sisa;
  Color? color;
  Widget _child() {
    if (thresholdLevel! <= tabunganAkun! || levelAkun == level) {
      return Image.network(
        "https://cdn-icons-png.flaticon.com/512/2961/2961545.png",
        height: 24,
        color: Colors.black.withOpacity(0.7),
      );
    } else {
      return Image.network(
        "https://cdn-icons-png.flaticon.com/512/3064/3064197.png",
        height: 24,
        color: Colors.black.withOpacity(0.7),
      );
    }
  }

  Color? color2;
  headerLevel({
    Key? key,
    this.now,
    required this.thresholdLevel,
    required this.level,
    required this.levelAkun,
    required this.tabunganAkun,
    required this.picture,
    required this.sisa,
    required this.color,
    required this.color2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      width: Get.width,
      decoration: BoxDecoration(
          color: color2,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    level == levelAkun
                        ? CustomText(text: "Level investasi saat ini")
                        : Container(),
                    CustomText(
                      text: level,
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                      color: color,
                    )
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Image.network(
                      picture!,
                      height: 150,
                      fit: BoxFit.fitHeight,
                    ),
                  ],
                )
              ],
            ),
            level == levelAkun
                ? Stack(
                    children: [
                      Container(
                        width: Get.width - 40,
                        height: 4,
                        decoration: BoxDecoration(
                            color: color!.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      Container(
                        width: (Get.width - 40) * 0.3,
                        height: 4,
                        decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(20)),
                      )
                    ],
                  )
                : Container(),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                _child(),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: CustomText(
                    fontSize: 12,
                    text: tabunganAkun! > thresholdLevel!
                        ? "Anda berada di level ini"
                        : tabunganAkun! < thresholdLevel!
                            ? "Investasi lagi sebanyak ${CurrencyFormat.convertToIdr((thresholdLevel! - tabunganAkun!), 0)}  untuk naik ke level selanjutnya."
                            : "Investasi lagi sebanyak ${CurrencyFormat.convertToIdr((thresholdLevel! - tabunganAkun!), 0)}  untuk naik ke level $level.",
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
// ${thresholdLevel! - tabunganAkun!}