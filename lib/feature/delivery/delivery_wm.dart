import 'package:elementary/elementary.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/material.dart';
import 'package:test_xpage/feature/delivery/delivery_model.dart';
import 'package:test_xpage/feature/delivery/delivery_widget.dart';

abstract interface class IDeliveryWM implements IWidgetModel {
  // Режим доставка/самовывоз
  EntityValueListenable<DeliveryState> get deliveryState;

  // Переключение режима доставки
  void change(final DeliveryState state);
}

DeliveryWM deliveryWMFactory(final BuildContext context) => DeliveryWM(DeliveryModel());

/// Блок выбора доставки / самовывоза

class DeliveryWM extends WidgetModel<DeliveryWidget, DeliveryModel> implements IDeliveryWM {
  DeliveryWM(super._model);

  late EntityStateNotifier<DeliveryState> _deliveryController;

  @override
  EntityValueListenable<DeliveryState> get deliveryState => _deliveryController;

  @override
  void change(final DeliveryState state) {
    _deliveryController.value = model.change(state);
  }

  @override
  void initWidgetModel() {
    _deliveryController = EntityStateNotifier<DeliveryState>(EntityState<DeliveryState>.content(model.deliveryState));

    super.initWidgetModel();
  }

  @override
  void dispose() {
    super.dispose();

    _deliveryController.dispose();
  }
}
