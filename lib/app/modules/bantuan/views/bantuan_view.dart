import 'dart:math';

import 'package:bareksa/app/const.dart';
import 'package:bareksa/app/controllers/page_controller_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../controllers/bantuan_controller.dart';

class BantuanView extends GetView<BantuanController> {
  BantuanView({Key? key}) : super(key: key);
  final pageC = Get.find<PageControllerController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Container(
              height: Get.height * 0.5,
              color: green,
            ),
            ListView(
              children: [
                Container(
                  height: 130,
                  width: Get.width,
                  color: green,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        CustomText(
                          text: "Pusat Bantuan Bareksa",
                          color: darkGreen,
                          fontSize: 22,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 50,
                          width: Get.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(color: Colors.grey, width: 0.3),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: "Cari kata kunci (misal: reksadana)",
                                    color: Colors.grey,
                                    fontSize: 15,
                                  ),
                                  Icon(Icons.search),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      seringDitanyakan(),
                      SizedBox(
                        height: 35,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: CustomText(
                            text: "Kategori Bantuan",
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: GridView.count(
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisSpacing: Get.width / 3 - 40 - 50,
                          shrinkWrap: true,
                          crossAxisCount: 3,
                          children: [
                            ButtonIcon(
                              judul: "Reksadana",
                              url:
                                  'https://images.bareksa.com/bareksa/img/products/home_superapp_reksadana@2x.png',
                            ),
                            ButtonIcon(
                              judul: "Robo",
                              url:
                                  'https://images.bareksa.com/bareksa/img/products/home_superapp_robo@2x.png',
                            ),
                            ButtonIcon(
                              judul: "SBN",
                              url:
                                  'https://images.bareksa.com/bareksa/img/products/home_superapp_sbn@2x.png',
                            ),
                            ButtonIcon(
                              judul: "Emas",
                              url:
                                  'https://images.bareksa.com/bareksa/img/products/home_superapp_emas@2x.png',
                            ),
                            ButtonIcon(
                              judul: "Umroh",
                              url:
                                  'https://images.bareksa.com/bareksa/img/products/home_superapp_umroh@2x.png',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: CustomText(
                            text: "Tutorial",
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: ScrollPhysics(),
                        child: Row(
                          children: [
                            for (var i = 0;
                                i < controller.cardPicture.length;
                                i++)
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Container(
                                  height: 130,
                                  width: 110,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          width: 0.5, color: Colors.grey)),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 80,
                                        width: 110,
                                        decoration: BoxDecoration(
                                            color: controller.pastelColor[
                                                Random().nextInt(controller
                                                    .pastelColor.length)],
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Center(
                                            child: SvgPicture.network(
                                              controller.cardPicture[i],
                                              fit: BoxFit.fitHeight,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                          child: Center(
                                        child: Text(
                                          "Produk di Bareksa",
                                          textAlign: TextAlign.center,
                                        ),
                                      ))
                                    ],
                                  ),
                                ),
                              )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Divider(
                        thickness: 4,
                        color: green,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: CustomText(
                            text: "Punya kendala atau pertanyaan?",
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: CustomText(
                            text:
                                "Kami siap membantumu setiap hari pukul 08:00-22:00 WIB (Live Chat) dan pukul 08:00-17:00 WIB (Email dan Telepon)."),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      listTileFaq(
                        urlImage:
                            "https://cdn-icons-png.flaticon.com/512/589/589708.png",
                        title: "Live Chat",
                        subtitle: "Tanya jawab langsung melalui chat",
                        withDivider: true,
                      ),
                      listTileFaq(
                        urlImage:
                            "https://cdn-icons-png.flaticon.com/512/561/561127.png",
                        title: "Email",
                        subtitle: "Kirim pertanyaan ke cs@bareksa.com",
                        withDivider: true,
                      ),
                      listTileFaq(
                        urlImage:
                            "https://cdn-icons-png.flaticon.com/512/126/126509.png",
                        title: "Telepon",
                        subtitle: "Hubungi kami di (021) 8067 6767",
                      ),
                      Divider(
                        thickness: 7,
                        color: green,
                      ),
                      listTileTwo(
                        urlImage:
                            "https://cdn-icons-png.flaticon.com/512/888/888034.png",
                        title: "Syarat dan Ketentuan",
                        withDivider: true,
                      ),
                      listTileTwo(
                        urlImage:
                            "https://cdn-icons-png.flaticon.com/512/109/109991.png",
                        title: "Kebijakan Privasi",
                      ),
                      Divider(
                        thickness: 7,
                        color: green,
                      ),
                      listTileThree(
                          urlImage:
                              "https://cdn-icons-png.flaticon.com/512/2312/2312258.png",
                          title: "Komunitas Bareksa"),
                      Divider(
                        thickness: 7,
                        color: green,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: CustomText(
                              text: "PT Bareksa Portal Investasi",
                              fontWeight: FontWeight.w800,
                              fontSize: 20,
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: CustomText(
                              text:
                                  "Jalan Kemang Raya 14 A-B-C RT 011 RW 001\nKelurahan Bangka,Kecamatan Mampang Prapatan\nJakarta Selatan 12730"),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                    color: Colors.grey, shape: BoxShape.circle),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Image.network(
                                    'https://cdn-icons-png.flaticon.com/512/1077/1077042.png',
                                    color: Colors.white,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                    color: Colors.grey, shape: BoxShape.circle),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Image.network(
                                    'https://cdn-icons-png.flaticon.com/512/20/20837.png',
                                    color: Colors.white,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                    color: Colors.grey, shape: BoxShape.circle),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Image.network(
                                    'https://cdn-icons-png.flaticon.com/512/3128/3128212.png',
                                    color: Colors.white,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                    color: Colors.grey, shape: BoxShape.circle),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Image.network(
                                    'https://cdn-icons-png.flaticon.com/512/1384/1384028.png',
                                    color: Colors.white,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                  color: Colors.grey, shape: BoxShape.circle),
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Image.network(
                                  'https://cdn-icons-png.flaticon.com/512/3046/3046120.png',
                                  color: Colors.white,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                )
              ],
            ),
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
        ));
  }
}

class listTileFaq extends StatelessWidget {
  String? urlImage;
  String? title;
  String? subtitle;
  bool? withDivider = true;
  listTileFaq({
    Key? key,
    required this.urlImage,
    required this.title,
    required this.subtitle,
    this.withDivider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Image.network(
                  urlImage!,
                  height: 30,
                  fit: BoxFit.fitHeight,
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: title,
                        fontWeight: FontWeight.w800,
                      ),
                      CustomText(text: subtitle)
                    ],
                  ),
                ),
                Image.network(
                    "https://cdn-icons-png.flaticon.com/512/271/271228.png",
                    height: 20,
                    fit: BoxFit.fitHeight)
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          withDivider == true
              ? Divider(
                  thickness: 2,
                  color: green,
                )
              : Container(),
        ],
      ),
    );
  }
}

class listTileTwo extends StatelessWidget {
  String? urlImage;
  String? title;
  bool? withDivider = true;
  listTileTwo({
    Key? key,
    required this.urlImage,
    required this.title,
    this.withDivider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Image.network(
                  urlImage!,
                  height: 30,
                  fit: BoxFit.fitHeight,
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: title,
                        fontWeight: FontWeight.w800,
                      ),
                    ],
                  ),
                ),
                Image.network(
                    "https://cdn-icons-png.flaticon.com/512/271/271228.png",
                    height: 20,
                    fit: BoxFit.fitHeight)
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          withDivider == true
              ? Divider(
                  thickness: 2,
                  color: green,
                )
              : Container(),
        ],
      ),
    );
  }
}

class listTileThree extends StatelessWidget {
  String? urlImage;
  String? title;
  bool? withDivider = true;
  listTileThree({
    Key? key,
    required this.urlImage,
    required this.title,
    this.withDivider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Image.network(
                  urlImage!,
                  color: darkGreen,
                  height: 35,
                  fit: BoxFit.fitHeight,
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: title,
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                      ),
                    ],
                  ),
                ),
                Image.network(
                    "https://cdn-icons-png.flaticon.com/512/271/271228.png",
                    height: 20,
                    fit: BoxFit.fitHeight)
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          withDivider == true
              ? Divider(
                  thickness: 2,
                  color: green,
                )
              : Container(),
        ],
      ),
    );
  }
}

class seringDitanyakan extends StatelessWidget {
  const seringDitanyakan({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "Sering Ditanyakan",
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
            SizedBox(
              height: 20,
            ),
            faq(
              text: "Apakah berinvestasi di Bareksa aman?",
            ),
            faq(text: "Apa syarat berinvestasi di Bareksa"),
            faq(text: "Apa saja produk yang tersedia di Bareksa?"),
            faq(text: "Tentang Bareksa"),
            faq(text: "Bagaimana cara menjual unit reksadana di Bareksa?"),
          ],
        ),
      ),
    );
  }
}

class faq extends StatelessWidget {
  String? text;
  faq({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: CustomText(
                text: text,
                fontSize: 16,
              ),
            ),
            Icon(Icons.arrow_right)
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Divider(
          thickness: 2,
        )
      ],
    );
  }
}

class ButtonIcon extends StatelessWidget {
  String url;
  String judul;
  ButtonIcon({Key? key, required this.url, required this.judul})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          width: 50,
          child: Image.network(url, width: 45, height: 45),
        ),
        CustomText(text: judul)
      ],
    );
  }
}
