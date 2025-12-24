import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  /// Push the route with the given name onto the navigator that most
  /// tightly encloses the given [BuildContext].
  ///
  /// The pushed route is given the arguments from the [arguments] map.
  ///
  /// The returned [Future] will complete when the pushed route has finished
  /// pushing any required previous routes onto the navigator.
  ///
  /// The route name, and any required arguments, are passed to the
  /// [ModalRouteBuilder] returned by the [MaterialApp.onGenerateRoute]
  /// callback of the [MaterialApp] widget.
  ///
  /// The navigator that most tightly encloses the given [context] must be
  /// a [MaterialApp] widget.
  ///
  /// See also:
  ///
  /// * [pushReplacementNamed], which pushes a route and removes all the previous routes until the predicate is true.
  /// * [pushNamedAndRemoveUntil], which pushes a route and removes all the previous routes until the predicate is true.
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }



  /// Push the route with the given name onto the navigator that most
  /// tightly encloses the given [BuildContext], and remove all the
  /// previous routes until the predicate is true.
  ///
  /// The pushed route is given the arguments from the [arguments] map.
  ///
  /// The returned [Future] will complete when the pushed route has finished
  /// pushing any required previous routes onto the navigator.
  ///
  /// The route name, and any required arguments, are passed to the
  /// [ModalRouteBuilder] returned by the [MaterialApp.onGenerateRoute]
  /// callback of the [MaterialApp] widget.
  ///
  /// The navigator that most tightly encloses the given [context] must be
  /// a [MaterialApp] widget.
  ///
  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(
      this,
    ).pushReplacementNamed(routeName, arguments: arguments);
  }
  /// Push the route with the given name onto the navigator that most
  /// tightly encloses the given [BuildContext], and remove all the
  /// previous routes until the predicate is true.
  ///
  /// The pushed route is given the arguments from the [arguments] map.
  ///
  /// The returned [Future] will complete when the pushed route has finished
  /// pushing any required previous routes onto the navigator.
  ///
  /// The route name, and any required arguments, are passed to the
  /// [ModalRouteBuilder] returned by the [MaterialApp.onGenerateRoute]
  /// callback of the [MaterialApp] widget.
  ///
  /// The navigator that most tightly encloses the given [context] must be
  /// a [MaterialApp] widget.
  ///
  /// See also:
  ///
  /// * [pushReplacementNamed], which pushes a route and removes all the previous routes until the predicate is true.
  /// * [pushNamed], which pushes a route.
  ///

  /// Push the route with the given name onto the navigator that most
  /// tightly encloses the given [BuildContext], and remove all the
  /// previous routes until the [predicate] is true.
  ///
  /// The pushed route is given the arguments from the [arguments] map.
  ///
  /// The returned [Future] will complete when the pushed route has finished
  /// pushing any required previous routes onto the navigator.
  ///
  /// The route name, and any required arguments, are passed to the
  /// [ModalRouteBuilder] returned by the [MaterialApp.onGenerateRoute]
  /// callback of the [MaterialApp] widget.
  ///
  /// The navigator that most tightly encloses the given [context] must be
  /// a [MaterialApp] widget.
  ///
  Future<dynamic> pushNamedAndRemoveUntil(
    String newRouteName, {
    bool Function(Route<dynamic>)? predicate,
  }) {
    return Navigator.of(this).pushNamedAndRemoveUntil(newRouteName, predicate!);
  }

  void pop() {
    Navigator.of(this).pop();
  }
}
