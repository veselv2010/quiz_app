import 'package:appfox_test_app/core/domain/models/quiz.dart';
import 'package:appfox_test_app/presentation/quiz_page/bloc/quiz_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizQuestionWidget extends StatelessWidget {
  final int index;
  final QuizQuestion question;

  const QuizQuestionWidget({
    Key? key,
    required this.question,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<QuizBloc, QuizState, QuestionState>(
      selector: (state) => state.questionsState[index],
      builder: (context, state) {
        return Column(
          children: [
            Text(question.question),
            const SizedBox(
              height: 16.0,
            ),
            if (state.answerA != null)
              CheckboxListTile(
                value: state.answerA,
                title: Text(question.answers.answer_a!),
                onChanged: (value) {
                  context.read<QuizBloc>().add(
                        QuizAnswerAEvent(
                          index: index,
                          isRight: value!,
                        ),
                      );
                },
              ),
            if (state.answerB != null)
              CheckboxListTile(
                value: state.answerB,
                title: Text(question.answers.answer_b!),
                onChanged: (value) {
                  context.read<QuizBloc>().add(
                        QuizAnswerBEvent(
                          index: index,
                          isRight: value!,
                        ),
                      );
                },
              ),
            if (state.answerC != null)
              CheckboxListTile(
                value: state.answerC,
                title: Text(question.answers.answer_c!),
                onChanged: (value) {
                  context.read<QuizBloc>().add(
                        QuizAnswerCEvent(
                          index: index,
                          isRight: value!,
                        ),
                      );
                },
              ),
            if (state.answerD != null)
              CheckboxListTile(
                value: state.answerD,
                title: Text(question.answers.answer_d!),
                onChanged: (value) {
                  context.read<QuizBloc>().add(
                        QuizAnswerDEvent(
                          index: index,
                          isRight: value!,
                        ),
                      );
                },
              ),
            if (state.answerE != null)
              CheckboxListTile(
                value: state.answerE,
                title: Text(question.answers.answer_e!),
                onChanged: (value) {
                  context.read<QuizBloc>().add(
                        QuizAnswerEEvent(
                          index: index,
                          isRight: value!,
                        ),
                      );
                },
              ),
            if (state.answerF != null)
              CheckboxListTile(
                value: state.answerF,
                title: Text(question.answers.answer_f!),
                onChanged: (value) {
                  context.read<QuizBloc>().add(
                        QuizAnswerFEvent(
                          index: index,
                          isRight: value!,
                        ),
                      );
                },
              ),
          ],
        );
      },
    );
  }
}
