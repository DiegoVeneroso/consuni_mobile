import 'dart:developer';

import 'package:consuni_mobile/app/core/mixins/loader_mixin.dart';
import 'package:consuni_mobile/app/core/mixins/messages_mixin.dart';
import 'package:consuni_mobile/app/core/rest_client/rest_client.dart';
import 'package:consuni_mobile/app/models/item_model.dart';
import 'package:consuni_mobile/app/modules/home/home_controller.dart';
import 'package:consuni_mobile/app/repositories/item/item_repository_impl.dart';
import 'package:get/get.dart';

class EditItemController extends GetxController
    with LoaderMixin, MessagesMixin {
  final _item = Rx<ItemModel>(Get.arguments);

  ItemModel get item => _item.value;

  final ItemRepositoryImpl _itemRepositoryImpl;
  HomeController homeController =
      HomeController(itemRepositoryImpl: Get.find());

  final _loading = false.obs;
  final _message = Rxn<MessageModel>();

  var isItemPicPathSet = false.obs;
  var itemPicPath = "".obs;

  EditItemController({
    required ItemRepositoryImpl ItemRepositoryImpl,
  }) : _itemRepositoryImpl = ItemRepositoryImpl;

  @override
  void onInit() {
    loaderListener(_loading);
    messageListener(_message);
    super.onInit();
  }

  void setItemImagePath(String path) {
    itemPicPath.value = path;
    isItemPicPathSet.value = true;
  }

  Future<void> updateItem(ItemModel item) async {
    try {
      _loading.toggle(); //abre o loading

      await _itemRepositoryImpl.updateItem(item);

      _loading.toggle(); //fecha o loading

      await Get.offAllNamed('/home');

      _message(MessageModel(
        title: 'Sucesso',
        message: 'Atualizado com sucesso',
        type: MessageType.info,
      ));
    } on RestClientException catch (e, s) {
      _loading.toggle(); //fecha o loaging que foi aberto no try

      log('Erro ao atualizar o item', error: e, stackTrace: s);

      _message(
        MessageModel(
          title: 'Erro',
          message: e.message,
          type: MessageType.error,
        ),
      );
    } catch (e, s) {
      _loading.toggle(); //fecha o loading
      log('Erro ao atualizar item', error: e, stackTrace: s);

      _message(
        MessageModel(
          title: 'Erro',
          message: 'Erro ao atualizar o item',
          type: MessageType.error,
        ),
      );
    }
  }
}
