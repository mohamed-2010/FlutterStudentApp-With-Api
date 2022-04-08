import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mrstudentapp/shered/styles/colors.dart';
import 'package:sizer/sizer.dart';

class Answers extends StatelessWidget {
  Answers({Key? key, required this.answer, this.ontap, this.myColor,this.textColor})
      : super(key: key);
  String answer;
  Function()? ontap;
  Color? myColor;
  Color? textColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 7.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.black, width: 2),
            color: myColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            Text(
              answer,
              style: GoogleFonts.notoKufiArabic(
                  fontSize: 20,
                  color: textColor
              ),
            ),
            SizedBox()
          ],
        ),
      ),
    );
  }
}
