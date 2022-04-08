part of 'lessons_cubit.dart';

abstract class LessonsState extends Equatable{}

class LessonsInitial extends LessonsState {
  @override
  List<Object?> get props => [];
}

class LessonLoadingState extends LessonsState {
  @override
  List<Object?> get props => [];
}

class LessonErrorState extends LessonsState {
  final String error;

  LessonErrorState(this.error);

  @override
  List<Object?> get props => [error];
}

class LessonSuccessState extends LessonsState {
  @override
  List<Object?> get props => [];
}

class LessonvideoloadedState extends LessonsState {
  @override
  List<Object?> get props => [];
}