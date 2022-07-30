// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../presentation/quiz_page/page.dart' as _i2;
import '../presentation/result_page/result_page.dart' as _i3;
import '../presentation/start_page/page.dart' as _i1;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    StartPageRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.StartPage());
    },
    QuizPageRoute.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<QuizPageRouteArgs>(
          orElse: () => QuizPageRouteArgs(
              difficulty: queryParams.getString('difficulty', 'easy'),
              category: queryParams.getString('category', 'Linux')));
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.QuizPage(
              key: args.key,
              difficulty: args.difficulty,
              category: args.category));
    },
    ResultPageRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ResultPageRouteArgs>(
          orElse: () =>
              ResultPageRouteArgs(resultId: pathParams.getString('resultId')));
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i3.ResultPage(key: args.key, resultId: args.resultId));
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(StartPageRoute.name, path: '/'),
        _i4.RouteConfig(QuizPageRoute.name, path: '/quiz:difficulty:theme'),
        _i4.RouteConfig(ResultPageRoute.name, path: '/result/:resultId')
      ];
}

/// generated route for
/// [_i1.StartPage]
class StartPageRoute extends _i4.PageRouteInfo<void> {
  const StartPageRoute() : super(StartPageRoute.name, path: '/');

  static const String name = 'StartPageRoute';
}

/// generated route for
/// [_i2.QuizPage]
class QuizPageRoute extends _i4.PageRouteInfo<QuizPageRouteArgs> {
  QuizPageRoute(
      {_i5.Key? key, String difficulty = 'easy', String category = 'Linux'})
      : super(QuizPageRoute.name,
            path: '/quiz:difficulty:theme',
            args: QuizPageRouteArgs(
                key: key, difficulty: difficulty, category: category),
            rawQueryParams: {'difficulty': difficulty, 'category': category});

  static const String name = 'QuizPageRoute';
}

class QuizPageRouteArgs {
  const QuizPageRouteArgs(
      {this.key, this.difficulty = 'easy', this.category = 'Linux'});

  final _i5.Key? key;

  final String difficulty;

  final String category;

  @override
  String toString() {
    return 'QuizPageRouteArgs{key: $key, difficulty: $difficulty, category: $category}';
  }
}

/// generated route for
/// [_i3.ResultPage]
class ResultPageRoute extends _i4.PageRouteInfo<ResultPageRouteArgs> {
  ResultPageRoute({_i5.Key? key, required String resultId})
      : super(ResultPageRoute.name,
            path: '/result/:resultId',
            args: ResultPageRouteArgs(key: key, resultId: resultId),
            rawPathParams: {'resultId': resultId});

  static const String name = 'ResultPageRoute';
}

class ResultPageRouteArgs {
  const ResultPageRouteArgs({this.key, required this.resultId});

  final _i5.Key? key;

  final String resultId;

  @override
  String toString() {
    return 'ResultPageRouteArgs{key: $key, resultId: $resultId}';
  }
}
