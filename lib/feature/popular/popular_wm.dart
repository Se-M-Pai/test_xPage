import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_xpage/core/product.dart';
import 'package:test_xpage/feature/popular/popular_model.dart';
import 'package:test_xpage/feature/popular/popular_widget.dart';

abstract interface class IPopularWM implements IWidgetModel {
  // Список популярных продуктов
  ValueListenable<List<Product>> get popularProducts;

  // Процесс загрузки
  ValueListenable<bool> get isLoading;

  // Обновление списка популярных
  Future<void> refreshPopular();
}

PopularWM popularWMFactory(final BuildContext context) => PopularWM(PopularModel());

class PopularWM extends WidgetModel<PopularWidget, PopularModel> implements IPopularWM {
  PopularWM(super._model);

  late ValueNotifier<List<Product>> _popularProductController;

  @override
  ValueListenable<List<Product>> get popularProducts => _popularProductController;

  late final ValueNotifier<bool> _isLoadingController = ValueNotifier<bool>(false);

  @override
  ValueListenable<bool> get isLoading => _isLoadingController;

  @override
  Future<void> refreshPopular() async {
    _isLoadingController.value = true;

    final List<Product> popularList = await model.refreshPopularList();
    _popularProductController.value = popularList;

    _isLoadingController.value = false;
  }

  @override
  void initWidgetModel() {
    super.initWidgetModel();

    _popularProductController = ValueNotifier<List<Product>>(model.initPopular());
  }

  @override
  void dispose() {
    _popularProductController.dispose();

    super.dispose();
  }
}
