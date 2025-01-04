import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

/// Utility class for logging purposes
class LoggingUtils with EquatableMixin {
  /// Factory constructor for external use
  factory LoggingUtils() => _instance;

  /// Singleton constructor
  const LoggingUtils._();

  /// One and only instance of ``[LoggingUtils]``
  static const _instance = LoggingUtils._();

  /// Log in debug mode
  void debugLog(
    String message, {
    int? sequenceNumber,
    int level = 0,
    String name = '',
    Zone? zone,
    Object? error,
    StackTrace? stackTrace,
  }) {
    if (!kDebugMode) return;
    log(
      message,
      time: DateTime.now(),
      sequenceNumber: sequenceNumber,
      level: level,
      name: name,
      zone: zone,
      error: error,
      stackTrace: stackTrace,
    );
  }

  static final crashlytics = FirebaseCrashlytics.instance;

  /// Track and record exceptions and failures
  Future<void> logError(
    Object? error, {
    String? message,
    StackTrace? stackTrace,
  }) async {
    /*final flavor = (await FlavorController.configure())?.flavor;
    final recordCrash =
        flavor == Environment.staging || flavor == Environment.production;
    if (recordCrash) {*/
    if (!kIsWeb && !kDebugMode) {
      if (error is FlutterErrorDetails) {
        await crashlytics.recordFlutterFatalError(error);
        return;
      }
      if (stackTrace == null) {
        await crashlytics.log(
          '${message ?? "An error occurred without a stacktrace"}\n\n$error',
        );
        return;
      }
      await crashlytics.recordError(
        error,
        stackTrace,
        reason: message,
        fatal: true,
      );
    } else {
      debugLog(
        message ?? 'error message not provided',
        error: error,
        stackTrace: stackTrace,
        level: 1000,
      );
      debugPrintStack(stackTrace: stackTrace);
    }
  }

  @override
  List<Object?> get props => [debugLog, logError];
}
