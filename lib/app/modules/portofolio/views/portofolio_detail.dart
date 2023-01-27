import 'package:bareksa/app/const.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class DetailPortofolio extends StatefulWidget {
  const DetailPortofolio({Key? key}) : super(key: key);

  @override
  State<DetailPortofolio> createState() => _DetailPortofolioState();
}

class _DetailPortofolioState extends State<DetailPortofolio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListView(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(Icons.arrow_back),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text: "Portofolio Reksadana",
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 35),
              Container(
                width: Get.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: (Get.width * 0.5) - 8,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "Total Investasi",
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CustomText(text: "Rp 1.511.690"),
                          ],
                        )),
                    Container(
                        width: (Get.width * 0.5) - 8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CustomText(text: "Imbal Hasil"),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
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
                            SizedBox(
                              height: 5,
                            ),
                            CustomText(
                              text: "+0.78%",
                              color: lightGreen,
                            ),
                          ],
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: "1 produk"),
                  Row(
                    children: [
                      Container(
                        width: 70,
                        height: 30,
                        color: green,
                        child: Center(
                            child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: CustomText(
                                  text: "Filter",
                                  fontWeight: FontWeight.w600,
                                ))),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 70,
                        height: 30,
                        color: green,
                        child: Center(
                            child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: CustomText(
                                  text: "Sort",
                                  fontWeight: FontWeight.w600,
                                ))),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 70,
                        height: 30,
                        color: green,
                        child: Center(
                            child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: CustomText(
                                  text: "Summary",
                                  fontWeight: FontWeight.w600,
                                ))),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                height: 300,
                width: Get.width,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black.withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.teal),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: "Syailendra Pendapatan Tetap Premium",
                                fontWeight: FontWeight.bold,
                              ),
                              CustomText(
                                text: "Pendapatan Tetap",
                                fontSize: 12,
                              ),
                            ],
                          ))
                        ],
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "Jumlah Unit",
                          ),
                          CustomText(
                            text: "822,8438",
                            fontSize: 12,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "Jumlah Unit",
                          ),
                          CustomText(
                            text: "Rp 1.638,07",
                            fontSize: 12,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "Jumlah Unit",
                          ),
                          CustomText(
                            text: "Rp 1.625,40",
                            fontSize: 12,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "Jumlah Unit",
                          ),
                          CustomText(
                            text: "Rp 1.500.000",
                            fontSize: 12,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "Jumlah Unit",
                          ),
                          CustomText(
                            text: "Rp 1.511.690",
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "Jumlah Unit",
                          ),
                          CustomText(
                            text: "Rp 11.690 (+0,78%)",
                            fontSize: 12,
                            color: lightGreen,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 40,
                              width: Get.width,
                              decoration: BoxDecoration(
                                  color: lightGreen,
                                  borderRadius: BorderRadius.circular(4)),
                              child: Center(
                                child: CustomText(
                                  text: "Beli Lagi",
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(4)),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 5,
                                    width: 5,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black.withOpacity(0.7)),
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Container(
                                    height: 5,
                                    width: 5,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black.withOpacity(0.7)),
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Container(
                                    height: 5,
                                    width: 5,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black.withOpacity(0.7)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
