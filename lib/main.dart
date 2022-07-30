import 'package:appfox_test_app/core/data/firebase_repository.dart';
import 'package:appfox_test_app/core/data/quiz_repository.dart';
import 'package:appfox_test_app/router/app_router.gr.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late AppRouter router;
  @override
  void initState() {
    final client = Dio(BaseOptions(baseUrl: 'https://quizapi.io'));
    GetIt.I.registerSingleton(QuizRepository(client));
    GetIt.I.registerSingleton(FirebaseRepository());
    router = AppRouter();
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Quiz App',
      routerDelegate: router.delegate(),
      routeInformationParser: router.defaultRouteParser(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
