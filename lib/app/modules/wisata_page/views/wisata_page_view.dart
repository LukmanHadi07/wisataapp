import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wisata_app/app/modules/wisata_page/controllers/detail_wisata_page_controller.dart';
import 'package:wisata_app/app/modules/wisata_page/views/widgets/custom_container_wisata_page.dart';


import '../controllers/wisata_page_controller.dart';

class WisataPageView extends GetView<WisataController> {
  const WisataPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
     final WisataController wisataC = Get.find<WisataController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Wisata Lamongan', style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w800,
          color: Colors.white
        ),),
        centerTitle: true,
      ),
      body: Obx(() => ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                 itemCount: wisataC.wisataModel.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () async  {
                        final WisataDetailByIdController _wisataDetailById = Get.find();
                        final id = wisataC.wisataModel[index].id;
                        await _wisataDetailById.detailWisataById(id.toString());
                        Get.toNamed('/detail-page/$id');
                      },
                      child: CustomContainerWisataPage(wisata: wisataC.wisataModel[index]));
                  })),
    );
  }
}
