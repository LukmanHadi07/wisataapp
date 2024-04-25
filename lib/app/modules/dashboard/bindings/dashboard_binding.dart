import 'package:get/get.dart';
import 'package:wisata_app/app/modules/wisata_category_page/controllers/wisata_category_by_id_controller.dart';



import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
      Get.lazyPut<WisataCategoryByIdController>(
      () => WisataCategoryByIdController(),
    );
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
  }
}
