import 'package:get/get.dart';
import 'package:wisata_app/app/modules/wisata_page/controllers/detail_wisata_page_controller.dart';

import '../controllers/wisata_page_controller.dart';

class WisataPageBinding extends Bindings {
  @override
  void dependencies() {
     Get.lazyPut<WisataDetailByIdController>(
      () => WisataDetailByIdController(),
    );
    Get.lazyPut<WisataController>(
      () => WisataController(),
    );
  }
}
