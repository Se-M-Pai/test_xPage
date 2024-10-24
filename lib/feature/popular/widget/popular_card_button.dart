import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_xpage/core/theme/icons.dart';
import 'package:test_xpage/core/theme/text_style.dart';

class PopularCardButton extends StatelessWidget {
  const PopularCardButton({super.key});

  @override
  Widget build(final BuildContext context) => Container(
        height: 270,
        width: (MediaQuery.of(context).size.width - 64) / 2,
        color: Color(0xFFF8F8F8),
        child: InkWell(
          onTap: () {
            log('Показать еще');
          },
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SvgPicture.asset(
                  AppIcons.more,
                  height: 36,
                  width: 36,
                  colorFilter: ColorFilter.mode(Color(0xFFFF8B19), BlendMode.srcIn),
                ),
                const SizedBox(height: 19),
                Text(
                  'Показать\nеще',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.seeAll,
                ),
              ],
            ),
          ),
        ),
      );
}
