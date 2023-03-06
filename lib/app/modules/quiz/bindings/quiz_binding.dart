import 'package:get/get.dart';
import 'package:quiz_demo/app/modules/quiz/data/question.data_source.dart';
import 'package:quiz_demo/app/modules/quiz/data/question.repository.dart';

import '../controllers/quiz_controller.dart';

class QuizBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuizController>(
      () => QuizController(
        questionRepository: QuestionRepository(
          questionDataSource: QuestionDataSource(),
        ),
      ),
    );
  }
}
