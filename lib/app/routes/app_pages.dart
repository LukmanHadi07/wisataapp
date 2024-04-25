import 'package:get/get.dart';

import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/favorite-page/bindings/favorite_page_binding.dart';
import '../modules/favorite-page/views/favorite_page_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/splashscreen/bindings/splashscreen_binding.dart';
import '../modules/splashscreen/views/splashscreen_onboarding_view.dart.dart';
import '../modules/splashscreen/views/splashscreen_view.dart';
import '../modules/wisata_category_page/bindings/wisata_category_page_binding.dart';
import '../modules/wisata_category_page/views/wisata_category_page_view.dart';
import '../modules/wisata_page/bindings/wisata_page_binding.dart';
import '../modules/wisata_page/views/detail_page_view.dart';
import '../modules/wisata_page/views/wisata_page_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const splashscreen = '/';
  static const splashscreenOnBoardingOne = '/splashscreen-onboarding-one';
  static const home = '/dashboard';
  static const wisataCategoryPageView = '/wisata-category-page/:id';
  static const wisata = '/wisata';
  static const detailPage = '/detail-page/:id';

  static final routes = [
    GetPage(
      name: splashscreen,
      page: () => const SplashscreenView(),
      binding: SplashscreenBinding(),
    ),
    GetPage(
      name: splashscreenOnBoardingOne,
      page: () => const SplashScreenOnBoardingView(),
    ),
    GetPage(
      name: home,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: wisataCategoryPageView,
      page: () => WisataCategoryPageView(id: int.parse(Get.parameters['id']!)),
      binding: WisataCategoryPageBinding(),
    ),
    GetPage(
      name: _Paths.WISATAPAGE,
      page: () => const WisataPageView(),
      binding: WisataPageBinding(),
    ),
    GetPage(
      name: detailPage,
      page: () => DetailPageView(id: int.parse(Get.parameters['id']!)),
      binding: WisataPageBinding(),
    ),
    GetPage(
      name: _Paths.FAVORITE_PAGE,
      page: () => const FavoritePageView(),
      binding: FavoritePageBinding(),
    ),
  ];
}
