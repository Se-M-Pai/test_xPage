import 'package:elementary/elementary.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/material.dart';
import 'package:test_xpage/core/global.dart';
import 'package:test_xpage/core/product.dart';
import 'package:test_xpage/feature/shopping_cart/data/cart_model.dart';
import 'package:test_xpage/feature/shopping_cart/data/cart_state.dart';

abstract interface class ICartScreenWM implements IWidgetModel {
  /// Состояние корзины
  EntityValueListenable<CartModel> get cartListenable;

  /// Метод удаления товара из корзины
  void deleteProduct(final Product product);

  /// Метод изменения кол-ва товара
  void addProduct(final Product product);
}

CartScreenWM defaultCartScreenWMFactory(final BuildContext context) => CartScreenWM(CartScreenModel());

class CartScreenWM extends WidgetModel<ElementaryWidget, CartScreenModel> implements ICartScreenWM {
  CartScreenWM(super._model);

  final CartState cartState = Global.cartState;

  @override
  EntityValueListenable<CartModel> get cartListenable => model.cartState;

  @override
  void initWidgetModel() {
    model.cartState.content(cartState.cartListenable.value!);
    super.initWidgetModel();
  }

  @override
  void deleteProduct(final Product product) {
    cartState.removeProduct(product);
    model.cartState.content(cartState.cartListenable.value!);
  }

  @override
  void addProduct(final Product product) {
    cartState.addProductToCart(product);
    model.cartState.content(cartState.cartListenable.value!);
  }
}
