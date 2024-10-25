import 'package:elementary/elementary.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:test_xpage/core/product.dart';
import 'package:test_xpage/example_data/example_cart.dart';

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

  final EntityStateNotifier<CartModel> cartState = EntityStateNotifier<CartModel>()..loading(exampleCart);
}
