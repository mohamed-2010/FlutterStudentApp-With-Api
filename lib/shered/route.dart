import 'package:flutter/material.dart';
import 'package:mrstudentapp/data/models/courses_model.dart';
import 'package:mrstudentapp/presentation/screens/course_pay_with_code.dart';
import 'package:mrstudentapp/presentation/screens/courses.dart';
import 'package:mrstudentapp/presentation/screens/dashboard.dart';
import 'package:mrstudentapp/presentation/screens/examquizes.dart';
import 'package:mrstudentapp/presentation/screens/exams.dart';
import 'package:mrstudentapp/presentation/screens/home.dart';
import 'package:mrstudentapp/presentation/screens/login.dart';
import 'package:mrstudentapp/presentation/screens/my_account.dart';
import 'package:mrstudentapp/presentation/screens/my_courses.dart';
import 'package:mrstudentapp/presentation/screens/my_results.dart';
import 'package:mrstudentapp/presentation/screens/on_boarding.dart';
import 'package:mrstudentapp/presentation/screens/quiz_pay_with_code.dart';
import 'package:mrstudentapp/presentation/screens/splash.dart';
import 'package:mrstudentapp/presentation/screens/watch_course.dart';
import 'package:mrstudentapp/shered/strings.dart';

class AppRoute{
  CoursesModel? course;
  Route? generateRoute(RouteSettings settings){
    switch(settings.name){
      case onboarding:
        {
          return MaterialPageRoute(builder: (_) => const OnboardingPage());
        }
      case splash:
        {
          return MaterialPageRoute(builder: (_) => const SplashScreen());
        }
      case loginpage:
        {
          return MaterialPageRoute(builder: (_) => LoginScreen());
        }
      case homepage:
        {
          return MaterialPageRoute(builder: (_) => HomeScreen());
        }
      case dashboard:
        {
          return MaterialPageRoute(builder: (_) => DashBoardScreen());
        }
      case courses:
        {
          return MaterialPageRoute(builder: (_) => const CoursesScreen());
        }
      case mycourses:
        {
          return MaterialPageRoute(builder: (_) => const MyCoursesScreen());
        }
      // case coursepaywithcode:
      //   {
      //     return MaterialPageRoute(builder: (_) => CoursePayWithCodeScreen(coursedetail: course!,));
      //   }
      // case watchcourses:
      //   {
      //     return MaterialPageRoute(builder: (_) => WatchCourseScreen());
      //   }
      case exams:
        {
          return MaterialPageRoute(builder: (_) => const ExamsScreen());
        }
      // case examquizes:
      //   {
      //     return MaterialPageRoute(builder: (_) => ExamQuizesScreen());
      //   }
      // case myresults:
      //   {
      //     return MaterialPageRoute(builder: (_) => const MyResultsScreen());
      //   }
      // case quizpaywithcode:
      //   {
      //     return MaterialPageRoute(builder: (_) => QuizPayWithCodeScreen());
      //   }
      case myaccount:
        {
          return MaterialPageRoute(builder: (_) => const MyAccountScreen());
        }
    }
  }
}