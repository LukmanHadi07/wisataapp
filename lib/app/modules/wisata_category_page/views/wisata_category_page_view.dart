import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wisata_app/app/core/widgets/costum_container_wisata.dart';
import 'package:wisata_app/app/models/category_model.dart';
import 'package:wisata_app/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:wisata_app/app/modules/wisata_category_page/controllers/wisata_category_by_id_controller.dart';


import '../../wisata_page/controllers/detail_wisata_page_controller.dart';
import '../controllers/wisata_page_controller.dart';

class WisataCategoryPageView extends GetView<WisataPageController> {
  const  WisataCategoryPageView({Key? key, required this.id}) : super(key: key);

  final int id; // Access categoryId directly

  @override
  Widget build(BuildContext context) {
    // final DashboardController dashboardC = Get.find<DashboardController>();

    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.blue,
        title: GetX<DashboardController>(builder: (controller) {
          final List<CategoryModel> categories = controller.categories;

          // Mencari indeks kategori yang memiliki ID sesuai dengan nilai 'id'
          final int index = categories.indexWhere((category) => category.id == id);

          // Menggunakan ID yang ditemukan atau default ke indeks 0 jika tidak ditemukan
          final int currentIndex = index >= 0 ? index : 0;

          return Text('Wisata ${controller.categories[currentIndex].name}',style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.normal,
            color: Colors.white
          ),);
        }),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(() {
          // final DashboardController dashboardC = Get.find<DashboardController>();
          final controller = Get.find<WisataCategoryByIdController>();
          return controller.loading.value
              ? const Center(child: CircularProgressIndicator())
              : Obx(() => ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: controller.wisata.length,
                  itemBuilder: (context, index) {
                   return Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                     child: InkWell(
                      onTap: () async {
                        final WisataDetailByIdController _wisataDetailById = Get.find();
                        final id = controller.wisata[index].id;
                        await _wisataDetailById.detailWisataById(id.toString());
                        Get.toNamed('/detail-page/$id');
                      },
                      child: CustomContainerWisata(wisata: controller.wisata[index])),
                   );
                  }));
        }),
      ),
    );
  }
}
