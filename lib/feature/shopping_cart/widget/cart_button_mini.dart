import 'dart:developer';

import 'package:elementary/elementary.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_xpage/core/theme/icons.dart';
import 'package:test_xpage/core/theme/text_style.dart';
import 'package:test_xpage/feature/shopping_cart/cart_wm.dart';
import 'package:test_xpage/feature/shopping_cart/data/cart_model.dart';

/// Кнопка перехода в корзину с отображением общей суммы

class CartButtonMini extends ElementaryWidget<CartScreenWM> {
  const CartButtonMini({super.key}) : super(defaultCartScreenWMFactory);

  @override
  Widget build(final CartScreenWM wm) => EntityStateNotifierBuilder<CartModel>(
        listenableEntityState: wm.cartListenable,
        builder: (final _, final CartModel? cart) => FilledButton.icon(
          onPressed: () {
            // ToDo переход в корзину
            log('Переход в корзину\n${cart?.totalPrice ?? 0}');
          },
          style: ButtonStyle(
            padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 13)),
            backgroundColor: WidgetStateProperty.all<Color>(Color(0xFFFF8B19)),
          ),
          label: Text(
            cart?.totalPrice.toString() ?? 0.toString(),
            style: AppTextStyle.white14,
          ),
          icon: SvgPicture.asset(
            AppIcons.dollar,
            width: 20,
            height: 20,
            colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ),
      );
}
