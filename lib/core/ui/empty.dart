import 'package:flutter/material.dart';

/// Заглушка для неиспользуемых экранов
class EmptyScreen extends StatelessWidget {
  const EmptyScreen({required this.data, super.key});

  final String data;

  @override
  Widget build(final BuildContext context) => Center(
        child: Text(data),
      );
}
