part of 'networking.dart';

sealed class ApiService<T> extends NetworkingService<T> {
  /// Creates a new [ApiService] instance
  ///
  /// Pass an optional [Client] for handling HTTP calls
  ApiService({super.client, String? host}) : super(host: host ?? 'assets');
  @override
  Future<HTTPResponseSchema<Object?>> parseResponse(
    Response? response,
    String apiBaseUrl,
    HTTPMethodsEnum method,
  ) async {
    try {
      final body = response?.body;
      if (response == null || body == null || body.isEmpty) {
        return const (
          data: null,
          error: 'Server did not respond. Contact support'
        );
      }
      Object? data;
      try {
        data = jsonDecode(body);
      } on FormatException catch (e, sT) {
        await logger.logError(e, stackTrace: sT);
        data = body;
      }
      final statusCode = response.statusCode;
      final isSuccessful = statusCode >= 200 && statusCode < 400;
      if (!isSuccessful) {
        await logger.logError(data);
        return const (
          data: null,
          error: 'Unable to determine response received',
        );
      }
      if (data is! Map<String, dynamic> && data is! List<Object>) {
        return const (data: null, error: 'Unexpected response received');
      }
      return (data: data, error: null);
    } on FormatException catch (e, trace) {
      await logger.logError(
        e,
        stackTrace: trace,
        message: 'Unable to parse json data',
      );
      return const (data: null, error: 'Invalid data. Contact support');
    } on Exception catch (error, stackTrace) {
      await logger.logError(
        error,
        stackTrace: stackTrace,
        message: 'Unable to parse HTTP response',
      );
      return const (
        data: null,
        error: 'Something went wrong. Retry or contact support',
      );
    }
  }

  @override
  List<Object?> get props => super.props..addAll([parseResponse]);
}
