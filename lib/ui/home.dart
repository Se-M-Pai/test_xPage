import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:test_xpage/core/app_icons.dart';
import 'package:test_xpage/core/app_text_style.dart';
import 'package:test_xpage/feature/category/category_widget.dart';
import 'package:test_xpage/feature/category/widget/category_card.dart';

/// Главный экран
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(final BuildContext context) => LayoutBuilder(
    builder: (final _, final BoxConstraints viewportConstraints) => SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // Популярное
              ListTile(
                title: Text(
                  'Популярное',
                  style: AppTextStyle.title,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                trailing: TextButton(
                  onPressed: () {
                    log('Смотреть все популярное');
                  },
                  style: ButtonStyle(
                    padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.all(0)),
                  ),
                  child: Text(
                    'Смотреть все >',
                    style: AppTextStyle.button,
                  ),
                ),
              ),

              // Категории товаров
              ListTile(
                title: Text(
                  'Категории товаров',
                  style: AppTextStyle.title,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 24),
              ),
              // Список категорий
              const CategoryWidget(),
            ],
          ),
        ),
      );
}
