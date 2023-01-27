import 'package:bareksa/app/const.dart';
import 'package:bareksa/app/controllers/page_controller_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/akun_controller.dart';

class AkunView extends GetView<AkunController> {
  AkunView({Key? key}) : super(key: key);
  final pageC = Get.find<PageControllerController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
          Container(
            width: Get.width,
            height: Get.height * 3,
            color: green,
          ),
          Container(
            width: Get.width,
            height: Get.height * 0.5,
            color: Colors.white,
          ),
          //KONTEN
          ListView(
            controller: controller.scrollController,
            children: [
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).padding.top + 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        height: 100,
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: blue.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: "Indra Prayoga Setyono",
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                  ),
                                  Image.network(
                                    "https://cdn-icons-png.flaticon.com/512/1828/1828911.png",
                                    height: 18,
                                    fit: BoxFit.fitHeight,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              CustomText(text: "indraprayogas21@gmail.com"),
                              SizedBox(
                                height: 5,
                              ),
                              CustomText(
                                text: "085156024563",
                                fontSize: 12,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        height: 110,
                        width: Get.width,
                        decoration: BoxDecoration(
                            color: pastelGreen.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(13)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10),
                          child: Row(
                            children: [
                              Container(
                                height: 60,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle, color: green),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.network(
                                      "https://cdn-icons-png.flaticon.com/512/5020/5020748.png",
                                      height: 50,
                                      fit: BoxFit.fitHeight),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: "Level investasi saat ini",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(
                                          text: "Rookie",
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                      Image.network(
                                          "https://cdn-icons-png.flaticon.com/512/271/271228.png",
                                          height: 10,
                                          fit: BoxFit.fitHeight),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Stack(
                                    children: [
                                      //container background
                                      Container(
                                        width: Get.width,
                                        height: 7,
                                        decoration: BoxDecoration(
                                            color: green,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                      ),
                                      Container(
                                        width: Get.width,
                                        child: Row(
                                          children: [
                                            Container(
                                              width: Get.width * 0.3,
                                              height: 7,
                                              decoration: BoxDecoration(
                                                  color: darkGreen,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  CustomText(
                                      text:
                                          "Investasi lagi sebanyak Rp 3.499.074 untuk naik ke level selanjutnya.",
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400)
                                ],
                              ))
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    listTileTwo(
                        urlImage:
                            "https://cdn-icons-png.flaticon.com/512/1144/1144760.png",
                        title: "Data Diri"),
                    listTileTwo(
                        urlImage:
                            "https://cdn-icons-png.flaticon.com/512/657/657076.png",
                        title: "Rekening Bank"),
                    listTileTwo(
                        urlImage:
                            "https://cdn-icons-png.flaticon.com/512/2099/2099058.png",
                        title: "Pengaturan"),
                    listTileTwo(
                        urlImage:
                            "https://cdn-icons-png.flaticon.com/512/471/471664.png",
                        title: "Bantuan"),
                    listTileTwo(
                        urlImage:
                            "https://cdn-icons-png.flaticon.com/512/888/888034.png",
                        title: "Syarat dan ketentuan"),
                    listTileTwo(
                        urlImage:
                            "https://cdn-icons-png.flaticon.com/512/109/109991.png",
                        title: "Kebijakan Privasi"),
                    listTileTwo(
                        urlImage:
                            "https://cdn-icons-png.flaticon.com/512/8944/8944313.png",
                        title: "Logout"),
                    Container(
                      width: Get.width,
                      height: 120,
                      color: green,
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(13),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomText(text: "App Version 2.12.0"),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          //HEADER
          Obx(
            () => Container(
              height: MediaQuery.of(context).padding.top + 50,
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: CustomText(
                      text: "Akun",
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          )
        ]),
        //BOTTOM NAVBAR
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
                  color: Colors.black.withOpacity(0.7),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        fontSize: 16,
                        text: title,
                        fontWeight: FontWeight.w800,
                      ),
                    ],
                  ),
                ),
                Image.network(
                    "https://cdn-icons-png.flaticon.com/512/271/271228.png",
                    height: 10,
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
