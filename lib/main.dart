import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_xpage/navigation/navigation_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(final BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'GothamPro',
        ),
        title: 'Test',
        home: const NavigationWidget(),
      );
}
