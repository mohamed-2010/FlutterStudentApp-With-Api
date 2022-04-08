import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mrstudentapp/data/models/lessons_model.dart';
import 'package:mrstudentapp/shered/styles/colors.dart';
import 'package:sizer/sizer.dart';

import '../../shered/apis.dart';

class LessonsItemView extends StatelessWidget {
  LessonsItemView({Key? key,required this.lessons,this.onTap}) : super(key: key);
  LessonsModel lessons;
  Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Center(
              child: InkWell(
                onTap: onTap,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 3.h),
                      child: Text(lessons.LessonTitle.toString(),style: GoogleFonts.notoKufiArabic(color: Appcolors.black,fontSize: 20,fontWeight: FontWeight.bold),),

                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
  }
}
