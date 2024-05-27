import 'package:flutter/material.dart';

import '../../base/constants/colors.dart';

class PlaceholderShimmer extends StatelessWidget {
  const PlaceholderShimmer({
    required String text,
    required this.contentAlignment,
    this.textStyle,
    this.maxTextLines,
    this.textOverflow,
    this.cornerRadius,
    this.shimmerEffectColor,
    this.placeholderTextColor,
    super.key,
  }) : _text = text;

  final String _text;

  final TextStyle? textStyle;

  final int? maxTextLines;

  final TextOverflow? textOverflow;

  final AlignmentGeometry contentAlignment;

  final double? cornerRadius;

  final Color? shimmerEffectColor;

  final Color? placeholderTextColor;

  double get _cornerRadius => cornerRadius ?? 16.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: contentAlignment,
      decoration: BoxDecoration(
        color: shimmerEffectColor ?? shimmerBaseColor,
        borderRadius: BorderRadius.all(
          Radius.circular(_cornerRadius),
        ),
      ),
      child: Text(
        _text,
        style: textStyle?.copyWith(
            color: placeholderTextColor ?? shimmerHighlightColor),
        maxLines: maxTextLines,
        overflow: textOverflow,
      ),
    );
  }
}
