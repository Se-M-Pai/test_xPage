import 'dart:developer';

import 'package:elementary/elementary.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_xpage/core/theme/icons.dart';
import 'package:test_xpage/core/theme/text_style.dart';
import 'package:test_xpage/feature/shopping_cart/cart_wm.dart';
import 'package:test_xpage/feature/shopping_cart/data/cart_model.dart';

class CartButton extends ElementaryWidget<CartScreenWM> {
  const CartButton({super.key}) : super(defaultCartScreenWMFactory);

  @override
  Widget build(final CartScreenWM wm) => EntityStateNotifierBuilder<CartModel>(
        listenableEntityState: wm.cartListenable,
        builder: (final _, final CartModel? cart) => cart?.products.isNotEmpty ?? false
            ? InkWell(
                onTap: () {
                  // ToDo переход в корзину
                  log('Переход в корзину');
                },
                child: ListTile(
                  minTileHeight: 48,
                  tileColor: Color(0xFFACC800),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                  leading: SvgPicture.asset(
                    AppIcons.cart,
                    width: 24,
                    height: 20,
                    colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'В корзине: ${cart!.products.length}',
                        style: AppTextStyle.inCart,
                      ),
                      Text(
                        '${cart.totalPrice} руб.',
                        style: AppTextStyle.sumCart,
                      ),
                    ],
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right, color: Colors.white),
                ),
              )
            : Container(),
      );
}
