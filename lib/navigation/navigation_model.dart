import 'package:elementary/elementary.dart';

/// Модель нижней панели экранов
class NavigationModel extends ElementaryModel {
  NavigationModel();

  int _indexScreen = 0;
  int get indexScreen => _indexScreen;

  Future<int> switchScreen(final int index) async => _indexScreen = index;
}
