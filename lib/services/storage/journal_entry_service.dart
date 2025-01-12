part of 'storage.dart';

/// This helper class extends [StorageService] to facilitate
/// offline storage of journal entries
final class JournalEntryService extends StorageService<JournalEntryModel> {
  JournalEntryService({super.box});

  Future<({String message, bool success})> addEntry(
    JournalEntryModel journalEntry,
  ) async {
    try {
      var entry = journalEntry;
      final id = entry.id;
      if (id.uuidValue.isEmpty || id.isNil) {
        return (message: 'ID not provided', success: false);
      }
      if (entry.content.isEmpty) {
        return (message: 'Content not provided', success: false);
      }
      if (entry.mood == null) {
        return (message: 'Mood not provided', success: false);
      }
      if (entry.createdAt == null) {
        entry = entry.copyWith(createdAt: DateTime.now());
      }
      final key = id.toFormattedString();
      if (get(key) != null) await delete(key);
      await put(key, entry);
      return (message: 'Entry saved successfully', success: true);
    } on Exception catch (error, stackTrace) {
      await logger.logError(
        error,
        message: '`JournalEntryService.addEntry` Error',
        stackTrace: stackTrace,
      );
      return (message: 'Error saving entry', success: false);
    }
  }
}
