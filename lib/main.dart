import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:interview_app/routes/app_pages.dart';
import 'package:interview_app/routes/route_name.dart';
import 'package:interview_app/utils/colors.dart';
import 'package:interview_app/utils/custom_text_style.dart';
import 'package:interview_app/utils/fonts.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Coloring.pr1200,
          titleTextStyle: CustomTextStyle.base(
            color: Coloring.pr00,
            fontFamily: Fonts.poppinsBold,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
          centerTitle: true,
          iconTheme: const IconThemeData(
            color: Coloring.pr25,
          ),
        ),
        scaffoldBackgroundColor: Coloring.pr25,
      ),
      initialRoute: RouteName.home,
      getPages: AppPages.page,
    );
  }
}
