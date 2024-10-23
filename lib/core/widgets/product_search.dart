import 'package:flutter/material.dart';

/// Виджет с полем для поиска товара
/// FixMe Для функционального поиска по товарам нужно переделать например через SearchAnchor.bar

class ProductSearch extends StatelessWidget {
  const ProductSearch({super.key});

  void refreshSearch(final String value) {
    // TODO обновление результатов поиска во время ввода запроса
  }

  @override
  Widget build(final BuildContext context) => Container(
        height: 44,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        margin: const EdgeInsets.symmetric(vertical: 24),
        child: TextFormField(
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              size: 16,
              color: Color(0xFF211901),
            ),
            contentPadding: EdgeInsets.zero,
            hintText: 'Поиск по товарам',
            hintStyle: TextStyle(fontSize: 16, color: Color(0xFFC3C3C3)),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFD9D9D9)),
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
          ),
          onChanged: (final String value) => refreshSearch(value),
        ),
      );
}
