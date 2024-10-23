import 'package:elementary/elementary.dart';

/// Модель доставка/забери сам

class DeliveryModel extends ElementaryModel {
  DeliveryModel();

  DeliveryState _deliveryState = DeliveryState.delivery;
  DeliveryState get deliveryState => _deliveryState;

  DeliveryState change(final DeliveryState state) => _deliveryState = state;
}

enum DeliveryState {
  delivery,
  selfDelivery,
}
