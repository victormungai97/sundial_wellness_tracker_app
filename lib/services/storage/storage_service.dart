part of 'storage.dart';

/// This helper class provides methods to save and retrieve data from [Box].
/// Works on mobile and web
/// Currently uses [Box] from `hive` library.
/// But can be repurposed to work with any key-value offline persistent storage mechanism / library
@immutable
sealed class StorageService<K, V> with EquatableMixin {
  /// Create a new [StorageService].
  ///
  /// Provide an optional [Box] to facilitate offline persistent storage
  StorageService({Box<V>? box}) : _prefs = box;

  /// Logging instance
  final logger = LoggingUtils();

  final Box<V>? _prefs;

  /// Access to local database
  Box<V>? get preferences => _prefs;

  /// retrieve
  V? get(K key, {V? defValue}) {
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
  Future<void> put(K key, V value) async {
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
  Future<bool> delete(K key) async {
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

  @override
  List<Object?> get props => [_prefs, get, put, delete, deleteAll, close];
}
