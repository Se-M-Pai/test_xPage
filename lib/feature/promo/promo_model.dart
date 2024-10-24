import 'package:elementary/elementary.dart';
import 'package:test_xpage/core/promo.dart';
import 'package:test_xpage/example_data/example_promo.dart';

class PromoModel extends ElementaryModel{
  PromoModel();

  final List<Promo> _listPromo = listPromoExample;

  List<Promo> get listPromo => _listPromo;
}
