part of 'networking.dart';

/// Helper subclass of [NetworkingService] that is dedicated purely for Sundial server calls
sealed class ApiService<D extends BaseModel>
    extends NetworkingService<List<D>> {
  /// Creates a new [ApiService] instance
  ///
  /// Pass an optional [Client] for handling HTTP calls
  /// and an optional [host] that serves as an overall base URL
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
  Future<HTTPResponseSchema<List<D>>> process(
    Object? payload,
    HTTPMethodsEnum method,
    String unEncodedPath,
  ) async {
    if (payload is! Map<String, dynamic> && payload is! List<dynamic>) {
      return const (data: null, error: 'Invalid data sent. Contact support');
    }
    final json = payload;
    if (json is Map<String, Object?>) {
      return (
        data: [
          switch (D) {
            const (MotivationalModel) => MotivationalModel.fromJson(json) as D,
            _ => BaseModel.fromJson(json) as D,
          },
        ],
        error: null,
      );
    }
    if (json is List<dynamic>) {
      final output = <D>[];
      for (final entry in json) {
        if (entry is Map<String, dynamic>) {
          output.add(
            switch (D) {
              const (MotivationalModel) =>
                MotivationalModel.fromJson(entry) as D,
              _ => BaseModel.fromJson(entry) as D,
            },
          );
        }
      }
      return (data: output, error: null);
    }
    return const (
      data: null,
      error: 'Unable to complete.\nPlease contact support',
    );
  }

  @override
  List<Object?> get props => super.props..addAll([parseResponse, process]);
}
