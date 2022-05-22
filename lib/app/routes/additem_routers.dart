import 'package:consuni_mobile/app/modules/add_item/add_item_bindings.dart';
import 'package:consuni_mobile/app/modules/add_item/add_item_page.dart';
import 'package:get/get.dart';

class AdditemRouters {
  AdditemRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: '/additem',
      binding: AddItemBindings(),
      page: () => AddItemPage(),
    ),
  ];
}
