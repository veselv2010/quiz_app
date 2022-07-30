import 'package:appfox_test_app/core/data/quiz_repository.dart';
import 'package:appfox_test_app/router/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  late final QuizRepository repository;
  String? selectedCategory;
  String? selectedDifficulty;
  @override
  void initState() {
    repository = GetIt.I.get();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          DropdownButton<String>(
            hint: Text('Category'),
            value: selectedCategory,
            items: repository
                .getCategories()
                .map((e) => DropdownMenuItem<String>(value: e, child: Text(e)))
                .toList(),
            onChanged: (value) => setState(() {
              selectedCategory = value;
            }),
          ),
          DropdownButton<String>(
            hint: Text('Difficulty'),
            value: selectedDifficulty,
            items: repository
                .getDifficulties()
                .map((e) => DropdownMenuItem<String>(value: e, child: Text(e)))
                .toList(),
            onChanged: (value) => setState(() {
              selectedDifficulty = value;
            }),
          ),
          ElevatedButton(
            onPressed: selectedCategory != null && selectedDifficulty != null
                ? _navigateToQuiz
                : null,
            child: const Text('Start quiz!'),
          )
        ]),
      ),
    );
  }

  void _navigateToQuiz() {
    AutoRouter.of(context).navigate(
      QuizPageRoute(
        difficulty: selectedDifficulty!,
        category: selectedCategory!,
      ),
    );
  }
}
