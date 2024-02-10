import 'package:flutter_e_commerce/models/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var itemBag = <ProductModel>[];

class ItemBagNotifier extends StateNotifier<List<ProductModel>> {
  ItemBagNotifier() : super(itemBag);
}


final itembagProvider =
    StateNotifierProvider<ItemBagNotifier, List<ProductModel>>((ref) {
  return ItemBagNotifier();
});
