import 'package:bareksa/app/const.dart';
import 'package:bareksa/app/controllers/page_controller_controller.dart';
import 'package:bareksa/app/global_controller.dart';
import 'package:bareksa/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final globalC = Get.put(GlobalController(), permanent: true);
    final pageC = Get.put(PageControllerController(), permanent: true);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(scaffoldBackgroundColor: Colors.white),
      title: "Application",
      initialRoute: Routes.MAIN_MENU,
      getPages: AppPages.routes,
    );
  }
}
