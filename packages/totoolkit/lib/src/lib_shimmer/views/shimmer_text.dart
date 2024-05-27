import 'package:flutter/material.dart';
import '../models/shimmer_style.dart';

import '../ui_components/placeholder_shimmer.dart';
import '../ui_components/proportional_shimmer_placeholder.dart';
import '../ui_components/random_shimmer_placeholder.dart';
import 'shimmer_wrapper.dart';

class ShimmerText extends StatelessWidget {
  const ShimmerText(
    this.text, {
    this.textStyle,
    this.shimmerStyle,
    this.maxTextLines,
    this.textOverflow,
    this.textAlign,
    this.baseShimmerColor,
    this.highlightShimmerColor,
    this.cornerRadius,
    this.textHeightBehavior,
    this.contentAlignment = Alignment.centerLeft,
    super.key,
  });

  final String? text;

  final TextStyle? textStyle;

  final ShimmerStyle? shimmerStyle;

  final int? maxTextLines;

  final TextOverflow? textOverflow;

  final AlignmentGeometry contentAlignment;

  final TextAlign? textAlign;

  final Color? baseShimmerColor;

  final Color? highlightShimmerColor;

  final double? cornerRadius;

  final TextHeightBehavior? textHeightBehavior;

  @override
  Widget build(BuildContext context) => ShimmerWrapper(
        showShimmer: text == null,
        alignment: contentAlignment,
        fadeTransition: false,
        baseColor: baseShimmerColor,
        highlightColor: highlightShimmerColor,
        child: _buildShimmerChild(context),
      );

  Widget _buildShimmerChild(BuildContext context) {
    if (text != null) {
      return Text(
        text!,
        style: textStyle,
        maxLines: maxTextLines,
        overflow: textOverflow,
        textAlign: textAlign,
        textHeightBehavior: textHeightBehavior,
      );
    }

    final shimmerStyle = this.shimmerStyle ?? ShimmerStyle.random();

    if (shimmerStyle is ShimmerStyleFixed) {
      return PlaceholderShimmer(
        text: shimmerStyle.placeholder,
        textStyle: textStyle,
        maxTextLines: maxTextLines,
        textOverflow: textOverflow,
        contentAlignment: contentAlignment,
        cornerRadius: cornerRadius,
      );
    }

    if (shimmerStyle is ShimmerStyleRandom) {
      return RandomShimmerPlaceholder(
        text: shimmerStyle.placeholder,
        textStyle: textStyle,
        maxTextLines: maxTextLines,
        textOverflow: textOverflow,
        randomShimmerStyle: shimmerStyle,
        contentAlignment: contentAlignment,
      );
    }

    if (shimmerStyle is ShimmerStyleProportional) {
      return ProportionalShimmerPlaceholder(
        leadingFlexFactor: shimmerStyle.leadingFlex,
        trailingFlexFactor: shimmerStyle.trailingFlex,
        text: shimmerStyle.placeholder,
        textOverflow: textOverflow,
        maxTextLines: maxTextLines,
        contentAlignment: contentAlignment,
        textStyle: textStyle,
        cornerRadius: cornerRadius,
      );
    }

    return Container();
  }
}
