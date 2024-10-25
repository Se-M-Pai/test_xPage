import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_xpage/core/theme/icons.dart';
import 'package:test_xpage/core/theme/text_style.dart';
import 'package:test_xpage/core/widgets/product_search.dart';
import 'package:test_xpage/feature/delivery/delivery_widget.dart';
import 'package:test_xpage/feature/navigation/navigation_wm.dart';
import 'package:test_xpage/feature/shopping_cart/widget/cart_button.dart';

class NavigationWidget extends ElementaryWidget<INavigationBarWM> {
  const NavigationWidget({super.key}) : super(navigationBarWMFactory);

  @override
  Widget build(final INavigationBarWM wm) => ValueListenableBuilder<Widget>(
        valueListenable: wm.screenState,
        builder: (final _, final Widget screen, final __) {
          final int index = wm.indexState.value;
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          // Доставка и корзина
                          if (index == 0 || index == 1) const DeliveryWidget(),

                          // Поиск по товарам
                          if (index == 0 || index == 1) const ProductSearch(),

                          // Разные экраны
                          screen,
                        ],
                      ),
                    ),
                  ),

                  // Кнопка перехода в корзину
                  if (index == 0) const CartButton(),
                ],
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                _navigationItem('Главная', AppIcons.home),
                _navigationItem('Каталог', AppIcons.catalog),
                _navigationItem('Профиль', AppIcons.profile),
                _navigationItem('Избранное', AppIcons.favorite),
                _navigationItem('Магазины', AppIcons.shop),
              ],
              currentIndex: index,
              unselectedLabelStyle: AppTextStyle.navigation,
              selectedLabelStyle: AppTextStyle.navigation,
              backgroundColor: Color(0xFFF8F8F8),
              selectedItemColor: Color(0xFFACC800),
              unselectedItemColor: Color(0xFF211901),
              showUnselectedLabels: true,
              onTap: wm.switchScreen,
              type: BottomNavigationBarType.fixed,
            ),
          );
        },
      );
}

/// Элементы навигационной панели
///
/// [name] - название экрана
///
/// [icon] - иконка экрана

BottomNavigationBarItem _navigationItem(final String name, final String icon) => BottomNavigationBarItem(
      icon: SvgPicture.asset(
        icon,
        colorFilter: ColorFilter.mode(Color(0xFF211901), BlendMode.srcIn),
      ),
      activeIcon: SvgPicture.asset(
        icon,
        colorFilter: ColorFilter.mode(Color(0xFFACC800), BlendMode.srcIn),
      ),
      label: name,
    );
