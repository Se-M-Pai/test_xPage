import 'package:test_xpage/core/product.dart';
import 'package:test_xpage/example_data/example_category.dart';

/// Примеры товаров
List<Product> listProductExample = <Product>[
  // фрукты
  Product(
    name: 'Арбуз',
    units: 'руб/кг',
    price: 1234,
    discountedPrice: 2356,
    category: CategoryExample.fruits,
    rate: 1,
    image: 'assets/products/watermelon.png',
  ),
  Product(
    name: 'Клубника',
    units: 'руб/кг',
    price: 1234,
    discountedPrice: 1234,
    category: CategoryExample.fruits,
    rate: 3,
    image: 'assets/products/strawberry.png',
  ),
  Product(
    name: 'Ананас',
    units: 'руб/кг',
    price: 1234,
    discountedPrice: 2356,
    category: CategoryExample.fruits,
    rate: 1,
    image: 'assets/products/pineapple.png',
  ),
  Product(
    name: 'Яблоки',
    units: 'руб/кг',
    price: 1234,
    discountedPrice: 2356,
    category: CategoryExample.fruits,
    rate: 1,
    image: 'assets/products/apple.png',
  ),
  Product(
    name: 'Бананы с длинным названием',
    units: 'руб/кг',
    price: 1234,
    discountedPrice: 2356,
    category: CategoryExample.fruits,
    rate: 1,
    image: 'assets/products/banana.png',
  ),
  Product(
    name: 'Папайя',
    units: 'руб/кг',
    price: 1234,
    discountedPrice: 2356,
    category: CategoryExample.fruits,
    rate: 1,
    image: 'assets/products/papaya.png',
  ),

  // овощи
  Product(
    name: 'Тыква',
    units: 'руб/кг',
    price: 1234,
    discountedPrice: 1234,
    category: CategoryExample.vegetables,
    rate: 4,
    image: 'assets/products/watermelon.png',
  ),
  Product(
    name: 'Помидор',
    units: 'руб/кг',
    price: 1234,
    discountedPrice: 1234,
    category: CategoryExample.vegetables,
    rate: 1,
    image: 'assets/products/strawberry.png',
  ),
  Product(
    name: 'Огурец',
    units: 'руб/кг',
    price: 1234,
    discountedPrice: 2356,
    category: CategoryExample.vegetables,
    rate: 1,
    image: 'assets/products/pineapple.png',
  ),

  // сухофрукты
  Product(
    name: 'Ананас',
    units: 'руб/кг',
    price: 1234,
    discountedPrice: 2356,
    category: CategoryExample.driedFruits,
    rate: 1,
    image: 'assets/products/pineapple.png',
  ),
  Product(
    name: 'Клубника',
    units: 'руб/кг',
    price: 1234,
    discountedPrice: 2356,
    category: CategoryExample.driedFruits,
    rate: 2,
    image: 'assets/products/strawberry.png',
  ),
  Product(
    name: 'Папайя',
    units: 'руб/кг',
    price: 1234,
    discountedPrice: 1234,
    category: CategoryExample.driedFruits,
    rate: 1,
    image: 'assets/products/papaya.png',
  ),
];
