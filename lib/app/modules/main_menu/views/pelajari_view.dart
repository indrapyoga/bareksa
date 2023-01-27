import 'package:bareksa/app/const.dart';
import 'package:bareksa/app/global_widget.dart';
import 'package:bareksa/app/modules/main_menu/controllers/main_menu_controller.dart';
import 'package:bareksa/app/modules/reksadana/views/reksadana_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pelajari extends GetView<MainMenuController> {
  const Pelajari({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          isiBody(),
          Container(
            color: Colors.white,
            height: Get.height * 0.1,
            child: SafeArea(
              child: Row(
                children: [
                  IconButton(
                      onPressed: () => Get.back(),
                      icon: Icon(Icons.arrow_back)),
                  Expanded(
                      child: CustomText(
                          text: "Super App Investasi",
                          fontSize: 20,
                          fontWeight: FontWeight.bold))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding isiBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ListView(
        children: [
          SizedBox(
            height: Get.height * 0.1,
          ),
          CustomText(
              text: "Produk Investasi",
              fontSize: 18,
              fontWeight: FontWeight.w700),
          SizedBox(
            height: 15,
          ),
          listTileProduk(
              "Reksadana",
              "Pilih sendiri dari 100+ produk terbaik yang sudah di kurasi",
              "https://images.bareksa.com/bareksa/img/products/home_superapp_reksadana@2x.png",
              () => Get.to(() => ReksadanaView())),
          listTileProduk(
              "Robo",
              "Membantumu memilih produk reksadana & mengelola portofolio",
              "https://images.bareksa.com/bareksa/img/products/home_superapp_robo@2x.png",
              () => Get.to(() => ReksadanaView())),
          listTileProduk(
              "SBN",
              "Bisa kontribusi bantu negara, aman & pasti untung",
              "https://images.bareksa.com/bareksa/img/products/home_superapp_sbn@2x.png",
              () => Get.to(() => ReksadanaView())),
          listTileProduk(
              "Emas",
              "Investasi emas fisik secara online, penyimpanan aman & mudah cair",
              "https://images.bareksa.com/bareksa/img/products/home_superapp_emas@2x.png",
              () => Get.to(() => ReksadanaView())),
          listTileProduk(
              "Umroh",
              "Nabung umroh hemat dan lebih cepat dengan reksadana syariah",
              "https://images.bareksa.com/bareksa/img/products/home_superapp_umroh@2x.png",
              () => Get.to(() => ReksadanaView())),
        ],
      ),
    );
  }

  Column listTileProduk(String? produk, String? keterangan, String? image,
      void Function()? onTap) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: Get.width,
            height: 70,
            decoration: BoxDecoration(
              border:
                  Border.all(color: Colors.black.withOpacity(0.4), width: 0.5),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              children: [
                Image.network(
                  '$image',
                  fit: BoxFit.fitHeight,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CustomText(
                            text: "$produk",
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      CustomText(
                        text: "$keterangan",
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                      )
                    ],
                  ),
                ))
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
