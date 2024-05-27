import 'dart:math';

abstract class ShimmerStyle {
  String get placeholder;

  static ShimmerStyleFixed fixed({int length = 12}) =>
      ShimmerStyleFixed(length);

  static ShimmerStyleRandom random({
    int minLeadingFlex = 3,
    int maxLeadingFlex = 5,
    int trailingFlex = 2,
  }) =>
      ShimmerStyleRandom(
        minLeadingFlex: minLeadingFlex,
        maxLeadingFlex: maxLeadingFlex,
        trailingFlex: trailingFlex,
      );

  static ShimmerStyleProportional proportional({
    int trailingFlex = 5,
    int leadingFlex = 3,
  }) =>
      ShimmerStyleProportional(
        leadingFlex: leadingFlex,
        trailingFlex: trailingFlex,
      );
}

class ShimmerStyleFixed extends ShimmerStyle {
  ShimmerStyleFixed(this.length);

  final int length;

  @override
  late final String placeholder = _createPlaceholder();

  String _createPlaceholder() => List.filled(length, '-').join();
}

class ShimmerStyleRandom extends ShimmerStyle {
  ShimmerStyleRandom({
    required this.minLeadingFlex,
    required this.maxLeadingFlex,
    required this.trailingFlex,
  });

  final int minLeadingFlex;
  final int maxLeadingFlex;
  final int trailingFlex;

  static int? leadingFlex;

  int generateLeadingFlex() =>
      leadingFlex ??
      Random().nextInt(maxLeadingFlex - minLeadingFlex + 1) + minLeadingFlex;

  @override
  String get placeholder => '-';
}

class ShimmerStyleProportional extends ShimmerStyle {
  ShimmerStyleProportional({
    required this.trailingFlex,
    required this.leadingFlex,
  });

  final int trailingFlex;
  final int leadingFlex;

  @override
  String get placeholder => '-';
}
