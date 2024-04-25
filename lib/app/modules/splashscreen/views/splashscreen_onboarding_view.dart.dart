import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wisata_app/app/modules/splashscreen/views/widgets/custom_splash_onboarding_view.dart';

class SplashScreenOnBoardingView extends StatefulWidget {
  const SplashScreenOnBoardingView({super.key});

  @override
  State<SplashScreenOnBoardingView> createState() => _SplashScreenOnBoardingViewState();
}

class _SplashScreenOnBoardingViewState extends State<SplashScreenOnBoardingView> {
   final PageController _pageController = PageController(initialPage: 0);
   int _currentPage = 0;
   
  Widget _pageViews(BuildContext context) {
    return PageView(
      controller: _pageController,
      onPageChanged: (int page) {
        setState(() {
          _currentPage = page;
        });

        if (page == 2) {
          Future.delayed(const Duration(seconds: 4),(){
             Get.offAllNamed('/dashboard');
          });
        }
      },
      children: const [
        CustomSplashOnBoardingView(imagePath: 'assets/images/logo_onboarding.png', textTitle: 'Dive into Nature\'s Embrace'),
         CustomSplashOnBoardingView(imagePath: 'assets/images/logo_onboarding.png', textTitle: 'Lamongan Beatiful'),
          CustomSplashOnBoardingView(imagePath: 'assets/images/logo_onboarding.png', textTitle: 'Craft Your Lamongan Story')
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 50.0,
            horizontal: 25.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: (){
                  Get.offAllNamed('/dashboard');
                },
                child: const Text('Skip', style: TextStyle(
                  color: Colors.white
                ),)),
            ],
          ),
        ),
        Padding(
          padding: const  EdgeInsets.symmetric(
             vertical: 150.0
          ),
          child: _pageViews(context),
        ),
        Positioned(
          bottom: 20.0,
          left: 0.0,
          right: 0.0,
          child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) => Container(
            width: 10.w,
            height: 10.h,
            margin: const EdgeInsets.symmetric(
              horizontal: 5
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _currentPage == index ? Colors.orange : Colors.white
            ),
          )),
        ))
        ],
      ),
    );
  }
}