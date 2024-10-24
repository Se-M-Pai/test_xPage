import 'package:elementary/elementary.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_xpage/core/global.dart';
import 'package:test_xpage/core/product.dart';
import 'package:test_xpage/example_data/example_category.dart';
import 'package:test_xpage/feature/catalog/catalog_model.dart';
import 'package:test_xpage/feature/catalog/widget/catalog_widget.dart';

abstract interface class ICatalogWM implements IWidgetModel {
  // Выбранная категория
  ListenableState<CategoryExample> get selectedCategory;

  // Список товаров
  ValueListenable<List<Product>> get listProduct;

  // Загрузка каталога
  Future<void> loadCatalog(final CategoryExample category);
}

CatalogWM catalogWMFactory(final BuildContext context) => CatalogWM(CatalogModel());

class CatalogWM extends WidgetModel<CatalogWidget, CatalogModel> implements ICatalogWM {
  CatalogWM(super._model);

  final StateNotifier<CategoryExample> _selectedCategory =
      StateNotifier<CategoryExample>(initValue: Global.selectedCategory);

  @override
  ListenableState<CategoryExample> get selectedCategory => _selectedCategory;

  late ValueNotifier<List<Product>> _listProduct;

  @override
  ValueListenable<List<Product>> get listProduct => _listProduct;

  @override
  Future<void> loadCatalog(final CategoryExample category) async {
    _selectedCategory.accept(category);
    final List<Product> newList = await model.loadCatalog(category);
    _listProduct.value = newList;
  }

  @override
  void initWidgetModel() {
    super.initWidgetModel();

    loadCatalog(_selectedCategory.value!);

    _listProduct = ValueNotifier<List<Product>>(<Product>[]);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
