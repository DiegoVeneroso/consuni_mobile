import 'package:consuni_mobile/app/core/helpers/notification.dart';
import 'package:consuni_mobile/app/core/ui/widgets/custom_drawer.dart';
import 'package:consuni_mobile/app/modules/home/home_controller.dart';
import 'package:consuni_mobile/app/modules/home/widgets/item_tile.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController controller = HomeController(itemRepositoryImpl: Get.find());

  String notificationTitle = 'No Title';
  String notificationBody = 'No Body';
  String notificationData = 'No Data';

  @override
  void initState() {
    final firebaseMessaging = FCM();
    firebaseMessaging.setNotifications();

    firebaseMessaging.streamCtlr.stream.listen(_changeData);
    firebaseMessaging.bodyCtlr.stream.listen(_changeBody);
    firebaseMessaging.titleCtlr.stream.listen(_changeTitle);

    super.initState();
  }

  _changeData(String msg) => setState(() => notificationData = msg);
  _changeBody(String msg) => setState(() => notificationBody = msg);
  _changeTitle(String msg) => setState(() => notificationTitle = msg);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EasySearchBar(
        title: const Text('CONSUNI'),
        onSearch: (text) {
          controller.findAllItems(text);
        },
      ),
      drawer: const CustomDrawer(),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => RefreshIndicator(
                onRefresh: controller.refreshPage,
                child: ListView.builder(
                  itemCount: controller.listItem.length,
                  itemBuilder: (context, index) {
                    final _item = controller.listItem[index];
                    return ItemTile(
                      item: _item,
                    );
                  },
                ),
              ),
            ),
          ),
          //notification
          Text(
            notificationTitle,
            style: Theme.of(context).textTheme.headline4,
          ),
          Text(
            notificationBody,
            style: Theme.of(context).textTheme.headline6,
          ),
          Text(
            notificationData,
            style: Theme.of(context).textTheme.headline6,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/additem');
        },
        backgroundColor: Colors.red,
        child: const Icon(Icons.add),
      ),
    );
  }
}
