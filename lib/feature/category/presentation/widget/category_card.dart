import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:test_xpage/core/theme/text_style.dart';
import 'package:test_xpage/example_data/example_category.dart';
import 'package:test_xpage/feature/category/presentation/category_wm.dart';

/// Карточка категории
///
/// [wm] - Представление категорий
///
/// [category] - Категория

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    required this.wm,
    required this.category,
    super.key,
  });

  final CategoryWM wm;
  final CategoryExample category;

  @override
  Widget build(final BuildContext context) => InkWell(
        onTap: () {
          wm.onTap(category);
          // TODO клик по карточке открывает каталог с выбранной категорией
        },
        child: Container(
          height: 72,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: category.image,
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              category.label,
              style: AppTextStyle.category,
            ),
          ),
        ),
      );
}
