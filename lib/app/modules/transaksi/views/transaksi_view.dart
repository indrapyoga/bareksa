import 'package:bareksa/app/const.dart';
import 'package:bareksa/app/controllers/page_controller_controller.dart';
import 'package:bareksa/app/global_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:get/get.dart';

import '../controllers/transaksi_controller.dart';

RxString query = "Reksadana".obs;
List<String> jenisProduk = [
  "Reksadana",
  "Robo",
  "SBN",
  "Emas",
  "Umroh",
];

class TransaksiView extends GetView<TransaksiController> {
  TransaksiView({Key? key}) : super(key: key);

  final pageC = Get.find<PageControllerController>();

  // TabController tabController = TabController(length: 2,vsync: TickerProvider());
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          body: Stack(
            children: [
              TabBarView(
                children: [
                  tabOne(),
                  tabTwo(),
                ],
              ),
              Container(
                height: MediaQuery.of(context).padding.top + 90,
                color: Colors.white,
                child: SafeArea(
                    child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: CustomText(
                          text: "Transaksi",
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TabBar(
                        indicatorColor: lightGreen,
                        onTap: (value) {
                          print(value);
                        },
                        tabs: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomText(
                              text: "Dalam Proses",
                              fontSize: 17,
                              color: lightGreen,
                            ),
                          ),
                          CustomText(
                            text: "Selesai",
                            fontSize: 17,
                            color: lightGreen,
                          ),
                        ])
                  ],
                )),
              )
            ],
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
          )),
    );
  }
}

class tabTwo extends StatelessWidget {
  const tabTwo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 100,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 0.5),
                      borderRadius: BorderRadius.circular(4)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: Icon(
                      Icons.display_settings,
                      color: darkPurple,
                    )),
                  ),
                ),
              ),
              for (var i = 0; i < jenisProduk.length; i++)
                Obx(
                  () => InkWell(
                    onTap: () {
                      query.value = jenisProduk[i];
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            color: query.value == jenisProduk[i]
                                ? purple.withOpacity(0.2)
                                : Colors.white,
                            border: query.value == jenisProduk[i]
                                ? Border.all(color: darkPurple, width: 0.5)
                                : Border.all(color: Colors.grey, width: 0.5),
                            borderRadius: BorderRadius.circular(4)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              Center(child: CustomText(text: jenisProduk[i])),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        SizedBox(
          height: 35,
        ),
        cardTransaksi(
          icon:
              'https://images.bareksa.com/bareksa/img/products/home_superapp_reksadana@2x.png',
          jenis: "Reksadana",
          tanggal: "27 Sept 2022, 19:47",
          status: "Pembelian Berhasil",
          jenisInvestasi: "Pendapatan Tetap",
          produkInvestasi: "Syailendra Pendapatan Tetap Premium",
          transaksi: "Transaksi Pembelian",
          jumlah: 1500000,
          unit: 822.8438,
        ),
        cardTransaksi(
          icon:
              'https://images.bareksa.com/bareksa/img/products/home_superapp_reksadana@2x.png',
          jenis: "Reksadana",
          tanggal: "27 Sept 2022, 19:47",
          status: "Penjualan Berhasil",
          jenisInvestasi: "Pendapatan Tetap",
          produkInvestasi: "Syailendra Pendapatan Tetap Premium",
          transaksi: "Transaksi Pembelian",
          jumlah: 1500000,
          unit: 822.8438,
        ),
        cardTransaksi(
          icon:
              'https://images.bareksa.com/bareksa/img/products/home_superapp_reksadana@2x.png',
          jenis: "Reksadana",
          tanggal: "27 Sept 2022, 19:47",
          status: "Pembelian Berhasil",
          jenisInvestasi: "Pendapatan Tetap",
          produkInvestasi: "Syailendra Pendapatan Tetap Premium",
          transaksi: "Transaksi Pembelian",
          jumlah: 1500000,
          unit: 822.8438,
        ),
      ],
    );
  }
}

class tabOne extends StatelessWidget {
  const tabOne({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 100,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 0.5),
                      borderRadius: BorderRadius.circular(4)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: Icon(
                      Icons.display_settings,
                      color: darkPurple,
                    )),
                  ),
                ),
              ),
              for (var i = 0; i < jenisProduk.length; i++)
                Obx(
                  () => InkWell(
                    onTap: () {
                      query.value = jenisProduk[i];
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            color: query.value == jenisProduk[i]
                                ? purple.withOpacity(0.2)
                                : Colors.white,
                            border: query.value == jenisProduk[i]
                                ? Border.all(color: darkPurple, width: 0.5)
                                : Border.all(color: Colors.grey, width: 0.5),
                            borderRadius: BorderRadius.circular(4)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              Center(child: CustomText(text: jenisProduk[i])),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        SizedBox(
          height: 35,
        ),
        cardTransaksi(
          icon:
              'https://images.bareksa.com/bareksa/img/products/home_superapp_reksadana@2x.png',
          jenis: "Reksadana",
          tanggal: "27 Sept 2022, 19:47",
          status: "Pembelian Berhasil",
          jenisInvestasi: "Pendapatan Tetap",
          produkInvestasi: "Syailendra Pendapatan Tetap Premium",
          transaksi: "Transaksi Pembelian",
          jumlah: 1500000,
          unit: 822.8438,
        ),
        cardTransaksi(
          icon:
              'https://images.bareksa.com/bareksa/img/products/home_superapp_reksadana@2x.png',
          jenis: "Reksadana",
          tanggal: "27 Sept 2022, 19:47",
          status: "Penjualan Berhasil",
          jenisInvestasi: "Pendapatan Tetap",
          produkInvestasi: "Syailendra Pendapatan Tetap Premium",
          transaksi: "Transaksi Pembelian",
          jumlah: 1500000,
          unit: 822.8438,
        ),
        cardTransaksi(
          icon:
              'https://images.bareksa.com/bareksa/img/products/home_superapp_reksadana@2x.png',
          jenis: "Reksadana",
          tanggal: "27 Sept 2022, 19:47",
          status: "Penjualan Berhasil",
          jenisInvestasi: "Pendapatan Tetap",
          produkInvestasi: "Syailendra Pendapatan Tetap Premium",
          transaksi: "Transaksi Pembelian",
          jumlah: 1500000,
          unit: 822.8438,
        ),
      ],
    );
  }
}

class cardTransaksi extends StatelessWidget {
  String? icon;
  String? jenis;
  String? tanggal;
  String? status;
  String? jenisInvestasi;
  String? produkInvestasi;
  String? transaksi;
  int? jumlah;
  double? unit;
  cardTransaksi({
    Key? key,
    required this.icon,
    required this.jenis,
    required this.tanggal,
    required this.status,
    required this.jenisInvestasi,
    required this.produkInvestasi,
    required this.transaksi,
    required this.jumlah,
    required this.unit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            height: 220,
            decoration: BoxDecoration(
                border: Border.all(width: 0.5, color: Colors.grey),
                borderRadius: BorderRadius.circular(2)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.network(
                            icon!,
                            width: 40,
                            fit: BoxFit.fitWidth,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(text: jenis),
                              CustomText(
                                text: tanggal,
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              ),
                            ],
                          )
                        ],
                      ),
                      Container(
                        height: 25,
                        decoration: BoxDecoration(
                          color: status == "Pembelian Berhasil"
                              ? green
                              : purple.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Center(
                              child: CustomText(
                            text: status,
                            color: status == "Pembelian Berhasil"
                                ? darkGreen
                                : darkPurple,
                          )),
                        ),
                      )
                    ],
                  ),
                  Divider(),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: jenisInvestasi,
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                        CustomText(text: produkInvestasi),
                        SizedBox(
                          height: 10,
                        ),
                        CustomText(
                          text: transaksi,
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                        CustomText(
                            text: "${CurrencyFormat.convertToIdr(jumlah, 0)}"),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(color: green),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Center(
                        child: CustomText(
                            text:
                                "Pembelian reksadana sebanyak $unit unit telah masuk ke akun kamu"),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
