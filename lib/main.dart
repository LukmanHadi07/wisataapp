import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'app/modules/splashscreen/bindings/splashscreen_binding.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      splitScreenMode: false,
      builder: (_, child){
        return  GetMaterialApp(
        getPages: AppPages.routes,
        initialRoute: Routes.SPLASHSCREEN,
        initialBinding: SplashscreenBinding());
      },
    );
  }
}
