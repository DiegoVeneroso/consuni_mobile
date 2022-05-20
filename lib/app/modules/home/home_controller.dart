import 'dart:developer';

import 'package:consuni_mobile/app/core/mixins/loader_mixin.dart';
import 'package:consuni_mobile/app/core/mixins/messages_mixin.dart';
import 'package:consuni_mobile/app/models/item_model.dart';
import 'package:consuni_mobile/app/repositories/item/item_repository_impl.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with LoaderMixin, MessagesMixin {
  final ItemRepositoryImpl _itemRepositoryImpl;

  final _loading = false.obs;
  final _message = Rxn<MessageModel>();
  final listItem = <ItemModel>[].obs;

  HomeController({required ItemRepositoryImpl itemRepositoryImpl})
      : _itemRepositoryImpl = itemRepositoryImpl;

  @override
  void onInit() {
    loaderListener(_loading);
    messageListener(_message);
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    try {
      _loading.toggle();
      await findAllItems();
      _loading.toggle();
    } catch (e, s) {
      _loading.toggle();
      log('Erro ao buscar item', error: e, stackTrace: s);
      _message(
        MessageModel(
          title: 'Erro',
          message: 'Erro ao buscar item',
          type: MessageType.error,
        ),
      );
    }
  }

  Future<void> findAllItems() async {
    final items = await _itemRepositoryImpl.findAll();
    listItem.assignAll(items); //sobrescreve a lista de items
  }
}
