import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class InterviewViewmodel extends GetxController {
  final RxBool _hasSpeech = false.obs;
  final RxBool _isListening = true.obs;
  final RxBool _isFinish = false.obs;
  final RxString _errorListening = "".obs;
  final RxString _resultInterview = "".obs;
  final SpeechToText _speechToText = SpeechToText();
  final RxDouble _level = 0.0.obs;
  bool get hasSpeech => _hasSpeech.value;
  bool get isListening => _isListening.value;
  bool get isFinish => _isFinish.value;
  String get errorListening => _errorListening.value;
  String get resultInterview => _resultInterview.value;
  double get level => _level.value;

  @override
  Future<void> onInit() async {
    super.onInit();
    await speechInitialize();
  }

  @override
  void onClose() {
    _speechToText.stop();
    super.dispose();
  }

  Future<void> speechInitialize() async {
    try {
      await _speechToText.initialize();
    } catch (e) {
      debugPrint(e.toString());
      _errorListening.value = e.toString();
    }
  }

  void startInterview() async {
    _speechToText.listen(
        onResult: listening,
        pauseFor: const Duration(seconds: 5),
        listenOptions: SpeechListenOptions(
          listenMode: ListenMode.deviceDefault,
        ),
        onSoundLevelChange: (double levelResult) => _level.value = levelResult);

    _hasSpeech.value = true;
  }

  void listening(SpeechRecognitionResult result) {
    if (!_speechToText.isListening) {
      _isListening.value = _speechToText.isListening;
    }
    _resultInterview.value = result.recognizedWords;
  }

  void stopInterview() async {
    _speechToText.stop();
    _isFinish.value = true;
  }
}
