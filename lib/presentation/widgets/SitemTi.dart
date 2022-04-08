import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SItemTI extends StatelessWidget {
  SItemTI({Key? key,required this.text,this.ic,this.ItemTap}) : super(key: key);
  String? text;
  IconData? ic;
  Function()? ItemTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 2.h),
      child: InkWell(
        onTap: ItemTap,
        child: Container(
          height: 10.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text.toString()),
              Icon(ic,color: Theme.of(context).iconTheme.color,size: 30,)
            ],
          ),
        ),
      ),
    );
  }
}
