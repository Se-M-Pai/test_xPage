import 'dart:math';

import 'package:flutter/material.dart';

/// Физика перемещения карточек с акциями

class SnapPageScrollPhysics extends ScrollPhysics {
  const SnapPageScrollPhysics({
    required this.widthCard,
    required this.padding,
    super.parent,
  });

  final double widthCard;
  final double padding;

  @override
  SnapPageScrollPhysics applyTo(final ScrollPhysics? ancestor) => SnapPageScrollPhysics(
        parent: buildParent(ancestor),
        widthCard: widthCard,
        padding: padding,
      );

  double _getTargetPixels(
    final ScrollMetrics position,
    final Tolerance tolerance,
    final double velocity,
  ) {
    final double pageWidth = widthCard + padding;
    final double page = position.pixels / pageWidth + velocity / 3000;
    final double offset = (position.viewportDimension - widthCard) / 2;
    final double target = page.roundToDouble() * pageWidth - offset + padding;
    return max(0, min(target, position.maxScrollExtent));
  }

  @override
  Simulation? createBallisticSimulation(
    final ScrollMetrics position,
    final double velocity,
  ) {
    if ((velocity <= 0.0 && position.pixels <= position.minScrollExtent) ||
        (velocity >= 0.0 && position.pixels >= position.maxScrollExtent)) {
      return super.createBallisticSimulation(position, velocity);
    }
    final Tolerance tolerance = toleranceFor(position);
    final double target = _getTargetPixels(position, tolerance, velocity);
    if (target != position.pixels) {
      return ScrollSpringSimulation(
        spring,
        position.pixels,
        target,
        velocity,
        tolerance: tolerance,
      );
    }
    return null;
  }
}
