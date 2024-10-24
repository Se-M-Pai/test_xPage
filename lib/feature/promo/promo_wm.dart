import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_xpage/core/promo.dart';
import 'package:test_xpage/feature/promo/promo_model.dart';
import 'package:test_xpage/feature/promo/widget/promo_widget.dart';

abstract interface class IPromoWM implements IWidgetModel {
  // Список акций
  ValueListenable<List<Promo>> get listPromo;
}

PromoWM promoWMFactory(final BuildContext context) => PromoWM(PromoModel());

class PromoWM extends WidgetModel<PromoWidget, PromoModel> implements IPromoWM {
  PromoWM(super._model);

  late ValueNotifier<List<Promo>> _promoController;

  @override
  ValueListenable<List<Promo>> get listPromo => _promoController;

  @override
  void initWidgetModel() {
    super.initWidgetModel();

    _promoController = ValueNotifier<List<Promo>>(model.listPromo);
  }

  @override
  void dispose() {
    _promoController.dispose();

    super.dispose();
  }
}
