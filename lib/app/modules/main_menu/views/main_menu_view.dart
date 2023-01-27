import 'dart:convert';
import 'dart:math';
import 'package:bareksa/app/Api/callApi.dart';
import 'package:bareksa/app/global_controller.dart';
import 'package:bareksa/app/global_method.dart';
import 'package:bareksa/app/global_widget.dart' as global;
import 'package:bareksa/app/modules/main_menu/views/level_view.dart';
import 'package:bareksa/app/modules/main_menu/views/pelajari_view.dart';
import 'package:bareksa/app/modules/portofolio/views/portofolio_detail.dart';
import 'package:bareksa/app/modules/reksadana/views/reksadana_view.dart';
import 'package:intl/intl.dart';
import 'package:bareksa/app/const.dart';
import 'package:bareksa/app/controllers/page_controller_controller.dart';
import 'package:bareksa/app/modules/main_menu/models/Artikel.dart';
import 'package:bareksa/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../controllers/main_menu_controller.dart';

class MainMenuView extends GetView<MainMenuController> {
  MainMenuView({Key? key}) : super(key: key);

  final pageC = Get.find<PageControllerController>();

  RxInt indicator = 0.obs;
  RxBool visible = false.obs;
  final globalC = Get.find<GlobalController>();

  List<Color> pastelColor = [
    // Color.fromARGB(255, 144, 161, 125),
    // Color.fromARGB(255, 130, 148, 96),
    Color.fromARGB(255, 250, 247, 240),
    Color.fromARGB(255, 238, 238, 238),
    Color.fromARGB(255, 200, 219, 190),
    Color.fromARGB(255, 188, 206, 248)
    // Color.fromARGB(255, 159, 135, 114),
  ];

  List<Map<String, dynamic>> artikel = [
    {
      "judul":
          "Bareksa Insight : Harga SBN Menguat Sepekan Terakhir, Reksadana Ini Cuan Hingga 16%",
      "timePost": DateTime.now(),
      "picture": "https://picsum.photos/70"
    },
    {
      "judul":
          "Tips Investasi Anti Galau Akhir Tahun 2022, Reksadana Saham Ini Punya Potensi",
      "timePost": DateTime.now(),
      "picture": "https://picsum.photos/80"
    },
    {
      "judul":
          "Jemaah Umroh Indonesia Tak Wajib Vaksin Meningitis, Ini Cara Siapkan Modal ke Tanah Suci",
      "timePost": DateTime.now(),
      "picture": "https://picsum.photos/90"
    },
  ];
  List<String> carouselPicture = [
    'https://images.bareksa.com/bareksa/img/sliders/bareksa-home-slider-414.jpg',
    'https://images.bareksa.com/bareksa/img/sliders/bareksa-home-slider-401.jpg',
    'https://images.bareksa.com/bareksa/img/sliders/bareksa-home-slider-420.jpg',
  ];

  List<String> cardPicture = [
    "https://images.bareksa.com/icons/1/secure.svg",
    "https://images.bareksa.com/icons/1/mudah.svg",
    "https://images.bareksa.com/icons/1/lengkap.svg",
    "https://images.bareksa.com/icons/1/transparant.svg",
    "https://images.bareksa.com/icons/1/educational.svg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          background(),
          isiMainMenu(),
          header(),
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
      ),
    );
  }

  ListView isiMainMenu() {
    return ListView(
      addSemanticIndexes: true,
      controller: controller.scrollController,
      children: [
        Container(
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(
                  height: Get.height * 0.1,
                ),
                InkWell(
                  onTap: () {
                    pageC.changeIndex(2);
                  },
                  child: Column(
                    children: [
                      Center(
                        child:
                            CustomText(text: "Total Investasi", fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Obx(
                        () => Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              visible.isFalse
                                  ? CustomText(
                                      text: "Rp ",
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    )
                                  : Container(),
                              visible.isTrue
                                  ? CustomText(
                                      text:
                                          "${CurrencyFormat.convertToIdr(1503144, 0)}",
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    )
                                  : Dots(
                                      color: Colors.black,
                                      size: 7,
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    width: Get.width,
                    height: 70,
                    decoration: BoxDecoration(
                      color: green.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.network(
                                'https://images.bareksa.com/illustrations/1/app_home_cta%402x.png',
                                width: 80,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomText(
                                        text: "Level investasi saat ini"),
                                    CustomText(
                                      text: "Rookie",
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ])
                            ],
                          ),
                          InkWell(
                            onTap: () => Get.to(() => LevelView()),
                            child: Container(
                              width: 80,
                              height: 36,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Center(
                                child: CustomText(
                                  text: "Pelajari",
                                  color: darkGreen,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: GestureDetector(
                    onTap: () => Get.to(() => DetailPortofolio()),
                    child: Container(
                      height: 50,
                      child: Row(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Image.network(
                              'https://images.bareksa.com/bareksa/img/products/home_superapp_reksadana@2x.png',
                              width: 30,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                                width: (Get.width - 20) * 0.5,
                                child: CustomText(
                                  text: "Reksadana",
                                  fontSize: 15,
                                )),
                          ),
                          Container(
                            width: (Get.width - 20 - 80) * 0.5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                CustomText(
                                    text:
                                        "${CurrencyFormat.convertToIdr(1503144, 0)}"),
                                Obx(
                                  () => Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(
                                        Icons.arrow_upward,
                                        size: 14,
                                        color: lightGreen,
                                      ),
                                      CustomText(
                                        text: "Rp ",
                                        color: lightGreen,
                                      ),
                                      visible.isTrue
                                          ? CustomText(
                                              text: "3.144",
                                              color: lightGreen,
                                            )
                                          : Dots(
                                              color: lightGreen,
                                              size: 3,
                                            ),
                                      CustomText(
                                        text: " (+0.21%)",
                                        color: lightGreen,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                global.SubTitle(
                  judul: "Super App Investasi",
                  subjudul: "Pelajari",
                  onTap: () => Get.to(() => Pelajari()),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: Get.width,
                  child: GridView.count(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    crossAxisCount: 4,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      ButtonIcon(
                        onTap: () => Get.to(() => ReksadanaView()),
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
                  height: 20,
                ),
                CarouselSlider(
                    options: CarouselOptions(
                      height: 80.0,
                      autoPlay: true,
                      viewportFraction: 0.6,
                      onPageChanged: (index, reason) {
                        indicator.value = index;
                      },
                    ),
                    items: [
                      for (var i = 0; i < carouselPicture.length; i++)
                        Container(
                            width: Get.width * 0.7,
                            margin: EdgeInsets.symmetric(horizontal: 10.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(3),
                              child: Image.network(
                                carouselPicture[i],
                                fit: BoxFit.cover,
                              ),
                            ))
                    ]),
                SizedBox(
                  height: 5,
                ),
                Obx(
                  () => Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (var i = 0; i < carouselPicture.length; i++)
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Dot(
                              size: 10,
                              color: i == indicator.value
                                  ? darkGreen
                                  : Colors.grey,
                            ),
                          )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                global.SubTitle(judul: "Tutorial", subjudul: "Lihat Semua"),
                SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: ScrollPhysics(),
                  child: Row(
                    children: [
                      for (var i = 0; i < cardPicture.length; i++)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Container(
                            height: 130,
                            width: 110,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border:
                                    Border.all(width: 0.5, color: Colors.grey)),
                            child: Column(
                              children: [
                                Container(
                                  height: 80,
                                  width: 110,
                                  decoration: BoxDecoration(
                                      color: pastelColor[
                                          Random().nextInt(pastelColor.length)],
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Center(
                                      child: SvgPicture.network(
                                        cardPicture[i],
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
                  height: 30,
                ),
                global.SubTitle(judul: "Artikel", subjudul: "Lihat Semua"),
                SizedBox(
                  height: 20,
                ),
                FutureBuilder<Artikel>(
                  future: CallApi.getArtikel(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Column(
                        children: [
                          for (var i = 0; i < 3; i++)
                            Obx(
                              () => VisibilityDetector(
                                  key: Key('$i'),
                                  onVisibilityChanged: (info) {
                                    if (info.visibleFraction >= 0.1) {
                                      controller.opacity[i] = 1;
                                      controller.visibility.value[i] = true;
                                    }
                                    print(controller.visibility);
                                  },
                                  //di controller ada animasi lain isi dari child dibawah ini
                                  child: AnimatedOpacity(
                                    opacity: controller.opacity[i],
                                    duration: Duration(seconds: 1),
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 16.0),
                                      child: contentArtikel(
                                          imageUrl: snapshot.data!.articles![i]
                                                      .urlToImage ==
                                                  null
                                              ? artikel[1]['picture']
                                              : snapshot.data!.articles![i]
                                                  .urlToImage,
                                          judul: snapshot.data!.articles![i]
                                                      .title ==
                                                  null
                                              ? "test"
                                              : snapshot
                                                  .data!.articles![i].title,
                                          timePost:
                                              "${DateTime.now().minute - snapshot.data!.articles![i].publishedAt!.toLocal().minute} minute ago"),
                                    ),
                                  )),
                            ),
                        ],
                      );
                    }
                    return Text("error");
                  },
                ),
                // for (var i = 0; i < artikel.length; i++)
                //   Padding(
                //     padding: const EdgeInsets.only(bottom: 16.0),
                //     child: contentArtikel(
                //       imageUrl: artikel[i]["picture"],
                //       judul: artikel[i]["judul"],
                //       timePost: artikel[i]["timePost"].toString(),
                //     ),
                //   ),
                Divider(
                  color: green,
                ),
                endWidget(
                    judul: "Simulasi Investasi", cardPicture: cardPicture[0]),
                Divider(
                  color: green,
                ),
                endWidget(
                    judul: "Komunitas Bareksa", cardPicture: cardPicture[1]),
                Container(
                  height: 100,
                  width: Get.width,
                  decoration: BoxDecoration(color: green),
                  child: Center(
                    child: global.OjkLicense(),
                  ),
                ),
              ],
            )),
      ],
    );
  }

  Container background() {
    return Container(
      height: Get.height * 3,
      color: green,
    );
  }

  Obx header() {
    return Obx(
      () => Container(
        height: Get.height * 0.1,
        decoration: controller.atTop.isTrue
            ? BoxDecoration(color: Colors.white)
            : BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.6),
                  offset: Offset(-2, 0),
                  spreadRadius: 1,
                  blurRadius: 2,
                )
              ]),
        child: Center(
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: SvgPicture.network(
                      'https://images.bareksa.com/logo/1.0.0/logo.svg'),
                ),
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: IconButton(
                      onPressed: () {
                        visible.toggle();
                      },
                      icon: visible.isFalse
                          ? Icon(
                              Icons.remove_red_eye_outlined,
                              color: darkPurple,
                            )
                          : Icon(
                              Icons.visibility_off,
                              color: darkPurple,
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class endWidget extends StatelessWidget {
  String? judul;
  endWidget({
    Key? key,
    required this.cardPicture,
    required this.judul,
  }) : super(key: key);

  final String cardPicture;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                    height: 50,
                    width: 50,
                    child: SvgPicture.network(
                      cardPicture,
                      fit: BoxFit.fitWidth,
                    )),
                SizedBox(
                  width: 20,
                ),
                CustomText(
                  text: judul,
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.arrow_right))
          ],
        ),
      ),
    );
  }
}

class contentArtikel extends StatelessWidget {
  String? judul;
  String? timePost;
  String? imageUrl;
  contentArtikel({
    required this.judul,
    required this.timePost,
    required this.imageUrl,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(fontWeight: FontWeight.w700, text: judul),
                  CustomText(
                    fontSize: 10,
                    text: timePost,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: 50,
                  height: 50,
                  child: Image.network(imageUrl!, fit: BoxFit.fill),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Dots extends StatelessWidget {
  double? size;
  Color? color;
  Dots({Key? key, required this.size, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Dot(
          color: color,
          size: size,
        ),
        SizedBox(
          width: 2,
        ),
        Dot(color: color, size: size),
        SizedBox(
          width: 2,
        ),
        Dot(color: color, size: size),
        SizedBox(
          width: 2,
        ),
        Dot(color: color, size: size),
        SizedBox(
          width: 2,
        ),
        Dot(color: color, size: size),
        SizedBox(
          width: 2,
        ),
      ],
    );
  }
}

class Dot extends StatelessWidget {
  double? size;
  Color? color;
  Dot({Key? key, required this.size, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }
}

class ButtonIcon extends StatelessWidget {
  String url;
  String judul;
  void Function()? onTap;
  ButtonIcon({Key? key, required this.url, required this.judul, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 50,
            width: 50,
            child: Image.network(url, width: 45, height: 45),
          ),
          CustomText(text: judul)
        ],
      ),
    );
  }
}
