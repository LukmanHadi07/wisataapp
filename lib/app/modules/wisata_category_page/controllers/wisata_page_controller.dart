import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:wisata_app/app/models/category_model.dart';
import 'package:wisata_app/app/models/wisata_model.dart';

class WisataPageController extends GetxController {
     final RxList<CategoryModel> categories = RxList<CategoryModel>();
    final RxList<WisataModel> wisata = RxList<WisataModel>();
   final RxBool loading = true.obs;
   var activeCategory = ''.obs;

  
  
  @override
  void onInit() {
    super.onInit();
    getAllWisata();
    getAllWisataByCategoryId('1');
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    getAllWisata();
  }



  Future<void> getAllWisata() async {
    loading.value = true; // Set loading to true before fetching data

    try {
      final url = Uri.parse('http://172.20.0.1:8000/api/destinasi');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final categoriesData = jsonDecode(response.body) as List;
        final parsedCategories =
            categoriesData.map((e) => WisataModel.fromJson(e)).toList();
        wisata.assignAll(parsedCategories);
      } else {
     
        Get.snackbar('Error', 'Failed to fetch categories'); // Display error snackbar
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred'); // Display error snackbar
    } finally {
      loading.value = false; // Set loading to false after completion
    }
  }


 Future<void> getAllWisataByCategoryId(String categoryId) async {
  try {
    if (activeCategory.value != categoryId) {
      loading.value = true;
      final url = Uri.parse('http://172.20.0.1:8000/api/destinasi/category/$categoryId');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final wisataData = jsonDecode(response.body) as List;
        final parsedWisata = wisataData.map((e) => WisataModel.fromJson(e)).toList();
        wisata.assignAll(parsedWisata);
        activeCategory.value = categoryId; // Simpan kategori yang sedang aktif
      } else {
        print('Error fetching categories: ${response.statusCode}');
        Get.snackbar('Error', 'Failed to fetch categories');
      }
    }
  } catch (e) {
    print('Error fetching categories: $e');
    Get.snackbar('Error', 'An error occurred');
  } finally {
    loading.value = false;
  }
}
}
