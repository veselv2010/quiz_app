import 'package:appfox_test_app/presentation/quiz_page/page.dart';
import 'package:appfox_test_app/presentation/result_page/result_page.dart';
import 'package:appfox_test_app/presentation/start_page/page.dart';
import 'package:auto_route/auto_route.dart';

@MaterialAutoRouter(routes: [
  AutoRoute(initial: true, path: '/', page: StartPage),
  AutoRoute(path: '/quiz:difficulty:theme', page: QuizPage),
  AutoRoute(path: '/result/:resultId', page: ResultPage),
])
class $AppRouter {}
