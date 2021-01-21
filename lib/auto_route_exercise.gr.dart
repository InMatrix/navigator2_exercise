// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'auto_route_exercise.dart' as _i2;
import 'package:flutter/material.dart' as _i3;

class AppRouter extends _i1.RootStackRouter {
  AppRouter({String initialDeepLink, List<_i1.PageRouteInfo> initialRoutes})
      : super(initialDeepLink: initialDeepLink, initialRoutes: initialRoutes);

  @override
  final Map<Type, _i1.PageFactory> pagesMap = {
    _i2.FirstScreen: (args) {
      return _i1.MaterialPageX(data: args, child: _i2.FirstScreen());
    },
    _i2.SecondScreen: (args) {
      var data = args.as<SecondRoute>();
      return _i1.MaterialPageX(
          data: args,
          child: _i2.SecondScreen(key: data.key, bookId: data.bookId));
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig<FirstRoute>(FirstRoute.name,
            path: '/',
            page: _i2.FirstScreen,
            routeBuilder: (_) => const FirstRoute()),
        _i1.RouteConfig<SecondRoute>(SecondRoute.name,
            path: '/second-screen/:id',
            page: _i2.SecondScreen,
            routeBuilder: (match) => SecondRoute.fromMatch(match))
      ];
}

class FirstRoute extends _i1.PageRouteInfo {
  const FirstRoute() : super(name, path: '/');

  static const String name = 'FirstRoute';
}

class SecondRoute extends _i1.PageRouteInfo {
  SecondRoute({this.key, this.bookId})
      : super(name,
            path: '/second-screen/:id',
            params: {'id': bookId},
            argProps: [key, bookId]);

  SecondRoute.fromMatch(_i1.RouteMatch match)
      : key = null,
        bookId = match.pathParams.getString('id'),
        super.fromMatch(match);

  final _i3.Key key;

  final String bookId;

  static const String name = 'SecondRoute';
}
