// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Quiz _$QuizFromJson(Map<String, dynamic> json) => Quiz(
      (json['questions'] as List<dynamic>)
          .map((e) => QuizQuestion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuizToJson(Quiz instance) => <String, dynamic>{
      'questions': instance.questions,
    };

QuizQuestion _$QuizQuestionFromJson(Map<String, dynamic> json) => QuizQuestion(
      id: json['id'] as int,
      question: json['question'] as String,
      description: json['description'] as String?,
      answers: Answers.fromJson(json['answers'] as Map<String, dynamic>),
      multiple_correct_answers: json['multiple_correct_answers'] as String?,
      correct_answers: CorrectAnswers.fromJson(
          json['correct_answers'] as Map<String, dynamic>),
      explanation: json['explanation'] as String?,
      tip: json['tip'] as String?,
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      category: json['category'] as String,
      difficulty: json['difficulty'] as String,
    );

Map<String, dynamic> _$QuizQuestionToJson(QuizQuestion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'description': instance.description,
      'answers': instance.answers,
      'multiple_correct_answers': instance.multiple_correct_answers,
      'correct_answers': instance.correct_answers,
      'explanation': instance.explanation,
      'tip': instance.tip,
      'tags': instance.tags,
      'category': instance.category,
      'difficulty': instance.difficulty,
    };

Answers _$AnswersFromJson(Map<String, dynamic> json) => Answers(
      answer_a: json['answer_a'] as String?,
      answer_b: json['answer_b'] as String?,
      answer_c: json['answer_c'] as String?,
      answer_d: json['answer_d'] as String?,
      answer_e: json['answer_e'] as String?,
      answer_f: json['answer_f'] as String?,
    );

Map<String, dynamic> _$AnswersToJson(Answers instance) => <String, dynamic>{
      'answer_a': instance.answer_a,
      'answer_b': instance.answer_b,
      'answer_c': instance.answer_c,
      'answer_d': instance.answer_d,
      'answer_e': instance.answer_e,
      'answer_f': instance.answer_f,
    };

CorrectAnswers _$CorrectAnswersFromJson(Map<String, dynamic> json) =>
    CorrectAnswers(
      answer_a_correct: json['answer_a_correct'] as String,
      answer_b_correct: json['answer_b_correct'] as String,
      answer_c_correct: json['answer_c_correct'] as String,
      answer_d_correct: json['answer_d_correct'] as String,
      answer_e_correct: json['answer_e_correct'] as String,
      answer_f_correct: json['answer_f_correct'] as String,
    );

Map<String, dynamic> _$CorrectAnswersToJson(CorrectAnswers instance) =>
    <String, dynamic>{
      'answer_a_correct': instance.answer_a_correct,
      'answer_b_correct': instance.answer_b_correct,
      'answer_c_correct': instance.answer_c_correct,
      'answer_d_correct': instance.answer_d_correct,
      'answer_e_correct': instance.answer_e_correct,
      'answer_f_correct': instance.answer_f_correct,
    };
