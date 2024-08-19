import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:interview_app/viewmodels/home_viewmodel.dart';
import 'package:interview_app/viewmodels/interview_viewmodel.dart';

class FinalViewmodel extends GetxController {
  final RxString _apiKey = "".obs;
  final RxString _result = "".obs;
  final RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;
  String get result => _result.value;

  final HomeViewmodel homeViewmodel = Get.find();
  final InterviewViewmodel interviewViewmodel = Get.find();

  @override
  Future<void> onInit() async {
    super.onInit();
    await initializeGemini();
  }

  @override
  void onClose() {
    super.dispose();
  }

  Future<void> initializeGemini() async {
    _apiKey.value = dotenv.env['GEMINI_API_KEY']!;

    final model = GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: _apiKey.value,
      generationConfig: GenerationConfig(
        temperature: 1,
        topK: 64,
        topP: 0.95,
        maxOutputTokens: 8192,
        responseMimeType: 'text/plain',
      ),
    );

    final chat = model.startChat(history: []);
    final content = Content.text(
        "Anda adalah seorang HRD profesional dan seorang kritikus dalam menilai interview seseorang. Berikan penilaian anda sebagai seorang professional HRD dalam interview dengan posisi ${homeViewmodel.positionController.text} dan kualifikasi ${homeViewmodel.requirementController.text} serta tugas ${homeViewmodel.jobdeskController.text} berikan penilaian anda terhadap interview saya : ${interviewViewmodel.resultInterview}");
    try {
      _isLoading.value = true;
      final response = await chat.sendMessage(content);
      _result.value = response.text!;
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      _isLoading.value = false;
    }
  }
}
