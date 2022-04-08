import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mrstudentapp/bloc/coursepaywithcode/course_pay_with_code_cubit.dart';
import 'package:mrstudentapp/data/models/courses_model.dart';
import 'package:mrstudentapp/presentation/widgets/Sboutton.dart';
import 'package:mrstudentapp/presentation/widgets/Stext_filed.dart';
import 'package:mrstudentapp/presentation/widgets/custom_dots.dart';
import 'package:mrstudentapp/shered/styles/colors.dart';
import 'package:sizer/sizer.dart';

import '../../shered/apis.dart';
import '../../shered/strings.dart';
import '../widgets/mysnackbar.dart';

class CoursePayWithCodeScreen extends StatelessWidget {
  CoursePayWithCodeScreen({Key? key,required this.coursedetail}) : super(key: key);
  CoursesModel coursedetail;
  TextEditingController code = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
       // physics: NeverScrollableScrollPhysics(),
        child: BlocConsumer<CoursePayWithCodeCubit, CoursePayWithCodeState>(
  listener: (context, state) {
    if (state is CoursePayWithCodeSuccessState){
      Navigator.pushReplacementNamed(context, homepage);
    }
    if (state is CoursePayWithCodeErrorState) {
      // Showing the error message if the user has entered invalid credentials
      MySnackBar.error(
          message: state.error.toString(),
          color: Colors.red,
          context: context);
    }
  },
  builder: (context, state) {
    CoursePayWithCodeCubit paywithcodecubi = BlocProvider.of(context);
    if(state is CoursePayWithCodeLoadingState){
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*0.5,),
              CircularProgressIndicator(),
            ],
          ),
        ],
      );
    }
      return SafeArea(
        child: Container(
          color: Appcolors.primary,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("الدفع بواسطة الكود",style: GoogleFonts.notoKufiArabic(color: Appcolors.white,fontSize: 20),),
                    IconButton(onPressed: (){Navigator.pop(context);}, icon: Image.asset('assets/images/icons/chevron-right.png',color: Appcolors.white,width: 10.w,height: 10.h)),
                  ],
                ),
              ),
              Container(
                height: 86.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30)),
                    color: Appcolors.lightbase2
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(
                          height: 30.h,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(image: NetworkImage(imagesUrl + coursedetail.Image.toString()),fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      Text(coursedetail.Title.toString(),style: GoogleFonts.notoKufiArabic(fontSize: 30,fontWeight: FontWeight.bold),),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(30),
                          child: Text(coursedetail.Description.toString(),style: GoogleFonts.notoKufiArabic(fontSize: 15),),
                        ),
                      ),
                      // SizedBox(height: 1.h,),
                      STextFiled(hint: "الرجاء إدخال الكود", textEditingController: code),
                      Divider(),
                      Padding(
                        padding: EdgeInsets.only(left: 20,right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(coursedetail.Price.toString()),
                            Text(":سعر الحصة",style: GoogleFonts.notoKufiArabic(fontSize: 15,fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                      SBoutton(text: SaveAndContinue, width: MediaQuery.of(context).size.width * 0.8,color: Appcolors.green,OnTap: (){
                        _paywithidandcode(context,paywithcodecubi);
                      },)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
  },
),
      ),
    );
  }
  void _paywithidandcode(context, CoursePayWithCodeCubit cubit) {
    // if (_fomkey.currentState!.validate()) {
      cubit.paywitcode(code:code.text , id: coursedetail.id.toString());
   // }
  }
}
