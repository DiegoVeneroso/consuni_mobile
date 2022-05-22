import 'package:consuni_mobile/app/models/item_model.dart';

abstract class ItemRepository {
  Future<List<ItemModel>> findAll();
  Future<void> addItem(ItemModel item);
}
