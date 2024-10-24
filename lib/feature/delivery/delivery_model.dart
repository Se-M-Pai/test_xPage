import 'package:elementary/elementary.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:test_xpage/core/global.dart';

/// Модель доставка/забери сам

class DeliveryModel extends ElementaryModel {
  DeliveryModel();

  DeliveryState? _deliveryState;
  DeliveryState get deliveryState => _deliveryState ?? Global.selectedDeliveryState;

  EntityState<DeliveryState> change(final DeliveryState state) {
    _deliveryState = state;
    Global.selectedDeliveryState = state;
    return EntityState<DeliveryState>.content(_deliveryState);
  }
}

enum DeliveryState {
  delivery, // доставка
  selfDelivery, // самовывоз
}
