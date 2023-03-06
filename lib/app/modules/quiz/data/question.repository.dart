import 'dart:convert';

import 'package:quiz_demo/app/modules/quiz/data/question.data_source.dart';
import 'package:quiz_demo/app/modules/quiz/models/question.model.dart';

class QuestionRepository {
  final QuestionDataSource questionDataSource;

  QuestionRepository({required this.questionDataSource});

  Future<List<QuestionModel>> getQuestions() async {
    final response = await questionDataSource.getQuestions();
    if (response.statusCode == 200) {
      final List<QuestionModel> result = jsonDecode(response.body)
          .map<QuestionModel>((item) => QuestionModel.fromJson(item))
          .toList();
      //
      for (var element in result) {
        element.answers = [element.correctAnswer, ...element.incorrectAnswers];
        element.answers.shuffle();
      }
      return result;
    } else {
      throw Exception('Failed to load album');
    }
  }
}
