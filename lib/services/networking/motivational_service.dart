part of 'networking.dart';

/// This helper service that handles the Motivational Messages API
final class MotivationalService extends ApiService<MotivationalModel> {
  /// Factory constructor for [MotivationalService]
  /// to implement a class that is a singleton
  factory MotivationalService({Client? client, String? host}) {
    return _instance ??= MotivationalService._(client: client, host: host);
  }

  /// Private constructor of [MotivationalService]
  MotivationalService._({super.client, super.host});

  /// One and only instance of [MotivationalService]
  static MotivationalService? _instance;

  /// Retrieve a random motivational message
  Future<HTTPResponseSchema<MotivationalModel>> getRandomMotivation() async {
    try {
      final (:data, :error) = await request(method: HTTPMethodsEnum.get);
      if (error.exists) return (data: null, error: error);
      if (data == null || data.isEmpty) {
        return const (
          data: null,
          error: 'No motivational messages available',
        );
      }
      return (data: (data..shuffle()).first, error: null);
    } on Exception catch (error, stackTrace) {
      await logger.logError(
        error,
        stackTrace: stackTrace,
        message: '`MotivationalService.getRandomMotivation` Error',
      );
      return (
        data: null,
        error: 'Error occurred while retrieving random motivation',
      );
    }
  }

  @override
  List<Object?> get props => super.props..addAll([getRandomMotivation]);
}
