import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:colorize/colorize.dart';

extension contextX on BuildContext {
  // TextStyle get bodyLarge => Theme.of(this)
  //     .textTheme
  //     .bodyLarge!; //Text('Hello World!', style: context.bodyLarge),

  // void showSnackbar(String message) => ScaffoldMessenger.of(this).showSnackBar(
  //       SnackBar(content: Text(message)),
  //     ); //context.showSnackbar('Here is your snack!'),

  Future<dynamic> go(String routeName, {Object? arguments, bool replacement = false}) {
    printRoute(routeName);
    return !replacement
        ? Navigator.pushNamed(this, routeName, arguments: arguments)
        : Navigator.pushReplacementNamed(this, routeName, arguments: arguments);
  } //   context.navigateTo('/second');

  Future<void> goUntil(String routeName, {Object? arguments}) {
    printRoute(routeName);
    return Navigator.pushNamedAndRemoveUntil(this, routeName, (route) => false,
        arguments: arguments);
  }

  void pop({dynamic value}) {
    return Navigator.pop(this, value);
  }
}

printRoute(String routeName) {
  var route = Colorize(routeName);
  route.apply(Styles.GREEN);
  log("Go to $route");
}
