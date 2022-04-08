import 'package:flutter/material.dart';
import 'package:mrstudentapp/shered/styles/colors.dart';
import 'package:sizer/sizer.dart';

class SBoutton extends StatelessWidget {
  SBoutton({
    Key? key,
    required this.text,
    this.color,
    required this.width,
    this.OnTap
  }) : super(key: key);
  String? text;
  Color? color;
  Function()? OnTap;
  double? width;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: OnTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: color,
          ),
          height: 7.h,
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  text.toString(),
                style: TextStyle(color: Appcolors.white,fontSize: 15.sp,fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
