part of 'exams_pay_with_code_cubit.dart';

abstract class ExamsPayWithCodeState extends Equatable{}

class ExamsPayWithCodeInitial extends ExamsPayWithCodeState {
  @override
  List<Object?> get props => [];
}
class ExamPayWithCodeErrorState extends ExamsPayWithCodeState {
  final String error;

  ExamPayWithCodeErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
class ExamPayWithCodeSuccessState extends ExamsPayWithCodeState {
  @override
  List<Object?> get props => [];
}
class ExamPayWithCodeLoadingState extends ExamsPayWithCodeState {
  @override
  List<Object?> get props => [];
}