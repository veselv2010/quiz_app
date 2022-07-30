part of 'quiz_bloc.dart';

@immutable
class QuizState {
  final List<QuestionState> questionsState;

  const QuizState(
    this.questionsState,
  );

  int getCorrectAnswersCount() {
    return questionsState.where((element) => element.isAnswerCorrect()).length;
  }

  int getIncorrectAnswersCount() {
    return questionsState.where((element) => !element.isAnswerCorrect()).length;
  }

  factory QuizState.fromQuiz(Quiz quiz) {
    return QuizState(
      quiz.questions.map((e) => QuestionState.fromQuestion(e)).toList(),
    );
  }

  QuizState getUpdatedAnswerAState(int index, bool isRight) {
    final newState = [...questionsState];
    newState[index] = newState[index].copyWith(answerA: isRight);
    return QuizState(newState);
  }

  QuizState getUpdatedAnswerBState(int index, bool isRight) {
    final newState = [...questionsState];
    newState[index] = newState[index].copyWith(answerB: isRight);
    return QuizState(newState);
  }

  QuizState getUpdatedAnswerCState(int index, bool isRight) {
    final newState = [...questionsState];
    newState[index] = newState[index].copyWith(answerC: isRight);
    return QuizState(newState);
  }

  QuizState getUpdatedAnswerDState(int index, bool isRight) {
    final newState = [...questionsState];
    newState[index] = newState[index].copyWith(answerD: isRight);
    return QuizState(newState);
  }

  QuizState getUpdatedAnswerEState(int index, bool isRight) {
    final newState = [...questionsState];
    newState[index] = newState[index].copyWith(answerE: isRight);
    return QuizState(newState);
  }

  QuizState getUpdatedAnswerFState(int index, bool isRight) {
    final newState = [...questionsState];
    newState[index] = newState[index].copyWith(answerF: isRight);
    return QuizState(newState);
  }
}

@immutable
class QuestionState {
  final bool? answerA;
  final bool? answerB;
  final bool? answerC;
  final bool? answerD;
  final bool? answerE;
  final bool? answerF;

  final bool? correctAnswerA;
  final bool? correctAnswerB;
  final bool? correctAnswerC;
  final bool? correctAnswerD;
  final bool? correctAnswerE;
  final bool? correctAnswerF;
  const QuestionState({
    required this.answerA,
    required this.answerB,
    required this.answerC,
    required this.answerD,
    required this.answerE,
    required this.answerF,
    required this.correctAnswerA,
    required this.correctAnswerB,
    required this.correctAnswerC,
    required this.correctAnswerD,
    required this.correctAnswerE,
    required this.correctAnswerF,
  });

  factory QuestionState.fromQuestion(QuizQuestion question) {
    return QuestionState(
      answerA: question.answers.answer_a != null ? false : null,
      answerB: question.answers.answer_b != null ? false : null,
      answerC: question.answers.answer_c != null ? false : null,
      answerD: question.answers.answer_d != null ? false : null,
      answerE: question.answers.answer_e != null ? false : null,
      answerF: question.answers.answer_f != null ? false : null,
      correctAnswerA:
          question.correct_answers.answer_a_correct.toLowerCase() == 'true'
              ? true
              : false,
      correctAnswerB:
          question.correct_answers.answer_b_correct.toLowerCase() == 'true'
              ? true
              : false,
      correctAnswerC:
          question.correct_answers.answer_c_correct.toLowerCase() == 'true'
              ? true
              : false,
      correctAnswerD:
          question.correct_answers.answer_d_correct.toLowerCase() == 'true'
              ? true
              : false,
      correctAnswerE:
          question.correct_answers.answer_e_correct.toLowerCase() == 'true'
              ? true
              : false,
      correctAnswerF:
          question.correct_answers.answer_f_correct.toLowerCase() == 'true'
              ? true
              : false,
    );
  }

  bool isAnswerCorrect() {
    return (answerA ?? false) == correctAnswerA &&
        (answerB ?? false) == correctAnswerB &&
        (answerC ?? false) == correctAnswerC &&
        (answerD ?? false) == correctAnswerD &&
        (answerE ?? false) == correctAnswerE &&
        (answerF ?? false) == correctAnswerF;
  }

  QuestionState copyWith({
    bool? answerA,
    bool? answerB,
    bool? answerC,
    bool? answerD,
    bool? answerE,
    bool? answerF,
    bool? correctAnswerA,
    bool? correctAnswerB,
    bool? correctAnswerC,
    bool? correctAnswerD,
    bool? correctAnswerE,
    bool? correctAnswerF,
  }) {
    return QuestionState(
      answerA: answerA ?? this.answerA,
      answerB: answerB ?? this.answerB,
      answerC: answerC ?? this.answerC,
      answerD: answerD ?? this.answerD,
      answerE: answerE ?? this.answerE,
      answerF: answerF ?? this.answerF,
      correctAnswerA: correctAnswerA ?? this.correctAnswerA,
      correctAnswerB: correctAnswerB ?? this.correctAnswerB,
      correctAnswerC: correctAnswerC ?? this.correctAnswerC,
      correctAnswerD: correctAnswerD ?? this.correctAnswerD,
      correctAnswerE: correctAnswerE ?? this.correctAnswerE,
      correctAnswerF: correctAnswerF ?? this.correctAnswerF,
    );
  }
}
