import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_demo/app/constant.dart';
import 'package:quiz_demo/app/modules/quiz/controllers/quiz_controller.dart';
import 'package:quiz_demo/app/modules/quiz/models/question.model.dart';
import 'package:quiz_demo/app/widgets/app_button.widget.dart';

class QuestionCard extends GetView<QuizController> {
  const QuestionCard({
    required this.question,
    Key? key,
  }) : super(key: key);

  final QuestionModel question;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(kDefaultPadding),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                gradient: LinearGradient(
                  colors: [Colors.white, Colors.white.withOpacity(1)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                )),
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
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Option(
                        index: index,
                        question: question,
                        onPressed: () => controller.checkAns(question, index),
                      );
                    },
                    itemCount: question.incorrectAnswers.length,
                    shrinkWrap: true,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        Align(
          alignment: Alignment.centerRight,
          child: AppButton(
            width: 120,
            labelText: labelText,
            onPressed: controller.handleNext,
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }

  String get labelText {
    return question.isAnswered
        ? controller.currentQsNum == controller.maxQs
            ? "Finish"
            : "Next"
        : "Skip";
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

  Color get color {
    if (question.isAnswered) {
      if (question.answers[index] == question.selectedAnswer) {
        if (question.isCorrect) {
          return kGreenColor;
        } else {
          return kRedColor;
        }
      }
    }
    return kGrayColor;
  }

  IconData get iconData {
    return color == kRedColor ? Icons.close : Icons.done;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: question.isAnswered ? null : onPressed,
      child: Container(
        margin: const EdgeInsets.only(top: kDefaultPadding),
        padding: const EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(
          border: Border.all(color: color),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                "${index + 1}. ${question.answers[index]}",
                style: TextStyle(color: color, fontSize: 16),
              ),
            ),
            Container(
              height: 26,
              width: 26,
              decoration: BoxDecoration(
                color: color == kGrayColor ? Colors.transparent : color,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: color),
              ),
              child: color == kGrayColor ? null : Icon(iconData, size: 16),
            )
          ],
        ),
      ),
    );
  }
}
