import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_app/routes/route_name.dart';
import 'package:interview_app/viewmodels/interview_viewmodel.dart';
import 'package:interview_app/widgets/my_button.dart';

class InterviewScreen extends StatelessWidget {
  const InterviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final InterviewViewmodel interviewViewmodel = Get.put(InterviewViewmodel());

    return Scaffold(
        appBar: AppBar(
          title: const Text("Interview App"),
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/interview-process.png"),
              const SizedBox(
                height: 20,
              ),
              Obx(
                () => Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: 40,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: .26,
                            spreadRadius: interviewViewmodel.level * 2,
                            color: Colors.black.withOpacity(.05))
                      ],
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                    ),
                    child: const Icon(Icons.mic),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Obx(() {
                if (!interviewViewmodel.hasSpeech) {
                  return MyButton(
                    title: "Start Interview",
                    onPress: interviewViewmodel.startInterview,
                  );
                } else if (interviewViewmodel.isListening &&
                    !interviewViewmodel.isFinish) {
                  return MyButton(
                    title: "Stop Interview",
                    onPress: interviewViewmodel.stopInterview,
                  );
                } else {
                  return MyButton(
                    title: "Process Interview",
                    onPress: () => Get.offNamed(RouteName.result),
                  );
                }
              }),
            ],
          ),
        ));
  }
}
