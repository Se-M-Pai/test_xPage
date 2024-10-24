import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:test_xpage/core/ui/catalog.dart';
import 'package:test_xpage/core/ui/empty.dart';
import 'package:test_xpage/core/ui/home.dart';

/// Модель нижней панели экранов

class NavigationModel extends ElementaryModel {
  NavigationModel();

  final List<Widget> _screen = <Widget>[
    const HomeScreen(),
    const CatalogScreen(),
    const EmptyScreen(data: 'Профиль'),
    const EmptyScreen(data: 'Избранное'),
    const EmptyScreen(data: 'Магазины'),
  ];

  List<Widget> get listScreen => _screen;
}
