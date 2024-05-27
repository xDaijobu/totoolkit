import 'package:flutter/material.dart';
import 'package:totoolkit/totoolkit.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50),
              LoadingStateSwitcher(
                builder: (isLoading, simulateLoading) => WidgetSection(
                  description: 'Shimmer Wrapper',
                  childSize: const Size(180, 120),
                  onRefresh: () => simulateLoading.call(true),
                  child: ShimmerWrapper(
                    showShimmer: isLoading,
                    fadeTransition: true,
                    alignment: Alignment.center,
                    child: Image.network(
                        'https://www.btsbg.org/sites/default/files/obekti/stobski-piramidi-selo-stob.jpg'),
                  ),
                ),
              ),
              LoadingStateSwitcher(
                builder: (isLoading, simulateLoading) => WidgetSection(
                  description: 'Text Shimmer',
                  onRefresh: () => simulateLoading.call(true),
                  child: ShimmerText(
                    isLoading
                        ? null
                        : 'helllo worldddddddddddddddddddddddddddddddddddddddddd',
                    contentAlignment: Alignment.center,
                    shimmerStyle: ShimmerStyle.random(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class WidgetSection extends StatelessWidget {
  const WidgetSection({
    required this.child,
    this.onRefresh,
    required this.description,
    this.childSize,
    super.key,
  });

  final Widget child;
  final String description;
  final Size? childSize;
  final void Function()? onRefresh;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      description,
                      style: const TextStyle(fontSize: 14),
                    ),
                    if (onRefresh != null)
                      IconButton(
                          onPressed: onRefresh,
                          icon: const Icon(Icons.refresh)),
                  ],
                ),
                SizedBox(
                  height: 10,
                  width: MediaQuery.of(context).size.width,
                ),
                childSize != null
                    ? SizedBox(
                        width: childSize!.width,
                        height: childSize!.height,
                        child: child,
                      )
                    : child,
              ],
            ),
          ),
        ),
      );
}

class LoadingStateSwitcher extends StatefulWidget {
  const LoadingStateSwitcher({required this.builder, super.key});

  final Widget Function(bool isDataLoading, void Function(bool value)) builder;

  @override
  State<LoadingStateSwitcher> createState() => _LoadingStateSwitcherState();
}

class _LoadingStateSwitcherState extends State<LoadingStateSwitcher> {
  late bool isLoading;

  @override
  void initState() {
    _slapAfterThreeSeconds(true);
    super.initState();
  }

  Future<void> _slapAfterThreeSeconds(bool initial) async {
    if (mounted) {
      setState(() {
        isLoading = initial;
      });
    }
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      setState(() {
        isLoading = !initial;
      });
    }
  }

  @override
  Widget build(BuildContext context) =>
      widget.builder.call(isLoading, _slapAfterThreeSeconds);
}
