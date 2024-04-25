import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:wisata_app/app/models/wisata_model.dart';

class CustomContainerWisataPage extends StatelessWidget {
  final WisataModel wisata;
  const CustomContainerWisataPage({
    Key? key,
    required this.wisata,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
         boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2), // changes position of shadow
          ),
         ]
      ),
      child:
          Row(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10,  top: 10),
                    child: Container(
                      width: 152,
                      height: 133,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey
                      ),
                      child: ClipRRect(
                        borderRadius:const BorderRadius.only(topLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                        child: Image.network(wisata.imageUrl!, fit: BoxFit.cover,)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 11,vertical: 10),
                    child: Container(
                      height: 23,
                      width: 150,
                      decoration: BoxDecoration(
                         color: Colors.blue,
                         borderRadius: BorderRadius.circular(5)
                      ),
                      child: Center(
                        child: Text('Information Wisata', style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.white
                        ),),
                      ),
                    ),
                  )
                ],
              ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(wisata.name!, style: TextStyle(
                          fontSize: 11.sp,
                          color: Colors.black
                        ),),
                        const  SizedBox(
                            height: 3,
                          ),
                          Text(wisata.address!, style: TextStyle(
                          fontSize: 8.sp,
                          color: Colors.blue
                        ),),
                       const   SizedBox(
                            height: 5,
                          ),
                          Container(
                                                   height: 15,
                                                   width: 70,
                                                   decoration: BoxDecoration(
                                                      color: Colors.amber,
                                                      borderRadius: BorderRadius.circular(5)
                                                   ),
                                                   child: Center(
                                                     child: Text(wisata.priceHtm!, style: TextStyle(
                                                       fontSize: 10.sp,
                                                       color: Colors.white
                                                     ),),
                                                   ),
                                                 ),
                        
                        ],
                      ),
                ),

            ],
          ),
         

    );
    
  }
}
