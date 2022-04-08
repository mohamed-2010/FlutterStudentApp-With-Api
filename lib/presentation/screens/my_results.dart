import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mrstudentapp/bloc/exams/exams_cubit.dart';
import 'package:sizer/sizer.dart';

import '../../shered/styles/colors.dart';

class MyResultsScreen extends StatelessWidget {
  MyResultsScreen({Key? key,required this.id}) : super(key: key);
  String id;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => ExamsCubit()..GetResult(id),
        child: BlocConsumer<ExamsCubit, ExamsState>(
        listener: (context, state) {},
          builder: (context, state) {
            ExamsCubit cubit = ExamsCubit.get(context);
            if(state is ExamsLoadingState) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Center(child: CircularProgressIndicator()),
                ],
              );
            }else if(state is ExamsSuccessState){
              return WillPopScope(
                onWillPop: () async => false,
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
                              "النتيجة",
                              style: GoogleFonts.notoKufiArabic(
                                  color: Appcolors.white, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 80.h,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            color: Appcolors.darkColor3,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30))
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 1.h,horizontal: 7.w),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 8.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Appcolors.darkColor3
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 6.w,vertical: 0.5.h),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("عدد الأسئلة:",style: GoogleFonts.notoKufiArabic(fontWeight: FontWeight.bold,color: Appcolors.darkColor2),),
                                      Text(cubit.count_questions.toString(),style: GoogleFonts.montserrat(color: Appcolors.darkColor2),)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 1.h,horizontal: 7.w),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 8.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Appcolors.darkColor3
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 6.w,vertical: 0.5.h),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("درجة الطالب:",style: GoogleFonts.notoKufiArabic(fontWeight: FontWeight.bold,color: Appcolors.darkColor2),),
                                      Text(cubit.student_mark.toString(),style: GoogleFonts.montserrat(color: Appcolors.darkColor2),)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 1.h,horizontal: 7.w),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 8.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Appcolors.darkColor3
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 6.w,vertical: 0.5.h),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("درجة السؤال الواحد:",style: GoogleFonts.notoKufiArabic(fontWeight: FontWeight.bold,color: Appcolors.darkColor2),),
                                      Text(cubit.per_quetion_mark.toString(),style: GoogleFonts.montserrat(color: Appcolors.darkColor2),)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 1.h,horizontal: 7.w),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 8.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Appcolors.darkColor3
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 6.w,vertical: 0.5.h),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("درجة الأمتحان:",style: GoogleFonts.notoKufiArabic(fontWeight: FontWeight.bold,color: Appcolors.darkColor2),),
                                      Text(cubit.total_marks.toString(),style: GoogleFonts.montserrat(color: Appcolors.darkColor2),)
                                    ],
                                  ),
                                ),
                              ),
                            ),
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
    )
    );
  }
}
