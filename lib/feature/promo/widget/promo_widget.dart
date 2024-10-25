import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:test_xpage/core/promo.dart';
import 'package:test_xpage/feature/promo/promo_wm.dart';
import 'package:test_xpage/feature/promo/widget/promo_card.dart';
import 'package:test_xpage/feature/promo/widget/scroll_physics.dart';

class PromoWidget extends ElementaryWidget<IPromoWM> {
  const PromoWidget({super.key}) : super(promoWMFactory);

  @override
  Widget build(final IPromoWM wm) => SizedBox(
        height: 184,
        child: ValueListenableBuilder<List<Promo>>(
          valueListenable: wm.listPromo,
          builder: (final BuildContext context, final List<Promo> listPromo, final __) {
            final double widthCard = MediaQuery.of(context).size.width - 48;

            return ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              scrollDirection: Axis.horizontal,
              physics: SnapPageScrollPhysics(
                padding: 20,
                widthCard: widthCard,
              ),
              itemCount: listPromo.length,
              clipBehavior: Clip.none,
              itemBuilder: (final _, final int index) => PromoCard(promo: listPromo.elementAt(index)),
              separatorBuilder: (final _, final __) => const SizedBox(width: 16),
            );
          },
        ),
      );
}
