import 'package:appfox_test_app/core/domain/models/quiz.dart';
import 'package:dio/dio.dart';

class QuizRepository {
  final Dio client;
  final String _apiKey = 'j24WhINsXuMG7PszLmbkLHqRiXRoFnjRZrHxkwDa';

  QuizRepository(this.client);

  List<String> getDifficulties() {
    return [
      'Easy',
      'Normal',
      'Hard',
    ];
  }

  List<String> getCategories() {
    return [
      'Linux',
      'Bash',
      'PHP',
      'Docker',
      'HTML',
      'MySQL',
      'WordPress',
      'Laravel',
      'Kubernetes',
      'JavaScript',
      'DevOps',
    ];
  }

  Future<Quiz?> getQuiz({
    required String category,
    required String difficulty,
  }) async {
    final res = await client.get('/api/v1/questions', queryParameters: {
      'apiKey': _apiKey,
      'limit': 10,
      'category': category,
      'difficulty': difficulty,
    });

    if (res.statusCode == 200) {
      final questions =
          res.data.map<QuizQuestion>((e) => QuizQuestion.fromJson(e)).toList();
      return Quiz(questions);
    }

    return null;
  }
}
