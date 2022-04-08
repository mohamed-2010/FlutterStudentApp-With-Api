import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mrstudentapp/bloc/auth/authintcation_cubit.dart';
import 'package:mrstudentapp/bloc/courses/courses_cubit.dart';
import 'package:mrstudentapp/data/models/courses_model.dart';
import 'package:mrstudentapp/presentation/screens/courses.dart';
import 'package:mrstudentapp/presentation/screens/show_all_courses.dart';
import 'package:mrstudentapp/presentation/view/courses_item_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../../main.dart';
import '../../shered/apis.dart';
import '../../shered/styles/colors.dart';

class DashBoardScreen extends StatelessWidget {
  DashBoardScreen({Key? key}) : super(key: key);
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.primary,
      body: SafeArea(
        child: BlocProvider(
          create: (context) => CoursesCubit()..getCourses(),
          child: BlocConsumer<CoursesCubit, CoursesState>(
            listener: (context, state) {},
            builder: (context, state) {
              CoursesCubit cubit = CoursesCubit.get(context);
              if (state is CoursesLoadingState) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(child: const CircularProgressIndicator()),
                  ],
                );
              }
              if (state is CoursesSuccessState) {
                return Scaffold(
                  body: SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 28.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30)),
                              color: Appcolors.primary),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5.w, vertical: 4.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: Image.asset(
                                          'assets/images/icons/bell.png',
                                          color: Appcolors.white,
                                        )),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              'مرحبا برجوعك',
                                              style: GoogleFonts.montserrat(
                                                  color: Appcolors.white,
                                                  fontSize: 13),
                                            ),
                                            Text(
                                             cubit.name,
                                              style: GoogleFonts.montserrat(
                                                  color: Appcolors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 15),
                                          child: CircleAvatar(
                                            backgroundImage: AssetImage(
                                                'assets/images/icons/user.png'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8.w, vertical: 3.h),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 7.h,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text("ماذا تريد أن تجد؟"),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Image.asset(
                                              'assets/images/icons/search.png')),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Appcolors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          child: Container(
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(15),
                                  child: Container(
                                    height: 20.h,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(image: NetworkImage(imagesUrl + "/logo/themp.jpg"),fit: BoxFit.cover),
                                  ),
                                ),
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(top: 1, left: 25, right: 25),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "الحصص",
                                            style: GoogleFonts.notoKufiArabic(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                          TextButton(
                                            onPressed: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowAllCoursesScreen()));
                                            },
                                            child: Text("أظهر الكل",
                                              style: GoogleFonts.notoKufiArabic(
                                                  color: Appcolors.gree),),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      height: 260,
                                      child: Container(
                                        width: double.infinity,
                                        height: 260,
                                        alignment: Alignment.center,
                                        child: ListView.builder(
                                                itemCount: cubit.listofcourses.length,
                                                scrollDirection: Axis.horizontal,
                                                itemBuilder: (BuildContext, int) {
                                                  return HomeCoursesItemView(
                                                      courses: cubit.courses[int]);
                                                })
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
