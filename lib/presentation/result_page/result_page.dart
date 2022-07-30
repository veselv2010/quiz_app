import 'package:appfox_test_app/core/data/firebase_repository.dart';
import 'package:appfox_test_app/core/domain/models/result.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ResultPage extends StatefulWidget {
  final String resultId;
  const ResultPage({
    Key? key,
    @pathParam required this.resultId,
  }) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  late final FirebaseRepository repository;

  @override
  void initState() {
    repository = GetIt.I.get();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result for ${widget.resultId}'),
      ),
      body: FutureBuilder<Result?>(
        future: repository.getResult(widget.resultId),
        builder: (context, snap) {
          if (snap.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!snap.hasData) {
            return const Center(
              child: Text('No such result for selected id'),
            );
          }

          final result = snap.data!;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('difficulty: ${result.difficulty}'),
              Text(
                  'time: ${DateTime.fromMillisecondsSinceEpoch(result.date, isUtc: true).toLocal()}'),
              Text('category: ${result.theme}'),
              Text('correct answers: ${result.correctAnswers.toString()}'),
              Text('incorrect answers: ${result.incorrectAnswers.toString()}'),
            ],
          );
        },
      ),
    );
  }
}
