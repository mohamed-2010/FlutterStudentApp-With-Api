import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mrstudentapp/bloc/exams/exams_cubit.dart';
import 'package:mrstudentapp/data/models/quizes_model.dart';
import 'package:mrstudentapp/presentation/screens/my_results.dart';
import 'package:mrstudentapp/presentation/widgets/answers.dart';
import 'package:mrstudentapp/shered/apis.dart';
import 'package:mrstudentapp/shered/styles/colors.dart';
import 'package:sizer/sizer.dart';

class QuizeView extends StatefulWidget {
  QuizeView({Key? key,required this.quize,required this.examId}) : super(key: key);
  QuizesModel quize;
  String examId;

  @override
  State<QuizeView> createState() => _QuizeViewState();
}

class _QuizeViewState extends State<QuizeView> {
  int? index =0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExamsCubit, ExamsState>(
  listener: (context, state) {},
  builder: (context, state) {
    ExamsCubit cubit = ExamsCubit.get(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 1.w,vertical: 7.h),
      child: Column(
        children: [
          widget.quize.question_img != null ? Container(
      height: 20.h,
        width: 50.w,
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(quizimagesUrl + widget.quize.question_img.toString()),fit: BoxFit.fill),
          borderRadius: BorderRadius.all(Radius.circular(15)),
          //color: Colors.grey,
        ),
      ) : SizedBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(child: Text(widget.quize.question.toString(),style: GoogleFonts.notoKufiArabic(fontWeight: FontWeight.bold,fontSize: 25),),width: 90.w,),
            ],
          ),
          Container(
            child: Column(
              children: [
                SizedBox(height: 5.h,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 1.5.h),
                  child: Answers(
                    myColor: cubit.selected1 == true ? Appcolors.primary : Colors.transparent,
                    textColor: cubit.selected1 == true ? Appcolors.white : Appcolors.black,
                    answer: widget.quize.a.toString(),
                    ontap: (){
                      cubit.sendAnswer(
                          widget.examId,
                          widget.quize.id.toString(),
                          "A"
                      );
                      if(cubit.selected1 == false && cubit.selected2 == false && cubit.selected3 == false && cubit.selected4 == false){
                        setState(() {
                          cubit.selected1 = true;
                        });
                      }else if(cubit.selected1 == false && cubit.selected2 == false && cubit.selected3 == false && cubit.selected4 == true){
                        setState(() {
                          cubit.selected4 = false;
                          cubit.selected1 = true;
                        });
                      }else if(cubit.selected1 == false && cubit.selected2 == true && cubit.selected3 == false && cubit.selected4 == false){
                        setState(() {
                          cubit.selected2 = false;
                          cubit.selected1 = true;
                        });
                      }else if(cubit.selected1 == false && cubit.selected2 == false && cubit.selected3 == true && cubit.selected4 == false){
                        setState(() {
                          cubit.selected3 = false;
                          cubit.selected1 = true;
                        });
                      }
                      print(widget.quize.id.toString());
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 1.5.h),
                  child: Answers(
                    myColor: cubit.selected2 == true ? Appcolors.primary : Colors.transparent,
                    textColor: cubit.selected2 == true ? Appcolors.white : Appcolors.black,
                    answer: widget.quize.b.toString(),
                    ontap: (){
                      cubit.sendAnswer(widget.examId,widget.quize.id.toString(), "B");
                      if(cubit.selected1 == false && cubit.selected2 == false && cubit.selected3 == false && cubit.selected4 == false){
                        setState(() {
                          cubit.selected2 = true;
                        });
                      }else if(cubit.selected1 == true && cubit.selected2 == false && cubit.selected3 == false && cubit.selected4 == false){
                        setState(() {
                          cubit.selected1 = false;
                          cubit.selected2 = true;
                        });
                      }else if(cubit.selected1 == false && cubit.selected2 == false && cubit.selected3 == false && cubit.selected4 == true){
                        setState(() {
                          cubit.selected4 = false;
                          cubit.selected2 = true;
                        });
                      }else if(cubit.selected1 == false && cubit.selected2 == false && cubit.selected3 == true && cubit.selected4 == false){
                        setState(() {
                          cubit.selected3 = false;
                          cubit.selected2 = true;
                        });
                      }
                      print(widget.quize.id.toString());
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 1.5.h),
                  child: Answers(
                    myColor: cubit.selected3 == true ? Appcolors.primary : Colors.transparent,
                    textColor: cubit.selected3 == true ? Appcolors.white : Appcolors.black,
                    answer: widget.quize.c.toString(),
                    ontap: (){
                      cubit.sendAnswer(widget.examId,widget.quize.id.toString(), "C");
                      if(cubit.selected1 == false && cubit.selected2 == false && cubit.selected3 == false && cubit.selected4 == false){
                        setState(() {
                          cubit.selected3 = true;
                        });
                      }else if(cubit.selected1 == true && cubit.selected2 == false && cubit.selected3 == false && cubit.selected4 == false){
                        setState(() {
                          cubit.selected1 = false;
                          cubit.selected3 = true;
                        });
                      }else if(cubit.selected1 == false && cubit.selected2 == true && cubit.selected3 == false && cubit.selected4 == false){
                        setState(() {
                          cubit.selected2 = false;
                          cubit.selected3 = true;
                        });
                      }else if(cubit.selected1 == false && cubit.selected2 == false && cubit.selected3 == false && cubit.selected4 == true){
                        setState(() {
                          cubit.selected4 = false;
                          cubit.selected3 = true;
                        });
                      }
                      print(widget.quize.id.toString());
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 1.5.h),
                  child: Answers(
                    myColor: cubit.selected4 == true ? Appcolors.primary : Colors.transparent,
                    textColor: cubit.selected4 == true ? Appcolors.white : Appcolors.black,
                    answer: widget.quize.d.toString(),
                    ontap: (){
                      cubit.sendAnswer(widget.examId,widget.quize.id.toString(), "D");
                      if(cubit.selected1 == false && cubit.selected2 == false && cubit.selected3 == false && cubit.selected4 == false){
                        setState(() {
                          cubit.selected4 = true;
                        });
                      }else if(cubit.selected1 == true && cubit.selected2 == false && cubit.selected3 == false && cubit.selected4 == false){
                        setState(() {
                          cubit.selected1 = false;
                          cubit.selected4 = true;
                        });
                      }else if(cubit.selected1 == false && cubit.selected2 == true && cubit.selected3 == false && cubit.selected4 == false){
                        setState(() {
                          cubit.selected2 = false;
                          cubit.selected4 = true;
                        });
                      }else if(cubit.selected1 == false && cubit.selected2 == false && cubit.selected3 == true && cubit.selected4 == false){
                        setState(() {
                          cubit.selected3 = false;
                          cubit.selected4 = true;
                        });
                      }
                      print(widget.quize.id.toString());
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  },
);
  }
}
