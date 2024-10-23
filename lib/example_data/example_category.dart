import 'package:flutter/material.dart';

/// Пример категорий
enum CategoryExample {
  groceries,
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
        groceries => AssetImage('assets/category/groceries.png'), // отсутствует
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
        groceries => 'Все категории',
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

  String get icon => switch (this) {
        groceries => 'assets/category/icons/groceries.svg',
        vegetables => 'assets/category/icons/vegetables.svg',
        fruits => 'assets/category/icons/fruits.svg',
        driedFruits => 'assets/category/icons/driedFruits.svg',
        nuts => 'assets/category/icons/nuts.svg',
        sweets => 'assets/category/icons/sweets.svg',
        beverages => 'assets/category/icons/beverages.svg',
        nutPastes => 'assets/category/icons/nutPastes.svg', // отсутствует
        honey => 'assets/category/icons/honey.svg', // отсутствует
        jam => 'assets/category/icons/jam.svg', // отсутствует
        freezing => 'assets/category/icons/freezing.svg', // отсутствует
        cereals => 'assets/category/icons/cereals.svg', // отсутствует
      };
}
