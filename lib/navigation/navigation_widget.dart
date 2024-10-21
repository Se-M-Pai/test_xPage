import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:test_xpage/navigation/navigation_wm.dart';

class NavigationWidget extends ElementaryWidget<NavigationWidgetModel> {
  const NavigationWidget({
    final Key? key,
    final WidgetModelFactory wmFactory = navigationWidgetModelFactory,
  }) : super(wmFactory, key: key);

  static const Color _selectedColor = Color(0xFFACC800);
  static const Color _unselectedColor = Color(0xFF211901);

  @override
  Widget build(final NavigationWidgetModel wm) => ValueListenableBuilder<int>(
        valueListenable: wm.indexState,
        builder: (final _, final int index, final __) => BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/navigation/home.png',
                color: _unselectedColor,
              ),
              activeIcon: Image.asset(
                'assets/navigation/home.png',
                color: _selectedColor,
              ),
              label: 'Главная',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/navigation/catalog.png',
                color: _unselectedColor,
              ),
              activeIcon: Image.asset(
                'assets/navigation/catalog.png',
                color: _selectedColor,
              ),
              label: 'Каталог',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/navigation/profile.png',
                color: _unselectedColor,
              ),
              activeIcon: Image.asset(
                'assets/navigation/profile.png',
                color: _selectedColor,
              ),
              label: 'Профиль',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/navigation/favorite.png',
                color: _unselectedColor,
              ),
              activeIcon: Image.asset(
                'assets/navigation/favorite.png',
                color: _selectedColor,
              ),
              label: 'Избранное',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/navigation/shop.png',
                color: _unselectedColor,
              ),
              activeIcon: Image.asset(
                'assets/navigation/shop.png',
                color: _selectedColor,
              ),
              label: 'Магазины',
            ),
          ],
          currentIndex: index,
          backgroundColor: Color(0xFFF8F8F8),
          selectedItemColor: _selectedColor,
          unselectedItemColor: _unselectedColor,
          showUnselectedLabels: true,
          onTap: wm.switchScreen,
        ),
      );
}
