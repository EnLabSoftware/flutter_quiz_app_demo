import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/score_controller.dart';

class ScoreView extends GetView<ScoreController> {
  const ScoreView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ScoreView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ScoreView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
