import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

import '../../base/constants/colors.dart';

class ShimmerWrapper extends StatelessWidget {
  const ShimmerWrapper({
    required this.child,
    required this.showShimmer,
    this.alignment = Alignment.centerLeft,
    this.radius = 0,
    this.fadeTransition = true,
    this.baseColor,
    this.highlightColor,
    super.key,
  });

  final Widget child;

  final bool showShimmer;

  final AlignmentGeometry? alignment;

  final double radius;

  final Color? baseColor;

  final Color? highlightColor;

  final bool fadeTransition;

  static const shimmerContainerKey = Key('shimmer');

  @override
  Widget build(BuildContext context) => AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, animation) =>
            fadeTransition || child.key == ShimmerWrapper.shimmerContainerKey
                ? FadeTransition(
                    opacity: animation,
                    child: child,
                  )
                : _appFadeTransition(animation: animation, child: child),
        child: _buildChild(context),
      );

  Widget _buildChild(BuildContext context) {
    if (showShimmer) {
      return Container(
        key: ShimmerWrapper.shimmerContainerKey,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(radius),
          ),
        ),
        alignment: alignment,
        child: Shimmer.fromColors(
          baseColor: baseColor ?? shimmerBaseColor,
          highlightColor: highlightColor ?? shimmerHighlightColor,
          child: child,
        ),
      );
    }

    if (alignment != null) {
      return Align(
        alignment: alignment!,
        child: child,
      );
    }

    return child;
  }

  SingleChildRenderObjectWidget _appFadeTransition({
    required Animation<double> animation,
    required Widget child,
  }) =>
      FadeTransition(
        opacity: CurvedAnimation(
          parent: animation,
          curve: const Interval(
            0.4,
            1.0,
            curve: Curves.easeInOutCubic,
          ),
        ),
        child: SizeTransition(
          sizeFactor: CurvedAnimation(
            parent: animation,
            curve: const Interval(
              0.0,
              1.0,
              curve: Curves.easeInOutCubic,
            ),
          ),
          child: child,
        ),
      );
}
