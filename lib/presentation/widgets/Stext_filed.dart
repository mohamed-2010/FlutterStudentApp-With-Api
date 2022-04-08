import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../shered/styles/colors.dart';

class STextFiled extends StatelessWidget {
  final IconData? icon;
  final String hint;
  final FormFieldValidator<String>? validator;
  final TextEditingController textEditingController;
  final TextInputType keyboardtype;
  final bool obscure;
  final bool readonly;
  final bool showicon;
  final int? maxlenght;
  final Function()? ontap;
  const STextFiled(
      {Key? key,
        required this.hint,
        this.icon,
        this.validator,
        required this.textEditingController,
        this.obscure = false,
        this.readonly = false,
        this.showicon = true,
        this.ontap,
        this.keyboardtype = TextInputType.text,
        this.maxlenght = null})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h,horizontal: 5.w),
      child: TextFormField(
        textCapitalization: TextCapitalization.sentences,
        maxLines: 1,
        maxLength: maxlenght,
        readOnly: readonly,
        obscureText: obscure,
        keyboardType: keyboardtype,
        onTap: readonly ? ontap : null,
        controller: textEditingController,
        style: Theme.of(context).textTheme.headline1?.copyWith(
          fontSize: 15.sp,
          color: Appcolors.black,
        ),
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: hint,
            border: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(width: 0,color: Colors.transparent)
               ),
            contentPadding:
            EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.3.h),
            hintStyle: Theme.of(context).textTheme.headline1?.copyWith(
              fontSize: 9.sp,
              color: Colors.deepPurple,
            ),
            prefixIcon: showicon
                ? Icon(
              icon,
              size: 22,
              color: Colors.deepPurple,
            )
                : null,
            suffixIcon: readonly
                ? Icon(
              icon,
              size: 22,
              color: Colors.deepPurple,
            )
                : null),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
      ),
    );
  }
}
