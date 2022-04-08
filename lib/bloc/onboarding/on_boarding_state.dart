part of 'on_boarding_cubit.dart';

@immutable
abstract class OnBoardingState {}

class OnboardingInitial extends OnBoardingState {}

class ChangeCurrentIndexState extends OnBoardingState {}

class RemoveFromCurrentIndexState extends OnBoardingState {}

class SkipIndexState extends OnBoardingState {}
