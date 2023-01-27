import 'package:get/get.dart';

import '../modules/akun/bindings/akun_binding.dart';
import '../modules/akun/views/akun_view.dart';
import '../modules/bantuan/bindings/bantuan_binding.dart';
import '../modules/bantuan/views/bantuan_view.dart';
import '../modules/main_menu/bindings/main_menu_binding.dart';
import '../modules/main_menu/views/main_menu_view.dart';
import '../modules/portofolio/bindings/portofolio_binding.dart';
import '../modules/portofolio/views/portofolio_view.dart';
import '../modules/reksadana/bindings/reksadana_binding.dart';
import '../modules/reksadana/views/reksadana_view.dart';
import '../modules/transaksi/bindings/transaksi_binding.dart';
import '../modules/transaksi/views/transaksi_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.MAIN_MENU;

  static final routes = [
    GetPage(
        name: _Paths.MAIN_MENU,
        page: () => MainMenuView(),
        binding: MainMenuBinding(),
        transition: Transition.fadeIn),
    GetPage(
        name: _Paths.TRANSAKSI,
        page: () => TransaksiView(),
        binding: TransaksiBinding(),
        transition: Transition.fadeIn),
    GetPage(
        name: _Paths.PORTOFOLIO,
        page: () => PortofolioView(),
        binding: PortofolioBinding(),
        transition: Transition.fadeIn),
    GetPage(
        name: _Paths.BANTUAN,
        page: () => BantuanView(),
        binding: BantuanBinding(),
        transition: Transition.fadeIn),
    GetPage(
        name: _Paths.AKUN,
        page: () => AkunView(),
        binding: AkunBinding(),
        transition: Transition.fadeIn),
    GetPage(
      name: _Paths.REKSADANA,
      page: () => ReksadanaView(),
      binding: ReksadanaBinding(),
    ),
  ];
}
