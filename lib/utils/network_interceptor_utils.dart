import 'dart:convert';

import 'package:http_interceptor/http_interceptor.dart';
import 'package:meta/meta.dart';
import 'package:sundial_wellness_tracker/utils/logging_utils.dart';

/// Interceptor class to track HTTP requests
@immutable
final class NetworkLoggingInterceptorUtil extends InterceptorContract {
  /// Factory constructor for [NetworkLoggingInterceptorUtil]
  /// to implement a class that is a singleton
  factory NetworkLoggingInterceptorUtil() {
    return _instance ??= NetworkLoggingInterceptorUtil._();
  }

  /// Private constructor of [NetworkLoggingInterceptorUtil]
  NetworkLoggingInterceptorUtil._();

  /// One and only instance of [NetworkLoggingInterceptorUtil]
  static NetworkLoggingInterceptorUtil? _instance;

  final _logger = LoggingUtils();

  /// Convert json to a readable form
  Future<String> _prettyPrint(Object? json) async {
    try {
      return const JsonEncoder.withIndent('  ').convert(
        json is String
            ? json.isNotEmpty
                ? jsonDecode(json)
                : ''
            : json,
      );
    } on Exception catch (error, trace) {
      await _logger.logError(
        error,
        message: 'Unable to pretty print response',
        stackTrace: trace,
      );
      return '$json';
    }
  }

  @override
  Future<BaseRequest> interceptRequest({required BaseRequest request}) async {
    if (request is Request) {
      final headers = await _prettyPrint(request.headers);
      final body = await _prettyPrint(request.body);
      _logger
        ..debugLog('REQUEST\n==========================\n')
        ..debugLog('url >>>>>>>>>>>>>>>> ${request.url}')
        ..debugLog('body >>>>>>>>>>>>>>>> $body')
        ..debugLog('headers >>>>>>>>>>>>>>>> $headers')
        ..debugLog('method >>>>>>>>>>>>>>>> ${request.method}');
    }
    return request;
  }

  @override
  Future<BaseResponse> interceptResponse({
    required BaseResponse response,
  }) async {
    if (response is Response) {
      final headers = await _prettyPrint(response.headers);
      final body = await _prettyPrint(response.body);
      final httpCode = response.statusCode;
      _logger
        ..debugLog('RESPONSE\n==========================\n')
        ..debugLog('statusCode >>>>>>>>>>>>>>>> $httpCode')
        ..debugLog('headers >>>>>>>>>>>>>>>> $headers')
        ..debugLog('body >>>>>>>>>>>>>>>> $body');
    }
    return response;
  }
}
