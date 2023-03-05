import 'package:get/get.dart';
import 'package:quiz_demo/app/modules/score/models/score.model.dart';

class ScoreController extends GetxController {
  //TODO: Implement ScoreController

  late final ScoreArgument argument;

  late final double score;

  @override
  void onInit() {
    argument = Get.arguments;
    //
    _calculateScore();
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

  void _calculateScore() {
    score = argument.correctAnswers / argument.totalQuestion * 10;
  }
}
