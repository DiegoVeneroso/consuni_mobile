import 'package:consuni_mobile/app/core/ui/widgets/custom_appbar.dart';
import 'package:consuni_mobile/app/core/ui/widgets/custom_drawer.dart';
import 'package:consuni_mobile/app/modules/home/home_controller.dart';
import 'package:consuni_mobile/app/modules/home/widgets/item_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      drawer: CustomDrawer(),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return ItemTile();
          }),
    );
  }
}
