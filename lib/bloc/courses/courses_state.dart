part of 'courses_cubit.dart';

abstract class CoursesState extends Equatable {}

class CoursesInitial extends CoursesState {
  @override
  List<Object?> get props => [];
}

class CoursesErrorState extends CoursesState {
  final String error;

  CoursesErrorState(this.error);

  @override
  List<Object?> get props => [error];
}

class CoursesLoadingState extends CoursesState {
  @override
  List<Object?> get props => [];
}
class CoursesSuccessState extends CoursesState {
  @override
  List<Object?> get props => [];
}