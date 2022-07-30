import 'package:appfox_test_app/core/data/firebase_repository.dart';
import 'package:appfox_test_app/core/data/quiz_repository.dart';
import 'package:appfox_test_app/core/domain/models/quiz.dart';
import 'package:appfox_test_app/core/domain/models/result.dart';
import 'package:appfox_test_app/presentation/quiz_page/bloc/quiz_bloc.dart';
import 'package:appfox_test_app/presentation/quiz_page/widgets/quiz_question_widget.dart';
import 'package:appfox_test_app/router/app_router.gr.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class QuizPage extends StatefulWidget {
  final String difficulty;
  final String category;

  const QuizPage({
    Key? key,
    @queryParam this.difficulty = 'easy',
    @queryParam this.category = 'Linux',
  }) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late final QuizRepository repository;
  late final FirebaseRepository firebaseRepository;
  late final PageController pageController;
  @override
  void initState() {
    repository = GetIt.I.get();
    firebaseRepository = GetIt.I.get();
    pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.category}/${widget.difficulty}'),
        automaticallyImplyLeading: false,
        leading: AutoLeadingButton(),
      ),
      body: FutureBuilder<Quiz?>(
        future: repository.getQuiz(
            category: widget.category, difficulty: widget.difficulty),
        builder: (context, snap) {
          if (snap.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snap.data == null) {
            return const Center(child: Text('No such quiz exists'));
          }

          final quiz = snap.data!;
          final initialState = QuizState.fromQuiz(quiz);

          return BlocProvider(
            create: (context) => QuizBloc(initialState),
            child: Builder(
              builder: (context) {
                return Column(
                  children: [
                    Expanded(
                      child: PageView.builder(
                        controller: pageController,
                        itemCount: quiz.questions.length,
                        itemBuilder: (context, index) {
                          return QuizQuestionWidget(
                            index: index,
                            question: quiz.questions.elementAt(index),
                          );
                        },
                      ),
                    ),
                    getPageViewControls(),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          final loadingDialog = showDialog(
                            context: context,
                            builder: (context) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                          final state = context.read<QuizBloc>().state;

                          final res = await firebaseRepository.sendResults(
                            Result(
                                date: DateTime.now().millisecondsSinceEpoch,
                                correctAnswers: state.getCorrectAnswersCount(),
                                incorrectAnswers:
                                    state.getIncorrectAnswersCount(),
                                difficulty: widget.difficulty,
                                theme: widget.category),
                          );

                          if (mounted) {
                            AutoRouter.of(context).pop();
                            AutoRouter.of(context)
                                .navigate(ResultPageRoute(resultId: res));
                          }
                        },
                        child: Text('End quiz'),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget getPageViewControls() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () => pageController.previousPage(
                duration: Duration(milliseconds: 150),
                curve: Curves.easeInOut,
              ),
              child: Text('Previous page'),
            ),
          ),
          const SizedBox(
            width: 16.0,
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: () => pageController.nextPage(
                duration: Duration(milliseconds: 150),
                curve: Curves.easeInOut,
              ),
              child: Text('Next page'),
            ),
          ),
        ],
      ),
    );
  }
}
