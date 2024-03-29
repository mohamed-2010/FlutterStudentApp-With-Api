import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../shered/styles/colors.dart';

class CircularButton extends StatelessWidget {
  const CircularButton(
      {Key? key,
      required this.color,
      required this.width,
      required this.icon,
      required this.func,
      required this.condition})
      : super(key: key);

  final Color color;
  final double width;
  final IconData icon;
  final Function() func;
  final bool condition;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(vertical: 2.h),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: MaterialButton(
          onPressed: func,
          child: Center(
            child: (condition)
                ? Icon(
                    icon,
                    color: Appcolors.white,
                    size: 30.sp,
                  )
                : Text(
                    'Begin',
                    style: Theme.of(context)
                        .textTheme
                        .headline1
                        ?.copyWith(fontSize: 9.sp, color: Appcolors.white),
                  ),
          ),
        ),
      ),
    );
  }
}
