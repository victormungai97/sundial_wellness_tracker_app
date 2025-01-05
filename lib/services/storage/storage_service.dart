part of 'storage.dart';

/// This helper class provides methods to save and retrieve data from [Box].
/// Works on mobile and web
@immutable
sealed class StorageService<T> with EquatableMixin {
  StorageService({Box<T>? box}) : _prefs = box;

  final logger = LoggingUtils();

  final Box<T>? _prefs;

  /// Access to local database
  Box<T>? get preferences => _prefs;

  /// retrieve
  T? get(dynamic key, {T? defValue}) {
    try {
      if (preferences == null) return defValue;
      return preferences?.get(key) ?? defValue;
    } on Exception catch (error, stackTrace) {
      logger.logError(
        error,
        message: 'Error retrieving value',
        stackTrace: stackTrace,
      );
    }
    return null;
  }

  /// add
  Future<void> put(dynamic key, T value) async {
    try {
      if (preferences == null) return;
      await preferences?.put(key, value);
    } on Exception catch (error, stackTrace) {
      await logger.logError(
        error,
        message: 'Error adding value',
        stackTrace: stackTrace,
      );
    }
  }

  /// remove
  Future<bool> delete(dynamic key) async {
    if (preferences == null) return false;
    try {
      await preferences?.delete(key);
      return true;
    } on Exception catch (error, stackTrace) {
      await logger.logError(
        error,
        message: 'Error removing value',
        stackTrace: stackTrace,
      );
      return false;
    }
  }

  /// clear
  Future<bool> deleteAll() async {
    if (preferences == null) return false;
    try {
      await preferences?.deleteAll(preferences!.keys);
      return true;
    } on Exception catch (error, stackTrace) {
      await logger.logError(
        error,
        message: 'Error clearing database',
        stackTrace: stackTrace,
      );
      return false;
    }
  }

  /// dispose
  Future<void>? close() async => preferences?.close();
}
