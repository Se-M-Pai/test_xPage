import 'package:elementary/elementary.dart';
import 'package:test_xpage/core/product.dart';
import 'package:test_xpage/example_data/example_product.dart';

/// Модель популярных продуктов

class PopularModel extends ElementaryModel {
  PopularModel();

  final List<Product> _popularProduct = <Product>[];

  List<Product> get popularProduct => _popularProduct;

  Future<List<Product>> refreshPopularList() async {
    // ToDo Запрос популярных продуктов с базы

    await Future<void>.delayed(const Duration(seconds: 1)); // Симуляция загрузки популярных продуктов

    return popularProduct;
  }

  List<Product> initPopular() {
    for (final Product product in listProductExample) {
      if (product.rate > 2) _popularProduct.add(product);
    }
    return _popularProduct;
  }
}
