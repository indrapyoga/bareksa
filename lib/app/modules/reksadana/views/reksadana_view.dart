import 'package:bareksa/app/Api/callApi.dart';
import 'package:bareksa/app/const.dart';
import 'package:bareksa/app/global_controller.dart';
import 'package:bareksa/app/global_widget.dart';
import 'package:bareksa/app/modules/main_menu/models/Artikel.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../controllers/reksadana_controller.dart';

class ReksadanaView extends GetView<ReksadanaController> {
  ReksadanaView({Key? key}) : super(key: key);

  final ReksadanaController _tabx = Get.put(ReksadanaController());
  final globalC = Get.find<GlobalController>();
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
  @override
  Widget build(BuildContext context) {
    return Background(
        pageScreen: Stack(
      children: [
        isiBody(),
        headerAppBar(),
      ],
    ));
  }

  ListView isiBody() {
    return ListView(
      controller: controller.scrollController,
      padding: EdgeInsets.zero,
      children: [
        headerIsi(),
        SizedBox(
          height: 20,
        ),
        body2(),
        SizedBox(
          height: 20,
        ),
        Container(
          width: Get.width,
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: SubTitle(judul: "Transaksi", subjudul: "Lihat Semua"),
              ),
              SizedBox(
                height: 25,
              ),
              detailTransaksi(),
              detailTransaksi(),
              detailTransaksi(),
              SizedBox(
                height: 35,
              ),
              CarouselSlider(
                  options: CarouselOptions(
                    height: 80.0,
                    autoPlay: true,
                    viewportFraction: 0.6,
                    onPageChanged: (index, reason) {
                      controller.indikator.value = index;
                    },
                  ),
                  items: [
                    for (var i = 0; i < controller.carouselPicture.length; i++)
                      Container(
                          width: Get.width * 0.7,
                          margin: EdgeInsets.symmetric(horizontal: 10.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(3),
                            child: Image.network(
                              controller.carouselPicture[i],
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
                      for (var i = 0;
                          i < controller.carouselPicture.length;
                          i++)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Dot(
                            size: 10,
                            color: i == controller.indikator.value
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
              SubTitle(judul: "Artikel", subjudul: "Lihat Semua"),
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
                                            : snapshot
                                                .data!.articles![i].urlToImage,
                                        judul: snapshot
                                                    .data!.articles![i].title ==
                                                null
                                            ? "test"
                                            : snapshot.data!.articles![i].title,
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
              SizedBox(
                height: 15,
              )
            ],
          ),
        ),
        SizedBox(
          height: 0.5,
        ),
        Container(
          color: Colors.white,
          width: Get.width,
          height: 70,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Image.network(
                  'https://cdn-icons-png.flaticon.com/512/2285/2285559.png',
                  height: 40,
                  color: darkGreen,
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: CustomText(
                        text: "Simulasi Investasi",
                        fontSize: 16,
                        fontWeight: FontWeight.bold))
              ],
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        OjkLicense(),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }

  Padding detailTransaksi() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Container(
            width: Get.width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.teal),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Pembelian Berhasil  -  27 Sep",
                      fontWeight: FontWeight.w300,
                      fontSize: 10,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CustomText(
                      text: "Syailendra Pendapatan Tetap Premium",
                      fontSize: 12,
                    ),
                    CustomText(
                      text: "Rp 1.500.000",
                      fontSize: 12,
                    )
                  ],
                ))
              ],
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  Padding body2() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        height: 420,
        width: Get.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SubTitle(judul: "Top 5 Produk", subjudul: "Lihat Semua"),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 20,
              child: TabBar(
                isScrollable: true,
                tabs: _tabx.myTabs,
                controller: _tabx.tabController,
                labelColor: lightGreen,
                labelStyle:
                    TextStyle(fontWeight: FontWeight.w300, fontSize: 12),
                indicatorWeight: 1.5,
                unselectedLabelColor: Colors.grey,
                indicatorColor: lightGreen,
              ),
            ),
            Expanded(
                child: TabBarView(controller: _tabx.tabController, children: [
              pasarUang(),
              pendapatanTetap(),
              campuran(),
              saham(),
              indeksSaham(),
            ]))
          ],
        ),
      ),
    );
  }

  Container headerIsi() {
    return Container(
      height: Get.height * 0.3,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(45),
          bottomRight: Radius.circular(45),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: Get.height * 0.1,
          ),
          CustomText(
            text: "Reksadana",
            fontSize: 18,
          ),
          SizedBox(
            height: 15,
          ),
          CustomText(
            text: "Rp 1.511.690",
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
              CustomText(
                text: "3.144",
                color: lightGreen,
              ),
              CustomText(
                text: " (+0.21%)",
                color: lightGreen,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Column indeksSaham() {
    return Column(
      children: [
        listData(),
        listData(),
        listData(),
        listData(),
        listData(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            width: Get.width,
            height: 40,
            decoration: BoxDecoration(
                color: lightGreen, borderRadius: BorderRadius.circular(4)),
            child: Center(
              child: CustomText(
                text: "Lihat Produk Lainnya",
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        )
      ],
    );
  }

  Column pasarUang() {
    return Column(
      children: [
        listData(),
        listData(),
        listData(),
        listData(),
        listData(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            width: Get.width,
            height: 40,
            decoration: BoxDecoration(
                color: lightGreen, borderRadius: BorderRadius.circular(4)),
            child: Center(
              child: CustomText(
                text: "Lihat Produk Lainnya",
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        )
      ],
    );
  }

  Column pendapatanTetap() {
    return Column(
      children: [
        listData(),
        listData(),
        listData(),
        listData(),
        listData(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            width: Get.width,
            height: 40,
            decoration: BoxDecoration(
                color: lightGreen, borderRadius: BorderRadius.circular(4)),
            child: Center(
              child: CustomText(
                text: "Lihat Produk Lainnya",
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        )
      ],
    );
  }

  Column campuran() {
    return Column(
      children: [
        listData(),
        listData(),
        listData(),
        listData(),
        listData(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            width: Get.width,
            height: 40,
            decoration: BoxDecoration(
                color: lightGreen, borderRadius: BorderRadius.circular(4)),
            child: Center(
              child: CustomText(
                text: "Lihat Produk Lainnya",
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        )
      ],
    );
  }

  Column saham() {
    return Column(
      children: [
        listData(),
        listData(),
        listData(),
        listData(),
        listData(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            width: Get.width,
            height: 40,
            decoration: BoxDecoration(
                color: lightGreen, borderRadius: BorderRadius.circular(4)),
            child: Center(
              child: CustomText(
                text: "Lihat Produk Lainnya",
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        )
      ],
    );
  }

  Obx headerAppBar() {
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
        child: SafeArea(
          child: Row(
            children: [
              IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => Get.back(),
                  icon: Icon(Icons.arrow_back)),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.search,
                        color: Colors.black,
                      )),
                  Image.network(
                    'https://cdn-icons-png.flaticon.com/512/1077/1077035.png',
                    height: 20,
                  )
                ],
              )),
              SizedBox(
                width: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class listData extends StatelessWidget {
  const listData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Container(
        width: Get.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'https://cdn-icons-png.flaticon.com/512/2450/2450311.png',
              height: 35,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "Sucorinvest Equity Fund",
                  fontWeight: FontWeight.bold,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.stars,
                      color: darkGreen,
                      size: 14,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    CustomText(
                      text: "4,59 ",
                      fontSize: 12,
                    ),
                    Container(
                      height: 2,
                      width: 2,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.black),
                    ),
                    CustomText(
                      text: " 13,28% ",
                      fontSize: 12,
                      color: lightGreen,
                    ),
                    CustomText(
                      text: "/th",
                      fontSize: 12,
                    ),
                  ],
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}

class SubTitle extends StatelessWidget {
  String? judul;
  String? subjudul;
  void Function()? onTap;
  SubTitle({
    Key? key,
    required this.judul,
    required this.subjudul,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: judul,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
              height: 30,
              decoration: BoxDecoration(
                  color: green.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(9)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Center(
                  child: CustomText(
                    text: subjudul,
                    color: lightGreen,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
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
