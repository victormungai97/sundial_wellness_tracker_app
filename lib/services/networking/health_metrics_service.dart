part of 'networking.dart';

/// This helper service that handles the Health Metrics API
final class HealthMetricsService extends ApiService<HealthMetricsModel> {
  /// Factory constructor for [HealthMetricsService]
  /// to implement a class that is a singleton
  factory HealthMetricsService({Client? client, String? host}) {
    return _instance ??= HealthMetricsService._(client: client, host: host);
  }

  /// Private constructor of [HealthMetricsService]
  HealthMetricsService._({super.client, super.host});

  /// One and only instance of [HealthMetricsService]
  static HealthMetricsService? _instance;

  /// Retrieve all health metrics from server
  Future<HTTPResponseSchema<List<HealthMetricsModel>>> getAllMetrics() async {
    final (:data, :error) = await request(method: HTTPMethodsEnum.get);
    if (error.exists) return (data: null, error: error);
    if (data == null || data.isEmpty) {
      return const (
        data: null,
        error: 'No health metrics found',
      );
    }
    final metrics = data
      ..sort(
        (a, b) {
          final bDateTime = b.updatedAt;
          final aDateTime = a.updatedAt;
          if (bDateTime == null && aDateTime == null) return 0;
          if (bDateTime == null) return -1;
          if (aDateTime == null) return 1;
          return bDateTime.compareTo(aDateTime);
        },
      );
    if (metrics.isEmpty) {
      return const (data: null, error: 'No health metrics available');
    }
    return (data: metrics, error: null);
  }

  /// Retrieve all health metrics upto given [date] from server
  Future<HTTPResponseSchema<List<HealthMetricsModel>>> getRangedMetrics(
    DateTime date,
  ) async {
    final (:data, :error) = await getAllMetrics();
    if (error.exists) return (data: null, error: error);
    final metrics = (data ?? []).where((e) {
      final eDateTime = e.updatedAt;
      if (eDateTime == null) return false;
      final now = date.isUtc ? date : date.toUtc();
      return eDateTime.isBefore(now) || eDateTime.isSameDate(now);
    }).toList();
    return (data: metrics, error: null);
  }

  /// Retrieve the latest health metric upto current time
  Future<HTTPResponseSchema<HealthMetricsModel>> getLatestMetric() async {
    final (:data, :error) = await getRangedMetrics(DateTime.now());
    if (error.exists) return (data: null, error: error);
    return (data: (data ?? []).first, error: null);
  }

  /// Calculate the total number of steps taken upto current time
  Future<HTTPResponseSchema<int>> computeTotalSteps() async {
    final (:data, :error) = await getRangedMetrics(DateTime.now());
    if (error.exists) return (data: null, error: error);
    return (
      data: (data ?? []).fold(0, (sum, item) => sum + item.steps),
      error: null,
    );
  }

  @override
  List<Object?> get props =>
      super.props..addAll([getLatestMetric, computeTotalSteps]);
}
