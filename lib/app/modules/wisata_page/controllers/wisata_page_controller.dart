import 'dart:convert';

import 'package:get/get.dart';
import 'package:wisata_app/app/models/wisata_model.dart';
import 'package:http/http.dart' as http;

class WisataController extends GetxController {
   final wisataModel = <WisataModel>[].obs;
   final RxBool loading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getAllDataWisata();
  }

  Future<void> getAllDataWisata() async {
    loading.value = true; // Set loading to true before fetching data
    try {
      final url = Uri.parse('http://172.20.0.1:8000/api/destinasi');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final wisataData = jsonDecode(response.body) as List;
        final parsedWisataData = wisataData.map((e) => WisataModel.fromJson(e)).toList();
        wisataModel.assignAll(parsedWisataData);
      } else {
        Get.snackbar('Error', 'Failed to fetch wisata'); // Display error snackbar
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred'); // Display error snackbar
    } finally {
      loading.value = false; // Set loading to false after completion
    }
  }

  
}
