import 'package:bareksa/app/const.dart';
import 'package:flutter/material.dart';

class GlobalWidget {}

class Background extends StatelessWidget {
  final Widget pageScreen;

  const Background({
    Key? key,
    required this.pageScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: green),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: pageScreen,
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

class OjkLicense extends StatelessWidget {
  const OjkLicense({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LimitedBox(
          maxWidth: 220,
          child: Container(
            height: 50,
            width: 220,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(13),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  'https://ojk.go.id/SiteAssets/logo2.png',
                  height: 30,
                  fit: BoxFit.fitHeight,
                ),
                SizedBox(
                  width: 10,
                ),
                CustomText(
                    fontSize: 10,
                    text: "Terdaftar dan diawasi \n Otoritas Jasa Keuangan")
              ],
            ),
          ),
        ),
      ],
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
            fontSize: 20,
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
