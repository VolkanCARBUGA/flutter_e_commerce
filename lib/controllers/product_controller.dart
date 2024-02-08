import 'package:flutter_e_commerce/data/product_list.dart';
import 'package:flutter_e_commerce/models/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductNotifier extends StateNotifier<List<ProductModel>> {
  ProductNotifier() : super(productItems);
}

final provider =
    StateNotifierProvider<ProductNotifier, List<ProductModel>>((ref) {
  return ProductNotifier();
});
