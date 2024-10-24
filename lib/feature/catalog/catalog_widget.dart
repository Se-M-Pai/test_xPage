import 'package:elementary/elementary.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/material.dart';
import 'package:test_xpage/core/product.dart';
import 'package:test_xpage/core/widgets/product_card.dart';
import 'package:test_xpage/example_data/example_category.dart';
import 'package:test_xpage/feature/catalog/catalog_wm.dart';
import 'package:test_xpage/feature/category/presentation/catalog_category_wm.dart';
import 'package:test_xpage/feature/category/presentation/widget/catalog_category_widget.dart';

class CatalogWidget extends ElementaryWidget<ICatalogWM> {
  const CatalogWidget({required this.categoryWM, super.key}) : super(catalogWMFactory);

  final CatalogCategoryWm categoryWM;
  @override
  Widget build(final ICatalogWM wm) => ValueListenableBuilder<CategoryExample>(
        valueListenable: categoryWM.selectedCategory,
        builder: (final _, final CategoryExample selectedCategory, final __) => ValueListenableBuilder<List<Product>>(
          valueListenable: wm.listProduct,
          builder: (final _, final List<Product> listProduct, final __) {
            wm.loadCatalog(selectedCategory);
            return Wrap(
              spacing: 16,
              runSpacing: 16,
              children: listProduct.map((final Product product) => ProductCard(product: product)).toList(),
            );
          },
        ),
      );
}
