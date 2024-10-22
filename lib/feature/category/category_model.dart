import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:test_xpage/ui/catalog.dart';
import 'package:test_xpage/ui/empty.dart';
import 'package:test_xpage/ui/home.dart';

/// Модель категорий
class CategoryModel extends ElementaryModel {
  CategoryModel();

  final List<CategoryExample> _listCategory = CategoryExample.values;
  List<CategoryExample> get listCategory => _listCategory;

  Future<List<CategoryExample>> searchCategory() async {
    // TODO Запрос доступных категорий из базы
    await Future<void>.delayed(const Duration(seconds: 1)); // Симуляция загрузки категорий

    return _listCategory;
  }
}

/// Пример категорий
enum CategoryExample {
  vegetables,
  fruits,
  driedFruits,
  nuts,
  sweets,
  beverages,
  nutPastes,
  honey,
  jam,
  freezing,
  cereals;

  AssetImage get image => switch (this) {
        vegetables => AssetImage('assets/category/vegetables.png'),
        fruits => AssetImage('assets/category/fruits.png'),
        driedFruits => AssetImage('assets/category/driedFruits.png'),
        nuts => AssetImage('assets/category/nuts.png'),
        sweets => AssetImage('assets/category/sweets.png'),
        beverages => AssetImage('assets/category/beverages.png'),
        nutPastes => AssetImage('assets/category/nutPastes.png'),
        honey => AssetImage('assets/category/honey.png'),
        jam => AssetImage('assets/category/jam.png'),
        freezing => AssetImage('assets/category/freezing.png'),
        cereals => AssetImage('assets/category/cereals.png'),
      };

  String get label => switch (this) {
        vegetables => 'Овощи и зелень',
        fruits => 'Фрукты и ягоды',
        driedFruits => 'Сухофрукты',
        nuts => 'Орехи и семечки',
        sweets => 'Сладости',
        beverages => 'Напитки',
        nutPastes => 'Ореховые пасты\nи урбечи',
        honey => 'Мед и крем-мед',
        jam => 'Варенье',
        freezing => 'Заморозка',
        cereals => 'Крупы',
      };
}
