import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quiz_demo/app/constant.dart';
import 'package:quiz_demo/app/routes/app_pages.dart';
import 'package:quiz_demo/app/widgets/app_button.widget.dart';

import '../controllers/score_controller.dart';

class ScoreView extends GetView<ScoreController> {
  const ScoreView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                "Total correct answers",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "${controller.argument.correctAnswers} out of ${controller.argument.totalQuestion} questions",
                style: const TextStyle(
                  color: kGreenColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 50),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                width: Get.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    const Text(
                      "Your final score is",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: kPrimaryGradient,
                      ),
                      height: 150,
                      width: 150,
                      alignment: Alignment.center,
                      child: Text(
                        "${controller.score}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 30),
              AppButton(
                labelText: "Return Home",
                onPressed: _onPressed,
              )
            ],
          ),
        ),
      ),
    );
  }

  _onPressed() {
    Get.offAllNamed(Routes.HOME);
  }
}
