import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_xpage/core/app_text_style.dart';
import 'package:test_xpage/example_data/example_category.dart';
import 'package:test_xpage/feature/category/catalog_category/catalog_category_wm.dart';

class CatalogCategoryWidget extends ElementaryWidget<CatalogCategoryWm> {
  const CatalogCategoryWidget({
    final Key? key,
    final WidgetModelFactory wmFactory = catalogCategoryWMFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(final CatalogCategoryWm wm) => ValueListenableBuilder<List<CategoryExample>>(
        valueListenable: wm.categoryState,
        builder: (final _, final List<CategoryExample> listCategory, final __) => SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: listCategory
                .map(
                  (final CategoryExample element) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      style: ButtonStyle(
                        side: WidgetStateProperty.all<BorderSide>(BorderSide(color: Color(0xFFFF8B19))),
                      ),
                      label: Text(element.label, style: AppTextStyle.black14l),
                      icon: SvgPicture.asset(
                        element.icon,
                        width: 16,
                        height: 16,
                        colorFilter: ColorFilter.mode(Color(0xFFACC800), BlendMode.srcIn),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      );
}
