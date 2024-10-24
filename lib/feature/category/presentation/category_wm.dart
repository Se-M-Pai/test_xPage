import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_xpage/example_data/example_category.dart';
import 'package:test_xpage/feature/category/category_model.dart';
import 'package:test_xpage/feature/category/presentation/widget/category_widget.dart';

abstract interface class ICategoryWM implements IWidgetModel {
  // Выбранная категория
  ValueListenable<CategoryExample> get selectedCategory;

  // Список категорий
  ValueListenable<List<CategoryExample>> get categoryState;

  // Процесс загрузки
  ValueListenable<bool> get isLoading;

  // Загрузка категорий из базы
  Future<void> searchCategory();

  // Клик по категории
  Future<void> onTap(final CategoryExample category);
}

CategoryWM categoryWMFactory(final BuildContext context) => CategoryWM(CategoryModel());

class CategoryWM extends WidgetModel<CategoryWidget, CategoryModel> implements ICategoryWM {
  CategoryWM(super._model);

  late ValueNotifier<CategoryExample> _selectedCategoryController;

  @override
  ValueListenable<CategoryExample> get selectedCategory => _selectedCategoryController;

  late ValueNotifier<List<CategoryExample>> _categoryController;

  @override
  ValueListenable<List<CategoryExample>> get categoryState => _categoryController;

  late final ValueNotifier<bool> _isLoadingController = ValueNotifier<bool>(false);

  @override
  ValueListenable<bool> get isLoading => _isLoadingController;

  @override
  Future<void> searchCategory() async {
    _isLoadingController.value = true;

    final List<CategoryExample> newListCategory = await model.searchCategory();
    _categoryController.value = newListCategory;

    _isLoadingController.value = false;
  }

  @override
  Future<void> onTap(final CategoryExample category) async {
    // FixMe Клик по категории на главном
    _selectedCategoryController.value = category;
    model.selectCategory(category);
  }

  @override
  void initWidgetModel() {
    super.initWidgetModel();

    searchCategory();

    _selectedCategoryController = ValueNotifier<CategoryExample>(model.selectedCategory);
    _categoryController = ValueNotifier<List<CategoryExample>>(model.listCategory);
  }

  @override
  void dispose() {
    _selectedCategoryController.dispose();
    _categoryController.dispose();

    super.dispose();
  }
}
