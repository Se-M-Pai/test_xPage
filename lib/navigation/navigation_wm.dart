import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_xpage/navigation/navigation_model.dart';
import 'package:test_xpage/navigation/navigation_widget.dart';

NavigationWidgetModel navigationWidgetModelFactory(final BuildContext context) =>
    NavigationWidgetModel(NavigationModel());

/// Представление навигационной нижней панели
///
/// [indexState] - Индекс экрана
///
/// [screenState] -

class NavigationWidgetModel extends WidgetModel<NavigationWidget, NavigationModel> {
  NavigationWidgetModel(super._model);

  late ValueNotifier<int> _indexController;
  late ValueNotifier<Widget> _screenController;

  ValueListenable<int> get indexState => _indexController;
  ValueListenable<Widget> get screenState => _screenController;

  /// Переключение экранов
  Future<void> switchScreen(final int index) async {
    final int newIndex = await model.switchScreen(index);
    _indexController.value = newIndex;
    _screenController.value = model.screen;
  }

  @override
  void initWidgetModel() {
    super.initWidgetModel();

    _indexController = ValueNotifier<int>(model.indexScreen);
    _screenController = ValueNotifier<Widget>(model.screen);
  }

  @override
  void dispose() {
    _indexController.dispose();
    _screenController.dispose();

    super.dispose();
  }
}
