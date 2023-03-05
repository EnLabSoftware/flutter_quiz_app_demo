import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quiz_demo/app/constant.dart';
import 'package:quiz_demo/app/modules/quiz/models/question.model.dart';
import 'package:quiz_demo/app/modules/quiz/widgets/timer_bar.widget.dart';
import 'package:quiz_demo/app/modules/quiz/widgets/progress_bar.widget.dart';
import 'package:quiz_demo/app/modules/quiz/widgets/question_card.widget.dart';

import '../controllers/quiz_controller.dart';

class QuizView extends GetView<QuizController> {
  const QuizView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
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
      body: const SafeArea(
        child: QuizBody(),
      ),
    );
  }
}

class QuizBody extends GetView<QuizController> {
  const QuizBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (controller.loadStatus) {
        case LoadStatus.none:
        case LoadStatus.error:
          return const SizedBox();
        case LoadStatus.loading:
          return const Center(child: CupertinoActivityIndicator());
        case LoadStatus.success:
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Column(
              children: [
                const ProgressBar(),
                const SizedBox(height: 12),
                const TimerBar(),
                const SizedBox(height: 12),
                const Divider(thickness: 1.5),
                const SizedBox(height: 12),
                Obx(
                  () => Expanded(
                    child: PageView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: controller.pageController,
                      itemCount: controller.questions.length,
                      itemBuilder: (context, index) =>
                          QuestionCard(question: controller.questions[index]),
                    ),
                  ),
                ),
              ],
            ),
          );
      }
    });
  }
}
