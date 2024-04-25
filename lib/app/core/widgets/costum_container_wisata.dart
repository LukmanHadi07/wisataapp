import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/wisata_model.dart';

class CustomContainerWisata extends StatelessWidget {
  final WisataModel wisata; 
  const CustomContainerWisata({
    Key? key,
    required this.wisata,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10.0
      ),
      width: 350,
      height: 174,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
         boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10 ),
        child: Expanded(
          child: Row(
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10)
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(wisata.imageUrl!, fit: BoxFit.cover,),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 7, top: 10.0, ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Row(
                        children: [
                          const Icon(Icons.airplanemode_active_rounded, size: 20.0, color: Colors.amber,),
                          const SizedBox(width: 5),
                          Text(
                            wisata.name!,
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w600
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                        Row(
                         children: [
                          const Icon(Icons.location_on_rounded, size: 20.0, color: Colors.amber,),
                           const  SizedBox(
                          width: 5,
                         ),
                          Text(wisata.address!, style: TextStyle(
                            fontSize: 9.sp,
                            fontWeight: FontWeight.normal
                          ),)
                         ],
                                         ),
                     
                   const SizedBox(
                    height: 5,
                   ),
                    Center(
                      child: Container(
                        width: 70,
                        height: 21,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.orange
                        ),
                        child: Center(
                          child: Text(wisata.priceHtm!, style: TextStyle(
                            fontSize: 10.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w600
                          ),),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Center(
                      child: Container(
                        width: 99,
                        height: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue
                        ),
                        child: Center(
                          child: Text('Information', style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w600
                          ),),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
