import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_xpage/core/app_icons.dart';
import 'package:test_xpage/core/app_text_style.dart';
import 'package:test_xpage/navigation/navigation_wm.dart';

class NavigationWidget extends ElementaryWidget<NavigationWidgetModel> {
  const NavigationWidget({
    final Key? key,
    final WidgetModelFactory wmFactory = navigationWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(final NavigationWidgetModel wm) => ValueListenableBuilder<int>(
        valueListenable: wm.indexState,
        builder: (final _, final int index, final __) => Scaffold(
          body: ValueListenableBuilder<Widget>(
            valueListenable: wm.screenState,
            builder: (final _, final Widget screen, final __) => SafeArea(
              child: screen,
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
          ),
        ),
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
