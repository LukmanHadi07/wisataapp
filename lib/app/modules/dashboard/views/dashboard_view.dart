import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:wisata_app/app/core/icons.dart';
import 'package:wisata_app/app/core/widgets/costum_container_destinasi.dart';
import 'package:wisata_app/app/core/widgets/costum_container_wisata.dart';
import 'package:wisata_app/app/core/widgets/custom_container_category_wisata.dart';
import 'package:wisata_app/app/modules/wisata_category_page/controllers/wisata_category_by_id_controller.dart';
import 'package:wisata_app/app/modules/wisata_category_page/controllers/wisata_page_controller.dart';

import '../../wisata_page/controllers/detail_wisata_page_controller.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
 
//  final DashboardController dashboardController = Get.find();

  @override
 Widget build(BuildContext context) {
  return Scaffold(
    body: ListView(
      children: [
        _header(context),
        _destinasi(context),
        _wisataCategory(context),
        _banner(context),
        _wisata(context),
      ],
    ),
  );
}
}

Widget _header(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 30.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(IconImages.icHamburger),
             Image.asset(IconImages.icSearch, width: 25.0, height: 25.0,),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Text('Hallo, Semua', style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400
        ),),
         Text('Selamat Datang, Di Wisata Lamongan', style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w800
         ),)
      ],
    ),
  );
}

 Widget _destinasi(BuildContext context) {
  final WisataPageController wisataC = Get.find<WisataPageController>();
  return  Padding(
    padding:const  EdgeInsets.symmetric(horizontal: 25.0,),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Destinasi')
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
         Container(
            height: 150,
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width,
              ),
              child: Obx(() => ListView.builder(
                scrollDirection: Axis.horizontal,
                 itemCount: wisataC.wisata.length,
                  itemBuilder: (context, index) {
                    return  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: CustomContainerDestinasiView(wisata: wisataC.wisata[index]));
                  })),
             
            ),
      ],
    ),
  );
 }


 Widget _wisataCategory(BuildContext context) {
  final DashboardController controller = Get.find<DashboardController>();
  final WisataCategoryByIdController wisataCategoryByIdController = Get.find<WisataCategoryByIdController>();
  return Padding(
    padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
    child: Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Wisata Category'),
            Text(
              'All Category',
              style: TextStyle(color: Colors.blueAccent),
            ),
          ],
        ),
            Container(
            height: 150,
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width,
              ),
              child: Obx(() => controller.loading.value
    ? const Center(
        child: CircularProgressIndicator(),
      )
    : ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: InkWell(
              onTap: () async {
                final id = controller.categories[index].id;
                await wisataCategoryByIdController.getAllWisataByCategoryId(id.toString());
                Get.toNamed('/wisata-category-page/$id');
              },
              child: CustomContainerCategoryWisata(categoryModel: controller.categories[index]),
            ),
          );
        },
      ),
)

             
            ),
          ],
        )
    );
}


 Widget _banner(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(left: 25.0, right: 25.0, ),
    child: Container(
      width: 339.w,
      height: 181.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Image.asset('assets/images/banner.png'),
    ),
  );
 }

 Widget _wisata(BuildContext context) {
  final WisataPageController wisataController = Get.find<WisataPageController>();
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text('Wisata'),
        ),
        const SizedBox(
          height: 5.0,
        ),
          SizedBox(
            height: 300.h,
              child: Obx(() => ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                 itemCount: min(3, wisataController.wisata.length),
                  itemBuilder: (context, index) {
                    return  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: InkWell(
                        onTap: () async {
                        final WisataDetailByIdController _wisataDetailById = Get.find();
                        final id = wisataController.wisata[index].id;
                        await _wisataDetailById.detailWisataById(id.toString());
                        Get.toNamed('/detail-page/$id');
                        },
                        child: CustomContainerWisata(wisata: wisataController.wisata[index])));
                  })),
             
            ),
      ],
    ),
  );
 }