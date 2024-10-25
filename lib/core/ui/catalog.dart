import 'package:flutter/material.dart';
import 'package:test_xpage/core/theme/text_style.dart';
import 'package:test_xpage/feature/category/presentation/widget/catalog_category_widget.dart';

/// Экран каталога товаров
class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(final BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // Каталог
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 24),
            title: Text(
              'Каталог',
              style: AppTextStyle.title,
            ),
          ),

          // Категории товаров и их список
          CatalogCategoryWidget(),
          const SizedBox(height: 40),
        ],
      );
}
