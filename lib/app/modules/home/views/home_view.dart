import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quiz_demo/app/constant.dart';
import 'package:quiz_demo/app/routes/app_pages.dart';
import 'package:quiz_demo/app/widgets/app_button.widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String? _fullName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(flex: 2), //2/6
              Text(
                "Let's Play Quiz,",
                style: Theme.of(context).textTheme.headline4?.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              const Text("Enter your informations below"),
              const Spacer(), // 1/6
              TextField(
                decoration: const InputDecoration(
                  filled: true,
                  hintText: "Full Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
                onChanged: _onNameChanged,
              ),
              const Spacer(), // 1/6
              AppButton(
                width: Get.width,
                onPressed: _onPressed,
                labelText: "Start Quiz",
              ),
              const Spacer(flex: 2), // it will take 2/6 spaces
            ],
          ),
        ),
      ),
    );
  }

  _onPressed() {
    Get.toNamed(Routes.QUIZ, arguments: _fullName);
  }

  void _onNameChanged(String value) {
    _fullName = value;
  }
}
