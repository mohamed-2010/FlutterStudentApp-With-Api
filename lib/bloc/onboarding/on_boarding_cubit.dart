import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/models/onboardingmodel.dart';
import '../../shered/constants/assets_path.dart';
import '../../shered/constants/consts_variables.dart';
part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnboardingInitial());

  int curruntindext = 0;

  Future<void> savepref(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, true);
  }

  void skipindex() {
    curruntindext = onboardinglist.length - 1;

    emit(SkipIndexState());
  }

  void changeindex() {
    curruntindext++;
    emit(ChangeCurrentIndexState());
  }

  void removefromindex() {
    curruntindext--;
    emit(RemoveFromCurrentIndexState());
  }
}
