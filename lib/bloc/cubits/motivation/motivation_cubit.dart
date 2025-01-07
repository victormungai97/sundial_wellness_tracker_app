import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sundial_wellness_tracker/extensions/extensions.dart';
import 'package:sundial_wellness_tracker/models/motivational_model/motivational_model.dart';
import 'package:sundial_wellness_tracker/services/networking/networking.dart';
import 'package:sundial_wellness_tracker/utils/logging_utils.dart';

part 'motivation_cubit.freezed.dart';
part 'motivation_state.dart';

/// This [Cubit] facilitates retrieval of motivational messages
class MotivationCubit extends Cubit<MotivationState> {
  /// Constructor for [MotivationCubit]
  MotivationCubit(this._motivationalService) : super(const MotivationInitial());

  final MotivationalService _motivationalService;
  static final LoggingUtils _logger = LoggingUtils();

  Future<void> retrieveRandom() async {
    emit(const MotivationRandomRetrievalInProgress());
    try {
      final (:data, :error) = await _motivationalService.getRandomMotivation();
      if (error.exists) {
        emit(MotivationRandomRetrievalState.failure(error!));
        return;
      }
      if (data == null) {
        emit(
          const MotivationRandomRetrievalFailure('No motivation provided'),
        );
        return;
      }
      emit(MotivationRandomRetrievalState.success(motivation: data));
    } on Exception catch (error, stackTrace) {
      await _logger.logError(
        error,
        message: '`motivation_cubit.MotivationCubit.retrieveRandom` Error',
        stackTrace: stackTrace,
      );
      emit(
        const MotivationRandomRetrievalState.failure(
          'Error occurred while retrieving motivational message',
        ),
      );
    }
  }

  void reset() => emit(const MotivationInitial());
}
