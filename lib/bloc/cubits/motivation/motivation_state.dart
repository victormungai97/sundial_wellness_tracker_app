part of 'motivation_cubit.dart';

@immutable
abstract class MotivationState with EquatableMixin {
  const MotivationState();

  @override
  List<Object?> get props => [];
}

final class MotivationInitial extends MotivationState {
  const MotivationInitial();
}

@freezed
sealed class MotivationRandomRetrievalState extends MotivationState
    with _$MotivationRandomRetrievalState {
  const factory MotivationRandomRetrievalState.loading() =
      MotivationRandomRetrievalInProgress;
  const factory MotivationRandomRetrievalState.success({
    required MotivationalModel motivation,
  }) = MotivationRandomRetrievalDone;
  const factory MotivationRandomRetrievalState.failure(String exception) =
      MotivationRandomRetrievalFailure;

  const MotivationRandomRetrievalState._();
}
