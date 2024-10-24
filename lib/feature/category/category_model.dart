import 'package:elementary/elementary.dart';
import 'package:test_xpage/core/global.dart';
import 'package:test_xpage/example_data/example_category.dart';

/// Модель категорий

class CategoryModel extends ElementaryModel {
  CategoryModel();

  CategoryExample? _selectedCategory;
  CategoryExample get selectedCategory => _selectedCategory ?? Global.selectedCategory;

  List<CategoryExample> _listCategory = CategoryExample.values;
  List<CategoryExample> get listCategory => _listCategory;

  Future<List<CategoryExample>> searchCategory() async {
    // ToDo Запрос доступных категорий из базы

    await Future<void>.delayed(const Duration(seconds: 1)); // Симуляция загрузки категорий

    return _listCategory;
  }

  void selectCategory(final CategoryExample category) {
    _selectedCategory = category;
    Global.selectedCategory = category;
  }
}
