part of 'journal_entry_bloc.dart';

@freezed
sealed class JournalEntryEvent with _$JournalEntryEvent {
  const factory JournalEntryEvent.started() = _Started;
  const factory JournalEntryEvent.entryAdded(
    JournalEntryModel journalEntry,
  ) = _EntryAdded;
}
