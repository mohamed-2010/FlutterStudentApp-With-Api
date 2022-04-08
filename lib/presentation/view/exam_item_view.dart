import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mrstudentapp/data/models/exams_model.dart';
import 'package:mrstudentapp/presentation/screens/examquizes.dart';
import 'package:mrstudentapp/presentation/screens/quiz_pay_with_code.dart';
import 'package:mrstudentapp/presentation/widgets/Sboutton.dart';
import 'package:mrstudentapp/presentation/widgets/cards_button.dart';
import 'package:mrstudentapp/shered/styles/colors.dart';
import 'package:sizer/sizer.dart';

class ExamItemView extends StatelessWidget {
  ExamItemView({Key? key, required this.exams}) : super(key: key);

  ExamsModel exams;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 1.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CardsButton(
              text: exams.exam,
              width: 25.w ,
              color: Appcolors.primary,
              OnTap: (){
                if(exams.IsBuyer == true){
                  //Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ExamQuizesScreen(id: exams.id!,exid: exams.id.toString(),)) );
                }else{
                  Navigator.push(context, MaterialPageRoute(builder: (contex)=> QuizPayWithCodeScreen(examdetails: exams)));
                }
              },
            ),
            SizedBox(width: 2.w,),
            Column(
              children: [
                Text(
                    exams.Title.toString(),
                  style: GoogleFonts.notoKufiArabic(fontSize: 20,fontWeight: FontWeight.bold),
                ),
                Text(
                    "مدة الأمتحان: " + exams.timer.toString(),
                  style: GoogleFonts.notoKufiArabic(fontSize: 15),
                )
              ],
            ),
            Image.asset('assets/images/icons/play-circle.png',width: 10.w,height: 10.h,fit: BoxFit.contain,),
          ],
        ),
      ),
    );
  }
}
