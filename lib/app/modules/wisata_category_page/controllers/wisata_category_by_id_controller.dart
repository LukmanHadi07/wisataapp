import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:wisata_app/app/models/category_model.dart';
import 'package:wisata_app/app/models/wisata_model.dart';

class WisataCategoryByIdController extends GetxController {
 
   final activeCategory = ''.obs;
   final categories = <CategoryModel>[].obs;
   final wisata = <WisataModel>[].obs;
   final RxBool loading = true.obs;

  
  @override
  void onInit() {
    super.onInit();
  }

  
 Future<void> getAllWisataByCategoryId(String categoryId) async {
  try {
    if (activeCategory != categoryId) {
      activeCategory.value = categoryId;
      loading.value = true;
      final url = Uri.parse('http://172.20.0.1:8000/api/destinasi/category/$categoryId');
      final response = await http.get(url);
       print(response.body);

       if (response.statusCode == 200) {
          final wisataData = jsonDecode(response.body) as List;
          final parsedWisata = wisataData.map((e) => WisataModel.fromJson(e)).toList();
          wisata.assignAll(parsedWisata);
       } else {
        print('Error fetching categories: ${response.statusCode}');
        Get.snackbar('Error', 'Failed to fetch categories'); // D
       }
    }
    loading.value = false;
  } catch (e) {
       print('Error fetching categories: $e');
      Get.snackbar('Error', 'An error occurred'); 
     }

 }
}
