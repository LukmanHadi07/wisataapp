import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:wisata_app/app/models/category_model.dart';

class DashboardController extends GetxController {
  final RxList<CategoryModel> categories = RxList<CategoryModel>();
  final RxBool loading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getAllCategory();
  }

  Future<void> getAllCategory() async {
    loading.value = true; // Set loading to true before fetching data

    try {
      final url = Uri.parse('http://172.20.0.1:8000/api/categories');
      final response = await http.get(url);
       print(response.body);
      if (response.statusCode == 200) {
        final categoriesData = jsonDecode(response.body) as List;
        final parsedCategories =
            categoriesData.map((e) => CategoryModel.fromJson(e)).toList();
        categories.assignAll(parsedCategories);
      } else {
        print('Error fetching categories: ${response.statusCode}');
        Get.snackbar('Error', 'Failed to fetch categories'); // Display error snackbar
      }
    } catch (e) {
      print('Error fetching categories: $e');
      Get.snackbar('Error', 'An error occurred'); // Display error snackbar
    } finally {
      loading.value = false; // Set loading to false after completion
    }
  }
}
