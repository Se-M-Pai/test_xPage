import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:test_xpage/core/promo.dart';
import 'package:test_xpage/core/theme/text_style.dart';

/// Настраиваемый виджет карточки для отображения информации о продукте

class PromoCard extends StatelessWidget {
  const PromoCard({required this.promo, super.key});

  final Promo promo; // Акция

  @override
  Widget build(final BuildContext context) {
    final double widthCard = MediaQuery.of(context).size.width - 48;

    return Container(
      height: 184,
      width: widthCard,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 5,
            blurRadius: 10,
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          log(promo.name);
        },
        child: Column(
          children: <Widget>[
            // Изображение акции
            SizedBox(
              height: 100,
              width: widthCard,
              child: Image(
                image: AssetImage(promo.image),
                fit: BoxFit.cover,
              ),
            ),

            // Детали акции
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              height: 84,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const SizedBox(height: 16),
                  Text(
                    promo.description,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.black14l,
                  ),
                  const Spacer(),
                  Text(
                    promo.name,
                    style: AppTextStyle.category,
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
