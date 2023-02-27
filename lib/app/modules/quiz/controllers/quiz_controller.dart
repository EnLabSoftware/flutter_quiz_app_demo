import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quiz_demo/app/modules/quiz/models/question.model.dart';

class QuizController extends GetxController {
  //TODO: Implement QuizController

  final questions = <QuestionModel>[].obs;
  final pageController = PageController();
  String? userName;

  Timer? timer;
  final RxInt _time = 0.obs;

  int get time => _time.value;
  int maxTime = const Duration(seconds: 30).inMilliseconds;

  final RxInt _currentQsNum = 3.obs;

  int get currentQsNum => _currentQsNum.value;

  int maxQs = 5;

  @override
  void onInit() {
    userName = Get.arguments;
    timer = Timer.periodic(const Duration(milliseconds: 100), (_timer) {
      _time.value += 100;
    });
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
