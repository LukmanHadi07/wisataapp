import 'package:flutter/material.dart';

import 'package:wisata_app/app/models/wisata_model.dart';

class CustomContainerDestinasiView extends StatelessWidget {
   final WisataModel wisata; 
  const CustomContainerDestinasiView({
    Key? key,
    required this.wisata,
  }) : super(key: key);
 

  @override
  Widget build(BuildContext context) {
    return Container(
                         width: 170,
                         height: 190,
                         decoration: const BoxDecoration(
                           color: Colors.grey,
                           borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                 10.0
                ),
                bottomRight: Radius.circular(10.0)
                           )
                         ),
                         child: ClipRRect(
                          borderRadius: const  BorderRadius.only( topLeft: Radius.circular(
                 10.0
                ),
                bottomRight: Radius.circular(10.0)) ,
                          child: Image.network(wisata.imageUrl!, fit: BoxFit.cover,)),
                       );
  }
}
