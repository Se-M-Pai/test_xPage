import 'package:flutter/material.dart';

/// Заглушка для неиспользуемых экранов
class Empty extends StatelessWidget {
  const Empty({required this.data, super.key});

  final String data;

  @override
  Widget build(final BuildContext context) => Center(
    child: Text(data),
  );
}
