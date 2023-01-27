import 'package:bareksa/app/const.dart';
import 'package:bareksa/app/controllers/page_controller_controller.dart';
import 'package:bareksa/app/global_method.dart';
import 'package:bareksa/app/modules/portofolio/views/portofolio_detail.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';

import '../controllers/portofolio_controller.dart';

class PortofolioView extends GetView<PortofolioController> {
  PortofolioView({Key? key}) : super(key: key);
  final pageC = Get.find<PageControllerController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    text: "Portofolio",
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Center(
                child: CustomText(text: "Total Investasi", fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text:
                          "${CurrencyFormat.convertToIdr(controller.total, 0)}",
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 10),
              //   child: AspectRatio(
              //     aspectRatio: 2.5,
              //     child: PieChart(
              //       PieChartData(
              //         pieTouchData: PieTouchData(
              //           touchCallback: (FlTouchEvent event, pieTouchResponse) {
              //             if (!event.isInterestedForInteractions ||
              //                 pieTouchResponse == null ||
              //                 pieTouchResponse.touchedSection == null) {
              //               touchedIndex = -1;
              //               return;
              //             }
              //             touchedIndex = pieTouchResponse
              //                 .touchedSection!.touchedSectionIndex;
              //           },
              //         ),
              //         startDegreeOffset: 180,
              //         borderData: FlBorderData(
              //           show: true,
              //         ),
              //         sectionsSpace: 1,
              //         centerSpaceRadius: 0,
              //         sections: [
              //           PieChartSectionData(
              //             color: darkGreen.withOpacity(1),
              //             value: 1500000,
              //             title: '',
              //             radius: 60,
              //             titleStyle: const TextStyle(
              //               fontSize: 18,
              //               fontWeight: FontWeight.bold,
              //               color: Color(0xff044d7c),
              //             ),
              //             titlePositionPercentageOffset: 0.55,
              //             borderSide:
              //                 BorderSide(color: darkGreen.withOpacity(0)),
              //           ),
              //           PieChartSectionData(
              //             color: darkGreen.withOpacity(1),
              //             value: 1500000,
              //             title: '',
              //             radius: 60,
              //             titleStyle: const TextStyle(
              //               fontSize: 18,
              //               fontWeight: FontWeight.bold,
              //               color: Color(0xff044d7c),
              //             ),
              //             titlePositionPercentageOffset: 0.55,
              //             borderSide:
              //                 BorderSide(color: darkGreen.withOpacity(0)),
              //           ),
              //           PieChartSectionData(
              //             color: darkGreen.withOpacity(1),
              //             value: 1500000,
              //             title: '',
              //             radius: 60,
              //             titleStyle: const TextStyle(
              //               fontSize: 18,
              //               fontWeight: FontWeight.bold,
              //               color: Color(0xff044d7c),
              //             ),
              //             titlePositionPercentageOffset: 0.55,
              //             borderSide:
              //                 BorderSide(color: darkGreen.withOpacity(0)),
              //           )
              //         ],
              //       ),
              //     ),
              //   ),
              // )
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  child: Row(
                    children: [
                      for (var i = 0; i < controller.dataPerJenis.length; i++)
                        Container(
                          height: 50,
                          width: (controller.dataPerJenis[i]["jumlahSekarang"] /
                                  controller.total!) *
                              (MediaQuery.of(context).size.width - 20),
                          decoration: BoxDecoration(
                              color: controller.warna[i],
                              borderRadius: i == 0
                                  ? BorderRadius.only(
                                      topLeft: Radius.circular(13),
                                      bottomLeft: Radius.circular(13),
                                    )
                                  : i + 1 == controller.dataPerJenis.length
                                      ? BorderRadius.only(
                                          topRight: Radius.circular(13),
                                          bottomRight: Radius.circular(13),
                                        )
                                      : BorderRadius.circular(0)),
                        ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              for (var i = 0; i < controller.dataPerJenis.length; i++)
                listJenisProduk(
                    color: controller.warna[i],
                    jenisProduk: controller.dataPerJenis[i]["jenisProduk"],
                    jumlah: controller.dataPerJenis[i]['jumlahSekarang'],
                    percentage: controller.dataPerJenis[i]['percentage'],
                    profit: controller.dataPerJenis[i]['profit'],
                    profitPercentage: controller.dataPerJenis[i]
                        ['percentageProfit']),
            ],
          ),
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: "home",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.assignment,
                ),
                label: "Transaksi",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_chart,
                ),
                label: "Portofolio",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.chat_bubble,
                ),
                label: "Bantuan",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outline_rounded,
                ),
                label: "Akun",
              ),
            ],
            currentIndex: pageC.selectedNavbar.value,
            selectedItemColor: darkPurple,
            unselectedItemColor: purple,
            showUnselectedLabels: true,
            onTap: (value) {
              pageC.changeIndex(value);
            },
          ),
        ));
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(
      5,
      (i) {
        final isTouched = i == controller.touchedIndex;
        final opacity = isTouched ? 1.0 : 0.6;

        const color0 = Color(0xff0293ee);
        const color1 = Color(0xfff8b250);
        const color2 = Color(0xff845bef);
        const color3 = Color(0xff13d38e);
        const color4 = Color(0xff395144);

        switch (i) {
          case 0:
            return PieChartSectionData(
              color: color0.withOpacity(opacity),
              value: 1500000,
              title: 'Reksadana',
              radius: 60,
              titleStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xff044d7c),
              ),
              titlePositionPercentageOffset: 0.55,
              borderSide: isTouched
                  ? BorderSide(color: color0, width: 6)
                  : BorderSide(color: color0.withOpacity(0)),
            );
          case 1:
            return PieChartSectionData(
              color: color1.withOpacity(opacity),
              value: 500000,
              title: '',
              radius: 60,
              titleStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xff90672d),
              ),
              titlePositionPercentageOffset: 0.55,
              borderSide: isTouched
                  ? BorderSide(color: color1, width: 6)
                  : BorderSide(color: color2.withOpacity(0)),
            );
          case 2:
            return PieChartSectionData(
              color: color2.withOpacity(opacity),
              value: 500000,
              title: '',
              radius: 60,
              titleStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xff4c3788),
              ),
              titlePositionPercentageOffset: 0.6,
              borderSide: isTouched
                  ? BorderSide(color: color2, width: 6)
                  : BorderSide(color: color2.withOpacity(0)),
            );
          case 3:
            return PieChartSectionData(
              color: color3.withOpacity(opacity),
              value: 500000,
              title: '',
              radius: 60,
              titleStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xff0c7f55),
              ),
              titlePositionPercentageOffset: 0.55,
              borderSide: isTouched
                  ? BorderSide(color: color3, width: 6)
                  : BorderSide(color: color2.withOpacity(0)),
            );
          case 4:
            return PieChartSectionData(
              color: darkPurple.withOpacity(opacity),
              value: 500000,
              title: '',
              radius: 60,
              titleStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: darkPurple,
              ),
              titlePositionPercentageOffset: 0.55,
              borderSide: isTouched
                  ? BorderSide(color: darkPurple, width: 6)
                  : BorderSide(color: darkPurple.withOpacity(0)),
            );
          default:
            throw Error();
        }
      },
    );
  }
}

class listJenisProduk extends StatelessWidget {
  String? jenisProduk;
  double? percentage;
  Color? color;
  int? jumlah;
  int? profit;
  String? profitPercentage;
  listJenisProduk({
    Key? key,
    required this.jenisProduk,
    required this.percentage,
    required this.color,
    required this.jumlah,
    required this.profit,
    required this.profitPercentage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => DetailPortofolio());
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: Get.width * 0.5 - 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                color: color,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(text: jenisProduk),
                            CustomText(
                                text: "${percentage!.toStringAsFixed(1)}%"),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CustomText(
                              text:
                                  "${CurrencyFormat.convertToIdr(jumlah, 0)}"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              profit! > 0
                                  ? Icon(
                                      Icons.arrow_upward,
                                      size: 14,
                                      color: lightGreen,
                                    )
                                  : profit == 0
                                      ? CustomText(text: "= ")
                                      : Icon(
                                          Icons.arrow_downward,
                                          size: 14,
                                          color: Colors.red,
                                        ),
                              CustomText(
                                text:
                                    "${CurrencyFormat.convertToIdr(profit, 0)}",
                                color: profit! > 0
                                    ? lightGreen
                                    : profit == 0
                                        ? Colors.black
                                        : Colors.red,
                              ),
                              CustomText(
                                text: profit! > 0
                                    ? " (+$profitPercentage%)"
                                    : " ($profitPercentage%)",
                                color: profit! > 0
                                    ? lightGreen
                                    : profit! == 0
                                        ? Colors.black
                                        : Colors.red,
                              ),
                            ],
                          ),
                        ],
                      ),
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.arrow_right))
                    ],
                  )
                ],
              ),
            ),
          ),
          Divider()
        ],
      ),
    );
  }
}
