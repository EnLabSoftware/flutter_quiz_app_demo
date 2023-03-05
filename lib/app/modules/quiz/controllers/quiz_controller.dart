import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quiz_demo/app/modules/quiz/models/question.model.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_demo/app/modules/score/models/score.model.dart';
import 'package:quiz_demo/app/routes/app_pages.dart';

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

  final Rx<LoadStatus> _loadStatus = LoadStatus.none.obs;

  LoadStatus get loadStatus => _loadStatus.value;

  @override
  void onInit() {
    userName = Get.arguments;
    //
    _initData();
    //
    super.onInit();
  }

  @override
  void onClose() {
    _cancelTime();
    super.onClose();
  }

  Future<void> _initData() async {
    try {
      _loadStatus(LoadStatus.loading);
      await _getQuestions();
      _loadStatus(LoadStatus.success);
      //
      _startTime();
    } catch (e) {
      _loadStatus(LoadStatus.error);
    }
  }

  Future<void> _getQuestions() async {
    final response = await http
        .get(Uri.parse('https://the-trivia-api.com/api/questions?limit=5'));
    if (response.statusCode == 200) {
      final List<QuestionModel> result = jsonDecode(response.body)
          .map<QuestionModel>((item) => QuestionModel.fromJson(item))
          .toList();
      for (var element in result) {
        element.answers = [element.correctAnswer, ...element.incorrectAnswers];
        element.answers.shuffle();
      }
      questions.value = result;
      //
    } else {
      throw Exception('Failed to load album');
    }
  }

  checkAns(QuestionModel question, int index) {
    question.selectedAnswer = question.answers[index];
    questions.refresh();
  }

  handleNext() {
    if (currentQsNum != questions.length) {
      _nextQuestion();
    } else {
      _finishQuiz();
    }
  }

  void _finishQuiz() {
    _cancelTime();
    //
    int correctAnswers = questions.where((_) => _.isCorrect).length;
    Get.offAllNamed(
      Routes.SCORE,
      arguments:
          ScoreArgument(correctAnswers: correctAnswers, totalQuestion: maxQs),
    );
  }

  void _nextQuestion() {
    pageController.nextPage(
        duration: Duration(milliseconds: 250), curve: Curves.ease);
    _currentQsNum.value++;
    _resetTime();
  }

  void _startTime() {
    timer = Timer.periodic(const Duration(milliseconds: 100), (_timer) {
      _time.value += 100;
      if (time == maxTime) handleNext();
    });
  }

  void _resetTime() {
    _time.value = 0;
  }

  void _cancelTime() {
    timer?.cancel();
  }
}
