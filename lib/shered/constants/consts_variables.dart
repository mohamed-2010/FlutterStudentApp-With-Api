import 'package:flutter/material.dart';

import '../../data/models/onboardingmodel.dart';
import 'assets_path.dart';

List<OnBoardingModel> onboardinglist = const [
  OnBoardingModel(
    img: MyAssets.onboradingone,
    title: 'طريقة أفضل للتعلم يتصل بك!',
    description:
    'Better way to learning is calling you!',
  ),
  OnBoardingModel(
    img: MyAssets.onboradingtwo,
    title: 'تجد نفسك من خلال القيام بكل ما تفعله!',
    description: 'Find yourself  by doing whatever you do !',
  ),
  OnBoardingModel(
    img: MyAssets.onboradingthree,
    title: 'انها ليست مجرد تعلم، إنه وعد!',
    description: 'It’s not just learning, It’s a promise!',
  ),
];
int profileimagesindex = 0;
