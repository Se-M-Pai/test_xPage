import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_xpage/feature/delivery/delivery_model.dart';
import 'package:test_xpage/feature/delivery/delivery_widget.dart';

DeliveryWidgetModel deliveryWidgetModelFactory(final BuildContext context) => DeliveryWidgetModel(DeliveryModel());

/// Блок выбора доставки / самовывоза
///
/// [deliveryState] - Выбранный вариант доставки

class DeliveryWidgetModel extends WidgetModel<DeliveryWidget, DeliveryModel> {
  DeliveryWidgetModel(super._model);

  late ValueNotifier<DeliveryState> _deliveryController;

  ValueListenable<DeliveryState> get deliveryState => _deliveryController;

  /// Переключение режима доставки / самовывоз
  void change(final DeliveryState state) {
    _deliveryController.value = model.change(state);
  }

  @override
  void initWidgetModel() {
    super.initWidgetModel();

    _deliveryController = ValueNotifier<DeliveryState>(model.deliveryState);
  }

  @override
  void dispose() {
    _deliveryController.dispose();

    super.dispose();
  }
}
