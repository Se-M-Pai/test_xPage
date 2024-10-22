import 'package:flutter/material.dart';

/// Виджет с полем для поиска товара
/// FixMe Для функционального поиска по товарам нужно переделать например через SearchAnchor.bar

class ProductSearch extends StatelessWidget {
  const ProductSearch({super.key});

  void refreshSearch(final String value) {
    // TODO обновление результатов поиска во время ввода запроса
  }

  @override
  Widget build(final BuildContext context) => SizedBox(
        height: 44,
        child: TextFormField(
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              size: 16,
              color: Color(0xFF211901),
            ),
            contentPadding: const EdgeInsets.all(0),
            hintText: 'Поиск по товарам',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
          ),
          onChanged: (final String value) => refreshSearch(value),
        ),
      );
}
