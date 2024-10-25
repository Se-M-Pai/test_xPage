import 'package:test_xpage/example_data/example_category.dart';
import 'package:test_xpage/feature/delivery/delivery_model.dart';
import 'package:test_xpage/feature/shopping_cart/data/cart_state.dart';

class Global {
  Global._();

  // выбранная категория
  static CategoryExample selectedCategory = CategoryExample.groceries;

  // выбранный режим доставки
  static DeliveryState selectedDeliveryState = DeliveryState.delivery;

  // эффект подгрузки
  static bool isLoaded = false;

  // состояние корзины
  static CartState cartState = CartState();
}
