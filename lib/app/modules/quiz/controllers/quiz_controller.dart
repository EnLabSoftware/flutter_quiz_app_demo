import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quiz_demo/app/modules/quiz/models/question.model.dart';

class QuizController extends GetxController {
  //TODO: Implement QuizController

  final questions = <QuestionModel>[].obs;
  final pageController = PageController();
  String? userName;

  @override
  void onInit() {
    userName = Get.arguments;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void updateTheQnNum(int value) {}
}
