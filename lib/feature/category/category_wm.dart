import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_xpage/example_data/example_category.dart';
import 'package:test_xpage/feature/category/category_model.dart';
import 'package:test_xpage/feature/category/category_widget.dart';

CategoryWM categoryWMFactory(final BuildContext context) => CategoryWM(CategoryModel());

class CategoryWM extends WidgetModel<CategoryWidget, CategoryModel> {
  CategoryWM(super._model);

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
