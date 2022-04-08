import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mrstudentapp/presentation/view/courses_item_view.dart';
import 'package:mrstudentapp/shered/strings.dart';
import 'package:mrstudentapp/shered/styles/colors.dart';
import 'package:sizer/sizer.dart';

import '../../bloc/courses/courses_cubit.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.primary,
      body: BlocProvider(
        create: (context) => CoursesCubit()..getCourses(),
        child: BlocConsumer<CoursesCubit, CoursesState>(
          listener: (context, state) {},
          builder: (context, state) {
            CoursesCubit cubit = CoursesCubit.get(context);
            if(state is CoursesLoadingState){
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(child: const CircularProgressIndicator()),
                ],
              );
            }else{
              return SafeArea(
                child: Container(
                  color: Appcolors.primary,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:
                        EdgeInsets.symmetric(vertical: 2.h, horizontal: 6.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              SAllCourses,
                              style: GoogleFonts.notoKufiArabic(
                                  fontWeight: FontWeight.bold,
                                  color: Appcolors.white,
                                  fontSize: 20),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            // IconButton(
                            //     onPressed: () {},
                            //     icon: ImageIcon(AssetImage('assets/images/icons/chevron-right.png'),color: Appcolors.white,)
                            // ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 78.h,
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 78.h,
                                child: ListView.builder(
                                    itemCount: cubit.listofcourses.length,
                                    itemBuilder: (BuildContext, int) {
                                      return AllCoursesItemView(
                                          courses: cubit.courses[int]);
                                    }),
                              )
                            ],
                          ),
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30),
                                  topLeft: Radius.circular(30)),
                              color: Appcolors.white),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
