import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrstudentapp/bloc/auth/authintcation_cubit.dart';
import 'package:mrstudentapp/bloc/coursepaywithcode/course_pay_with_code_cubit.dart';
import 'package:mrstudentapp/bloc/courses/courses_cubit.dart';
import 'package:mrstudentapp/bloc/exams/exams_cubit.dart';
import 'package:mrstudentapp/bloc/examspaywithcode/exams_pay_with_code_cubit.dart';
import 'package:mrstudentapp/bloc/lessons/lessons_cubit.dart';
import 'package:mrstudentapp/bloc/onboarding/on_boarding_cubit.dart';
import 'package:mrstudentapp/presentation/screens/home.dart';
import 'package:mrstudentapp/presentation/screens/login.dart';
import 'package:mrstudentapp/presentation/screens/on_boarding.dart';
import 'package:mrstudentapp/shered/route.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final bool? seen = prefs.getBool('seen');
  final String token = prefs.getString('token').toString();
 //prefs.setBool('seen', false);
  //prefs.setString("token", "");
  final Widget widget;
  if(seen != null && seen != false){
    if(token != null && token != ''){
      widget = HomeScreen();
    }else{
      widget = LoginScreen();
    }
  }else{
    widget = OnboardingPage();
  }
  runApp(MyApp(
    seen: seen,
    approute: AppRoute(),
    widget: widget,
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key,required this.seen,required this.approute,required this.widget}) : super(key: key);
  final bool? seen;
  final AppRoute approute;
  final Widget widget;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (BuildContext context, Orientation orientation, deviceType) {
          return MultiBlocProvider(
              providers: [
                BlocProvider(create: (context) => OnBoardingCubit()),
                BlocProvider(create: (context) => CoursesCubit()),
                BlocProvider(create: (context) => AuthintcationCubit()),
                BlocProvider(create: (context) => CoursePayWithCodeCubit()),
                BlocProvider(create: (context) => LessonsCubit()),
                BlocProvider(create: (context) => ExamsPayWithCodeCubit()),
                BlocProvider(create: (context) => ExamsCubit()),
              ],
          child: MaterialApp(
            onGenerateRoute: approute.generateRoute,
            home: widget,
            debugShowCheckedModeBanner: false,
          ));
    }
    );
  }
}