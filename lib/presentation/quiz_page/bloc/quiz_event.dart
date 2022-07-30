part of 'quiz_bloc.dart';

@immutable
abstract class QuizEvent {}

class QuizAnswerAEvent extends QuizEvent {
  final int index;
  final bool isRight;
  QuizAnswerAEvent({
    required this.index,
    required this.isRight,
  });
}

class QuizAnswerBEvent extends QuizEvent {
  final int index;
  final bool isRight;
  QuizAnswerBEvent({
    required this.index,
    required this.isRight,
  });
}

class QuizAnswerCEvent extends QuizEvent {
  final int index;
  final bool isRight;
  QuizAnswerCEvent({
    required this.index,
    required this.isRight,
  });
}

class QuizAnswerDEvent extends QuizEvent {
  final int index;
  final bool isRight;
  QuizAnswerDEvent({
    required this.index,
    required this.isRight,
  });
}

class QuizAnswerEEvent extends QuizEvent {
  final int index;
  final bool isRight;
  QuizAnswerEEvent({
    required this.index,
    required this.isRight,
  });
}

class QuizAnswerFEvent extends QuizEvent {
  final int index;
  final bool isRight;
  QuizAnswerFEvent({
    required this.index,
    required this.isRight,
  });
}
