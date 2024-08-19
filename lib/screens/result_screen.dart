import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_app/routes/route_name.dart';
import 'package:interview_app/utils/custom_text_style.dart';
import 'package:interview_app/utils/fonts.dart';
import 'package:interview_app/viewmodels/final_viewmodel.dart';
import 'package:interview_app/widgets/my_button.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FinalViewmodel finalViewmodel = Get.put(FinalViewmodel());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Result Your Interview"),
      ),
      body: Obx(
        () => finalViewmodel.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 10,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FormattedText(text: finalViewmodel.result),
                      const SizedBox(
                        height: 30,
                      ),
                      MyButton(
                        title: "Back To Home",
                        onPress: () => Get.offAllNamed(RouteName.home),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

class FormattedText extends StatelessWidget {
  final String text;

  const FormattedText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.justify,
      text: TextSpan(
        style: CustomTextStyle.base(),
        children: _parseText(text),
      ),
    );
  }

  List<TextSpan> _parseText(String text) {
    final List<TextSpan> spans = [];
    final regexBold = RegExp(
        r'\*\*(.*?)\*\*'); // Untuk menemukan string diapit oleh bintang 2
    final regexFence = RegExp(r'^##[^\n\r]+',
        multiLine: true); // Deteksi kalimat yang dimulai dengan ##
    int lastMatchEnd = 0;

    // Mencari dan memformat string yang diapit oleh bintang 2
    final matchesBold = regexBold.allMatches(text);
    for (final match in matchesBold) {
      if (match.start > lastMatchEnd) {
        spans.add(TextSpan(text: text.substring(lastMatchEnd, match.start)));
      }
      spans.add(TextSpan(
        text: match.group(1),
        style:
            CustomTextStyle.base(fontFamily: Fonts.poppinsBold, fontSize: 15),
      ));
      lastMatchEnd = match.end;
    }
    final matchesFence = regexFence.allMatches(text);
    for (final match in matchesFence) {
      if (match.start > lastMatchEnd) {
        spans.add(TextSpan(text: text.substring(lastMatchEnd, match.start)));
      }
      spans.add(TextSpan(
        text: match.group(0)?.substring(2).trim(),
        style:
            CustomTextStyle.base(fontFamily: Fonts.poppinsBold, fontSize: 16),
      ));
      lastMatchEnd = match.end;
    }

    // Tambahkan sisa teks jika ada
    if (lastMatchEnd < text.length) {
      spans.add(TextSpan(text: text.substring(lastMatchEnd)));
    }

    return spans;
  }
}
