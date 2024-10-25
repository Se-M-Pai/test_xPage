import 'package:elementary/elementary.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:test_xpage/core/global.dart';
import 'package:test_xpage/core/product.dart';

class CartModel {
  CartModel({
    required this.products,
    required this.totalPrice,
  });

  CartModel.empty()
      : products = <Product, double>{},
        totalPrice = 0;

  final Map<Product, double> products;

  final num totalPrice;
}

class CartScreenModel extends ElementaryModel {
  CartScreenModel() : super();

  final EntityStateNotifier<CartModel> cartState = EntityStateNotifier<CartModel>()..loading(CartModel.empty());
}
