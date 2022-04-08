import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mrstudentapp/bloc/auth/authintcation_cubit.dart';
import 'package:mrstudentapp/presentation/widgets/Sboutton.dart';
import 'package:mrstudentapp/shered/styles/colors.dart';
import 'package:sizer/sizer.dart';

import 'login.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.primary,
      body: BlocProvider(
  create: (context) => AuthintcationCubit()..getUser(),
  child: BlocConsumer<AuthintcationCubit, AuthintcationState>(
        listener: (context, state) {},
      builder: (context, state) {
        AuthintcationCubit cubit = AuthintcationCubit.get(context);
        if(state is AuthenticationLoadingState){
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(child: const CircularProgressIndicator()),
            ],
          );
        }else{
          return SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                  child: Text("حسابي",style: GoogleFonts.notoKufiArabic(fontWeight: FontWeight.bold,fontSize: 25,color: Appcolors.white),),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 77.h,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30)),
                    color: Appcolors.white,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 3.h),
                        child: const CircleAvatar(
                          backgroundImage: AssetImage('assets/images/icons/user.png'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 1.h,horizontal: 7.w),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 8.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Appcolors.darkColor3
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6.w,vertical: 0.5.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Column(
                                  children: [
                                    Text("الأسم",style: GoogleFonts.notoKufiArabic(fontWeight: FontWeight.bold,color: Appcolors.darkColor2),),
                                    Text(cubit.name.toString(),style: GoogleFonts.notoKufiArabic(color: Appcolors.darkColor2),)
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 1.h,horizontal: 7.w),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 8.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Appcolors.darkColor3
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6.w,vertical: 0.5.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Column(
                                  children: [
                                    Text("                الإيميل",style: GoogleFonts.notoKufiArabic(fontWeight: FontWeight.bold,color: Appcolors.darkColor2),),
                                    Text(cubit.email.toString(),style: GoogleFonts.montserrat(color: Appcolors.darkColor2),)
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 1.h,horizontal: 7.w),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 8.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Appcolors.darkColor3
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6.w,vertical: 0.5.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Column(
                                  children: [
                                    Text("رقم الموبايل",style: GoogleFonts.notoKufiArabic(fontWeight: FontWeight.bold,color: Appcolors.darkColor2),),
                                    Text(cubit.mopile.toString(),style: GoogleFonts.montserrat(color: Appcolors.darkColor2),)
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 1.h,horizontal: 7.w),
                        child: SBoutton(
                          text: "تسجيل خروج",
                          width: MediaQuery.of(context).size.width,
                          color: Appcolors.primary,
                          OnTap: (){
                            cubit.logout(
                                (){
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=> LoginScreen()));
                                }
                            );
                          },
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        }
  },
),
),
    );
  }
}
