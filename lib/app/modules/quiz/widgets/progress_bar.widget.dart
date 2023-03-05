import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_demo/app/constant.dart';
import 'package:quiz_demo/app/modules/quiz/controllers/quiz_controller.dart';

class ProgressBar extends GetView<QuizController> {
  const ProgressBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.black38,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 10,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black12),
              ),
              alignment: Alignment.centerLeft,
              child: Obx(
                () => AnimatedContainer(
                  duration: const Duration(
                    milliseconds: 100,
                  ),
                  height: 14,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  width: (controller.currentQsNum - 1) *
                      Get.width /
                      controller.maxQs,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: kPrimaryGradient,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Obx(() => Text(
                "${controller.currentQsNum}/${controller.maxQs}",
                style: Theme.of(context).textTheme.headline5?.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),),
        ],
      ),
    );
  }
}
