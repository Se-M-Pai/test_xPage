import 'package:elementary_helper/elementary_helper.dart';
import 'package:test_xpage/core/product.dart';
import 'package:test_xpage/example_data/example_cart.dart';
import 'package:test_xpage/feature/shopping_cart/data/cart_model.dart';

/// Состояние корзины и управление ей
class CartState {
  CartState();

  /// Состояние корзины
  final StateNotifier<CartModel> _cartState = StateNotifier<CartModel>(initValue: exampleCart);

  ListenableState<CartModel> get cartListenable => _cartState;

  /// Добавление товара
  void addProductToCart(final Product product) {
    final Map<Product, double> products = _cartState.value!.products;

    if (products.keys.contains(product)) {
      products[product] = double.parse((products[product]! + 0.1).toStringAsFixed(1));
    } else {
      products[product] = 0.1;
    }
    final num totalPrice =
        num.parse((_cartState.value!.totalPrice + (product.discountedPrice * 0.1)).toStringAsFixed(2));

    final CartModel newCartState = CartModel(products: products, totalPrice: totalPrice);

    _cartState.accept(newCartState);
  }

  /// Удаление товара
  void removeProduct(final Product product) {
    final Map<Product, double> products = _cartState.value!.products;

    if (products[product]! > 0.1) {
      products[product] = double.parse((products[product]! - 0.1).toStringAsFixed(1));
    } else {
      products.remove(product);
    }
    final num totalPrice =
        num.parse((_cartState.value!.totalPrice - (product.discountedPrice * 0.1)).toStringAsFixed(2));

    final CartModel newCartState = CartModel(products: products, totalPrice: totalPrice);

    _cartState.accept(newCartState);
  }
}
