import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              'Home is working',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    Get.toNamed('/counter');
                  },
                  child: Text('Counter')
              ),
              SizedBox(height: 10, width: 10),
              ElevatedButton(
                  onPressed: () {
                    Get.toNamed('/formulir');
                  },
                  child: Text('Biodata')
              ),
              SizedBox(height: 10, width: 10),
              ElevatedButton(
                  onPressed: () {
                    Get.toNamed('/profile');
                  },
                  child: Text('Profile Account')
              ),
            ],
          )
        ],
      ),
    );
  }
}
