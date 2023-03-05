import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_demo/app/modules/quiz/controllers/quiz_controller.dart';

class TimerBar extends GetView<QuizController> {
  const TimerBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Obx(
              () => SizedBox(
                width: 40,
                height: 40,
                child: CircularProgressIndicator(
                    value: controller.time / controller.maxTime,
                    strokeWidth: 7,
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.tealAccent)),
              ),
            ),
            const Positioned(child: Icon(Icons.access_time))
          ],
        ),
        const SizedBox(width: 12),
        Obx(
          () {
            final time =
                "${timeInSecond(controller.time)}/${timeInSecond(controller.maxTime)}s";
            return Text(time);
          },
        ),
      ],
    );
  }

  int timeInSecond(int millisecond) =>
      Duration(milliseconds: millisecond).inSeconds;
}
