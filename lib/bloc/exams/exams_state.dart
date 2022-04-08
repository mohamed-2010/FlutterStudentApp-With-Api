part of 'exams_cubit.dart';

abstract class ExamsState extends Equatable{}

class ExamsInitial extends ExamsState {
  @override
  List<Object?> get props => [];
}
class ExamsErrorState extends ExamsState {
  final String error;

  ExamsErrorState(this.error);

  @override
  List<Object?> get props => [error];
}

class ExamsLoadingState extends ExamsState {
  @override
  List<Object?> get props => [];
}
class ExamsSuccessState extends ExamsState {
  @override
  List<Object?> get props => [];
}

class QuizesLoadingState extends ExamsState {
  @override
  List<Object?> get props => [];
}
class QuizesSuccessState extends ExamsState {
  @override
  List<Object?> get props => [];
}
class QuizesErrorState extends ExamsState {
  final String error;

  QuizesErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
class TimerRunning extends ExamsState {
  @override
  List<Object?> get props => [];
}

class TimerPausing extends ExamsState {
  @override
  List<Object?> get props => [];
}

class TimerComplete extends ExamsState {
  @override
  List<Object?> get props => [];
}
class IncrementState extends ExamsState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ResultsExam extends ExamsState{

  @override
  List<Object?> get props => [];
}