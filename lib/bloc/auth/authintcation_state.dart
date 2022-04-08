part of 'authintcation_cubit.dart';

abstract class AuthintcationState extends Equatable {}

class AuthintcationInitial extends AuthintcationState {
  @override
  List<Object?> get props => [];
}
class AuthenticationLoadingState extends AuthintcationState {
  @override
  List<Object?> get props => [];
}

class AuthenticationSuccessState extends AuthintcationState {
  @override
  List<Object?> get props => [];
}

class AuthenticationErrortate extends AuthintcationState {
  final String error;

  AuthenticationErrortate(this.error);

  @override
  List<Object?> get props => [error];
}

class UnAuthintcationState extends AuthintcationState {
  @override
  List<Object?> get props => [];
}

class UpdateProfileLoadingState extends AuthintcationState {
  @override
  List<Object?> get props => [];
}

class UpdateProfileSuccessState extends AuthintcationState {
  @override
  List<Object?> get props => [];
}

class UpdateProfileErrorState extends AuthintcationState {
  @override
  List<Object?> get props => [];
}

class LogdOutSuccessState extends AuthintcationState {
  final Function() navigator;
  LogdOutSuccessState(this.navigator);
  @override
  List<Object?> get props => [navigator];
}