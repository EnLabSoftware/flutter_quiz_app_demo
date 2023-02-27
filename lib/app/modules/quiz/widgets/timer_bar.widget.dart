import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_demo/app/constant.dart';
import 'package:quiz_demo/app/modules/quiz/controllers/quiz_controller.dart';

class TimerBar extends GetView<QuizController> {
  const TimerBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Obx(
          () => CircularProgressIndicator(
            value: controller.time / controller.maxTime,
            strokeWidth: 5,
             valueColor:const AlwaysStoppedAnimation<Color>(Colors.cyanAccent)
          ),
        ),
        const Positioned(child: Text("30s"))
      ],
    );
  }
}
