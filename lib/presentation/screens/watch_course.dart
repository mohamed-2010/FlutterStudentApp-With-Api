import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mrstudentapp/bloc/lessons/lessons_cubit.dart';
import 'package:mrstudentapp/presentation/view/lessons_item_view.dart';
import 'package:mrstudentapp/shered/styles/colors.dart';
import 'package:sizer/sizer.dart';

class WatchCourseScreen extends StatelessWidget {
  WatchCourseScreen({Key? key, required this.id}) : super(key: key);
  int? id;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
          create: (context) => LessonsCubit()..getLessons(id!),
          child: BlocConsumer<LessonsCubit, LessonsState>(
            listener: (context, state) {},
            builder: (context, state) {
              LessonsCubit cubit = LessonsCubit.get(context);
              if (state is LessonLoadingState) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: const CircularProgressIndicator()),
                  ],
                );
              }
              if (state is LessonSuccessState){
                return Scaffold(
                    body:
                    Container(
                  color: Appcolors.primary,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Watch",
                              style: GoogleFonts.notoKufiArabic(
                                  color: Appcolors.white, fontSize: 20),
                            ),
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Image.asset(
                                    'assets/images/icons/chevron-right.png',
                                    color: Appcolors.white,
                                    width: 10.w,
                                    height: 10.h)),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              height: 25.h,
                              color: Appcolors.green,
                              child:  cubit.playVideo(),
                            )
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30)),
                                color: Appcolors.white),
                            width: MediaQuery.of(context).size.width,
                            height: 60.h,
                            child: ListView.builder(
                                itemCount: cubit.listoflessons.length,
                                itemBuilder: (BuildContext , int){
                                  return LessonsItemView(lessons: cubit.lessons[int],onTap: (){
                                    cubit.onTapVideo(int);
                                  },);
                                }),
                          ),
                        ],
                      )
                    ],
                  ),
                )
                );
              }
              return Container(color: Appcolors.white,);

            },
          ),
        ),
    );
  }
}
