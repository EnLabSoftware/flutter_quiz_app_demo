import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_demo/app/constant.dart';
import 'package:quiz_demo/app/modules/quiz/controllers/quiz_controller.dart';
import 'package:quiz_demo/app/modules/quiz/models/question.model.dart';

class QuestionCard extends GetView<QuizController> {
  const QuestionCard({
    required this.question,
    Key? key,
  }) : super(key: key);

  final QuestionModel question;

  @override
  Widget build(BuildContext context) {
    return SizedBox();
    /*return Obx(
          () => Text.rich(
        TextSpan(
          text:
          "Question ${_questionController.questionNumber.value}",
          style: Theme.of(context)
              .textTheme
              .headline4
              .copyWith(color: kSecondaryColor),
          children: [
            TextSpan(
              text: "/${_questionController.questions.length}",
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(color: kSecondaryColor),
            ),
          ],
        ),
      ),
    );*/
  }
}
