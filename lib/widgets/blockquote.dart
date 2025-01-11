import 'package:flutter/material.dart';

///
/// Creates a <blockquote> like HTML </blockquote>
///
class BlockQuoteWidget extends StatelessWidget {
  /// Constructor for [BlockQuoteWidget]
  const BlockQuoteWidget({
    required this.child,
    super.key,
    this.blockColor,
    this.blockWidth = 4.0,
    this.outerPadding,
    this.childPadding,
  });

  ///
  /// The [child] contained by the BlockQuote.
  ///
  /// [required]
  ///
  final Widget? child;

  ///
  /// BlockQuote's vertical line color
  ///
  /// default to [Theme]'s `accentColor`
  ///
  final Color? blockColor;

  ///
  /// BlockQuote's vertical line width
  ///
  /// default to `4.0`
  ///
  final double blockWidth;

  ///
  /// BlockQuote's outer padding
  ///
  /// default to `const EdgeInsets.symmetric(horizontal: 15)`
  ///
  final EdgeInsetsGeometry? outerPadding;

  ///
  /// BlockQuote's outer padding
  ///
  /// default to `const EdgeInsets.only(left: 15, top: 5, bottom: 5)`
  ///
  final EdgeInsetsGeometry? childPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: outerPadding ?? const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              color: blockColor ?? ColorScheme.fromSwatch().secondary,
              width: blockWidth,
            ),
          ),
        ),
        child: Padding(
          padding: childPadding ??
              const EdgeInsets.only(
                left: 15,
                top: 5,
                bottom: 5,
              ),
          child: child ?? const SizedBox.shrink(),
        ),
      ),
    );
  }
}
