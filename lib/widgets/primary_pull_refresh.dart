import 'package:flutter/material.dart';
import 'package:liquid_pull_refresh/liquid_pull_refresh.dart';

/// Custom refresh indicator with image in loader
class PrimaryPullRefresh extends LiquidPullRefresh {
  /// Constructor for [PrimaryPullRefresh]
  const PrimaryPullRefresh({
    required super.onRefresh,
    required super.child,
    super.key,
  }) : super(
          backgroundColor: Colors.white,
          color: Colors.purple,
          height: 64,
          showChildOpacityTransition: false,
        );
}
