import 'package:elementary/elementary.dart';
import 'package:test_xpage/core/product.dart';
import 'package:test_xpage/example_data/example_category.dart';
import 'package:test_xpage/example_data/example_product.dart';

class CatalogModel extends ElementaryModel {
  CatalogModel();

  List<Product> list = listProduct;

  Future<List<Product>> loadCatalog(final CategoryExample category) async {
    await Future<void>.delayed(const Duration(milliseconds: 500));

    List<Product> data = <Product>[];
    if (category == CategoryExample.groceries) {
      data = listProduct;
    } else {
      for (final Product product in listProduct) {
        if (product.category == category) data.add(product);
      }
    }

    return data;
  }
}
