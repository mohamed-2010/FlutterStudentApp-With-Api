import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mrstudentapp/presentation/screens/watch_course.dart';
import 'package:mrstudentapp/presentation/widgets/Sboutton.dart';
import 'package:mrstudentapp/shered/apis.dart';
import 'package:mrstudentapp/shered/strings.dart';
import 'package:mrstudentapp/shered/styles/colors.dart';
import 'package:sizer/sizer.dart';

import '../../data/models/courses_model.dart';
import '../screens/course_pay_with_code.dart';
import '../widgets/cards_button.dart';

class HomeCoursesItemView extends StatelessWidget {
  HomeCoursesItemView({Key? key , required this.courses}) : super(key: key);
  CoursesModel courses;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8,right: 8),
      child: Container(
        child: Column(
          children: [
            Container(
              height: 15.h,
              width: 40.w,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(imagesUrl + courses.Image.toString()),fit: BoxFit.cover),
                borderRadius: BorderRadius.all(Radius.circular(15)),
                //color: Colors.grey,
              ),
            ),
            Center(
              child: Text(courses.Title.toString(),style: GoogleFonts.notoKufiArabic(fontSize: 20,fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10,right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  courses.Price == null ? Text('مجاني' , style: GoogleFonts.notoKufiArabic(color: Appcolors.green)) : Text('مدفوع',style: GoogleFonts.notoKufiArabic(color: Appcolors.pink),),
                  SizedBox(width: 10.w,),
                  courses.Price == null ? Text('0') : Text(courses.Price.toString(),style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            CardsButton(text: courses.hesa, width: 30.w,color: Appcolors.primary,OnTap: (){
              if(courses.IsBuyer == true){
                Navigator.push(context, MaterialPageRoute(builder: (context) => WatchCourseScreen(id: courses.id!,)));
              }else{
                Navigator.push(context, MaterialPageRoute(builder: (context) => CoursePayWithCodeScreen(coursedetail: courses,)));
              }
            },)
          ],
        ),
      ),
    );
  }
}

class AllCoursesItemView extends StatelessWidget {
  AllCoursesItemView({Key? key,required this.courses}) : super(key: key);
  CoursesModel courses;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h,horizontal: 4.w),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CardsButton(text: courses.hesa, width: 30.w,color: Appcolors.primary,OnTap: (){
              if(courses.IsBuyer == true){
                Navigator.push(context, MaterialPageRoute(builder: (context) => WatchCourseScreen(id: courses.id!,)));
              }else{
                Navigator.push(context, MaterialPageRoute(builder: (context) => CoursePayWithCodeScreen(coursedetail: courses,)));
              }
            },),
            Column(
              children: [
                Center(
                  child: Text(courses.Title.toString(),style: GoogleFonts.notoKufiArabic(fontSize: 20,fontWeight: FontWeight.bold),),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10,right: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      courses.Price == null ? Text('مجاني' , style: GoogleFonts.notoKufiArabic(color: Appcolors.green)) : Text('مدفوع',style: GoogleFonts.notoKufiArabic(color: Appcolors.pink),),
                      SizedBox(width: 10.w,),
                      courses.Price == null ? Text('0') : Text(courses.Price.toString(),style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: 10.h,
              width: 20.w,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(imagesUrl + courses.Image.toString()),fit: BoxFit.cover),
                borderRadius: BorderRadius.all(Radius.circular(15)),
                //color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

