import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrstudentapp/bloc/auth/authintcation_cubit.dart';
import 'package:mrstudentapp/presentation/widgets/Sboutton.dart';
import 'package:mrstudentapp/presentation/widgets/Stext_filed.dart';
import 'package:mrstudentapp/shered/styles/colors.dart';
import 'package:sizer/sizer.dart';

import '../../shered/strings.dart';
import '../widgets/mysnackbar.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  final _fomkey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AuthintcationCubit authcubit = BlocProvider.of(context);
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<AuthintcationCubit, AuthintcationState>(
          listener: (context, state) {
            if (state is AuthenticationSuccessState) {
              Navigator.pushReplacementNamed(context, homepage);
            }
            if (state is AuthenticationErrortate) {
              // Showing the error message if the user has entered invalid credentials
              MySnackBar.error(
                  message: state.error.toString(),
                  color: Colors.red,
                  context: context);
            }
          },
          builder: (context, state) {
            if (state is AuthenticationLoadingState) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(child: const CircularProgressIndicator()),
                ],
              );
            }
            if (state is! AuthenticationSuccessState) {
                return SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Appcolors.primary,
                    child: Form(
                      key: _fomkey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Image.asset('assets/images/logo/Logo.png',
                                width: 70.w, height: 12.h),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: Text(
                              SappName,
                              style: TextStyle(
                                  fontSize: 30.sp,
                                  color: Appcolors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: Text(
                              SLoginDesc,
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: Appcolors.white,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                        Container(
                            height: 52.h,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(30),
                                    topLeft: Radius.circular(30)),
                                color: Appcolors.lightbase2),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 5.h),
                                    child: Column(
                                      children: [
                                        STextFiled(
                                            hint: SEmail,
                                            validator: (value){
                                              return value!.length <= 1 ? 'الرجاء إدخل أسم المستخدم بشكل صحيح!!' : null;
                                            },
                                            icon: Icons.email_outlined,
                                            textEditingController: email),
                                        SizedBox(
                                          height: 3.h,
                                        ),
                                        STextFiled(
                                            hint: SPassword,
                                            validator: (value){
                                              return value!.length < 6 ? 'الرجاء إدخال كلمة المرور بشكل صحيح!!' : null;
                                            },
                                            icon: Icons.password_outlined,
                                            textEditingController: password)
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  SBoutton(
                                    text: Slogin,
                                    width: 90.w,
                                    color: Appcolors.primary,
                                    OnTap: (){
                                      _authenticatewithemailandpass(context, authcubit);
                                    },
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  Text(
                                      "جميع الحقوق محفوظة لدي \n   ©المهندس محمد أحمد  ")
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
            }
            return Container();
          },
        ),
      ),
    );
  }

  void _authenticatewithemailandpass(context, AuthintcationCubit cubit) {
    if (_fomkey.currentState!.validate()) {
      cubit.login(
          email: email.text, password: password.text);
    }
  }
}
