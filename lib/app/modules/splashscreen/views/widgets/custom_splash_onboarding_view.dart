import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSplashOnBoardingView extends StatelessWidget {
   final String imagePath;
   final String  textTitle;
   
  const CustomSplashOnBoardingView({
    Key? key,
    required this.imagePath,
    required this.textTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25.0
      ),
      child: Center(
        child: Column(children: [
          Image.asset(
            imagePath,
             height: 250.h,
             width: 250.w,
          ),
          SizedBox(
            height: 20.h,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                textTitle, style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
            ],
          )
        ]),
      ),
    );
  }
}
