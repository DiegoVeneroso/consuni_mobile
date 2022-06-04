import 'dart:developer';
import 'dart:io' as Io;
import 'dart:typed_data';

import 'package:consuni_mobile/app/core/mixins/loader_mixin.dart';
import 'package:consuni_mobile/app/core/mixins/messages_mixin.dart';
import 'package:consuni_mobile/app/core/rest_client/rest_client.dart';
import 'package:consuni_mobile/app/models/item_model.dart';
import 'package:consuni_mobile/app/repositories/item/item_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';

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

  Future<void> refreshPage() async {
    super.onReady();
    try {
      await findAllItems();
    } catch (e, s) {
      log('Erro ao atualizar a lista de item', error: e, stackTrace: s);
      _message(
        MessageModel(
          title: 'Erro',
          message: 'Erro ao atualiza a lista de item',
          type: MessageType.error,
        ),
      );
    }
  }

  Future<void> deleteItem(int? idItem) async {
    try {
      _loading.toggle(); //abre o loading

      await _itemRepositoryImpl.deleteItem(idItem!);

      _loading.toggle(); //fecha o loading

      _message(MessageModel(
        title: 'Sucesso',
        message: 'Item excluído com sucesso',
        type: MessageType.info,
      ));

      await Get.offAllNamed('/home');
    } on RestClientException catch (e, s) {
      _loading.toggle(); //fecha o loaging que foi aberto no try

      log('Erro ao exlcuir item', error: e, stackTrace: s);

      _message(
        MessageModel(
          title: 'Erro',
          message: e.message,
          type: MessageType.error,
        ),
      );
    } catch (e, s) {
      _loading.toggle(); //fecha o loading
      log('Erro ao excluir o item', error: e, stackTrace: s);

      _message(
        MessageModel(
          title: 'Erro',
          message: 'Erro ao excluir o item',
          type: MessageType.error,
        ),
      );
    }
  }

  Image decodeImage(String img64) {
    Uint8List _bytesImage;

    _bytesImage = const Base64Decoder().convert(img64);

    return Image.memory(_bytesImage);
  }
}
