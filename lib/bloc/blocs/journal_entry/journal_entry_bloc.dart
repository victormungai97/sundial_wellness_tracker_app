import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sundial_wellness_tracker/models/journal_entry_model/journal_entry_model.dart';
import 'package:sundial_wellness_tracker/services/storage/storage.dart';
import 'package:sundial_wellness_tracker/utils/logging_utils.dart';

part 'journal_entry_bloc.freezed.dart';
part 'journal_entry_event.dart';
part 'journal_entry_state.dart';

class JournalEntryBloc extends Bloc<JournalEntryEvent, JournalEntryState> {
  JournalEntryBloc(this._journalEntryService)
      : super(const JournalEntryInitial()) {
    on<JournalEntryEvent>((event, emit) {
      event.when(
        started: () => emit(const JournalEntryInitial()),
        entryAdded: _addEntry,
      );
    });
  }

  final _loggingUtils = LoggingUtils();

  Future<void> _addEntry(JournalEntryModel journalEntry) async {
    emit(const JournalEntryRecordAddedInProgress());
    try {
      await Future<void>.delayed(const Duration(seconds: 2));
      final (:message, :success) = await _journalEntryService.addEntry(
        journalEntry,
      );
      if (!success) {
        emit(JournalEntryRecordAddedState.failure(message));
      } else {
        emit(const JournalEntryRecordAddedDone());
      }
    } on Exception catch (error, stackTrace) {
      await _loggingUtils.logError(
        error,
        message: '`JournalEntryBloc._addEntry` Error',
        stackTrace: stackTrace,
      );
      emit(
        const JournalEntryRecordAddedFailure(
          'Error adding journal entry. Contact support',
        ),
      );
    }
  }

  final JournalEntryService _journalEntryService;
}
