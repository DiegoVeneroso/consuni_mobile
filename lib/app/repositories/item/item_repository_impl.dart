import 'dart:developer';

import 'package:consuni_mobile/app/core/rest_client/rest_client.dart';
import 'package:consuni_mobile/app/models/item_model.dart';

import './item_repository.dart';

class ItemRepositoryImpl implements ItemRepository {
  final RestClient _restClient;

  ItemRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<List<ItemModel>> findAll(String text) async {
    if (text == '') {
      final result = await _restClient.get('/items/');
    }

    final result = await _restClient.get('/items/$text');

    if (result.hasError) {
      log(
        'Erro ao buscar o item principal ${result.statusCode}',
        error: result.statusText,
        stackTrace: StackTrace.current,
      );
      throw RestClientException('Erro ao buscar os items');
    }
    return result.body.map<ItemModel>((p) => ItemModel.fromMap(p)).toList();
  }

  @override
  Future<void> addItem(ItemModel item) async {
    final result = await _restClient.post('/items/', {
      "title": item.title,
      "subtitle": item.subtitle,
      "description": item.description,
      "image": item.image
    });

    if (result.hasError) {
      var message = 'Erro ao registrar item';
      if (result.statusCode == 400) {
        message = result.body['error'];
      }

      log(
        message,
        error: result.statusText,
        stackTrace: StackTrace.current,
      );

      throw RestClientException(message);
    }
  }

  @override
  Future<void> deleteItem(int idItem) async {
    final result = await _restClient.delete('/items/$idItem');

    if (result.hasError) {
      var message = 'Erro ao deletar item';
      if (result.statusCode == 400) {
        message = result.body['error'];
      }

      log(
        message,
        error: result.statusText,
        stackTrace: StackTrace.current,
      );

      throw RestClientException(message);
    }
  }

  @override
  Future<void> updateItem(ItemModel item) async {
    final result = await _restClient.put('/items/${item.id}', {
      "id": item.id,
      "title": item.title,
      "subtitle": item.subtitle,
      "description": item.description,
      "image": item.image
    });

    if (result.hasError) {
      var message = 'Erro ao atualizar item';
      if (result.statusCode == 400) {
        message = result.body['error'];
      }

      log(
        message,
        error: result.statusText,
        stackTrace: StackTrace.current,
      );

      throw RestClientException(message);
    }
  }

  @override
  Future<void> searchItem(String text) async {
    final result = await _restClient.get('/items/$text');

    if (result.hasError) {
      log(
        'Erro ao buscar o item principal ${result.statusCode}',
        error: result.statusText,
        stackTrace: StackTrace.current,
      );
      throw RestClientException('Erro ao buscar os items principais');
    }
    return result.body.map<ItemModel>((p) => ItemModel.fromMap(p)).toList();
  }
}
