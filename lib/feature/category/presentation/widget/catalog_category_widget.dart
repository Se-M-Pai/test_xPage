import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_xpage/core/theme/text_style.dart';
import 'package:test_xpage/example_data/example_category.dart';
import 'package:test_xpage/feature/catalog/catalog_widget.dart';
import 'package:test_xpage/feature/category/presentation/catalog_category_wm.dart';

class CatalogCategoryWidget extends ElementaryWidget<CatalogCategoryWm> {
  const CatalogCategoryWidget({super.key}) : super(catalogCategoryWMFactory);

  @override
  Widget build(final CatalogCategoryWm wm) => ValueListenableBuilder<List<CategoryExample>>(
        valueListenable: wm.categoryState,
        builder: (final _, final List<CategoryExample> listCategory, final __) =>
            ValueListenableBuilder<CategoryExample>(
          valueListenable: wm.selectedCategory,
          builder: (final _, final CategoryExample selectedCategory, final __) => Column(
            children: <Widget>[
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: listCategory.take(7).map(
                    (final CategoryExample category) {
                      final bool selected = selectedCategory == category;
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ChoiceChip(
                          selected: selected,
                          label: Text(category.label),
                          labelStyle: selected ? AppTextStyle.white14l : AppTextStyle.black14l,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Color(0xFFFF8B19)),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          selectedColor: Color(0xFFFF8B19),
                          backgroundColor: Colors.white,
                          avatar: SvgPicture.asset(
                            category.icon,
                            width: 16,
                            height: 16,
                            colorFilter: ColorFilter.mode(selected ? Colors.white : Color(0xFFACC800), BlendMode.srcIn),
                          ),
                          showCheckmark: false,
                          onSelected: (final _) {
                            wm.onTap(category);
                          },
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
              const SizedBox(height: 24),

              // Список товаров
              CatalogWidget(categoryWM: wm),
            ],
          ),
        ),
      );
}
