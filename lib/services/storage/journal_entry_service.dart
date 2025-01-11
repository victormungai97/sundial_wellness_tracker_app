part of 'storage.dart';

/// This helper class extends [StorageService] to facilitate
/// offline storage of journal entries
final class JournalEntryService
    extends StorageService<List<JournalEntryModel>> {}
