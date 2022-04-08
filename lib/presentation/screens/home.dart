import 'package:flutter/material.dart';
import 'package:mrstudentapp/presentation/screens/courses.dart';
import 'package:mrstudentapp/presentation/screens/dashboard.dart';
import 'package:mrstudentapp/presentation/screens/exams.dart';
import 'package:mrstudentapp/presentation/screens/my_account.dart';

import '../widgets/bottom_nav.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNav(
        onTap: (int index) {
          controller.jumpToPage(index);
        },
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          DashBoardScreen(),
          CoursesScreen(),
          ExamsScreen(),
          MyAccountScreen()
        ],
      ),
    );
  }
}
