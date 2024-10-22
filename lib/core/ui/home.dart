import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:test_xpage/core/app_icons.dart';
import 'package:test_xpage/core/app_text_style.dart';
import 'package:test_xpage/core/widgets/product_search.dart';
import 'package:test_xpage/feature/category/category_widget.dart';
import 'package:test_xpage/feature/category/widget/category_card.dart';

/// Главный экран
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(final BuildContext context) => Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    // Доставка и корзина
                    SizedBox(
                      height: 92,
                      child: Row(
                        children: <Widget>[],
                      ),
                    ),

                    // Поиск по товарам
                    const ProductSearch(),

                    // Акции
                    ListTile(
                      title: Text(
                        'Акции',
                        style: AppTextStyle.title,
                      ),
                    ),

                    // Популярное
                    ListTile(
                      title: Text(
                        'Популярное',
                        style: AppTextStyle.title,
                      ),
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
                    ),

                    // Список категорий
                    const CategoryWidget(),
                  ],
                ),
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
