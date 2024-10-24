import 'package:test_xpage/example_data/example_category.dart';

/// Класс для продуктов

class Product {
  Product({
    required this.name,
    required this.units,
    required this.price,
    required this.discountedPrice,
    required this.category,
    required this.rate,
    required this.image,
  });

  // Название
  String name;

  // Единицы измерения
  String units;

  // Цена
  int price;

  // Цена со скидкой
  int discountedPrice;

  // Категория товара
  CategoryExample category;

  // Рейтинг
  int rate;

  // Картинка
  String image;

  // В избранном
  bool isFavorite = false;

  // В корзине
  bool inCart = false;
}
