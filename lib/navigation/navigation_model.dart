import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:test_xpage/ui/catalog.dart';
import 'package:test_xpage/ui/empty.dart';
import 'package:test_xpage/ui/home.dart';

/// Модель нижней панели экранов
class NavigationModel extends ElementaryModel {
  NavigationModel();

  int _indexScreen = 0;
  final List<Widget> _screen = <Widget>[
    const Home(),
    const Catalog(),
    const Empty(data: 'Профиль'),
    const Empty(data: 'Избранное'),
    const Empty(data: 'Магазины'),
  ];

  int get indexScreen => _indexScreen;
  Widget get screen => _screen.elementAt(_indexScreen);

  Future<int> switchScreen(final int index) async => _indexScreen = index;
}
