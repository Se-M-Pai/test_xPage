import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:test_xpage/core/product.dart';
import 'package:test_xpage/feature/catalog/widget/product_card.dart';
import 'package:test_xpage/feature/popular/popular_wm.dart';
import 'package:test_xpage/feature/popular/widget/popular_card_button.dart';

class PopularWidget extends ElementaryWidget<IPopularWM> {
  const PopularWidget({super.key}) : super(popularWMFactory);

  @override
  Widget build(final IPopularWM wm) => ValueListenableBuilder<List<Product>>(
        valueListenable: wm.popularProducts,
        builder: (final _, final List<Product> popularProducts, final __) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ProductCard(product: popularProducts.first),
              const PopularCardButton(),
            ],
          ),
        ),
      );
}