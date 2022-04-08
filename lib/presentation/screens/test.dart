import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mrstudentapp/presentation/widgets/Sboutton.dart';
import 'package:mrstudentapp/presentation/widgets/Scard.dart';
import 'package:mrstudentapp/presentation/widgets/SitemTi.dart';
import 'package:mrstudentapp/presentation/widgets/Stext_filed.dart';
import 'package:mrstudentapp/presentation/widgets/Stogle_widget.dart';
import 'package:mrstudentapp/shered/styles/colors.dart';
import 'package:sizer/sizer.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  TextEditingController test = TextEditingController();
  String status = "Off";
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SBoutton(text: "Test", width: 50.w,color: Appcolors.primary,OnTap: (){},),
              SCardWidget
                (Cwidth: 90.w, Cheight: 30.h, Ccolor: Appcolors.white,
                Cimage: 'https://cdn.onlinewebfonts.com/svg/img_518950.png',CImgheight: 60,CImgWidth: 60,),
              SItemTI(text: "Setting Row" , ic: Icons.logout,ItemTap: (){

              },),
              STextFiled(textEditingController: test, hint: 'Test Edit Text', validator: (String? value) {  }, icon: Icons.connected_tv,),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    STogleWidget()
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
