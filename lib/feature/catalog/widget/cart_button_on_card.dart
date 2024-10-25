import 'package:elementary/elementary.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_xpage/core/product.dart';
import 'package:test_xpage/core/theme/icons.dart';
import 'package:test_xpage/feature/shopping_cart/cart_wm.dart';
import 'package:test_xpage/feature/shopping_cart/data/cart_model.dart';

class CartButtonOnCard extends ElementaryWidget<CartScreenWM> {
  const CartButtonOnCard({required this.product, super.key}) : super(defaultCartScreenWMFactory);

  final Product product;

  @override
  Widget build(final CartScreenWM wm) => EntityStateNotifierBuilder<CartModel>(
        listenableEntityState: wm.cartListenable,
        builder: (final _, final CartModel? cart) => cart?.products.keys.contains(product) ?? false
            ? Container(
                height: 36,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Color(0xFFFF8B19)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        wm.deleteProduct(product);
                      },
                      icon: Text('-'),
                    ),
                    Text(
                      cart!.products[product].toString(),
                      textAlign: TextAlign.center,
                    ),
                    IconButton(
                      onPressed: () {
                        wm.addProduct(product);
                      },
                      icon: Text('+'),
                    ),
                  ],
                ),
              )
            : SizedBox(
                height: 36,
                child: FilledButton(
                  onPressed: () {
                    wm.addProduct(product);
                  },
                  style: ButtonStyle(backgroundColor: WidgetStateProperty.all<Color>(Color(0xFFFF8B19))),
                  child: SvgPicture.asset(
                    AppIcons.cart,
                    width: 24,
                    height: 20,
                    colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                ),
              ),
      );
}
