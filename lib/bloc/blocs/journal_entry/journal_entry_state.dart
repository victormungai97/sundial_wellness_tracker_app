part of 'journal_entry_bloc.dart';

@immutable
sealed class JournalEntryState extends Equatable {
  const JournalEntryState();

  @override
  List<Object?> get props => [];
}

final class JournalEntryInitial extends JournalEntryState {
  const JournalEntryInitial();
}

@freezed
sealed class JournalEntryRecordAddedState extends JournalEntryState {
  const factory JournalEntryRecordAddedState.loaded() =
      JournalEntryRecordAddedInProgress;
  const factory JournalEntryRecordAddedState.success() =
      JournalEntryRecordAddedDone;
  const factory JournalEntryRecordAddedState.failure(String exception) =
      JournalEntryRecordAddedFailure;

  const JournalEntryRecordAddedState._();
}
