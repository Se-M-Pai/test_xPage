import 'package:flutter/material.dart';
import 'package:test_xpage/feature/navigation/navigation_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(final BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: 'GothamPro',
          listTileTheme: ListTileThemeData(
            contentPadding: EdgeInsets.zero,
          ),
        ),
        title: 'Test',
        home: const NavigationWidget(),
      );
}
