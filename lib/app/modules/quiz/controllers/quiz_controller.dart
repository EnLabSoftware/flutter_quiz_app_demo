import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quiz_demo/app/modules/quiz/data/question.repository.dart';
import 'package:quiz_demo/app/modules/quiz/models/question.model.dart';
import 'package:quiz_demo/app/modules/score/models/score.model.dart';
import 'package:quiz_demo/app/routes/app_pages.dart';

class QuizController extends GetxController {
  final QuestionRepository questionRepository;

  QuizController({required this.questionRepository});

  final RxList<QuestionModel> questions = <QuestionModel>[].obs;
  final pageController = PageController();

  String? userName;

  Timer? _timer;
  final RxInt _time = 0.obs;

  int get time => _time.value;
  int maxTime = const Duration(seconds: 30).inMilliseconds;

  final RxInt _currentQsNum = 1.obs;

  int get currentQsNum => _currentQsNum.value;

  int totalQuestion = 5;

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
    try {
      final result = await questionRepository.getQuestions();
      questions.value = result;
    } catch (e) {
      log(e.toString());
    }
  }

  checkAns(QuestionModel question, int index) {
    question.selectedAnswer = question.answers[index];
    questions.refresh();
  }

  handleNext() {
    if (currentQsNum < questions.length) {
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
      arguments: ScoreArgument(
          correctAnswers: correctAnswers, totalQuestion: totalQuestion),
    );
  }

  void _nextQuestion() {
    pageController.nextPage(
        duration: const Duration(milliseconds: 250), curve: Curves.ease);
    //
    _increaseCurrentQsNum();
    //
    _resetTime();
  }

  void _increaseCurrentQsNum() {
    _currentQsNum.value++;
  }

  void _startTime() {
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      _time.value += 100;
      if (time == maxTime) handleNext();
    });
  }

  void _resetTime() {
    _time.value = 0;
  }

  void _cancelTime() {
    _timer?.cancel();
  }
}
