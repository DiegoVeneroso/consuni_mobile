import 'package:consuni_mobile/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppbar extends AppBar {
  CustomAppbar({Key? key, double elevation = 2})
      : super(
            key: key,
            backgroundColor: Colors.white,
            elevation: elevation,
            centerTitle: true,
            title: Image.asset(
              'assets/images/logo.png',
              width: 80,
            ),
            iconTheme: const IconThemeData(color: Colors.black),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    // Get.toNamed('/edititem', arguments: item);
                    // HomeController(itemRepositoryImpl: Get.find())
                    //     .searchBar
                    //     .value = true;
                  },
                  child: const Icon(Icons.search),
                ),
              ),
            ]);
}
