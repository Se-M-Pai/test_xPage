import 'package:flutter/material.dart';

/// Стили текстовых данных
class AppTextStyle {
  static const TextStyle title = TextStyle(fontSize: 20, fontWeight: FontWeight.w700);
  static const TextStyle category = TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
  static const TextStyle navigation = TextStyle(fontSize: 10, fontWeight: FontWeight.w600);
  static const TextStyle seeAll = TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFFFF8B19));
  static const TextStyle productName = TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
  static const TextStyle productNameS = TextStyle(fontSize: 12, fontWeight: FontWeight.w600);
  static const TextStyle price = TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFFFF8B19));
  static const TextStyle inCart = TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Color(0xFFFFFFFF));
  static const TextStyle sumCart = TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFFFFFFFF));
  static const TextStyle discountPrice = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w300,
    color: Color(0xFFD9D9D9),
    decoration: TextDecoration.lineThrough,
  );

  static const TextStyle white14 = TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFFFFFFFF));
  static const TextStyle white14l = TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: Color(0xFFFFFFFF));
  static const TextStyle white14b = TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFFFFFFFF));

  static const TextStyle black14 = TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF211901));
  static const TextStyle black14l = TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: Color(0xFF211901));
  static const TextStyle black14b = TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF211901));
}
