import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:test_xpage/feature/category/category_model.dart';
import 'package:test_xpage/feature/category/category_wm.dart';
import 'package:test_xpage/feature/category/widget/category_card.dart';

class CategoryWidget extends ElementaryWidget<CategoryWidgetModel> {
  const CategoryWidget({
    final Key? key,
    final WidgetModelFactory wmFactory = categoryWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(final CategoryWidgetModel wm) => ValueListenableBuilder<bool>(
        valueListenable: wm.isLoadingState,
        builder: (final _, final bool isLoading, final __) => isLoading
            ? Padding(
                padding: const EdgeInsets.only(top: 32),
                child: CircularProgressIndicator(),
              )
            : ValueListenableBuilder<List<CategoryExample>>(
                valueListenable: wm.categoryState,
                builder: (final _, final List<CategoryExample> listCategory, final __) => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  height: listCategory.length * 87,
                  child: ListView.separated(
                    itemCount: listCategory.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (final _, final int index) => CategoryCard(
                      label: listCategory.elementAt(index).label,
                      image: listCategory.elementAt(index).image,
                    ),
                    separatorBuilder: (final _, final __) => const SizedBox(height: 15),
                  ),
                ),
              ),
      );
}
