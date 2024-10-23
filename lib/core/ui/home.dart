import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:test_xpage/core/app_text_style.dart';
import 'package:test_xpage/core/widgets/product_search.dart';
import 'package:test_xpage/feature/category/category_widget.dart';
import 'package:test_xpage/feature/delivery/delivery_widget.dart';

/// Главный экран
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(final BuildContext context) => Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  // Доставка и корзина
                  const DeliveryWidget(),

                  // Поиск по товарам
                  const ProductSearch(),

                  // Акции
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                    title: Text(
                      'Акции',
                      style: AppTextStyle.title,
                    ),
                  ),

                  // Популярное
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                    title: Text(
                      'Популярное',
                      style: AppTextStyle.title,
                    ),
                    trailing: TextButton.icon(
                      onPressed: () {
                        log('Смотреть все популярное');
                      },
                      style: ButtonStyle(
                        padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.zero),
                      ),
                      label: Text(
                        'Смотреть все',
                        style: AppTextStyle.seeAll,
                      ),
                      iconAlignment: IconAlignment.end,
                      icon: Icon(Icons.keyboard_arrow_right, color: Color(0xFFFF8B19)),
                    ),
                  ),

                  // Категории товаров
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                    title: Text(
                      'Категории товаров',
                      style: AppTextStyle.title,
                    ),
                  ),

                  // Список категорий
                  const CategoryWidget(),
                ],
              ),
            ),
          ),

          // Кнопка перехода в корзину
          // ToDo добавить проверку на наличие товаров в корзине
          Container(
            height: 48,
            color: Color(0xFFACC800),
          ),
        ],
      );
}
