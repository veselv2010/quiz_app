// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'quiz.g.dart';

@JsonSerializable()
class Quiz {
  final List<QuizQuestion> questions;
  Quiz(this.questions);

  factory Quiz.fromJson(Map<String, dynamic> json) => _$QuizFromJson(json);
  Map<String, dynamic> toJson() => _$QuizToJson(this);
}

@JsonSerializable()
class QuizQuestion {
  final int id;
  final String question;
  final String? description;
  final Answers answers;
  final String? multiple_correct_answers;
  final CorrectAnswers correct_answers;
  final String? explanation;
  final String? tip;
  final List<Map<String, dynamic>>? tags;
  final String category;
  final String difficulty;

  QuizQuestion({
    required this.id,
    required this.question,
    required this.description,
    required this.answers,
    required this.multiple_correct_answers,
    required this.correct_answers,
    required this.explanation,
    required this.tip,
    required this.tags,
    required this.category,
    required this.difficulty,
  });

  factory QuizQuestion.fromJson(Map<String, dynamic> json) =>
      _$QuizQuestionFromJson(json);
  Map<String, dynamic> toJson() => _$QuizQuestionToJson(this);
}

@JsonSerializable()
class Answers {
  final String? answer_a;
  final String? answer_b;
  final String? answer_c;
  final String? answer_d;
  final String? answer_e;
  final String? answer_f;

  Answers({
    this.answer_a,
    this.answer_b,
    this.answer_c,
    this.answer_d,
    this.answer_e,
    this.answer_f,
  });

  factory Answers.fromJson(Map<String, dynamic> json) =>
      _$AnswersFromJson(json);
  Map<String, dynamic> toJson() => _$AnswersToJson(this);
}

@JsonSerializable()
class CorrectAnswers {
  final String answer_a_correct;
  final String answer_b_correct;
  final String answer_c_correct;
  final String answer_d_correct;
  final String answer_e_correct;
  final String answer_f_correct;

  CorrectAnswers({
    required this.answer_a_correct,
    required this.answer_b_correct,
    required this.answer_c_correct,
    required this.answer_d_correct,
    required this.answer_e_correct,
    required this.answer_f_correct,
  });

  factory CorrectAnswers.fromJson(Map<String, dynamic> json) =>
      _$CorrectAnswersFromJson(json);
  Map<String, dynamic> toJson() => _$CorrectAnswersToJson(this);
}
