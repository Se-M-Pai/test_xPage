import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_xpage/example_data/example_category.dart';
import 'package:test_xpage/feature/category/catalog_category/catalog_category_widget.dart';
import 'package:test_xpage/feature/category/category_model.dart';

CatalogCategoryWm catalogCategoryWMFactory(final BuildContext context) => CatalogCategoryWm(CategoryModel());

class CatalogCategoryWm extends WidgetModel<CatalogCategoryWidget, CategoryModel> {
  CatalogCategoryWm(super._model);

  late ValueNotifier<int> _countController;
  late ValueNotifier<List<CategoryExample>> _categoryController;
  late final ValueNotifier<bool> _isLoadingController = ValueNotifier<bool>(false);

  ValueListenable<int> get countState => _countController;
  ValueListenable<List<CategoryExample>> get categoryState => _categoryController;
  ValueListenable<bool> get isLoadingState => _isLoadingController;

  /// Поиск категорий в базе
  Future<void> searchCategory() async {
    _isLoadingController.value = true;

    final List<CategoryExample> newListCategory = await model.searchCategory();
    _categoryController.value = newListCategory;

    _isLoadingController.value = false;
  }

  Future<void> onTap() async {
    // TODO Клик по категории на главном
  }

  @override
  void initWidgetModel() {
    super.initWidgetModel();

    searchCategory();

    _countController = ValueNotifier<int>(model.listCategory.length);
    _categoryController = ValueNotifier<List<CategoryExample>>(model.listCategory);
  }

  @override
  void dispose() {
    _countController.dispose();
    _categoryController.dispose();

    super.dispose();
  }
}
