import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:test_xpage/example_data/example_category.dart';
import 'package:test_xpage/feature/category/presentation/category_wm.dart';
import 'package:test_xpage/feature/category/presentation/widget/category_card.dart';

class CategoryWidget extends ElementaryWidget<CategoryWM> {
  const CategoryWidget({super.key}) : super(categoryWMFactory);

  @override
  Widget build(final CategoryWM wm) => ValueListenableBuilder<bool>(
        valueListenable: wm.isLoading,
        builder: (final _, final bool isLoading, final __) => isLoading
            ? Padding(
                padding: const EdgeInsets.only(top: 32),
                child: CircularProgressIndicator(),
              )
            : ValueListenableBuilder<List<CategoryExample>>(
                valueListenable: wm.categoryState,
                builder: (final _, final List<CategoryExample> listCategory, final __) => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  height: (listCategory.length - 1) * 87,
                  child: ListView.separated(
                    itemCount: listCategory.length - 1,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (final _, final int index) => CategoryCard(
                      wm: wm,
                      category: listCategory.elementAt(index + 1),
                    ),
                    separatorBuilder: (final _, final __) => const SizedBox(height: 15),
                  ),
                ),
              ),
      );
}
