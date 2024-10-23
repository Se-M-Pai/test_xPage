import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_xpage/core/app_icons.dart';
import 'package:test_xpage/core/app_text_style.dart';

/// Кнопка перехода в корзину с отображением общей суммы
///
/// [total] - сумма товаров в корзине

class TotalAmount extends StatelessWidget {
  const TotalAmount({
    required this.total,
    super.key,
  });

  final int total;

  @override
  Widget build(final BuildContext context) => FilledButton.icon(
        onPressed: () {
          // ToDo переход в корзину
          log('$total');
        },
        style: ButtonStyle(
          padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 13)),
          backgroundColor: WidgetStateProperty.all<Color>(Color(0xFFFF8B19)),
        ),
        label: Text(
          total.toString(),
          style: AppTextStyle.white14,
        ),
        icon: SvgPicture.asset(
          AppIcons.dollar,
          width: 20,
          height: 20,
          colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
      );
}
