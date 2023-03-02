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
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(
            question.question,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: kBlackColor),
          ),
          const SizedBox(height: kDefaultPadding / 2),
          ...List.generate(
            question.incorrectAnswers.length,
            (index) => Option(
              index: index,
              question: question,
              onPressed: () => controller.checkAns(question, index),
            ),
          ),
        ],
      ),
    );
  }
}

class Option extends StatelessWidget {
  const Option({
    Key? key,
    required this.question,
    required this.index,
    required this.onPressed,
  }) : super(key: key);
  final QuestionModel question;
  final int index;
  final VoidCallback onPressed;

  bool get isAnswer => question.selectedAnswer != null;

  Color get getTheRightColor {
    if (isAnswer) {
      if (question.answers[index] == question.selectedAnswer) {
        if (question.correctAnswer == question.selectedAnswer) {
          return kGreenColor;
        } else {
          return kRedColor;
        }
      }
    }
    return kGrayColor;
  }

  IconData get getTheRightIcon {
    return getTheRightColor == kRedColor ? Icons.close : Icons.done;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.only(top: kDefaultPadding),
        padding: const EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(
          border: Border.all(color: getTheRightColor),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                "${index + 1}. ${question.answers[index]}",
                style: TextStyle(color: getTheRightColor, fontSize: 16),
              ),
            ),
            Container(
              height: 26,
              width: 26,
              decoration: BoxDecoration(
                color: getTheRightColor == kGrayColor
                    ? Colors.transparent
                    : getTheRightColor,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: getTheRightColor),
              ),
              child: getTheRightColor == kGrayColor
                  ? null
                  : Icon(getTheRightIcon, size: 16),
            )
          ],
        ),
      ),
    );
  }
}
