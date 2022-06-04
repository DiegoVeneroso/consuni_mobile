import 'package:consuni_mobile/app/core/ui/widgets/custom_appbar.dart';
import 'package:consuni_mobile/app/core/ui/widgets/custom_drawer.dart';
import 'package:consuni_mobile/app/modules/home/home_controller.dart';
import 'package:consuni_mobile/app/modules/home/widgets/item_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      drawer: CustomDrawer(),
      body: Obx(
        () => RefreshIndicator(
          onRefresh: controller.refreshPage,
          child: ListView.builder(
              itemCount: controller.listItem.length,
              itemBuilder: (context, index) {
                final _item = controller.listItem[index];
                return ItemTile(
                  item: _item,
                );
              }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/additem');
        },
        backgroundColor: Colors.red,
        child: Icon(Icons.add),
      ),
    );
  }
}
