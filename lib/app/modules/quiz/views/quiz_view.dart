import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quiz_demo/app/constant.dart';
import 'package:quiz_demo/app/modules/quiz/widgets/timer_bar.widget.dart';
import 'package:quiz_demo/app/modules/quiz/widgets/progress_bar.widget.dart';
import 'package:quiz_demo/app/modules/quiz/widgets/question_card.widget.dart';

import '../controllers/quiz_controller.dart';

class QuizView extends GetView<QuizController> {
  const QuizView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: controller.userName != null &&
                controller.userName!.trim().isNotEmpty
            ? Text('Hello ${controller.userName}')
            : null,
        elevation: 0,
        centerTitle: false,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset("assets/images/bg4.png", fit: BoxFit.fill),
          SafeArea(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: ProgressBar(),
                ),
                const SizedBox(height: kDefaultPadding),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: TimerBar(),
                ),
                const Divider(thickness: 1.5),
                const SizedBox(height: kDefaultPadding),
                Obx(
                    ()=> Expanded(
                    child: PageView.builder(
                      // Block swipe to next qn
                      physics: const NeverScrollableScrollPhysics(),
                      controller: controller.pageController,
                      onPageChanged: controller.updateTheQnNum,
                      itemCount: controller.questions.length,
                      itemBuilder: (context, index) =>
                          QuestionCard(question: controller.questions[index]),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
