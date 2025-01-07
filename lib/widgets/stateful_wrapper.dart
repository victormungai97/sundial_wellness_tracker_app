import 'package:flutter/widgets.dart';

/// Widget that serves a blueprint for [StatelessWidget]s
/// by availing [StatefulWidget] specific functionalities
class StatefulWrapper extends StatefulWidget {
  const StatefulWrapper({
    required this.child,
    super.key,
    this.onInit,
    this.onDispose,
  });

  /// Function to run when [child] is added to the widget tree
  final VoidCallback? onInit;

  /// Function to run when [child] is removed the widget tree
  final VoidCallback? onDispose;

  /// [StatelessWidget] that requires [StatefulWidget] specific functionalities
  final Widget child;

  @override
  State<StatefulWrapper> createState() => _StatefulWrapperState();
}

class _StatefulWrapperState extends State<StatefulWrapper> {
  @override
  void initState() {
    super.initState();
    widget.onInit?.call();
  }

  @override
  Widget build(BuildContext context) => widget.child;

  @override
  void dispose() {
    widget.onDispose?.call();
    super.dispose();
  }
}
