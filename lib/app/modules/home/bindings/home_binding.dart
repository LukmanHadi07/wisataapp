

import 'package:get/get.dart';
import 'package:wisata_app/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:wisata_app/app/modules/wisata_category_page/controllers/wisata_category_by_id_controller.dart';
import 'package:wisata_app/app/modules/wisata_category_page/controllers/wisata_page_controller.dart';
import 'package:wisata_app/app/modules/wisata_page/controllers/wisata_page_controller.dart';
import '../../wisata_page/controllers/detail_wisata_page_controller.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
     Get.lazyPut<WisataDetailByIdController>(() => WisataDetailByIdController());
    Get.lazyPut<WisataCategoryByIdController>(() => WisataCategoryByIdController());
     Get.lazyPut<WisataController>(() => WisataController());
    Get.lazyPut<WisataPageController>(() => WisataPageController());
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
