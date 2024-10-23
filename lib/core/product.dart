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

  String name; // Название
  String units; // Единицы измерения
  int price; // Цена
  int discountedPrice; // Цена со скидкой
  CategoryExample category; // Категория товара
  int rate; // Рейтинг
  String image; // Картинка

  bool isFavorite = false; // В избранном
  bool inCart = false; // В корзине
}
