import 'package:get/get.dart';
import 'package:interview_app/routes/route_name.dart';
import 'package:interview_app/screens/home_screen.dart';
import 'package:interview_app/screens/interview_screen.dart';
import 'package:interview_app/screens/result_screen.dart';

class AppPages {
  static final page = [
    GetPage(
      name: RouteName.home,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: RouteName.interview,
      page: () => const InterviewScreen(),
    ),
    GetPage(
      name: RouteName.result,
      page: () => const ResultScreen(),
    )
  ];
}
