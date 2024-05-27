import 'package:flutter/widgets.dart';

import 'placeholder_shimmer.dart';

class ProportionalShimmerPlaceholder extends StatelessWidget {
  const ProportionalShimmerPlaceholder({
    required this.text,
    required this.contentAlignment,
    this.textStyle,
    this.maxTextLines,
    this.textOverflow,
    this.cornerRadius,
    this.placeholderTextColor,
    this.leadingFlexFactor = 1,
    this.trailingFlexFactor = 1,
    super.key,
  });

  final String text;

  final int leadingFlexFactor;

  final int trailingFlexFactor;

  final TextStyle? textStyle;

  final int? maxTextLines;

  final TextOverflow? textOverflow;

  final AlignmentGeometry contentAlignment;

  final double? cornerRadius;

  final Color? placeholderTextColor;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (contentAlignment == Alignment.center ||
              contentAlignment == Alignment.centerRight)
            Flexible(
              fit: FlexFit.loose,
              flex: trailingFlexFactor,
              child: Container(),
            ),
          Flexible(
            fit: FlexFit.loose,
            flex: leadingFlexFactor,
            child: PlaceholderShimmer(
              text: text,
              textStyle: textStyle,
              placeholderTextColor: placeholderTextColor,
              maxTextLines: maxTextLines,
              textOverflow: textOverflow,
              contentAlignment: contentAlignment,
              cornerRadius: cornerRadius,
            ),
          ),
          if (contentAlignment == Alignment.center ||
              contentAlignment == Alignment.centerLeft)
            Flexible(
              fit: FlexFit.loose,
              flex: trailingFlexFactor,
              child: Container(),
            ),
        ],
      );
}
