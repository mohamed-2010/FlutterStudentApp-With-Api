import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_countdown_timer/countdown.dart';
import 'package:flutter_countdown_timer/countdown_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mrstudentapp/bloc/exams/exams_cubit.dart';
import 'package:mrstudentapp/data/models/quizes_model.dart';
import 'package:mrstudentapp/presentation/screens/home.dart';
import 'package:mrstudentapp/presentation/view/quiz_view.dart';
import 'package:mrstudentapp/presentation/widgets/Sboutton.dart';
import 'package:sizer/sizer.dart';

import '../../shered/styles/colors.dart';
import 'my_results.dart';

class ExamQuizesScreen extends StatefulWidget {
  ExamQuizesScreen({Key? key, required this.id, required this.exid})
      : super(key: key);
  int id;
  String exid;

  @override
  State<ExamQuizesScreen> createState() => _ExamQuizesScreenState();
}

class _ExamQuizesScreenState extends State<ExamQuizesScreen> {
  @override
  Widget build(BuildContext context) {
    //Navigator.pop(context,true);
    return MultiBlocProvider(
      providers: [
        //BlocProvider(create: (context) => ExamsCubit()),
        BlocProvider(create: (context) => ExamsCubit()..getQuizes(widget.id)),
      ],
      child: BlocConsumer<ExamsCubit, ExamsState>(
        listener: (context, state) {},
        builder: (context, state) {
          ExamsCubit cubit = ExamsCubit.get(context);
          if (state is QuizesSuccessState) {
            CountdownController countdownController = CountdownController(
                duration: Duration(minutes: ExamsCubit.start!),
                onEnd: () {
                  cubit.finish(widget.exid);
                  print('onEnd');
                });
            bool isRunning = false;
            countdownController.start();
            return WillPopScope(
              onWillPop: () async => false,
              child: SafeArea(
                child: Scaffold(
                  backgroundColor: Appcolors.primary,
                  body: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 2.h, horizontal: 7.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "الأمتحان",
                              style: GoogleFonts.notoKufiArabic(
                                  color: Appcolors.white, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 1.w,
                          ),
                          Column(
                            children: [
                              Stack(
                                fit: StackFit.passthrough,
                                children: [
                                  Countdown(
                                      countdownController: countdownController,
                                      builder: (_, Duration time) {
                                        return Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 1.9.h),
                                          child: Text(
                                            '${time.inHours}:${time.inMinutes % 60}:${time.inSeconds % 60}',
                                            style: GoogleFonts.montserrat(
                                                fontSize: 20,
                                                color: Appcolors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        );
                                      }),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 1.w,
                          )
                        ],
                      ),
                      Container(
                        height: 80.h,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            color: Appcolors.darkColor3,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30))),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              // for (int i = 0;
                              //     i < cubit.listofquizes.length; i++)
                                     SizedBox(
                                       width: MediaQuery.of(context).size.width,
                                       height: MediaQuery.of(context).size.height *0.7,
                                       child: ListView.builder(
                                           itemBuilder: (BuildContext context, int) {
                                             return QuizeView(
                                               quize: cubit.quizes[int],
                                               examId: widget.exid,
                                             );
                                           },
                                           itemCount: cubit.listofquizes.length,
                                       ),
                                     ),
                              SBoutton(
                                text: "إنهاء",
                                width: MediaQuery.of(context).size.width * 0.8,
                                color: Appcolors.primary,
                                OnTap: () {
                                  cubit.GetResult(widget.exid);
                                },
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          } else if (state is ResultsExam) {
            return WillPopScope(
              onWillPop: () async => false,
              child: Scaffold(
                backgroundColor: Appcolors.primary,
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 3.h,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 2.h, horizontal: 7.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "النتيجة",
                            style: GoogleFonts.notoKufiArabic(
                                color: Appcolors.white, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 85.h,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: Appcolors.darkColor3,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 1.h, horizontal: 7.w),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 8.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Appcolors.darkColor3),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 6.w, vertical: 0.5.h),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      cubit.count_questions.toString(),
                                      style: GoogleFonts.montserrat(
                                          color: Appcolors.darkColor2),
                                    ),
                                    Text(
                                      ":عدد الأسئلة",
                                      style: GoogleFonts.notoKufiArabic(
                                          fontWeight: FontWeight.bold,
                                          color: Appcolors.darkColor2),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 1.h, horizontal: 7.w),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 8.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Appcolors.darkColor3),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 6.w, vertical: 0.5.h),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      cubit.student_mark.toString(),
                                      style: GoogleFonts.montserrat(
                                          color: Appcolors.darkColor2),
                                    ),
                                    Text(
                                      ":درجة الطالب",
                                      style: GoogleFonts.notoKufiArabic(
                                          fontWeight: FontWeight.bold,
                                          color: Appcolors.darkColor2),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 1.h, horizontal: 7.w),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 8.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Appcolors.darkColor3),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 6.w, vertical: 0.5.h),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      cubit.per_quetion_mark.toString(),
                                      style: GoogleFonts.montserrat(
                                          color: Appcolors.darkColor2),
                                    ),
                                    Text(
                                      ":درجة السؤال الواحد",
                                      style: GoogleFonts.notoKufiArabic(
                                          fontWeight: FontWeight.bold,
                                          color: Appcolors.darkColor2),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 1.h, horizontal: 7.w),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 8.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Appcolors.darkColor3),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 6.w, vertical: 0.5.h),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      cubit.total_marks.toString(),
                                      style: GoogleFonts.montserrat(
                                          color: Appcolors.darkColor2),
                                    ),
                                    Text(
                                      ":درجة الأمتحان",
                                      style: GoogleFonts.notoKufiArabic(
                                          fontWeight: FontWeight.bold,
                                          color: Appcolors.darkColor2),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 1.h, horizontal: 7.w),
                              child: SBoutton(
                                text: "<<<الرجوع للصفحة الرئيسية",
                                color: Appcolors.primary,
                                width: MediaQuery.of(context).size.width,
                                OnTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (builder) => HomeScreen()));
                                },
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
