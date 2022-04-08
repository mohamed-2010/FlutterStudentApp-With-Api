part of 'course_pay_with_code_cubit.dart';

abstract class CoursePayWithCodeState extends Equatable {}

class CoursePayWithCodeInitial extends CoursePayWithCodeState {
  @override
  List<Object?> get props => [];
}
class CoursePayWithCodeErrorState extends CoursePayWithCodeState {
  final String error;

  CoursePayWithCodeErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
class CoursePayWithCodeSuccessState extends CoursePayWithCodeState {
  @override
  List<Object?> get props => [];
}
class CoursePayWithCodeLoadingState extends CoursePayWithCodeState {
  @override
  List<Object?> get props => [];
}