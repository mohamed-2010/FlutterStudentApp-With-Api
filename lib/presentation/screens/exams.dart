import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mrstudentapp/bloc/exams/exams_cubit.dart';
import 'package:mrstudentapp/presentation/view/exam_item_view.dart';
import 'package:mrstudentapp/shered/styles/colors.dart';
import 'package:sizer/sizer.dart';

class ExamsScreen extends StatelessWidget {
  const ExamsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      ExamsCubit()
        ..getExams(),
      child: Scaffold(
        backgroundColor: Appcolors.primary,
        body: BlocConsumer<ExamsCubit, ExamsState>(
          listener: (context, state) {},
          builder: (context, state) {
            ExamsCubit cubit = ExamsCubit.get(context);
            if(state is ExamsLoadingState){
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(child: const CircularProgressIndicator()),
                ],
              );
            }else{
              return SafeArea(
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
                            "الأمتحانات",
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
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        height: 78.h,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                topLeft: Radius.circular(30)),
                            color: Appcolors.white),
                        child: Column(
                          children: [
                            Container(
                                width: double.infinity,
                                height: 78.h,
                              child: ListView.builder(
                                itemCount: cubit.listofexams.length,
                                itemBuilder: (BuildContext, int){
                                  return ExamItemView(exams: cubit.exam[int]);
                                },
                              )
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
