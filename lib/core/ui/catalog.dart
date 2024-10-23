import 'package:flutter/material.dart';
import 'package:test_xpage/core/app_text_style.dart';
import 'package:test_xpage/core/product.dart';
import 'package:test_xpage/core/widgets/product_card.dart';
import 'package:test_xpage/core/widgets/product_search.dart';
import 'package:test_xpage/example_data/example_product.dart';
import 'package:test_xpage/feature/category/catalog_category/catalog_category_widget.dart';
import 'package:test_xpage/feature/delivery/delivery_widget.dart';

/// Экран каталога товаров
class Catalog extends StatelessWidget {
  const Catalog({super.key});

  @override
  Widget build(final BuildContext context) => SingleChildScrollView(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        // Доставка и корзина
        const DeliveryWidget(),

        // Поиск по товарам
        const ProductSearch(),

        // Каталог
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 24),
          title: Text(
            'Каталог',
            style: AppTextStyle.title,
          ),
        ),

        // Карусель категорий
        CatalogCategoryWidget(),
        const SizedBox(height: 24),

        // Список товаров
        // ToDO каталог продуктов сделать через элементари
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: listProduct.map((final Product product) => ProductCard(product: product)).toList(),
        ),
        const SizedBox(height: 40),
      ],
    ),
  );
}
