import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_xpage/core/theme/icons.dart';
import 'package:test_xpage/core/theme/text_style.dart';

class CartButton extends StatelessWidget {
  const CartButton({super.key});

  @override
  Widget build(final BuildContext context) => InkWell(
        onTap: () {
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
                'В корзине: 4',
                style: AppTextStyle.inCart,
              ),
              Text(
                '1456 руб.',
                style: AppTextStyle.sumCart,
              ),
            ],
          ),
          trailing: Icon(Icons.keyboard_arrow_right, color: Colors.white),
        ),
      );
}
