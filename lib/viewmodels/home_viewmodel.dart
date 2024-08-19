import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViewmodel extends GetxController {
  late TextEditingController _positionController;
  late TextEditingController _requirementController;
  late TextEditingController _jobdeskController;
  final RxBool _isPositionValid = false.obs;
  final RxBool _isRequirementValid = false.obs;
  final RxBool _isJobdeskValid = false.obs;

  set isPositionValid(value) => _isPositionValid.value = value;

  TextEditingController get positionController => _positionController;
  TextEditingController get requirementController => _requirementController;
  TextEditingController get jobdeskController => _jobdeskController;
  bool get isPositionValid => _isPositionValid.value;
  bool get isRequirementValid => _isRequirementValid.value;
  bool get isJobdeskValid => _isJobdeskValid.value;

  @override
  Future<void> onInit() async {
    super.onInit();
    _positionController = TextEditingController();
    _requirementController = TextEditingController();
    _jobdeskController = TextEditingController();
  }

  @override
  void onClose() {
    super.dispose();
  }

  void validatePosition(String value) {
    _positionController.text = value;
    _isPositionValid.value = value.isNotEmpty;
  }

  void validateRequirement(String value) {
    _requirementController.text = value;
    _isRequirementValid.value = value.isNotEmpty;
  }

  void validateJobdesk(String value) {
    _jobdeskController.text = value;
    _isJobdeskValid.value = value.isNotEmpty;
  }
}
