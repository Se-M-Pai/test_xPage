import 'package:elementary/elementary.dart';
import 'package:test_xpage/example_data/example_category.dart';

/// Модель категорий

class CategoryModel extends ElementaryModel {
  CategoryModel();

  List<CategoryExample> _listCategory = CategoryExample.values;
  List<CategoryExample> get listCategory => _listCategory;

  Future<List<CategoryExample>> searchCategory() async {
    // TODO Запрос доступных категорий из базы
    await Future<void>.delayed(const Duration(seconds: 1)); // Симуляция загрузки категорий

    return _listCategory;
  }
}
