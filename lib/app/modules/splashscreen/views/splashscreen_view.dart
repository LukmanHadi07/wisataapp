import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';


import '../controllers/splashscreen_controller.dart';

class SplashscreenView extends GetView<SplashscreenController> {
  const SplashscreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      // Use Get.to() to navigate to the next page
      Get.toNamed('/splashscreen-onboarding-one');
    });
    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/logo_wisata.png', width: 350.w, height: 300.h,),
      ),
    );
  }
}
