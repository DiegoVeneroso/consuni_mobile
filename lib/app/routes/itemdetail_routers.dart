import 'package:consuni_mobile/app/modules/home/home_bindings.dart';
import 'package:consuni_mobile/app/modules/home/home_page.dart';
import 'package:consuni_mobile/app/modules/item_detail/item_detail_bindings.dart';
import 'package:consuni_mobile/app/modules/item_detail/item_detail_page.dart';
import 'package:get/get.dart';

class ItemDetailRouters {
  ItemDetailRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: '/itemdetail',
      binding: ItemDetailBindings(),
      page: () => ItemDetailPage(),
    ),
  ];
}
