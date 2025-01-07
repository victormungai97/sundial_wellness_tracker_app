part of 'networking.dart';

/// This generic helper class provides methods to facilitate making and processing of HTTP requests
@immutable
abstract class NetworkingService<T> with EquatableMixin {
  /// Create a new [NetworkingService].
  ///
  /// Provide an optional [Client] to facilitate HTTP calls
  /// and an optional [host] that serves as an overall base URL
  NetworkingService({Client? client, String? host})
      : _httpClient = client ?? Client(),
        _apiBaseUrl = host ?? '';

  final Client _httpClient;

  final String _apiBaseUrl;

  /// Logging instance
  final logger = LoggingUtils();

  /// Base method to handle HTTP calls
  Future<HTTPResponseSchema<T>> request({
    required HTTPMethodsEnum method,
    String baseUrl = '',
    String unEncodedPath = '',
    Object? data,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      if (baseUrl.isEmpty && unEncodedPath.isEmpty) {
        return const (error: 'URL not provided', data: null);
      }

      final host = baseUrl.isEmpty ? _apiBaseUrl : baseUrl;
      if (host.isEmpty) {
        return const (error: 'URL not provided', data: null);
      }

      Response? response;
      if (host.startsWith('assets')) {
        try {
          await Future<void>.delayed(const Duration(milliseconds: 1500));
          response = switch (method) {
            HTTPMethodsEnum.get => Response.bytes(
                (await rootBundle.load(p.join(host, unEncodedPath)))
                    .buffer
                    .asUint8List(),
                200,
                headers: {'Content-Type': 'application/json'},
              ),
            _ => Response(
                jsonEncode({
                  'title': 'Not Implemented',
                  'message':
                      'The server does not support the functionality required to fulfill the request',
                }),
                501,
                headers: {'Content-Type': 'application/json'},
              ),
          };
        } on Exception catch (exc, stack) {
          await logger.logError(
            exc,
            message: 'Asset ${"$host/$unEncodedPath"} not found',
            stackTrace: stack,
          );
          response = Response(
            jsonEncode({
              'title': 'Internal Server Error',
              'message':
                  'The server encountered an unexpected condition that prevented it from fulfilling the request',
            }),
            500,
            headers: {'Content-Type': 'application/json'},
          );
        }
      } else {
        final uri = Uri.https(host, unEncodedPath, queryParameters);
        response = await switch (method) {
          HTTPMethodsEnum.post => _httpClient.post(
              uri,
              body: jsonEncode(data ?? const {}),
              headers: headers,
            ),
          HTTPMethodsEnum.get => _httpClient.get(
              uri,
              headers: headers,
            ),
          HTTPMethodsEnum.put => _httpClient.put(
              uri,
              body: jsonEncode(data ?? const {}),
              headers: headers,
            ),
          HTTPMethodsEnum.delete => _httpClient.delete(
              uri,
              body: jsonEncode(data ?? const {}),
              headers: headers,
            ),
          HTTPMethodsEnum.patch => _httpClient.patch(
              uri,
              body: jsonEncode(data ?? const {}),
              headers: headers,
            ),
          HTTPMethodsEnum.head => _httpClient.head(uri, headers: headers),
        };
      }

      final output = await parseResponse(response, _apiBaseUrl, method);
      return switch (output.error) {
        null || '' => await process(output.data, method, unEncodedPath),
        _ => (error: output.error, data: null),
      };
    } on Exception catch (error, stackTrace) {
      await logger.logError(error, stackTrace: stackTrace);
      return const (error: 'Error occurred during request', data: null);
    }
  }

  /// Analyze and decipher the response from HTTP requests
  Future<HTTPResponseSchema<Object?>> parseResponse(
    Response? response,
    String apiBaseUrl,
    HTTPMethodsEnum method,
  );

  /// Convert the data from HTTP requests to form usable in the application
  Future<HTTPResponseSchema<T>> process(
    Object? payload,
    HTTPMethodsEnum method,
    String unEncodedPath,
  );

  @override
  List<Object?> get props => [_httpClient, _apiBaseUrl];
}
