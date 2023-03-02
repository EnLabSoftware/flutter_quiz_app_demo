import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quiz_demo/app/modules/quiz/models/question.model.dart';
import 'package:http/http.dart' as http;

class QuizController extends GetxController {
  //TODO: Implement QuizController

  final RxList<QuestionModel> questions = <QuestionModel>[].obs;
  final pageController = PageController();
  String? userName;

  Timer? timer;
  final RxInt _time = 0.obs;

  int get time => _time.value;
  int maxTime = const Duration(seconds: 30).inMilliseconds;

  final RxInt _currentQsNum = 1.obs;

  int get currentQsNum => _currentQsNum.value;

  int maxQs = 5;

  @override
  void onInit() {
    userName = Get.arguments;
    _getQuestions();
    super.onInit();
  }

  void _startTime() {
    timer = Timer.periodic(const Duration(milliseconds: 100), (_timer) {
      _time.value += 100;
      if (time == maxTime) nextQuestion();
    });
  }

  void _resetTime() {
    _time.value = 0;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    _cancelTime();
    super.onClose();
  }

  void updateTheQnNum(int value) {}

  Future<void> _getQuestions() async {
    final response = await http
        .get(Uri.parse('https://the-trivia-api.com/api/questions?limit=5'));

    if (response.statusCode == 200) {
      final List<QuestionModel> result = jsonDecode(response.body)
          .map<QuestionModel>((item) => QuestionModel.fromJson(item))
          .toList();
      result.forEach((element) {
        element.answers = [element.correctAnswer, ...element.incorrectAnswers];
      });
      questions.value = result;
      //
      _startTime();
    } else {
      throw Exception('Failed to load album');
    }
  }

  checkAns(QuestionModel question, int index) {
    question.selectedAnswer = question.answers[index];
    questions.refresh();
    Future.delayed(Duration(seconds: 2)).then((value) => nextQuestion());
  }

  nextQuestion() {
    if (currentQsNum != questions.length) {
      pageController.nextPage(
          duration: Duration(milliseconds: 250), curve: Curves.ease);
      _currentQsNum.value++;
      _resetTime();
    } else {
      _cancelTime();
      // Get package provide us simple way to naviigate another page
      //Get.to(ScoreScreen());
    }
  }

  void _cancelTime() {
    timer?.cancel();
  }
}
