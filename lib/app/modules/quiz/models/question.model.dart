import 'package:json_annotation/json_annotation.dart';

part 'question.model.g.dart';

@JsonSerializable()
class QuestionModel {
  final String id, question, correctAnswer;
  final List<String> incorrectAnswers;

  @JsonKey(includeFromJson: false, includeToJson: false)
  List<String> answers;
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? selectedAnswer;

  QuestionModel({
    required this.id,
    required this.question,
    required this.correctAnswer,
    required this.incorrectAnswers,
    this.answers = const [],
    this.selectedAnswer,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionModelToJson(this);
}
