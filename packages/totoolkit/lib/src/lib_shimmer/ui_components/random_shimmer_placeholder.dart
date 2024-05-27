import 'package:flutter/material.dart';

import '../models/shimmer_style.dart';
import 'proportional_shimmer_placeholder.dart';

class RandomShimmerPlaceholder extends StatefulWidget {
  const RandomShimmerPlaceholder({
    required String text,
    required this.randomShimmerStyle,
    required this.contentAlignment,
    this.textStyle,
    this.maxTextLines,
    this.textOverflow,
    this.cornerRadius,
    this.placeholderTextColor,
    super.key,
  }) : _text = text;

  final String _text;

  final TextStyle? textStyle;

  final int? maxTextLines;

  final TextOverflow? textOverflow;

  final ShimmerStyleRandom randomShimmerStyle;

  final AlignmentGeometry contentAlignment;

  final double? cornerRadius;

  final Color? placeholderTextColor;

  @override
  State<RandomShimmerPlaceholder> createState() =>
      _RandomShimmerPlaceholderState();
}

class _RandomShimmerPlaceholderState extends State<RandomShimmerPlaceholder> {
  late final int leadingFlex = widget.randomShimmerStyle.generateLeadingFlex();

  @override
  Widget build(BuildContext context) => ProportionalShimmerPlaceholder(
        leadingFlexFactor: leadingFlex,
        trailingFlexFactor: widget.randomShimmerStyle.trailingFlex,
        text: widget._text,
        textOverflow: widget.textOverflow,
        maxTextLines: widget.maxTextLines,
        textStyle: widget.textStyle,
        contentAlignment: widget.contentAlignment,
        cornerRadius: widget.cornerRadius,
        placeholderTextColor: widget.placeholderTextColor,
      );
}
