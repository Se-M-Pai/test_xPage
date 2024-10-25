import 'package:test_xpage/core/product.dart';
import 'package:test_xpage/example_data/example_product.dart';
import 'package:test_xpage/feature/shopping_cart/data/cart_model.dart';

CartModel exampleCart = CartModel(
  products: <Product, double>{
    listProductExample.elementAt(1): 0.4,
  },
  totalPrice: 493.6,
);
