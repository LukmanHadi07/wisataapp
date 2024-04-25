import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:wisata_app/app/models/wisata_model.dart';
import 'package:wisata_app/app/modules/wisata_page/controllers/detail_wisata_page_controller.dart';

class DetailPageView extends GetView<WisataDetailByIdController> {
   final int id; 
  const DetailPageView({
    required this.id,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _image(context),
          _text(context),
          _buttonContainer(context)
        ],
      )
    );
  }

   Widget _image(BuildContext context) {
  return Stack(
    children: [
      Container(
        width: double.infinity,
        height: 340,
        decoration: const BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100)),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(100)),
          child: GetBuilder<WisataDetailByIdController>(
            builder: ((controller) {
              final List<WisataModel> wisata = controller.wisata;
              final int index = wisata.indexWhere((wisata) => wisata.id == id);

              // Menggunakan ID yang ditemukan atau default ke indeks 0 jika tidak ditemukan
              final int currentIndex = index >= 0 ? index : 0;
              return Image.network(controller.wisata[currentIndex].imageUrl!, fit: BoxFit.cover);
            }),
          ),
        ),
      ),
      Positioned(
        top: 40, // Sesuaikan dengan posisi vertikal ikon
        left: 16, // Sesuaikan dengan posisi horizontal ikon
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: const  Icon(
              Icons.arrow_back,
              color: Colors.orange,
            ),
          ),
        ),
      ),
        Positioned(
        top: 280, // Sesuaikan dengan posisi vertikal ikon
        left: 350, // Sesuaikan dengan posisi horizontal ikon
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: const  Icon(
              Icons.favorite,
              color: Colors.orange,
            ),
          ),
        ),
      ),
    ],
  );
}


  Widget _text(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: GetBuilder<WisataDetailByIdController>(
          builder:(controller) {
             final List<WisataModel> wisata = controller.wisata;
               final int index = wisata.indexWhere((wisata) => wisata.id == id);
                // Menggunakan ID yang ditemukan atau default ke indeks 0 jika tidak ditemukan
              final int currentIndex = index >= 0 ? index : 0;
            return  Column(
            children: [
              Center(
                child: Text(controller.wisata[currentIndex].name!, style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold
                ),),
              ),
               Center(
                child: Text(controller.wisata[currentIndex].address!, style: TextStyle(
                  fontSize: 12.sp,
                ),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SizedBox(
                  width: double.infinity,
                  height: 350,
                  child: ListView(children: [Text(controller.wisata[currentIndex].description!, textAlign: TextAlign.justify,)])),
              )
            ],
          );
          },
        ),
      ),
    );
  }

  Widget _buttonContainer(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      child: Row(
        children: [
          Container(
            width: 240,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
               color: Colors.blue,
            ),
            child: TextButton(onPressed: (){}, child: Center(
              child: Text('LOCATION', style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),),
            )),
          ),
          SizedBox(
           width: 20.w,
          ),
          Container(
            width: 90,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
               color: Colors.orange,
            ),
            child: GetBuilder<WisataDetailByIdController>(
            builder: ((controller) {
              final List<WisataModel> wisata = controller.wisata;
              final int index = wisata.indexWhere((wisata) => wisata.id == id);

              // Menggunakan ID yang ditemukan atau default ke indeks 0 jika tidak ditemukan
              final int currentIndex = index >= 0 ? index : 0;
              return Center(child: Text(controller.wisata[currentIndex].priceHtm!, style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600,color: Colors.white),),);
            }),
          ),
          )
        ],
      ),
    );
  }
   

}


