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
  Future<List<ItemModel>> findAll() async {
    final result = await _restClient.get('/items/');

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
