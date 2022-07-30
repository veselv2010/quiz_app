import 'package:json_annotation/json_annotation.dart';

part 'result.g.dart';

@JsonSerializable()
class Result {
  final int date;
  final int correctAnswers;
  final int incorrectAnswers;
  final String difficulty;
  final String theme;

  const Result({
    required this.date,
    required this.correctAnswers,
    required this.incorrectAnswers,
    required this.difficulty,
    required this.theme,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
