import 'package:bloc/bloc.dart';
import 'package:sundial_wellness_tracker/constants/enums.dart';
import 'package:sundial_wellness_tracker/models/journal_entry_model/journal_entry_model.dart';
import 'package:sundial_wellness_tracker/models/uuid_model/uuid_model.dart';

final class JournalEntryCubit extends Cubit<JournalEntryModel> {
  /// Factory constructor for [JournalEntryCubit]
  /// to implement a class that is a singleton
  factory JournalEntryCubit() => _instance;

  /// Private constructor of [JournalEntryCubit]
  JournalEntryCubit._() : super(_initialState);

  /// One and only instance of [JournalEntryCubit]
  static final JournalEntryCubit _instance = JournalEntryCubit._();

  static final _initialState = JournalEntryModel(id: UuidModel());

  void updatedId(String id) => emit(state.copyWith(id: UuidModel.tryParse(id)));

  void updatedContent(String content) => emit(state.copyWith(content: content));

  void updatedMood(Mood mood) => emit(state.copyWith(mood: mood));

  void reset() => emit(_initialState);
}
