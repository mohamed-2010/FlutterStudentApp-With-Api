import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrstudentapp/presentation/widgets/Sboutton.dart';
import 'package:mrstudentapp/shered/strings.dart';
import 'package:sizer/sizer.dart';
import '../../bloc/onboarding/on_boarding_cubit.dart';
import '../../shered/constants/consts_variables.dart';
import '../../shered/styles/colors.dart';
import '../widgets/circular_button.dart';
import '../widgets/custom_dots.dart';
import '../widgets/mycustompainter.dart';
import '../widgets/onboarding_item.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: BlocConsumer<OnBoardingCubit, OnBoardingState>(
        listener: (context, state) {},
        builder: (context, state) {
          OnBoardingCubit cubit = BlocProvider.of(context);
          return SafeArea(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                          width: 100.w,
                          height: 95.h,
                          color: Colors.deepPurple,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        _pageController.previousPage(
                                            duration:
                                            const Duration(milliseconds: 500),
                                            curve: Curves.easeIn);

                                        cubit.curruntindext > 0
                                            ? cubit.removefromindex()
                                            : null;
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 20),
                                        child: Text(
                                          'Back',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1
                                              ?.copyWith(
                                            fontSize: 13.sp,
                                            color: Colors.white38,
                                          ),
                                        ),
                                      ),
                                    ),
                                    CustomDots(myindex: cubit.curruntindext),
                                    SizedBox(
                                      width: 10.w,
                                    )
                                  ],
                                )
                              ],
                            ),
                          )),
                      SizedBox(
                        width: 100.w,
                        height: 90.h,
                        child: CustomPaint(
                          painter: const MycustomPainter(color: Appcolors.white),
                          child: SizedBox(
                            width: 80.w,
                            height: 50.h,
                            child: PageView.builder(
                              itemCount: onboardinglist.length,
                              physics: const NeverScrollableScrollPhysics(),
                              controller: _pageController,
                              itemBuilder: ((context, index) {
                                return OnBoardingItem(
                                  index: index,
                                  image: onboardinglist[index].img,
                                  title: onboardinglist[index].title,
                                  description: onboardinglist[index].description,
                                );
                              }),
                            ),
                          ),
                        ),
                      ),
                      cubit.curruntindext != onboardinglist.length - 1
                          ? Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: SBoutton(
                                color: Colors.deepPurple,
                                width: 19.w,
                                text: 'Skip',
                                OnTap: () {
                                  _pageController.animateToPage(
                                      onboardinglist.length - 1,
                                      duration:
                                      const Duration(milliseconds: 500),
                                      curve: Curves.easeOut);
                                  cubit.curruntindext <
                                      onboardinglist.length - 1
                                      ? cubit.skipindex()
                                      : null;
                                }),
                          ))
                          : Container(),
                      Positioned(
                        bottom: 10.h,
                        child: CircularButton(
                            color: Appcolors.pink.withOpacity(0.6),
                            width: 30.w,
                            icon: Icons.arrow_right_alt_sharp,
                            condition:
                            cubit.curruntindext != onboardinglist.length - 1,
                            func: () {
                              _pageController.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut);
                              if (cubit.curruntindext < onboardinglist.length - 1) {
                                cubit.changeindex();
                              } else {
                                Navigator.pushReplacementNamed(
                                    context, loginpage);
                                cubit.savepref('seen');
                              }
                            }),
                      ),
                    ],
                  ),
                ],
              ));
        },
      ),
    );
  }
}
