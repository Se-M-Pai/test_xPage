import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_xpage/navigation/navigation_model.dart';
import 'package:test_xpage/navigation/navigation_widget.dart';

NavigationWidgetModel navigationWidgetModelFactory(final BuildContext context) => NavigationWidgetModel(NavigationModel());

class NavigationWidgetModel extends WidgetModel<NavigationWidget, NavigationModel> {
  NavigationWidgetModel(super._model);

  late ValueNotifier<int> _indexController;

  ValueListenable<int> get indexState => _indexController;

  Future<void> switchScreen(final int index) async {
    final int newIndex = await model.switchScreen(index);
    _indexController.value = newIndex;
  }

  @override
  void initWidgetModel() {
    super.initWidgetModel();

    _indexController = ValueNotifier<int>(model.indexScreen);
  }

  @override
  void dispose() {
    _indexController.dispose();

    super.dispose();
  }
}
