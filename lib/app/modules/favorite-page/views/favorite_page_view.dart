import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/favorite_page_controller.dart';

class FavoritePageView extends GetView<FavoritePageController> {
  const FavoritePageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FavoritePageView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'FavoritePageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
