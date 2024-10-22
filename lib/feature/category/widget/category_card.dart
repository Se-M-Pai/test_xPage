import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:test_xpage/core/app_text_style.dart';

/// Карточка категории
///
/// [label] - Название категории
///
/// [image] - Изображение категории

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    required this.label,
    required this.image,
    super.key,
  });

  final String label;
  final AssetImage image;

  @override
  Widget build(final BuildContext context) => InkWell(
        onTap: () {
          // TODO клик по карточке открывает каталог с выбранной категорией
          log(label);
        },
        child: Container(
          height: 72,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: image,
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              label,
              style: AppTextStyle.category,
            ),
          ),
        ),
      );
}
