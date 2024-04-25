
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'package:wisata_app/app/models/category_model.dart';

class CustomContainerCategoryWisata extends StatelessWidget {
    final CategoryModel categoryModel;
  const CustomContainerCategoryWisata({
    Key? key,
    required this.categoryModel,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        children: [
          Container(
            width: 73,
            height: 74,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(categoryModel.imageCategory!, fit: BoxFit.cover,)),
          ),
          SizedBox(
            height: 5.w,
          ),
          Text(categoryModel.name!, style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.normal
          ),)
        ],
      ),
    );
  }
}
