import 'package:get/get.dart';
import 'package:wisata_app/app/modules/wisata_category_page/controllers/wisata_category_by_id_controller.dart';




import '../controllers/wisata_page_controller.dart';

class WisataCategoryPageBinding extends Bindings {
  @override
  void dependencies() {
      Get.lazyPut<WisataCategoryByIdController>(
      () => WisataCategoryByIdController(),
    );
    Get.lazyPut<WisataPageController>(
      () => WisataPageController(),
    );
  }
}
