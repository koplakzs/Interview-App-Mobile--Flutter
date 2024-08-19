import 'package:flutter/material.dart';
import 'package:interview_app/utils/colors.dart';
import 'package:interview_app/utils/custom_text_style.dart';
import 'package:interview_app/utils/fonts.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.title,this.onPress});
  final String title;
  final VoidCallback? onPress;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
          backgroundColor: Coloring.pr1200,
          fixedSize: Size(MediaQuery.of(context).size.width, 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          // foregroundColor: const Color.fromARGB(255, 250, 250, 250),
          overlayColor: Coloring.pr100
          // animationDuration: Duration(seconds: 5),

          ),
      child: Text(
        title,
        style: CustomTextStyle.base(
            color: Coloring.pr25, fontFamily: Fonts.poppinsMedium),
      ),
    );
  }
}
