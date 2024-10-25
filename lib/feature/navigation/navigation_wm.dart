import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_xpage/feature/navigation/navigation_model.dart';
import 'package:test_xpage/feature/navigation/navigation_widget.dart';

abstract interface class INavigationBarWM implements IWidgetModel {
  /// Индекс экрана
  ValueListenable<int> get indexState;

  /// Активный экран
  ValueListenable<Widget> get screenState;

  /// Переключение экранов
  void switchScreen(final int index);
}

NavigationBarWM navigationBarWMFactory(final BuildContext context) => NavigationBarWM(NavigationModel());

/// Представление навигационной нижней панели

class NavigationBarWM extends WidgetModel<NavigationWidget, NavigationModel> implements INavigationBarWM {
  NavigationBarWM(super._model);

  final ValueNotifier<int> _indexController = ValueNotifier<int>(0);

  @override
  ValueListenable<int> get indexState => _indexController;

  late ValueNotifier<Widget> _screenController;

  @override
  ValueListenable<Widget> get screenState => _screenController;

  @override
  void switchScreen(final int index) {
    _indexController.value = index;
    _screenController.value = model.listScreen.elementAt(index);
  }

  @override
  void initWidgetModel() {
    super.initWidgetModel();

    _screenController = ValueNotifier<Widget>(model.listScreen.first);
  }

  @override
  void dispose() {
    _screenController.dispose();

    super.dispose();
  }
}
